package edu.kh.bangbanggokgok.service.user;

import java.util.Random;

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
				//이메일 보내는 로직
			} else {
				
			}
		}
		return 0;
	}

}
