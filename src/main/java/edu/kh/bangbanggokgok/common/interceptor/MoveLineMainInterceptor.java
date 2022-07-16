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
		
		if(application.getAttribute("preHashTagList") == null) {
			
			List<MoveLineHashTag> preHashTagList = MovelineService.selectMoveLineMain();
			
			
			application.setAttribute("preHashTagList", preHashTagList);
		}
		
		
		if(application.getAttribute("preMoveLineList") == null) {
			
			
			//List<List> aaa = new ArrayList();
			//List<String> bbb = new ArrayList();
			//aaa.add(bbb);
			
			//1. 코스 게시글 번호 제일 큰거 가져와 변수로 담아
			//2. ex) maxNo = 1.
			//3. List<MoveLineDetail> preMoveLineList = MovelineService.selectMoveLineMain2(maxNo);
			//3-1. 쿼리 where에  WHERE ML_NO > 'maxNo' - 3
			
			List<MoveLine> lastNo = MovelineService.selectLastNo();
			List<MoveLineDetail> preMoveLineList = MovelineService.selectMoveLineMain2();

			application.setAttribute("preMoveLineList", preMoveLineList);
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
