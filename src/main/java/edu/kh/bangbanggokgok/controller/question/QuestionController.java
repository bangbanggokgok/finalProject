package edu.kh.bangbanggokgok.controller.question;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.bangbanggokgok.service.question.QuestionService;
import edu.kh.bangbanggokgok.vo.question.QuestionDetail;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@RequestMapping("/myPage")
@SessionAttributes({"loginUser"})
public class QuestionController {
	
	@Autowired
	private QuestionService service;

	// 문의 게시판 목록 조회
	@GetMapping("/inquiry")
	public String questionList(@ModelAttribute("loginUser") User loginUser
							 , @RequestParam(value="cp", required=false, defaultValue="1") int cp
							 , Model model
							 , @RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = service.selectQuestionList(cp, loginUser);

		model.addAttribute("map", map);
		
		return "myPage/myPage-inquiry";
	}
	
	// 문의 게시글 상세 조회
	@GetMapping("/inquiry/detail/{questionNo}")
	public String questionDetail(@PathVariable("questionNo") int questionNo
							   , @RequestParam(value="cp", required=false, defaultValue="1") int cp
							   , Model model
							   , HttpServletRequest req, HttpServletResponse resp) {
		
		QuestionDetail detail = service.selectQuestionDetail(questionNo);
		
		model.addAttribute("detail", detail);
		
		return "myPage/myPage-inquiryDetail";
	}
	
	// 문의 게시글 작성 화면
	@GetMapping("/inquiry/q_write")
	public String questionWriteForm(@RequestParam(value="cp", required=false, defaultValue="1") int cp) {
		return "myPage/myPage-inquiryWrite";
	}
	
	// 문의 게시글 등록
	
	
}
