package edu.kh.bangbanggokgok.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("user/*")
public class LoginController {

	@GetMapping("login")
	public String login() {
		return "user/loginPage/loginPage";
	}

	@PostMapping("login")
	public String login(@RequestParam(value = "email") String email,
			@RequestParam(value = "password") String password) {
		return "redirect:/";
	}

	@PostMapping("find-account")
	public String findAccount() {
		return "";
	}
	
}
