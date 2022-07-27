package edu.kh.bangbanggokgok.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.bangbanggokgok.common.Util;
import edu.kh.bangbanggokgok.service.admin.AdminService;
import edu.kh.bangbanggokgok.service.notice.NoticeService;
import edu.kh.bangbanggokgok.vo.admin.ReportMoveLine;
import edu.kh.bangbanggokgok.vo.notice.NoticeDetail;
import edu.kh.bangbanggokgok.vo.question.Question;
import edu.kh.bangbanggokgok.vo.question.QuestionDetail;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@RequestMapping("/admin")
@SessionAttributes({ "loginUser" })
public class AdminController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private NoticeService noticeService;

	@GetMapping("/main")
	public String main() {
		return "admin_/main-admin";
	}

	// 공지 작성
	@GetMapping("/notice/{mode}")
	public String noticeWriteForm(@PathVariable String mode, Model model, @RequestParam(value = "noticeNo", required = false, defaultValue="0") int noticeNo) {
		
		if(mode.equals("update")) { // 수정
			NoticeDetail detail = noticeService.selectNoticeDetail(noticeNo);
			
			detail.setNoticeContent(Util.newLineClear(detail.getNoticeContent()));
			
			model.addAttribute("detail", detail);
		}
		
		return "admin_/notice-write";
	}

	// 공지 작성(삽입, 수정)
	@PostMapping("/notice/{mode}")
	public String noticeWrite(NoticeDetail detail,  @PathVariable String mode,
			@RequestParam(value = "images", required = false) List<MultipartFile> imageList,
			@ModelAttribute("loginUser") User loginUser, HttpServletRequest req, RedirectAttributes ra,
			@RequestParam(value="deleteList", required = false) String deleteList)
			throws IOException {

		detail.setUserNo(loginUser.getUserNo());

		String webPath = "/resources/images/notice";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);

		if (mode.equals("insert")) {
			String path = null;
			String message = null;

		int noticeNo = service.insertNotice(detail, imageList, webPath, folderPath);


		if (noticeNo > 0) {
			path = "../../notice/detail/" + noticeNo;
			message = "등록되었습니다.";

		} else {
			path = req.getHeader("referer");
			message = "등록 실패";
		}

		ra.addFlashAttribute("message", message);

		return "redirect:" + path;

		} else { // 수정
			
			int result = service.updateNotice(detail, imageList, webPath, folderPath, deleteList);
			
			String path = null;
			String message = null;
			if(result > 0) {
				message = "공지가 수정되었습니다.";
				path = "../../notice/detail/" + detail.getNoticeNo();
			}else {
				message = "공지 수정 실패";
				path = req.getHeader("referer");
			}
			
			
			return "redirect:" + path;
		}

	}

	// 회원 조회
	@GetMapping("/user/{list}")
	public String userList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@RequestParam Map<String, Object> paramMap, User user, @PathVariable("list") String list) {

		Map<String, Object> map = service.selectUserList(cp, list);

		model.addAttribute("map", map);

		return "admin_/user-list";
	}

	// 문의 조회
	@GetMapping("/qna/{list}")
	public String inquiryList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@RequestParam Map<String, Object> paramMap, Question question, @PathVariable("list") String list) {

		Map<String, Object> map = service.selectInquiryList(cp, list);
		model.addAttribute("map", map);

		return "admin_/inquiry-list";
	}

	// 문의 상세 조회
	@GetMapping("/qna/detail/{questionNo}")
	public String QuestionDetail(@PathVariable("questionNo") int questionNo, Model model,
			@ModelAttribute("loginUser") User loginUser) {

		QuestionDetail detail = service.selectQuestionDetail(questionNo);

//		detail.setUserNo(loginUser.getUserNo());

		model.addAttribute("detail", detail);
		return "admin_/inquiry-detail";
	}

	// 문의 답변 등록
	@ResponseBody
	@PostMapping("/qna/insert")
	public int insertAnswer(QuestionDetail detail) {
		return service.insertAnswer(detail);
	}

	// 코스 신고 조회
	@GetMapping("/report/course/{list}")
	public String reportList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@RequestParam Map<String, Object> paramMap, @PathVariable("list") String list) {

		Map<String, Object> map = service.selectreportList(cp, list);
		model.addAttribute("map", map);

		return "admin_/report-course";
	}

	// 코스 신고 처리
	@ResponseBody
	@GetMapping("/report/situation")
	public int updateReport(ReportMoveLine report) {
		return service.updateReport(report);
	}

	// 댓글 신고 조회
	@GetMapping("/report/reply/{list}")
	public String replyReportList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@RequestParam Map<String, Object> paramMap, @PathVariable("list") String list) {

		Map<String, Object> map = service.selectReplyReport(cp, list);
		model.addAttribute("map", map);

		return "admin_/report-reply";
	}

	// 회원 상태별 조회
	@ResponseBody
	@GetMapping("/user/situation/{list}")
	public String userSituation(@PathVariable("list") String list,
								@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
								@RequestParam("selectUser") String selectUser) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (selectUser.equals("register")) {
			map = service.selectSignUpUser(cp, list);
		} else {
			map = service.selectSecession(cp, list);
		}
		return new Gson().toJson(map);
	}
		
	
}
