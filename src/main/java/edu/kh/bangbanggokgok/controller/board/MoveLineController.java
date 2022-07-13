//package edu.kh.bangbanggokgok.controller.board;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import edu.kh.bangbanggokgok.service.board.MoveLineService;
//import edu.kh.bangbanggokgok.vo.board.MoveLine;
//
//
//@Controller
//@RequestMapping("movelineSort/*")
//public class MoveLineController {
//	
//	@Autowired
//	private MoveLineService service;
//	
//	// 코스 구분 페이지 조회
//	@GetMapping("")
//	public String moveLineSort() {
//		return "moveline/movelineSort";
//	}
//
//	// 지역별 목록 페이지 조회
//	@GetMapping("locationType"+"num/")
//	public String locationType(@PathVariable("locationType") int locationType,
//							   @RequestParam(value="num") int num,
//							   @RequestParam(value="cp", required=false, defaultValue="1") int cp,
//							   Model model
//							   ) {
//		
//		List<MoveLine> locationList = service.selectLocationList();
//		
//		return null;
//	}
//	
//	
//	
//	
//}