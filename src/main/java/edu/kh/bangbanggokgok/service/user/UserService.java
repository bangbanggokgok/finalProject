package edu.kh.bangbanggokgok.service.user;

import edu.kh.bangbanggokgok.vo.user.User;

public interface UserService {

	int addAccount(User account);

	User login(String email, String password);

	User findAccount(User findInfo);

	int resetPassword(User resetAccount);
}
