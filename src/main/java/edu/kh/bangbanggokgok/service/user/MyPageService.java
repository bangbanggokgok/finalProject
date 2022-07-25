package edu.kh.bangbanggokgok.service.user;

import java.io.IOException;
import java.util.List;
import java.util.Map;


import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.user.MyMoveline;
import edu.kh.bangbanggokgok.vo.user.MyReply;
import edu.kh.bangbanggokgok.vo.user.User;

public interface MyPageService {

	/** 프로필 이미지 변경
	 * @param map
	 * @return result
	 */
	int updateProfile(Map<String, Object> map) throws IOException;

	/** 회원정보 수정
	 * @param map
	 * @return result
	 */
	int updateInfo(Map<String, Object> map);

	/** 비밀변호 변경
	 * @param map
	 * @return result
	 */
	int changePw(Map<String, Object> map);

	/** 회원 탈퇴
	 * @param loginUser
	 * @return result
	 */
	int secession(Map<String, Object> map);

	
	// 즐겨찾는 랜드마크/무브라인 관련 메소드
	List<LandMark> favoriteLandmark(int userNo);
	List<MoveLine> favoriteMoveline(int userNo);

	/** 내 댓글 조회
	 * @param cp
	 * @param loginUser 
	 * @return list
	 */
	Map<String, Object> selectMyReplyList(int cp, User loginUser);

	/** 내 작성 코스 조회
	 * @param userNo
	 * @return
	 */
	List<MyMoveline> selectMyMovelineList(int userNo);

	
	
	List<LandMark> favoriteLandmark(int userNo,int locationNum);
	
 }
