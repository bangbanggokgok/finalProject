package edu.kh.bangbanggokgok.service.user;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.bangbanggokgok.dao.user.UserDAO;
import edu.kh.bangbanggokgok.vo.user.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO dao;

	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Override
	public int addAccount(User account) {
		account.setUserPW(bcrypt.encode(account.getUserPW()));
		return dao.addAccount(account);
	}

	@Override
	public User login(String email, String password) {
		String matchPW = dao.matchPW(email);
		if(bcrypt.matches(password, matchPW)) {
			User loginUser = dao.login(email);
			return loginUser;
		}
		return null;
	}

	@Override
	public User findAccount(User findInfo) {
		User findUser = dao.findAccount(findInfo);
		String name = findUser.getUserName();
		String email = findUser.getUserEmail();
		if(name.length()<4) {
			name = name.substring(0,1) + "*" + name.substring(2);
		} else {
			name = name.substring(0,1) + "**" + name.substring(3, name.length());
		}
		String[] temp = email.split("@");
		temp[0] = temp[0].substring(0,2) + "***"+ temp[0].substring(5, temp[0].length());
		email = temp[0] + "@" + temp[1];
		findUser.setUserName(name);
		findUser.setUserEmail(email);
		return findUser;
	}

	@Override
	public int resetPassword(User resetAccount) {
		String selectAccountPW = dao.selectAccount(resetAccount);
		if(selectAccountPW != null) {
			String newPW = "";
			Random random = new Random();
			for(int i=0;i<6;i++) {
				newPW += (char)(random.nextInt(52) + 'A');
			}
			String newPWUpdate = bcrypt.encode(newPW);
			resetAccount.setUserPW(newPWUpdate);
			int result = dao.updatePassword(resetAccount);
			if(result>0) {
				String inputEmail = resetAccount.getUserEmail();
				
				String subject = "방방곡곡 비밀번호 안내";
				String fromEmail = "dnsehddls4@gmail.com";
				String fromUsername = "관리자";
				String toEmail = inputEmail; // 받는사람, 콤마(,)로 여러개 나열 가능v
				
				final String smtpEmail = "dnsehddls4@gmail.com"; // 이메일 (관리자 메일)
			    final String password = "ybuwzahxzvtfvkfs"; // 발급 받은 비밀번호
				
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
			      
			         message.setFrom(new InternetAddress(fromEmail, fromUsername));    // 송신자(보내는 사람) 지정
			         
			         message.addRecipient(RecipientType.TO, new InternetAddress(toEmail)); // 수신자(받는사람) 지정
			         
			         message.setSubject(subject); // 이메일 제목 지정
			         
			         
			         
			         // 메일 콘텐츠 설정
			         Multipart mParts = new MimeMultipart();
			         MimeBodyPart mTextPart = new MimeBodyPart();

			         
			         // 인증번호 6자리 생성코드(영어 대/소문 + 숫자)
			         String cNumber = "";
			
			    } catch (Exception e) {
			         e.printStackTrace();
			         
			         // ajax error 속성 활용을 위한 500에러를 응답으로 전달.
			         resp.setStatus(500);
			         resp.getWriter().print(e.getMessage());
			      }
				
			}
		}
		return 0;
	}

}
