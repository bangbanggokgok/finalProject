package edu.kh.bangbanggokgok.controller.notice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.bangbanggokgok.service.notice.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@GetMapping("/list")
	public String list(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model){
		
		Map<String, Object> map = service.selectNoticeList(cp);
		
		model.addAttribute("map", map);
		
		return "notice";
	}
}
