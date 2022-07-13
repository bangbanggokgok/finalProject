package edu.kh.bangbanggokgok.controller.user;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.bangbanggokgok.service.user.UserService;
import edu.kh.bangbanggokgok.vo.user.User;
import oracle.net.aso.c;

@Controller
@RequestMapping("addAccount/*")
public class AddAccountController {

	@Autowired
	private UserService service;
	
	@GetMapping("sign-up")
	public String addAcount() {
		return "user/addAccount/signUp";
	}
	
	@PostMapping("sign-up")
	public String addAccount(User account,
			RedirectAttributes ra) {
		
		int result = service.addAccount(account);
		
		if(result>0) {
			ra.addFlashAttribute("message", "생성 성공");
		} else {
			ra.addFlashAttribute("message", "실패");
		}
		
		return "redirect:/";
	}
	
	@ResponseBody
	@GetMapping("email-reduplicate-check")
	public int duplicateEmail(@RequestParam("memberEmail") String userEmail) {
		return service.emailReduplicateCheck(userEmail);
	}
	
	@ResponseBody
	@GetMapping("sendEmail")
	public int sendEmail(@RequestParam("inputEmail") String userEmail
			,@RequestParam("flag") int flag) {
		
		String subject = "방방곡곡 인증 번호 안내";
		String fromEmail = "iwanttogotrip1@gmail.com";
		String fromUsername = "관리자";
		String toEmail = userEmail; // 받는사람, 콤마(,)로 여러개 나열 가능

		final String smtpEmail = "iwanttogotrip1@gmail.com"; // 이메일 (관리자 메일)
		final String password = "ninapqldpfuqplfa"; // 발급 받은 비밀번호

		// 메일 옵션 설정
		Properties props = new Properties();
		
		// 중요
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587"); //465, 587
		props.put("mail.smtp.auth", "true");

		// 추가 옵션
		props.put("mail.smtp.quitwait", "false");
		props.put("mail.smtp.socketFactory.port", "587");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "true");
		props.put("mail.smtp.starttls.enable", "true");

		
		try {
			// 메일 세션 생성
			Session session = Session.getDefaultInstance(props);

			// 메일 송/수신 옵션 설정(1명 보내기)
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail, fromUsername)); 	// 송신자(보내는 사람) 지정
			message.addRecipient(RecipientType.TO, new InternetAddress(toEmail)); // 수신자(받는사람) 지정
			message.setSubject(subject); // 이메일 제목 지정
			
			// 메일 콘텐츠 설정
			Multipart mParts = new MimeMultipart();
			MimeBodyPart mTextPart = new MimeBodyPart();

			// 인증번호 6자리 생성코드(영어 대/소문 + 숫자)
			String cNumber = "";
			for(int i=0 ; i< 6 ; i++) {
				
				int sel1 = (int)(Math.random() * 3); // 0:숫자 / 1,2:영어
				
				if(sel1 == 0) {
					int num = (int)(Math.random() * 10); // 0~9
					cNumber += num;
				}else {
					char ch = (char)(Math.random() * 26 + 65); // A~Z
					int sel2 = (int)(Math.random() * 2); // 0:소문자 / 1:대문자
					if(sel2 == 0) {
						ch = (char)(ch + ('a' - 'A')); // 대문자로 변경
					}
					cNumber += ch;
				}
			}
			
			// 메일에 출력할 텍스트
			StringBuffer sb = new StringBuffer(); // 가변성 문자열 저장 객체
			sb.append("<h3>방방곡곡 인증번호 </h3>\n");
			sb.append("<h3>인증 번호 : <span style='color:red'>"+ cNumber +"</span></h3>\n");
			
			String mailContent = sb.toString(); // 문자열로 반환
			
			// 메일 콘텐츠 - 내용 , 메일인코딩, "html" 추가 시 HTML 태그가 해석됨
			mTextPart.setText(mailContent, "UTF-8", "html");
			mParts.addBodyPart(mTextPart);
			
			// 메일 콘텐츠 지정
			message.setContent(mParts);

			
			// 메일 발송
			Transport t = session.getTransport("smtp");
			t.connect(smtpEmail, password);
			t.sendMessage(message, message.getAllRecipients());
			t.close();
			int result = -10;
			
			if(flag!=1) {
				result = service.insertCertification(userEmail, cNumber);
			}
			if(flag==1) {
				result = service.updateCertification(userEmail, cNumber);
			}
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@ResponseBody
	@GetMapping("checkNumber")
	public int emailUserCheck(@RequestParam("inputEmail")String userEmail,
			@RequestParam("cNumber") String cNumber) {
		return service.emailUserCheck(userEmail,cNumber);
	}
	

}
