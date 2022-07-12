package edu.kh.bangbanggokgok.service.user;

import edu.kh.bangbanggokgok.vo.user.User;

public interface UserService {

	int addAccount(User account);

	int login(String email, String password);
}
