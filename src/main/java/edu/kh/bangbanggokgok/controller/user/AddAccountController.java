package edu.kh.bangbanggokgok.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bangbanggokgok.service.user.UserService;
import edu.kh.bangbanggokgok.service.user.UserServiceImpl;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@RequestMapping("addAccount/*")
public class AddAccountController {

	@Autowired
	private UserService service;
	
	@GetMapping("sign-up")
	public String addAcount() {
		return "user/addAccount/signUp";
	}
	
	@PostMapping("sign-up")
	public String addAccount(User account,
			RedirectAttributes ra) {
		
		int result = service.addAccount(account);
		
		if(result>0) {
			ra.addFlashAttribute("message", "생성 성공");
		} else {
			ra.addFlashAttribute("message", "실패");
		}
		
		return "redirect:/";
	}
//	중복 ajex
	public int duplicateEmail() {
		return 1;
	}
	
}
