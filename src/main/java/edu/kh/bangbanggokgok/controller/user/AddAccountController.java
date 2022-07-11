package edu.kh.bangbanggokgok.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.bangbanggokgok.service.user.UserService;
import edu.kh.bangbanggokgok.service.user.UserServiceImpl;

@Controller
@RequestMapping("addAccount")
public class AddAccountController {

//	@Autowired
	private UserServiceImpl service;
	
	@GetMapping("")
	public String addAcount() {
		return "addAccount/signUp";
	}
	
	@PostMapping("")
	public int addAccount() {
		return 1;
	}
}
