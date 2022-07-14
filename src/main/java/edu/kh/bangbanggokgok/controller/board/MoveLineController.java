package edu.kh.bangbanggokgok.controller.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.ApplicationScope;

import edu.kh.bangbanggokgok.service.board.MoveLineService;
import edu.kh.bangbanggokgok.vo.board.Location;
//import edu.kh.bangbanggokgok.service.board.MoveLineService;


@Controller
@RequestMapping("moveline-main/*")
public class MoveLineController {
	
//	@Autowired
	private MoveLineService service;
//	
	// 코스 구분 페이지 조회
	@GetMapping("/list")
	public String moveLineSort(Model model) {
		return "moveline/movelineSort";
	}
	
	@GetMapping("/list/location/*")
	public String moveLineLocation() {
		
		return "";
	}
	
	@GetMapping("")
	public String moveLine() {
		return "";
	}

	
	
}