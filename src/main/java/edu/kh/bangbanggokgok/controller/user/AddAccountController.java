package edu.kh.bangbanggokgok.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import edu.kh.bangbanggokgok.service.user.UserService;
import edu.kh.bangbanggokgok.service.user.UserServiceImpl;

//@Controller
public class AddAccountController {

//	@Autowired
	private UserServiceImpl service;
	
//	@PostMapping()
	public int addAccount() {
		return 1;
	}
}