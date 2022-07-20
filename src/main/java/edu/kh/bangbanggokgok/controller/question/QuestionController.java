package edu.kh.bangbanggokgok.controller.question;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@PostMapping("/inquiry/q_write")
	public String questionWrite(QuestionDetail detail
							  , @ModelAttribute("loginUser") User loginUser
							  , HttpServletRequest req
							  , RedirectAttributes ra) throws IOException {
		
		detail.setUserNo(loginUser.getUserNo());
		
		int questionNo = service.insertQuestion(detail);
		
		String path = null;
		String message = null;
		
		if(questionNo>0) {
			path = "detail/"+questionNo+"?cp=1";
			message = "문의 게시글이 작성되었습니다.";
		} else {
			path = req.getHeader("referer");
			message = "작성 실패";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}
	
	
	
	
}
