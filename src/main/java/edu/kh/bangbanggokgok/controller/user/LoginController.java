package edu.kh.bangbanggokgok.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bangbanggokgok.service.user.UserService;
import edu.kh.bangbanggokgok.service.user.UserServiceImpl;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@RequestMapping("user/*")
@SessionAttributes({ "loginUser" })
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
			RedirectAttributes ra, Model model) {
		
		User result = service.login(email,password);
		String path = "";
		if(result!=null) {
			model.addAttribute("loginUser",result);
			ra.addFlashAttribute("message","로그인 성공");
			path = "redirect:/";
		} else {
			ra.addFlashAttribute("message","실패");
			path = "redirect:/user/login";
		}
		return path;
	}

	@PostMapping("find-account")
	public String findAccount() {
		return "";
	}
	
}
