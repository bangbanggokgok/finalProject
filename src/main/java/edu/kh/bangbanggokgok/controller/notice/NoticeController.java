package edu.kh.bangbanggokgok.controller.notice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

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
	public String list(@PathVariable("list") String list,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		Map<String, Object> map = service.selectNoticeList(cp, list);

		model.addAttribute("map", map);

		return "notice/notice";
	}

	// 공지 상세 조회
	@GetMapping("/detail/{noticeNo}")
	public String boardDetail(@PathVariable("noticeNo") int noticeNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, HttpSession session,
			HttpServletRequest req, HttpServletResponse resp) {

		NoticeDetail detail = service.selectNoticeDetail(noticeNo);
		model.addAttribute("detail", detail);
		return "notice/noticeDetail";
	}

	// 공지 ajax 조회
	@ResponseBody
	@GetMapping("/type/{list}")
	public String noticelist(@PathVariable("list") String list,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam(value = "selectType") String selectType) {

		Map<String, Object> map = new HashMap<String, Object>();

		if (selectType.equals("notice")) {
			map = service.selectNotice(cp, list);
		} else {
			map = service.selectEvent(cp, list);
		}
		
		return new Gson().toJson(map);
	}

}
