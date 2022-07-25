package edu.kh.bangbanggokgok.controller.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bangbanggokgok.service.board.ReportService;
import edu.kh.bangbanggokgok.vo.admin.ReportMoveLine;
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@SessionAttributes("loginUser")
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	private ReportService service;
	
	@GetMapping("/moveline")
	public String reportML(@RequestParam(value="movelineNo", required=true, defaultValue = "1") int moveLineNo) {
		return "moveline/movelineReport";
	}
	
	@PostMapping("/moveline/insert")
	public String reportML(@RequestParam(value="moveLineNo", required=true, defaultValue = "1") int moveLineNo,
						@RequestParam(value="report" , required=false) String reportReason,
						@ModelAttribute("loginUser") User loginUser, ReportMoveLine report
						,HttpServletRequest req, RedirectAttributes ra) {
		report.setMoveLineNo(moveLineNo);
		report.setUserNo(loginUser.getUserNo());
		report.setReportReason(reportReason);
		
		int result = service.reportML(report);
		
		String message = null;
		String path = null;
		if(result > 0) {
			path = "../../moveline-main/detail/" + moveLineNo;
			message = "신고 완료";
		}else {
			path = req.getHeader("referer");
			message = "신고 실패";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}
}
