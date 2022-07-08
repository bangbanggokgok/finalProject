package edu.kh.bangbanggokgok.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@GetMapping("")
	public String login() {
		return "loginPage/loginPage";
	}
	
	@PostMapping("")
	public String login(User user) {
		return "loginPage/loginPage";
	}
	
	
	public String findAccount() {
		return "";
	}
}
