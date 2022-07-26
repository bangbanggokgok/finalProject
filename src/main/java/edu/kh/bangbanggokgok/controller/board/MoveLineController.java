package edu.kh.bangbanggokgok.controller.board;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.bangbanggokgok.service.board.MoveLineService;
import edu.kh.bangbanggokgok.service.reply.ReplyService;
import edu.kh.bangbanggokgok.service.user.MyPageService;
import edu.kh.bangbanggokgok.service.user.MyPageServiceImpl;
import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import edu.kh.bangbanggokgok.vo.board.LandMarkIMG;
import edu.kh.bangbanggokgok.vo.board.Location;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.board.MoveLineBookmark;
import edu.kh.bangbanggokgok.vo.board.MoveLineDetail;
import edu.kh.bangbanggokgok.vo.hashTag.MoveLineHashTag;
import edu.kh.bangbanggokgok.vo.image.MoveLineImage;
import edu.kh.bangbanggokgok.vo.reply.Reply;
import edu.kh.bangbanggokgok.vo.user.MyMoveline;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@RequestMapping("moveline-main/*")
@SessionAttributes({"loginUser"})
public class MoveLineController {

	@Autowired
	private MoveLineService service;

	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private MyPageService myPageService;

	// 코스 구분 페이지 조회
	@GetMapping("/list")
	public String moveLineSort(Model model) {

		return "moveline/movelineSort";
	}

	// 코스 작성 페이지 조회
	@GetMapping("/list/write")
	public String movelineWrite(Model model) {

		return "moveline/movelineWrite";
	}

	// 특정 지역에 따른 랜드마크 조회
	@ResponseBody
	@GetMapping("/list/write/connectLocation")
//	public String connectLocation(@RequestParam(value = "locationName", required = true) String locationName,
//			LandMark landmark, Model model, HttpServletRequest req, RedirectAttributes ra) {
//
//		System.out.println("locationName : " + locationName);
//
//		List<LandMark> landmarkList = service.connectLocation(locationName);
//		model.addAttribute("landmarkList", landmarkList);
//
//		System.out.println("landmarkList : " + landmarkList.size());
//
//		return "moveline/movelineWrite";
	public String connectLocation(@RequestParam(value="locationName", required=true) String locationName,
								  LandMark landmark,
								  Model model,
								  HttpServletRequest req,
								  RedirectAttributes ra) {
		
		
		List<LandMark> landmarkList =  service.connectLocation(locationName);
		
		return new Gson().toJson(landmarkList);
	}

	@GetMapping("/goToList")
	public String goToList(@RequestHeader("referer") String referer, Model model, RedirectAttributes ra,
			HttpServletRequest req) {

		String path = null;

		path = referer;
		path = req.getHeader("referer");

		return path;
	}

	/**
	 * 특정 지역 코스 목록 조회
	 * 
	 * @param model
	 * @param locationNum
	 * @param cp
	 * @return map
	 */
	@GetMapping("/list/location/{locationNum}")
	public String moveLineLocation(Model model, @PathVariable("locationNum") int locationNum,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = null;

		map = service.selectLocationList(cp, locationNum);

		model.addAttribute("map", map);

		return "moveline/movelineList";
	}

	/**
	 * 특정 해시태그 목록 조회
	 * 
	 * @param model
	 * @param cp
	 * @param MLHashTag
	 * @param paramMap
	 * @return
	 */
	@GetMapping("/list/hashtag")
	public String movelineHashTag(
//			@PathVariable("MLHashTag") String MLHashTag,

			Model model, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam(value = "hashtag", required = true) String MLHashTag,
			@RequestParam Map<String, Object> paramMap

	) {

		Map<String, Object> map = null;

		paramMap.put("cp", cp);
		paramMap.put("MLHashTag", MLHashTag);

		map = service.selectHashTagList(paramMap);

		model.addAttribute("map", map);

		return "moveline/movelineList";
	}

	/**
	 * 코스 즐겨찾기
	 * 
	 * @param moveLineBookMark
	 * @param MovelineNo
	 * @param paramMap
	 * @param loginUser
	 * @param req
	 * @param ra
	 * @return result
	 */
	@GetMapping("/list/bookmark")
	@ResponseBody
	public int bookmarkMoveline(MoveLineBookmark moveLineBookMark,
			@RequestParam(value = "movelineNo", required = true) int MovelineNo,
			@RequestParam Map<String, Object> paramMap, @ModelAttribute("loginUser") User loginUser,
			HttpServletRequest req, RedirectAttributes ra) {

		moveLineBookMark.setUserNo(loginUser.getUserNo());
		moveLineBookMark.setMovelineNo(MovelineNo);

		List<MoveLineBookmark> moveLineBookMark1 = service.selectBookmarkList(moveLineBookMark);

		int result = 0;

		if (moveLineBookMark1.size() == 0) {

			result = service.movelineBookmark(moveLineBookMark);

		} else {

			result = 0;

		}

		return result;
	}

	// 코스 테마별 목록 조회
	@GetMapping("/list/theme")
	public String movelineTheme(String theme, Model model,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = null;

		paramMap.put("cp", cp);
		paramMap.put("theme", theme);

		map = service.selectMovelineTheme(paramMap);

		model.addAttribute("map", map);

		return "moveline/movelineList";
	}

