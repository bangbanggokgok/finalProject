package edu.kh.bangbanggokgok.common.aop;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import edu.kh.bangbanggokgok.vo.user.User;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
@Aspect
public class BeforeAspect {

	private Logger logger = LoggerFactory.getLogger(BeforeAspect.class);
	
	@Before("CommonPointcut.implPointcut()")
	public void serviceStart(JoinPoint jp) {
		
		String str = "------------------------------------------------------\n";
	
		// jp.getTarget() : aop가 적용된 객체(각종 ServiceImpl)
		String className = jp.getTarget().getClass().getSimpleName(); // 간단한 클래스명(패키지명 제외)
		
		// jp.getSignature() : 수행되는 메서드 정보
		String methodName = jp.getSignature().getName();
		
		// jp.getArgs() : 메서드 호출 시 전달된 매개변수
		String param = Arrays.toString( jp.getArgs() );
		
		
		str += "Start : " + className + " - " + methodName + "\n";
		
		str += "Parameter : " + param + "\n";
		
		
		
		try {
			// HttpServletRequest 얻어오기
			// 단, 스프링 스케쥴러 동작 시 예외 발생(스케쥴러는 요청 객체가 존재하지 않음)
			HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();

			User loginUser = (User)req.getSession().getAttribute("loginUser");
			
			str += "ip : " + getRemoteAddr(req);

			if(loginUser != null) { // 로그인 상태인 경우
				str += " (email : " + loginUser.getUserEmail() + ")";
			}
			
		}catch (Exception e) {
			str += "[스케쥴러 동작]";
		}
		
		logger.info(str);
	}
	
		
	public static String getRemoteAddr(HttpServletRequest request) {

		String ip = null;

		ip = request.getHeader("X-Forwarded-For");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("Proxy-Client-IP"); 
		} 

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("WL-Proxy-Client-IP"); 
		} 

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("HTTP_CLIENT_IP"); 
		} 

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
		}

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("X-Real-IP"); 
		}

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("X-RealIP"); 
		}

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("REMOTE_ADDR");
		}

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getRemoteAddr(); 
		}

		return ip;
	}
	
	

}
