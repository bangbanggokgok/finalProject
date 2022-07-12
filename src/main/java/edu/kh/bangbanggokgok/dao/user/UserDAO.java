package edu.kh.bangbanggokgok.dao.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.user.User;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	private Logger logger = LoggerFactory.getLogger(UserDAO.class);
	
	/** 계정 생성
	 * @param account
	 * @return int
	 */
	public int addAccount(User account) {
		return sqlSession.insert("userMapper.addAccount",account);
	}

	/** 로그인계정 비밀번호 조회
	 * @param email
	 * @return
	 */
	public String matchPW(String email) {
		return sqlSession.selectOne("userMapper.matchPW",email);
	}

	/** 로그인 유저 정보
	 * @param email
	 * @return
	 */
	public User login(String email) {
		return sqlSession.selectOne("userMapper.login",email);
	}

}
