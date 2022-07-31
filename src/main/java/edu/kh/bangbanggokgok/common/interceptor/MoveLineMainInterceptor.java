package edu.kh.bangbanggokgok.common.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import edu.kh.bangbanggokgok.service.board.MoveLineService;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.board.MoveLineBookmark;
import edu.kh.bangbanggokgok.vo.board.MoveLineDetail;
import edu.kh.bangbanggokgok.vo.hashTag.MoveLineHashTag;


// 코스 
public class MoveLineMainInterceptor implements HandlerInterceptor{
	
	
	@Autowired
	private MoveLineService MovelineService;
	
	@Override
	public boolean preHandle( HttpServletRequest request
							, HttpServletResponse response
							, Object handler)
			throws Exception {
		
		ServletContext application = request.getServletContext();
		
		
		// 코스 메인 - 랜덤 해시태그 10개 조회		
		if(application.getAttribute("preHashTagList") == null) {
			
			List<MoveLineHashTag> preHashTagList = MovelineService.selectMoveLineMain();
			
			application.setAttribute("preHashTagList", preHashTagList);
		}
		
		
		
		// 코스 메인 - 최신 코스 3개 조회		

		if(application.getAttribute("preMoveLineList") == null) {
			
			List<MoveLineDetail> preMoveLineList = MovelineService.selectMoveLineMain2();

			application.setAttribute("preMoveLineList", preMoveLineList);
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
		
		
//		// 코스 목록 - 즐겨찾기용
//		if(application.getAttribute("bookmarkCheck") == null) {
//			
//			List<MoveLineBookmark> bookmarkCheck = MovelineService.bookmarkCheck();
//			
//			application.setAttribute("preMoveLineList", bookmarkCheck);
//		}
//		
//		return HandlerInterceptor.super.preHandle(request, response, handler);
//		
		
		
		
		
	}

}
