package edu.kh.bangbanggokgok.controller.board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import edu.kh.bangbanggokgok.service.board.LandMarkService;
import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import edu.kh.bangbanggokgok.vo.user.User;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@SessionAttributes("loginUser")
@RequestMapping("landmark-main/*")
public class LandMarkController {

	@Autowired
	private LandMarkService service;

	@GetMapping("/list")
	public String landmarkMainPage(Model model) {

		// 랜드마크 목록 조회 서비스
		// 게시글 목록 조회
		Map<String, Object> map = service.selectAllLandMarkList();
//		List<LandMark> landMarks = landMarkListPage(100, model);

		model.addAttribute("map", map);
		// 미리 작성한 비동기 친구에 매개변수 100을 넣으면 서울에있는 랜드마크 검색
		return "landMark/landmark";
	}

	@ResponseBody
	@GetMapping("/list/{locationNum}")
	public String landMarkListPage(@RequestParam(value = "locationNum", defaultValue = "100") int locationType,
			Model model) {

		// 랜드마크 특정 지역 목록 조회 서비스
		// 지역 이름 조회
		// 게시글 목록 조회
		Map<String, Object> map = service.selectLandMarkList(locationType);

		return new Gson().toJson(map);
	}

	// 랜드마크 상세 조회
	@GetMapping("/detail/{locationNum}/{landMakrNo}")
	public String landMarkDetail(@PathVariable("landMarkNo") int landMakrNo, Model model, HttpSession session,
			HttpServletRequest req, HttpServletResponse resp) {

		LandMarkDetail landmarkDetail = service.selectLandMakrDetail(landMakrNo);
		model.addAttribute("landmarkDetail",landmarkDetail);
		return "landMark/land-detail";
	}

	// 게시글 작성 화면 전환
	@GetMapping("/write/{locationNum}")
	public String landWriteForm(@PathVariable("locationNum") int locationType) {
		return "landMark/landmarkWrite";
	}

	// 게시글 삽입/수정
	@PostMapping("/write/{locationNum}")
	public String landWrite(LandMarkDetail detail, // 제목, 내용
			@RequestParam(value = "images", required = false) List<MultipartFile> imageList, // 이미지 리스트
			@PathVariable("locationNum") int locationNum, String mode, @ModelAttribute("loginUser") User loginUser,
			HttpServletRequest req, RedirectAttributes ra,
			@RequestParam( value = "deleteList", required=false) String deleteList)
			throws IOException {

		// 회원번호 얻어오기
		detail.setUserNo(loginUser.getUserNo());

		// 이미지 저장 경로
		String webPath = "/resources/images/landMark/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);

		if (mode.equals("insert")) {

			int landMarkNo = service.insertLandMark(detail, imageList, webPath, folderPath);

			String path = null;
			String message = null;
			if (landMarkNo > 0) {

				path = "../detail/" + locationNum + "/" + landMarkNo;
				message = "게시글이 등록되었습니다.";

			} else {
				path = req.getHeader("referer");
				message = "게시글 삽입 실패";
			}

			ra.addFlashAttribute("message", message);

			return "redirect:" + path;

		} else {// 수정코드 작성 공간
			
			int result = service.updateLandMark(detail, imageList, webPath, folderPath, deleteList);
			
			String path = null;
			String message = null;
			
			if(result > 0) {
				message = "게시글이 수정되었습니다.";
				// 현재 : /board/write/{boardCode}
				// 목표 : /board/detail/{boardCode}/{boardNo}?cp=10
				path = "../detail/" + locationNum + "/" + detail.getLandMakrNo();
			}else {
				message = "게시글 수정 실패";
				path = req.getHeader(	"referer");
			}
			
			ra.addFlashAttribute("message", message);
			
			return "redirect:"+path; 
		}


	}

}
