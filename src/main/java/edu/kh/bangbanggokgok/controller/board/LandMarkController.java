package edu.kh.bangbanggokgok.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("landmark-main")
public class LandMarkController {

	@GetMapping("")
	public String landMarkMainPage() {
		return "landMark/randmark";
	}
}
