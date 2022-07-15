package edu.kh.bangbanggokgok.controller.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.bangbanggokgok.service.board.LandMarkService;

@Controller
@RequestMapping("landmark/*")
public class LandMarkController {

	@Autowired
	private LandMarkService service;
	
	@GetMapping("/list")
	public String landmarkMainPage(Model model) {
		
		
		// 랜드마크 목록 조회 서비스
		// 게시글 목록 조회
		Map<String, Object> map = service.selectAllLandMarkList();
		
		model.addAttribute("map", map);
		
		return "landMark/landmark";
	}
	
	
	@GetMapping("/list/{locationNum}")
	public String landMarkListPage(@RequestParam(value="locationNum"
									,required=false
									,defaultValue="100") 
									int locationType
									,Model model) {
		
		// 랜드마크 특정 지역 목록 조회 서비스
		// 지역 이름 조회
		// 게시글 목록 조회
		Map<String, Object> map = service.selectLandMarkList(locationType);
		
		model.addAttribute("map", map);
		
		return "landMark/landmark";

	}
	@GetMapping("/landmark-detail")
	public String landMarkDetail() {
		return "landMark/land-detail";
	}
}
