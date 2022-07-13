package edu.kh.bangbanggokgok.dao.user;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 프로필 이미지 변경
	 * @param map
	 * @return result
	 */
	public int updateProfile(Map<String, Object> map) {
		return sqlSession.update("myPageMapper.updateProfile", map);
	}

	/** 회원정보 수정
	 * @param map
	 * @return result
	 */
	public int updateInfo(Map<String, Object> map) {
		return sqlSession.update("myPageMapper.updateInfo", map);
	}

	/** 암호화된 비밀번호 조회
	 * @param userNo
	 * @return userPw
	 */
	public String selectEncPw(int userNo) {
		return sqlSession.selectOne("myPageMapper.selectEncPw", userNo);
	}
	
	/** 비밀번호 변경
	 * @param map
	 * @return result
	 */
	public int changePw(Map<String, Object> map) {
		return sqlSession.update("myPageMapper.changePw", map);
	}

	/** 회원 탈퇴
	 * @param userNo
	 * @return result
	 */
	public int secession(int userNo) {
		return sqlSession.update("myPageMapper.secession", userNo);
	}


}
