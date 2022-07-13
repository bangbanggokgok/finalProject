package edu.kh.bangbanggokgok.service.user;


import javax.servlet.http.HttpServletResponse;

import edu.kh.bangbanggokgok.vo.user.User;

public interface UserService {

	int addAccount(User account);

	User login(String email, String password);

	User findAccount(User findInfo);

	int resetPassword(User resetAccount,HttpServletResponse resp);

	int emailReduplicateCheck(String userEmail);

	int insertCertification(String userEmail, String cNumber);

	int emailUserCheck(String userEmail, String cNumber);

	int updateCertification(String userEmail, String cNumber);

}
