package edu.kh.bangbanggokgok.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.bangbanggokgok.service.board.MoveLineService;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.board.MoveLineBookmark;
import edu.kh.bangbanggokgok.vo.board.MoveLineDetail;
import edu.kh.bangbanggokgok.vo.user.MyMoveline;
import edu.kh.bangbanggokgok.vo.user.User;


@Controller
@RequestMapping("moveline-main/*")
@SessionAttributes("loginUser")
public class MoveLineController {
	
	@Autowired
	private MoveLineService service;
	
	
	// 코스 구분 페이지 조회
	@GetMapping("/list")
//	@ResponseBody
	public String moveLineSort(Model model) {
		
//		List<MoveLineDetail> list = service.selectMoveLineMain();
//		List<MoveLineDetail> list2 = service.selectMoveLineMain2();
		
//		return new Gson().toJson(list);
		return "moveline/movelineSort";
	}
	
	
	/** 특정 지역 코스 목록 조회
	 * @param model
	 * @param locationNum
	 * @param cp
	 * @return map
	 */
	@GetMapping("/list/location/{locationNum}")
	public String moveLineLocation(Model model,
								@PathVariable("locationNum") int locationNum,
								@RequestParam(value="cp", required=false, defaultValue="1") int cp,
								@RequestParam Map<String, Object> paramMap
								) {
		
		Map<String, Object> map = null;
		
		map = service.selectLocationList(cp, locationNum);
		
		model.addAttribute("map",map);
		
		return "moveline/movelineList";
	}
	

	/** 특정 해시태그 목록 조회
	 * @param model
	 * @param cp
	 * @param MLHashTag
	 * @param paramMap
	 * @return
	 */
	@GetMapping("/list/hashtag")
	public String movelineHashTag(
//			@PathVariable("MLHashTag") String MLHashTag,

			Model model,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			@RequestParam(value="hashtag", required=true) String MLHashTag,
			@RequestParam Map<String, Object> paramMap
			
			) {
		
		Map<String, Object> map = null;
		
		paramMap.put("cp", cp);
		paramMap.put("MLHashTag", MLHashTag);
		
		map = service.selectHashTagList(paramMap);
		
		model.addAttribute("map",map);
		
		return "moveline/movelineList";
	}
		
	
	/** 코스 즐겨찾기
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
								@RequestParam(value="movelineNo", required=true) int MovelineNo,
								@RequestParam Map<String, Object> paramMap,
								@ModelAttribute("loginUser") User loginUser,
								HttpServletRequest req,
			   					RedirectAttributes ra) {
		
		moveLineBookMark.setUserNo(loginUser.getUserNo());
		moveLineBookMark.setMovelineNo(MovelineNo);
		
		List<MoveLineBookmark> moveLineBookMark1 = service.selectBookmarkList(moveLineBookMark);
		
		int result = 0;
		
		if(moveLineBookMark1.size() == 0) {

			result = service.movelineBookmark(moveLineBookMark);	
			
		} else {

			result = 0;
			
		}
		
		return result;
	}
	
	
	// 코스 테마별 목록 조회
	@GetMapping("/list/theme")
	public String movelineTheme(String theme,
								Model model,
								@RequestParam(value="cp", required=false, defaultValue="1") int cp,
								@RequestParam Map<String, Object> paramMap
								) {

		Map<String, Object> map = null;
		
		paramMap.put("cp", cp);
		paramMap.put("theme", theme);
		
		map =  service.selectMovelineTheme(paramMap);
		
		model.addAttribute("map",map);
		
		return "moveline/movelineList";		
	}
	
	
	// 코스 전체 목록 조회
	@GetMapping("/list/selectAll")
	public String selectAll(@RequestParam Map<String, Object> paramMap,
							@RequestParam(value="cp", required=false, defaultValue="1") int cp,
							Model model,
							String selectAll
							) {
		
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
	
	
	@GetMapping("/detail/{movelineNo}")
	public String movelineDetail(
								 @PathVariable("movelineNo") int movelineNo,
								 @RequestParam(value="cp", required=false, defaultValue="1") int cp,
								 Model model,
			                     HttpSession session) {
		
		
		
		return "moveline/movelineDetail";
	}
	
	
	
	
	
	
}