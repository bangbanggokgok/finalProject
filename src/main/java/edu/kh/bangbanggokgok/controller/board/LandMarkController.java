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


	@GetMapping("/list")
	public String landMarkMainPage() {
		return "landMark/landmark";
			}
	

	
	@Autowired
	private LandMarkService service;
	
	@GetMapping("/list/{locationType}")
	public String landMarkMainPage(@RequestParam(value="locationType",required=false,defaultValue="1") int locationType
			,Model model) {
		
		// 랜드마크 목록 조회 서비스
		// 지역 이름 조회
		// 게시글 목록 조회
		Map<String, Object> map = service.selectLandMarkList(locationType);
		
		model.addAttribute("map", map);
		
		return "landMark/randmark";

	}
	@GetMapping("/landmark-detail")
	public String landMarkDetail() {
		return "landMark/land-detail";
	}
}
