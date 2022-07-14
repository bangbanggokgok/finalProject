package edu.kh.bangbanggokgok.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.annotation.ApplicationScope;

@Controller
public class MainController {

	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	
}