	// 코스 전체 목록 조회
	@GetMapping("/list/selectAll")
	public String selectAll(@RequestParam Map<String, Object> paramMap,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, String selectAll) {

		System.out.println("1 : " + 1);

		Map<String, Object> map = null;

		paramMap.put("cp", cp);
		paramMap.put("selectAll", selectAll);

		map = service.selectAll(paramMap);

		model.addAttribute("map", map);
		System.out.println("map : " + map);
		System.out.println("selectAll : " + selectAll);

		return "moveline/movelineList";
	}

	/**
	 * 코스 상세 페이지 조회
	 * 
	 * @param movelineNo
	 * @param cp
	 * @param model
	 * @param session
	 * @return list
	 */
	@GetMapping("/detail/{movelineNo}")
	public String movelineDetail(@PathVariable("movelineNo") int movelineNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			HttpSession session) {

		MoveLineDetail movelineDetail = service.selectMovelineDetail(movelineNo);

		Map<String, Object> map = null;
		List<MoveLineImage> movelineImage = service.selectMovelineImage(movelineNo);
		List<LandMarkDetail> landmarkDetail = service.selectLandmarkDetail(movelineNo);
		List<LandMarkIMG> landmarkImage = service.selectLandmarkImage(movelineNo);
		List<MoveLineHashTag> movelineHashtag = service.selectMovelineHashtag(movelineNo);

		model.addAttribute("movelineDetail", movelineDetail);
		model.addAttribute("movelineImage", movelineImage);
		model.addAttribute("movelineHashtag", movelineHashtag);
		model.addAttribute("landmarkDetail", landmarkDetail);
		model.addAttribute("landmarkImage", landmarkImage);

		System.out.println("landmarkDetail.landmarkContent" + landmarkDetail);
		
		List<Reply> rList = replyService.selectReplyList(movelineNo);
		model.addAttribute("rList", rList);

		User loginUser = (User) session.getAttribute("loginUser");

		int UserNo = 0;

		if (loginUser != null) {
			UserNo = loginUser.getUserNo();
		}

		return "moveline/movelineDetail";
	}

	
	
	// 특정 랜드마크 이미지 세팅 목록 조회
	@ResponseBody
	@GetMapping("/detail/setLandmarkImages")
	public String setLandmarkImages(
//									@PathVariable("landMarkNo") int landMarkNo,
			 						Model model,
									@RequestParam(value="cp", required=false, defaultValue="1") int cp,
									@RequestParam(value="landmarkNo", required=true) int landmarkNo,
									HttpServletRequest req,
									RedirectAttributes ra
									) {
		
		System.out.println("landmarkNo");
		
		List<LandMarkIMG> landmarkImageList = service.setLandmarkImages(landmarkNo);
		
		List<LandMark> landmarkContentList =  service.setLandmarkContent(landmarkNo);
		
		model.addAttribute("landmarkContentList", landmarkContentList);

		System.out.println("landmarkContentList size : " + landmarkContentList.size());
		System.out.println("landmarkImageList size : " + landmarkImageList.size());
		return new Gson().toJson(landmarkImageList);

	}
	
	// 랜드마크 이름 조회 - 상세 페이지 랜드마크 이름 정렬용
	@GetMapping("/detail/setLandmarkName")
	public String setLandmarkName(@RequestParam(value = "landmarkNo", required = true) int landmarkNo) {

		String landmarkName = service.setLandmarkName(landmarkNo);

		System.out.println("landmarkName : " + landmarkName);

		return landmarkName;

	}

	// 코스 삭제
	@GetMapping("/detail/delete")
	public String deleteMoveline(
//								 @PathVariable("movelineNo") int movelineNo,
			   					 @RequestHeader("referer") String referer,
			   					 @RequestParam(value="movelineNo", required=true) int movelineNo,
		   					 RedirectAttributes ra
			   					 ) {
		
		//int result = service.deleteMoveline(movelineNo);

			   					 //RedirectAttributes ra,
			   					 //Model model) {
		int result = 0;
		
		result = service.deleteMoveline(movelineNo);
		  
//		System.out.println("deleteMoveline : " + movelineNo);

		
		String message = null;
		String path = null;
		   
		if(result > 0) {
			
			System.out.println("result : " + result);
			
			message = "코스를 삭제했습니다.";
			path = "/moveline-main";
			   
		} else {
			   
			message = "코스 삭제가 실패했습니다.";
		    path = referer;
			   
		}
		   
		ra.addFlashAttribute("message",message);
		
		return "redirect:" + path;
	}

	@ResponseBody
	@GetMapping("/list/validate-mybookmark-list")
	public String myBookmarkLandmarkList(@ModelAttribute("loginUser") User loginUser,
			@RequestParam("locationValue") int locationNum) {
		List<LandMark> result = myPageService.favoriteLandmark(loginUser.getUserNo(),locationNum);
		return new Gson().toJson(result);
	}
	
	
	
//	@GetMapping("/detail/report")
//	public String reportMoveline(@RequestParam(value="movelineNo", required=true) int movelineNo
//								) {
//		
//		
//		
//	}
	
}