package edu.kh.bangbanggokgok.controller.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.bangbanggokgok.service.board.LandMarkService;
import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("landmark-main/*")
public class LandMarkController {

	@Autowired
	private LandMarkService service;
	
	@GetMapping("/list")
	public String landmarkMainPage(Model model) {
		
		
		// 랜드마크 목록 조회 서비스
		// 게시글 목록 조회
		Map<String, Object> map = service.selectAllLandMarkList();
		
		model.addAttribute("map", map);
		
		return "landMark/landmark";
	}
	
	
	@GetMapping("/list/{locationNum}")
	public String landMarkListPage(@RequestParam(value="locationNum"
									,required=false
									,defaultValue="100") 
									int locationType) {
		
		// 랜드마크 특정 지역 목록 조회 서비스
		// 지역 이름 조회
		// 게시글 목록 조회
		Map<String, Object> map = service.selectLandMarkList(locationType);
		
		model.addAttribute("map", map);
		
		return "landMark/landmark";

	}
	// 랜드마크 상세 조회
	@GetMapping("/detail/{landMakrNo}")
	public String landMarkDetail(@PathVariable ("landMarkNo") int landMakrNo
								 ,Model model,
								 HttpSession session,
								 HttpServletRequest req, HttpServletResponse resp) {
		
		LandMarkDetail detail = service.selectLandMakrDetail(landMakrNo);
		
		return "landMark/land-detail";
	}
	// 게시글 작성 화면 전환
	@GetMapping("/write")
	public String landWriteForm(String mode, Model model) {
		
		
		
		
		return "land/landWriteForm";
	}
	
	// 게시글 삽입/수정
	@PostMapping("/write")
	public String landWrite() {
		
		
		
		return "redirect:";
	}
	
	
	
}
