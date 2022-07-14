package edu.kh.bangbanggokgok.controller.question;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.bangbanggokgok.service.question.QuestionService;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@SessionAttributes({"loginUser"})
public class QuestionController {
	
	@Autowired
	private QuestionService service;

	// 문의 게시판 목록 조회
	@GetMapping("myPage/inquiry")
	public String questionList(@ModelAttribute("loginUser") User loginUser
							 , @RequestParam(value="cp", required=false, defaultValue="1") int cp
							 , Model model
							 , @RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = service.selectQuestionList(cp, loginUser);

		model.addAttribute("map", map);
		
		return "myPage/myPage-inquiry";
	}
	
}
