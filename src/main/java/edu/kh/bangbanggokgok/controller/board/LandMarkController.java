package edu.kh.bangbanggokgok.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("landmark-main/*")
public class LandMarkController {

	@GetMapping("/list")
	public String landMarkMainPage() {
		return "landMark/randmark";
	}
	@GetMapping("/landmark-detail")
	public String landMarkDetail() {
		return "landMark/land-detail";
	}
}
