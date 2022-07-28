package edu.kh.bangbanggokgok.controller.board;

import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestHeader;
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
import edu.kh.bangbanggokgok.vo.board.Pagination2;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@SessionAttributes("loginUser")
@RequestMapping("landmark-main/*")
public class LandMarkController {

	private Logger logger = LoggerFactory.getLogger(LandMarkController.class);
	@Autowired
	private LandMarkService service;

	@GetMapping("/list/{locationNum}")
	public String landmarkMainPage(Model model, @PathVariable("locationNum") int locationNum) {

		// 랜드마크 목록 조회 서비스
		Map<String, Object> map = service.selectAllLandMarkList(locationNum);
		
		map.put("hihi", locationNum);
		model.addAttribute("map", map);
		return "landMark/landmark";
	}

	@ResponseBody
	@GetMapping("/list/nsync/{locationNum}")
	public String landMarkListPage(
			@RequestParam("locationNum") int locationType,
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) int pageNo,
			Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		List<LandMark> rankLandMarkList = service.rankLandMarkList(locationType);
		
		// 랜드마크 특정 지역 목록 조회 서비스
		List<LandMark> landMarkList = service.selectLandMarkList(locationType,pageNo);
		
		Pagination2 pagination = new Pagination2(pageNo, service.selectLandmarkCount(locationType));
		map.put("rankLandMarkList", rankLandMarkList);
		map.put("landMarkList", landMarkList);
		map.put("pagination", pagination);
		
		return new Gson().toJson(map);
	}

	// 랜드마크 상세 조회
	@GetMapping("/detail/{locationNum}/{landMarkNo}")
	public String landMarkDetail(@PathVariable("landMarkNo") int landmarkNo, Model model, HttpSession session) {

//		랜드마크 조회
		LandMarkDetail landmarkDetail = service.selectLandmarkDetail(landmarkNo);

//		비로그인 판별
		User loginUser = (User) session.getAttribute("loginUser");
		int userNo = 0;
		if (loginUser != null) {
			userNo = loginUser.getUserNo();
		}

//		북마크 확인용 변수 전환
		String sLandmarkNo = Integer.toString(landmarkNo);
		String sUserNo = Integer.toString(userNo);

		int checkBookmark = service.landmarkBookmark(sUserNo, sLandmarkNo);

		double rankLandmark = service.rankLandmark(landmarkNo);

		int addPointCheck = service.addPointCheck(landmarkNo, userNo);

//		디테일 속성삽입
		model.addAttribute("landmarkDetail", landmarkDetail);
//		북마크 속성삽입
		model.addAttribute("checkBookmark", checkBookmark);
//		랜드마크 평균점수삽입
		model.addAttribute("rankLandmark", rankLandmark);
//		점수 삽입 판단
		model.addAttribute("addPointCheck", addPointCheck);

		return "landMark/land-detail";
	}

	// 게시글 작성 화면 전환
	@GetMapping("/write/{mode}")
	public String landWriteForm(@PathVariable String mode,
			@RequestParam(value = "landmark-no", required = false, defaultValue = "0") int landmarkNo, Model model,
			HttpSession session, RedirectAttributes ra) {

		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return redirectHome(ra);
		}

		if (mode.equals("update")) {
			LandMarkDetail landmarkDetail = service.selectLandmarkDetail(landmarkNo);
			landmarkDetail.setLandMarkContent(Util.newLineClear(landmarkDetail.getLandMarkContent()));
			model.addAttribute("landmarkDetail", landmarkDetail);
		}

		return "landMark/landmarkWrite";
	}

	// 게시글 삽입/수정
	@PostMapping("/write/{mode}")
//	service로 로직 옴겨야함
	public String landWrite(LandMarkDetail detail, // 제목, 내용
			@RequestParam(value = "landmark-no", required = false, defaultValue = "0") int landmarkNo,
			@RequestParam(value = "images", required = false) List<MultipartFile> imageList, // 이미지 리스트
			@RequestParam Map<String, String> param, @PathVariable String mode,
			@ModelAttribute("loginUser") User loginUser, HttpServletRequest req, RedirectAttributes ra,
			@RequestParam(value = "deleteList", required = false) String deleteList) throws IOException {

		logger.debug(deleteList + ""); // 나중

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

			if (result > 0) {
				message = "게시글이 수정되었습니다.";
				path = "../detail/" + param.get("locationNum") + "/" + detail.getLandMarkNo();
			} else {
				message = "게시글 수정 실패";
				path = req.getHeader("referer");
			}
		}
		ra.addFlashAttribute("message", message);

		return "redirect:" + path;

	}

//	랜드마크 북마크 기능
	@ResponseBody
	@GetMapping("/detail/{locationNum}/{landMarkNo}/landmarkBookmark")
	public int landmarkBookmark(@PathVariable("landMarkNo") String landmarkNo, @RequestParam("userNo") String loginNo) {

		int result = service.landmarkBookmark(loginNo, landmarkNo);

		// 이미 있는 북마크
		if (result > 0) {
			result = 3; // 있으면 1 - 3으로 전환
		}

		// 없을 경우 삽입
		if (result == 0) {
			result = service.landmarkBookmarkInsert(loginNo, landmarkNo);
		}
		return result;
	}

	// 북마크 삭제
	@ResponseBody
	@GetMapping("/detail/{locationNum}/{landMarkNo}/landmarkBookmarkDelete")
	public int landmarkBookmarkDelete(@PathVariable("landMarkNo") String landmarkNo,
			@RequestParam("userNo") String loginNo) {
		return service.landmarkBookmarkDelete(loginNo, landmarkNo);
	}

	// 별점 삽입
	@ResponseBody
	@GetMapping("/detail/{locationNum}/{landMarkNo}/insert-landmark-rankPoint")
	public double insertLandmarkRankPoint(@RequestParam("rankPoint") String rankPoint,
			@RequestParam("userNo") String userNo, @PathVariable("landMarkNo") int landmarkNo) {
		return service.insertRankPoint(rankPoint, userNo, landmarkNo);
	}

	// 별점 삭제
	@ResponseBody
	@GetMapping("/detail/{locationNum}/{landMarkNo}/delet-landmark-rankPoint")
	public double deleteLandmarkRankPoint(@RequestParam("userNo") String userNo,
			@PathVariable("landMarkNo") int landmarkNo) {
		return service.deleteRankPoint(userNo, landmarkNo);
	}

	public String redirectHome(RedirectAttributes ra) {
		ra.addFlashAttribute("message", "로그인 후 이용 바람");
		return "redirect:/user/login-page";
	}
	
	// 랜드마크 삭제
	@GetMapping("/detail/delete")
	public String deleteLandmark(@RequestParam(value = "landmark-no", required = false, defaultValue = "0") int landmarkNo,			
								 RedirectAttributes ra, @RequestHeader("referer") String referer){
		
		int result = service.deleteLandmark(landmarkNo);
		
		String path = null;
		String message = null;
		
		if(result > 0) {
			message = "삭제되었습니다.";
			
			path = "/landmark-main/list/100";
			
		} else {
			message = "삭제 실패";
			path = referer;
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:" + path;
		
	}
	
}
