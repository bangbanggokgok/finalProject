package edu.kh.bangbanggokgok.common.aop;

import org.aspectj.lang.annotation.Pointcut;

// Pointcut을 모아둘 클래스
public class CommonPointcut {

	// 회원 서비스용 Pointcut
	@Pointcut("execution(* edu.kh.bangbanggokgok.service.user..*Impl.*(..))")
	public void userPointcut() {}

	// 모든 ServiceImpl 클래스용 Pointcut
	@Pointcut("execution(* edu.kh.bangbanggokgok..*Impl.*(..))")
	public void implPointcut() {}
	
	
}
