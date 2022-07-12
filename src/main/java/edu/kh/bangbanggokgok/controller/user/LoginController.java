package edu.kh.bangbanggokgok.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bangbanggokgok.service.user.UserService;
import edu.kh.bangbanggokgok.service.user.UserServiceImpl;

@Controller
@RequestMapping("user/*")
public class LoginController {

	@Autowired
	private UserService service;
	
	@GetMapping("login")
	public String login() {
		return "user/loginPage/loginPage";
	}

	@PostMapping("login")
	public String login(@RequestParam(value = "email") String email,
			@RequestParam(value = "password") String password,
			RedirectAttributes ra) {
		
		int result = service.login(email,password);
		
		if(result>0) {
			ra.addFlashAttribute("message","로그인 성공");
		} else {
			ra.addFlashAttribute("message","실패");
		}
		
		return "redirect:/";
	}

	@PostMapping("find-account")
	public String findAccount() {
		return "";
	}
	
}
