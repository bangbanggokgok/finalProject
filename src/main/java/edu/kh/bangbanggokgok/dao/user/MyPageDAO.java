package edu.kh.bangbanggokgok.dao.user;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.user.MyMoveline;
import edu.kh.bangbanggokgok.vo.user.MyReply;
import edu.kh.bangbanggokgok.vo.user.User;

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

	//즐겨찾기 목록
	public List<LandMark> favoriteLandmark(int userNo) {
		return sqlSession.selectList("myPageMapper.favoriteLandmark",userNo);
	}
	public List<LandMark> favoriteLandmark(Map<String, Integer> map) {
		return sqlSession.selectList("myPageMapper.favoriteLandmarkForMoveline",map);
	}
	
	public List<MoveLine> favoriteMoveline(int userNo) {
		return sqlSession.selectList("myPageMapper.favoriteMoveline",userNo);
	}
	
	/** 내 댓글수 조회
	 * @param loginUser
	 * @return listCount
	 */
	public int getListCount(User loginUser) {
		return sqlSession.selectOne("myPageMapper.getListCount",loginUser);
	}

	/** 내 댓글 조회
	 * @param userNo
	 * @return myReplyList
	 */
	public List<MyReply> selectMyReplyList(User loginUser) {
		return sqlSession.selectList("myPageMapper.selectMyReplyList", loginUser);
	}

	/** 내 작성 코스 조회
	 * @param userNo
	 * @return
	 */
	public List<MyMoveline> selectMyMovelineList(int userNo) {
		return sqlSession.selectList("myPageMapper.selectMyMovelineList",userNo);
	}





}
