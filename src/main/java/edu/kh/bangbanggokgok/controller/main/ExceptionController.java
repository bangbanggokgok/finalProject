package edu.kh.bangbanggokgok.controller.main;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
	
	/* 스프링의 예외처리 방법 ( 3가지, 중복 사용 가능)
	 * 1 순위 : 메소드 단위 ( try - catch / throws ) 
	 * 2 순위 : 컨트롤러 단위 ( @ExceptionHandler ) - 메소드에 작성
	 * 3 순위 : 어플리케이션 단위 ( @ControllerAdvice ) - 클래스에 작성
	 * */
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		e.printStackTrace();
		model.addAttribute("errorMessage","서비스 이용 중 문제가 발생했습니다.");
		model.addAttribute("e",e);
		return "common/error";
	}
	
	
}
