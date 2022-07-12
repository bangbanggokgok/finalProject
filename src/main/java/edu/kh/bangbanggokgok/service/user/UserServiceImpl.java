package edu.kh.bangbanggokgok.service.user;

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
	public int login(String email, String password) {
		String matchPW = dao.matchPW();
		
		return 0;
	}

}
