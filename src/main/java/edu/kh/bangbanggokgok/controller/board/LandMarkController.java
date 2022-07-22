package edu.kh.bangbanggokgok.controller.board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.bangbanggokgok.common.Util;
import edu.kh.bangbanggokgok.service.board.LandMarkService;
import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import edu.kh.bangbanggokgok.vo.user.User;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@SessionAttributes("loginUser")
@RequestMapping("landmark-main/*")
public class LandMarkController {

	private Logger logger = LoggerFactory.getLogger(LandMarkController.class);
	@Autowired
	private LandMarkService service;

	@GetMapping("/list/{locationNum}")
	public String landmarkMainPage(Model model,
			@PathVariable("locationNum") int num) {

		// 랜드마크 목록 조회 서비스
		Map<String, Object> map = service.selectAllLandMarkList(num);
		map.put("hihi", num);
		model.addAttribute("map", map);
		return "landMark/landmark";
	}
	
	@ResponseBody
	@GetMapping("/list/nsync/{locationNum}")
	public String landMarkListPage(@RequestParam(value = "locationNum", defaultValue = "100") int locationType,
			Model model) {

		// 랜드마크 특정 지역 목록 조회 서비스
		Map<String, Object> map = service.selectLandMarkList(locationType);
		return new Gson().toJson(map);
	}

	// 랜드마크 상세 조회
	@GetMapping("/detail/{locationNum}/{landMarkNo}")
	public String landMarkDetail(@PathVariable("landMarkNo") int landmarkNo, Model model) {
		LandMarkDetail landmarkDetail = service.selectLandmarkDetail(landmarkNo);
		// 이미지 담아야함
		model.addAttribute("landmarkDetail", landmarkDetail);
		
		return "landMark/land-detail";
	}

	// 게시글 작성 화면 전환
	@GetMapping("/write/{mode}")
	public String landWriteForm(@PathVariable String mode,
			@RequestParam(value="landmark-no",required=false,defaultValue="0") int landmarkNo,
			Model model) {

		if (mode.equals("update")) {
			LandMarkDetail landmarkDetail = service.selectLandmarkDetail(landmarkNo);
			landmarkDetail.setLandMarkContent(Util.newLineClear(landmarkDetail.getLandMarkContent()));
			//xss 처리해야함
			model.addAttribute("landmarkDetail", landmarkDetail);
		}

		return "landMark/landmarkWrite";
	}

	// 게시글 삽입/수정
	@PostMapping("/write/{mode}")
	public String landWrite(LandMarkDetail detail, // 제목, 내용
			@RequestParam(value = "landmark-no",required = false) int landmarkNo,
			@RequestParam(value = "images", required = false) List<MultipartFile> imageList, // 이미지 리스트
			@RequestParam Map<String, String> param, @PathVariable String mode,
			@ModelAttribute("loginUser") User loginUser, HttpServletRequest req, RedirectAttributes ra,
			@RequestParam(value = "deleteList", required = false) String deleteList) throws IOException {

		logger.debug(deleteList + ""); // 나중
		logger.debug(param + "");

		// 회원번호 얻어오기
		detail.setUserName(loginUser.getUserName());
		detail.setUserNo(loginUser.getUserNo());

		detail.setLocationNum(Integer.parseInt(param.get("locationsList")));
		detail.setLandMarkContent(param.get("contents"));

		detail.setLandMarkX(Double.parseDouble(param.get("lng")));
		detail.setLandMarkY(Double.parseDouble(param.get("lat")));

		detail.setLandMarkName(Util.XSSHandling(param.get("landmarkName")));
		detail.setLandMarkContent(Util.XSSHandling(param.get("contents")));
		detail.setLandMarkContent(Util.newLineHandling(detail.getLandMarkContent()));

		// 이미지 저장 경로
		String webPath = "/resources/images/landmark/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);

		String path = null;
		String message = null;

		if (mode.equals("insert")) {

			int landMarkNo = service.insertLandMark(detail, imageList, webPath, folderPath);

			if (landMarkNo > 0) {
				path = "../detail/" + param.get("locationsList") + "/" + landMarkNo;
				message = "게시글이 등록되었습니다.";
			} else {
				path = req.getHeader("referer");
				message = "게시글 삽입 실패";
			}
		}

		if (mode.equals("update")) {

			detail.setLandMarkNo(landmarkNo);
			// 수정코드 작성 공간
			int result = service.updateLandMark(detail, imageList, webPath, folderPath, deleteList);

			if(result > 0) {
				message = "게시글이 수정되었습니다.";
				path = "../detail/" + param.get("locationNum") + "/" + detail.getLandMarkNo();
			}else {
				message = "게시글 수정 실패";
				path = req.getHeader("referer");
			}
		}
		ra.addFlashAttribute("message", message);

		return "redirect:"+path;

	}

}
