package edu.kh.bangbanggokgok.controller.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import edu.kh.bangbanggokgok.service.notice.NoticeService;
import edu.kh.bangbanggokgok.vo.notice.NoticeDetail;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@RequestMapping("/notice")
@SessionAttributes({ "loginUser" })
public class NoticeController {

	@Autowired
	private NoticeService service;
	
    // 공지 목록 조회
	@GetMapping("/{list}")
	public String list(@PathVariable("list") String list, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model){
		
		Map<String, Object> map = service.selectNoticeList(cp, list);
		
		model.addAttribute("map", map);
		
		return "notice";
	}
	
	// 공지 상세 조회
	@GetMapping("/detail/{boardNo}")
	public String boardDetail( @PathVariable("boardNo") int boardNo
							, @RequestParam(value="cp", required=false, defaultValue="1") int cp
							, Model model
							, HttpSession session
							, HttpServletRequest req, HttpServletResponse resp) {
		
		NoticeDetail detail = service.selectNoticeDetail(boardNo);
		
		
		if(detail != null) {
			User loginUser = (User)session.getAttribute("loginUser");
			
			String adminFlag = "N";
			if(loginUser != null) {
				adminFlag = loginUser.getAdminFlag();
			}
		}
		
		model.addAttribute("detail", detail);
		
		return "notice/noticeDetail";
	}
	


	
	
}
