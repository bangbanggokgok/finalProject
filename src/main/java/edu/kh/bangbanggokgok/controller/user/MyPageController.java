package edu.kh.bangbanggokgok.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.bangbanggokgok.service.user.MyPageService;


@Controller
@RequestMapping("/myPage")
@SessionAttributes({"loginUser"})
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	@GetMapping("/info")
	public String info() {
		return "myPage/myPage-favorite";
	}
	
	
}
