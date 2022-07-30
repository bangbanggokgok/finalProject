package edu.kh.bangbanggokgok.controller.board;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
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
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("moveline-main/*")
@SessionAttributes({ "loginUser" })
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
	public String connectLocation(@RequestParam(value = "locationName", required = true) String locationName,
			LandMark landmark, Model model, HttpServletRequest req, RedirectAttributes ra) {

		List<LandMark> landmarkList = service.connectLocation(locationName);

		return new Gson().toJson(landmarkList);
	}

	// 목록으로
	@GetMapping("/detail/goToList")
	public String goToList(RedirectAttributes ra, HttpSession session, @RequestHeader("referer") String referer,
			HttpServletRequest req) {

		String path = (String) session.getAttribute("listURL");

		session.removeAttribute("listURL");

		return "redirect:" + path;

	}

	// 특정 지역 코스 목록 조회
	@GetMapping("/list/location/{locationNum}")
	public String moveLineLocation(Model model, @PathVariable("locationNum") int locationNum,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = null;

		map = service.selectLocationList(cp, locationNum);

		model.addAttribute("map", map);

		return "moveline/movelineList";
	}

	// 특정 해시태그 목록 조회
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

	// 코스 즐겨찾기
//	@GetMapping("/list/bookmarkSet")
//	@ResponseBody
//	public int bookmarkMoveline(MoveLineBookmark moveLineBookMark,
//			@RequestParam(value = "movelineNo", required = true) int MovelineNo,
//			@RequestParam Map<String, Object> paramMap, @ModelAttribute("loginUser") User loginUser,
//			HttpServletRequest req, RedirectAttributes ra) {
//
//		moveLineBookMark.setUserNo(loginUser.getUserNo());
//		moveLineBookMark.setMovelineNo(MovelineNo);
//
//		List<MoveLineBookmark> moveLineBookMark1 = service.selectBookmarkList(moveLineBookMark);
//
//		int result = 0;
//
//		if (moveLineBookMark1.size() == 0) {
//
//			result = service.movelineBookmark(moveLineBookMark);
//
//		} else {
//
//			result = 0;
//
//		}
//
//		return result;
//	}

	// 코스 테마별 목록 조회
	@GetMapping("/list/theme")
	public String movelineTheme(String theme, Model model,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			HttpSession session,
			@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = null;

		paramMap.put("cp", cp);
		paramMap.put("theme", theme);

		map = service.selectMovelineTheme(paramMap);
		
//		// 비로그인 판별
//		User loginUser = (User) session.getAttribute("loginUser");
//		int userNo = 0;
//		if (loginUser != null) {
//			userNo = loginUser.getUserNo();
//		}
//		// 북마크 확인용 변수 전환
//		String sMovelineNo = Integer.toString(movelineNo);
//		String sUserNo = Integer.toString(userNo);
//
//		int checkBookmark = service.movelineBookmark(sUserNo, sMovelineNo);
//
//		model.addAttribute("checkBookmark", checkBookmark);
		

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

	// 코스 상세 페이지 조회
	@GetMapping("/detail/{movelineNo}")
	public String movelineDetail(@PathVariable("movelineNo") int movelineNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, HttpSession session,
			@RequestHeader("referer") String listURL) {

		MoveLineDetail movelineDetail = service.selectMovelineDetail(movelineNo);

		List<MoveLineImage> movelineImage = service.selectMovelineImage(movelineNo);
		List<LandMarkDetail> landmarkDetail = service.selectLandmarkDetail(movelineNo);
		List<LandMarkIMG> landmarkImage = service.selectLandmarkImage(movelineNo);
		List<MoveLineHashTag> movelineHashtag = service.selectMovelineHashtag(movelineNo);

		model.addAttribute("movelineDetail", movelineDetail);
		model.addAttribute("movelineImage", movelineImage);
		model.addAttribute("movelineHashtag", movelineHashtag);
		model.addAttribute("landmarkDetail", landmarkDetail);
		model.addAttribute("landmarkImage", landmarkImage);

		// 이전 목록 주소를 세션에 추가(삭제 시 이용)
		session.setAttribute("listURL", listURL);

		// 비로그인 판별
		User loginUser = (User) session.getAttribute("loginUser");
		int userNo = 0;
		if (loginUser != null) {
			userNo = loginUser.getUserNo();
		}

		// 북마크 확인용 변수 전환
		String sMovelineNo = Integer.toString(movelineNo);
		String sUserNo = Integer.toString(userNo);

		int checkBookmark = service.movelineBookmark(sUserNo, sMovelineNo);

		model.addAttribute("checkBookmark", checkBookmark);

		List<Reply> rList = replyService.selectReplyList(movelineNo);
		model.addAttribute("rList", rList);
		
		
//		session.setAttribute("landMarkX", landmarkDetail.get(0).getUserName());
		

		return "moveline/movelineDetail";
	}

	// 특정 랜드마크 이미지 세팅 목록 조회
//	@ResponseBody
//	@GetMapping("/detail/setLandmarkImages")
//	public String setLandmarkImages(
////									@PathVariable("landMarkNo") int landMarkNo,
//			 						Model model,
//									@RequestParam(value="cp", required=false, defaultValue="1") int cp,
//									@RequestParam(value="landmarkNo", required=true) int landmarkNo,
//									HttpServletRequest req,
//									RedirectAttributes ra
//									) {
//		
//		System.out.println("landmarkNo");
//		
//		List<LandMarkIMG> landmarkImageList = service.setLandmarkImages(landmarkNo);
//		
//		System.out.println("landmarkImageList size : " + landmarkImageList.size());
//		
//		return new Gson().toJson(landmarkImageList);
//
//	}

	@ResponseBody
	@GetMapping("/detail/setLandmarkImages")
	public String setLandmarkImages(
//									@PathVariable("landMarkNo") int landMarkNo,
			Model model, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam(value = "landmarkNo", required = true) int landmarkNo, HttpServletRequest req,
			RedirectAttributes ra) {

		System.out.println("landmarkNo");

		List<LandMarkDetail> landmarkImageList = service.setLandmarkImages(landmarkNo);
		String landmarkContent = service.setLandmarkContent(landmarkNo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("landmarkImageList", landmarkImageList);
		map.put("landmarkContent", landmarkContent);

		System.out.println("landmarkImageList size : " + landmarkImageList.size());

		return new Gson().toJson(map);

	}

	// 랜드마크 이름 조회 - 상세 페이지 랜드마크 이름 정렬용
	@GetMapping("/detail/setLandmarkName")
	public String setLandmarkName(@RequestParam(value = "landmarkNo", required = true) int landmarkNo) {

		String landmarkName = service.setLandmarkName(landmarkNo);

		System.out.println("landmarkName : " + landmarkName);

		return landmarkName;

	}

	// 코스 삭제
	@GetMapping("/detail/delete/{movelineNo}")
	public String deleteMoveline(@PathVariable("movelineNo") int movelineNo, @RequestHeader("referer") String referer,
//			   					 @RequestParam(value="movelineNo", required=true) int movelineNo,
			RedirectAttributes ra, HttpSession session) {

		System.out.println("movelineNo : " + movelineNo);
		int result = service.deleteMoveline(movelineNo);

		String message = null;
		String path = null;

		if (result > 0) {

			System.out.println("result : " + result);

			message = "코스를 삭제했습니다.";
			path = "/moveline-main/list";

			String listURL = (String) session.getAttribute("listURL");

			if (listURL == null) {
				path = "/moveline-main/list";
			} else {
				path = listURL;
				session.removeAttribute("listURL");
			}

		} else {

			message = "코스 삭제가 실패했습니다.";
			path = referer;

		}

		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}

	@ResponseBody
	@GetMapping("/list/validate-mybookmark-list")
	public String myBookmarkLandmarkList(@ModelAttribute("loginUser") User loginUser,
			@RequestParam("locationValue") int locationNum) {
		List<LandMark> result = myPageService.favoriteLandmark(loginUser.getUserNo(), locationNum);
		return new Gson().toJson(result);
	}

	@ResponseBody
	@GetMapping("/list/bookmarkSet/{movelineNo}")
	public int movelineBookmarkSet(@PathVariable("movelineNo") String movelineNo,
			@RequestParam("userNo") String loginNo) {

		int result = service.movelineBookmark(loginNo, movelineNo);
		System.out.println("movelineNo : " + movelineNo);
		System.out.println("result bookmark : " + result);

		// 이미 있는 북마크
		if (result > 0) {
			result = 3; // 있으면 1 - 3으로 전환
		}

		// 없을 경우 삽입
		if (result == 0) {
			result = service.movelineBookmarkInsert(loginNo, movelineNo);
		}
		return result;
	}

	// 북마크 삭제
	@ResponseBody
	@GetMapping("/list/bookmarkDelete/{movelineNo}")
	public int movelineBookmarkDelete(@PathVariable("movelineNo") String movelineNo,
			@RequestParam("userNo") String loginNo) {
		return service.movelineBookmarkDelete(loginNo, movelineNo);
	}

//	@PostMapping("/{mode}/moveline-content")
//	public String movelineInsert(@RequestParam Map<String, String> param, @RequestParam("indexValue") int[] indexArray,
//			@ModelAttribute("loginUser") User loginUser, @PathVariable("mode") String mode, Model model,
//			HttpSession session, RedirectAttributes ra, @RequestHeader("referer") String listURL) {
//
//		int movelineNumber = service.insertMoveline(param, loginUser.getUserNo());
//
//		int movelineIndexInsert = service.insertIndex(indexArray, movelineNumber);
//		String message = "";
//		String path = "";
//		if (movelineIndexInsert > 0) {
//
//			return movelineDetail(movelineNumber, 1, model, session, listURL);
//
//		} else {
//
//			message = "실패";
//			path = "redirect:/movline-main";
//			ra.addFlashAttribute(message);
//			return path;
//		}
//	}
	
	
	// 여기부터 
	@PostMapping("/{mode}/moveline-content")
	public String movelineInsert(@RequestParam Map<String, String> param,
								 @RequestParam("indexValue") int[] indexArray,
								 @ModelAttribute("loginUser") User loginUser,
								 @RequestHeader("referer") String listURL,
								 @PathVariable("mode") String mode,
								 Model model,
								 HttpSession session, RedirectAttributes ra,
								 HttpServletRequest req,
								 @RequestParam(value = "images", required = false) List<MultipartFile> imageList,
								 @RequestParam("hashTag") String hashList
//								 @RequestParam(value = "hashTag", required = false) List<MoveLineHashTag> hashList 
								 
		)throws IOException {
		
		String webPath = "/resources/images/moveline/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		String message = "";
		String path = "";
		
		System.out.println("param.size() : " + param.size());
		System.out.println("param.size : " + param);
		
//		if(int i=0; i<param.getTheme_arr[]; i++) {
//			System.out.println("param.size : " + param.theme_arr[i]);
//		}

		int movelineNumber = service.insertMoveline(param, imageList, hashList, loginUser.getUserNo(), webPath, folderPath);
		System.out.println("insert 1 : " + param);
		
		
		
		int movelineIndexInsert = service.insertIndex(indexArray, movelineNumber);
		System.out.println("insert 2 : " + param);

		if (movelineIndexInsert > 0) {
			
			System.out.println("movelineIndexInsert : " + movelineIndexInsert);
			return movelineDetail(movelineNumber, 1, model, session, listURL);
			
		} else {
			
			message = "실패";
			path = "redirect:/movline-mani";
			ra.addFlashAttribute(message);
			return path;
		}
	}
}
