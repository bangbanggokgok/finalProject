package edu.kh.bangbanggokgok.controller.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kh.bangbanggokgok.service.board.MoveLineService;
import edu.kh.bangbanggokgok.vo.board.MoveLineDetail;


@Controller
@RequestMapping("moveline-main/*")
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
			@RequestParam(value="MLHashTag", required=true) String MLHashTag,
			@RequestParam Map<String, Object> paramMap
			
			) {
		
		Map<String, Object> map = null;
		
		paramMap.put("cp", cp);
		paramMap.put("MLHashTag", MLHashTag);
		
		map = service.selectHashTagList(paramMap);
		
		model.addAttribute("map",map);
		
		return "moveline/movelineList";
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	/** 특정 해시태그 목록 조회
//	 * @param model
//	 * @param MLHashTagNo
//	 * @param cp
//	 * @return map
//	 */
//	@GetMapping("/list/hashtag/{MLHashTagNo}")
//	public String moveLineHashTag(Model model,
//								@PathVariable("MLHashTagNo") int MLHashTagNo,
//								@RequestParam(value="cp", required=false, defaultValue="1") int cp
//								) {
//		
//		Map<String, Object> map = null;
//		
////		map = service.selectHashTagList(cp, MLHashTagNo);
//		
//		model.addAttribute("map",map);
//		
//		return "moveline/movelineList";
//	}
//	
//	
//	
//	@GetMapping("/list/hashtag?hashTagName={MLHashTag}")
//	public String movelineHashTag2(
//			
//			Model model,
//			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
//			@RequestParam(value="MLHashTag", required=false, defaultValue="") String MLHashTag,
//			@RequestParam Map<String, Object> paramMap) {
//		
//		Map<String, Object> map = null;
//			
//					
//		paramMap.put("cp", cp);
//		paramMap.put("MLHashTag", MLHashTag);
//
//		map = service.selectHashTagList(paramMap);
//		
//		model.addAttribute("map",map);
//
//		
//		return null;
//		
//	}
	
	
//	// 코스 구분 페이지 조회
//	@GetMapping("/list/main")
//	public String moveLineMain(Model model) {
//		
//		return "moveline/movelineSort";
//	}
	
	
}