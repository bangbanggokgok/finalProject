package edu.kh.bangbanggokgok.controller.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bangbanggokgok.service.board.ReportService;
import edu.kh.bangbanggokgok.vo.admin.ReportMoveLine;
import edu.kh.bangbanggokgok.vo.admin.ReportReply;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@SessionAttributes("loginUser")
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	private ReportService service;
	
	@GetMapping("/moveline/{movelineNo}")
	public String reportML(@PathVariable("movelineNo") int movelineNo) {
		return "moveline/movelineReport";
	}
	
	@PostMapping("/moveline/{movelineNo}")
	public String reportML(@PathVariable("movelineNo") int movelineNo,
						@RequestParam(value="report" , required=false) String reportReason,
						@ModelAttribute("loginUser") User loginUser, ReportMoveLine report
						,HttpServletRequest req, RedirectAttributes ra) {
		report.setMoveLineNo(movelineNo);
		report.setUserNo(loginUser.getUserNo());
		report.setReportReason(reportReason);
		
		int result = service.reportML(report);
		
		String message = null;
		String path = null;
		if(result > 0) {
			path = "../../moveline-main/detail/" + movelineNo;
			message = "코스신고 완료";
		}else {
			path = req.getHeader("referer");
			message = "코스신고 실패";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}
	
	@GetMapping("/reply/{movelineNo}/{replyNo}")
	public String reportReply(@PathVariable("movelineNo") int movelineNo, @PathVariable("replyNo") int replyNo) {
		return "moveline/movelineReplyReport";
	}
	
	@PostMapping("reply/{movelineNo}/{replyNo}")
	public String reportReply(@PathVariable("movelineNo") int movelineNo,
							@PathVariable("replyNo") int replyNo,
							@RequestParam(value="report" , required=false) String reportReason,
							@ModelAttribute("loginUser") User loginUser, ReportReply report,
							HttpServletRequest req, RedirectAttributes ra) {
			
		report.setReplyNo(replyNo);
		report.setUserNo(loginUser.getUserNo());
		report.setReportReason(reportReason);
		
		int result = service.reportReply(report);
		
		String message = null;
		String path = null;
		if(result > 0) {
			path = "../../../moveline-main/detail/" + movelineNo;
			message = "댓글신고 완료";
		}else {
			path = req.getHeader("referer");
			message = "댓글신고 실패";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}
}
