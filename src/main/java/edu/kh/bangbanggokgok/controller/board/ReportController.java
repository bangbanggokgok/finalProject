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
import edu.kh.bangbanggokgok.vo.user.User;

@Controller
@SessionAttributes("loginUser")
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	private ReportService service;
	
	@GetMapping("/moveline/{movelineNo}")
	public String reportML(@PathVariable("movelineNo") int movelineNo
			//@RequestParam(value="movelineNo", required=true, defaultValue = "1") int moveLineNo
			) {
		return "moveline/movelineReport";
	}
	
	@GetMapping("/insert/{movelineNo}")
	public String reportML(
			//@RequestParam(value="moveLineNo", required=true, defaultValue = "1") int moveLineNo,
						@RequestParam(value="report" , required=false) String reportReason,
						@ModelAttribute("loginUser") User loginUser,
						ReportMoveLine report,
						@PathVariable("movelineNo") int movelineNo
						,HttpServletRequest req, RedirectAttributes ra) {
		
		System.out.println("insert controller : " + movelineNo);
		
		report.setMoveLineNo(movelineNo);
		report.setUserNo(loginUser.getUserNo());
		report.setReportReason(reportReason);
		
		int result = service.reportML(report);
		
		String message = null;
		String path = null;
		if(result > 0) {
			path = "../../moveline-main/detail/" + movelineNo;
			message = "신고 완료";
		}else {
			path = req.getHeader("referer");
			message = "신고 실패";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}
}
