package edu.kh.bangbanggokgok.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Servlet Filter implementation class Init
 */
@WebFilter(filterName = "initFilter",urlPatterns = "/*")
public class InitFilter extends HttpFilter implements Filter {
//       slf4j
	
	private Logger logger = LoggerFactory.getLogger(InitFilter.class); 
	
	public void init(FilterConfig fConfig) throws ServletException {
//		logger - trace , debug , info , warn , erorr
		logger.info("초기화 필터 생성");
	}
	
	public void destroy() {
		logger.info("필터 파괴");
	}

	public void doFilter( ServletRequest request
						, ServletResponse response
						, FilterChain chain) throws IOException, ServletException {
		// application 내장 객체 얻어오기
		ServletContext application = request.getServletContext();
		
		// 최상위 주소 얻어오기
		String contextPath =  ( (HttpServletRequest)request ).getContextPath();
		                       // 다운캐스팅
		
		// 세팅
		application.setAttribute("contextPath", contextPath);
		chain.doFilter(request, response);
	}

}
