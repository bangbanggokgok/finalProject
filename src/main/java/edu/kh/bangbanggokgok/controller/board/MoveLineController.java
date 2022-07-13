package edu.kh.bangbanggokgok.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//import edu.kh.bangbanggokgok.service.board.MoveLineService;
import edu.kh.bangbanggokgok.vo.board.MoveLine;


@Controller
@RequestMapping("moveline-main/*")
public class MoveLineController {
	
//	@Autowired
//	private MoveLineService service;
//	
	// 코스 구분 페이지 조회
	@GetMapping("/list")
	public String moveLineSort() {
		return "moveline/movelineSort";
	}

	
	
}