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

	public String matchPW() {
		// TODO Auto-generated method stub
		return null;
	}

}
