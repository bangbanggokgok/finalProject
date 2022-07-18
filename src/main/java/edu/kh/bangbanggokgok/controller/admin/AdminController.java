package edu.kh.bangbanggokgok.controller.admin;

import java.io.IOException;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bangbanggokgok.service.admin.AdminService;
import edu.kh.bangbanggokgok.vo.notice.NoticeDetail;
import edu.kh.bangbanggokgok.vo.question.Question;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginUser"})
public class AdminController {

	@Autowired
	private AdminService service;
	
	@GetMapping("/main")
	public String main() {
		return "admin_/main-admin";
	}
	
	
	// 공지 작성
	@GetMapping("/notice/write")
	public String noticeWriteForm(String mode,
								 @RequestParam(value="no", required=false, defaultValue = "0") int noticeNo,
								 Model model) {




		return "admin_/notice-write";
	}
	
	
	// 공지 작성(삽입, 수정)
	@PostMapping("/notice/write")
	public String noticeWrite(NoticeDetail detail,
							@RequestParam(value = "images", required = false) List<MultipartFile> imageList, String mode,
							@ModelAttribute("loginUser") User loginUser, HttpServletRequest req, RedirectAttributes ra) throws IOException {

		detail.setUserNo(loginUser.getUserNo());

		String webPath = "/resources/images/notice";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);

//		if (mode.equals("insert")) {
			
			int noticeNo = service.insertNotice(detail, imageList, webPath, folderPath);

			String path = null;
			String message = null;
			
			if(noticeNo > 0) {
				path = "../../notice/detail/" + noticeNo;
				message = "등록되었습니다.";
				
			}else {
				path = req.getHeader("referer");
				message = "등록 실패";
			}
			
			ra.addFlashAttribute("message", message);
			
			return "redirect:" + path;
			
			
//		} else {
//			
//			return null;
//		}
		
	}
	
	// 회원 조회
	@GetMapping("/user/{list}")
	public String userList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
						 , Model model
						 , @RequestParam Map<String, Object> paramMap
						 , User user, @PathVariable("list") String list) {
		
		
		Map<String, Object> map = service.selectUserList(cp, list);
		
		model.addAttribute("map", map);
		
		return "admin_/user-list";
	}
	
	// 문의 조회
	@GetMapping("/inquiry/{list}")
	public String inquiryList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
							 , Model model
							 , @RequestParam Map<String, Object> paramMap
							 , Question question, @PathVariable("list") String list) {
		
		Map<String, Object> map = service.selectInquiryList(cp, list);
		model.addAttribute("map", map);
		
		return "admin_/inquiry-list";
	}
	
	// 신고 코스 조회
	@GetMapping("/report/{list}")
	public String reportList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
							 , Model model
							 , @RequestParam Map<String, Object> paramMap
							 , Question question, @PathVariable("list") String list) {
		
		
		Map<String, Object> map = service.selectreportList(cp, list);
		model.addAttribute("map", map);
		
		return "admin_/report-list";
	}
	
	
	
}