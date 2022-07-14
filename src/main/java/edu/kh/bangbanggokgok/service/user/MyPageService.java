package edu.kh.bangbanggokgok.service.user;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonElement;

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

	List<Integer> favoriteList(Map<String, Object> param);

	
}
