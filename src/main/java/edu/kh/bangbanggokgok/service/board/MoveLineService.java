package edu.kh.bangbanggokgok.service.board;

import java.util.List;
import java.util.Map;

import edu.kh.bangbanggokgok.vo.board.Location;
import edu.kh.bangbanggokgok.vo.board.MoveLineDetail;

public interface MoveLineService {

	List<String> selectMovelineList();

	
	/** 지역 구분 조회 서비스
	 * @return locationList
	 */
	List<Location> selectLocation();
	
	
	/** 해시태그 이름 조회 서비스
	 * @return hashtagList
	 */
	List<Location> selectHashTag();

	
	
	/** 특정 지역 코스 목록 조회 서비스
	 * @param cp
	 * @param locationNum
	 * @return map
	 */
	Map<String, Object> selectLocationList(int cp, int locationNum);


//	/** 특정 해시태그 목록 조회 서비스
//	 * @param cp
//	 * @param mLHashTagNo
//	 * @return map
//	 */
//	Map<String, Object> selectHashTagList(int cp, int MLHashTagNo);
//
//
//	Map<String, Object> selectHashTagList(Map<String, Object> paramMap);


	/**
	 * @param cp
	 * @param mLHashTag
	 * @return
	 */
	Map<String, Object> selectHashTagList(int cp, String mLHashTag);


	/** 코스 메인 조회 서비스
	 * @return list
	 */
	List<MoveLineDetail> selectMoveLineDetail();


}