package edu.kh.bangbanggokgok.common.interceptor;



import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import edu.kh.bangbanggokgok.service.board.MoveLineService;
import edu.kh.bangbanggokgok.vo.board.Location;

public class LocationInterceptor implements HandlerInterceptor{
	
	
	@Autowired
	private MoveLineService MovelineService;
	
	@Override
	public boolean preHandle( HttpServletRequest request
							, HttpServletResponse response
							, Object handler)
			throws Exception {
		
		ServletContext application = request.getServletContext();
		if(application.getAttribute("locationList") == null) {
			List<Location> locationList = MovelineService.selectLocation();
			application.setAttribute("locationList", locationList);
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
