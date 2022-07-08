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

@WebFilter(filterName = "initFilter",urlPatterns = "/*")
public class InitFilter extends HttpFilter implements Filter {
	
	private Logger logger = LoggerFactory.getLogger(InitFilter.class); 
	
	public void init(FilterConfig fConfig) throws ServletException {
		logger.info("초기화 필터 생성");
	}
	
	public void destroy() {
		logger.info("필터 파괴");
	}

	public void doFilter( ServletRequest request
						, ServletResponse response
						, FilterChain chain) throws IOException, ServletException {
		ServletContext application = request.getServletContext();
		
		String contextPath =  ( (HttpServletRequest)request ).getContextPath();
		
		application.setAttribute("contextPath", contextPath);
		chain.doFilter(request, response);
	}

}
