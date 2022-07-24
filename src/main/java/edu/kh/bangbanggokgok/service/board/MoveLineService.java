package edu.kh.bangbanggokgok.service.board;

import java.util.List;
import java.util.Map;

import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import edu.kh.bangbanggokgok.vo.board.LandMarkIMG;
import edu.kh.bangbanggokgok.vo.board.Location;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.board.MoveLineBookmark;
import edu.kh.bangbanggokgok.vo.board.MoveLineDetail;
import edu.kh.bangbanggokgok.vo.hashTag.MoveLineHashTag;
import edu.kh.bangbanggokgok.vo.image.MoveLineImage;

/**
 * @author user
 *
 */
/**
 * @author user
 *
 */
/**
 * @author user
 *
 */
public interface MoveLineService {

//	List<String> selectMovelineList();

	
	/** 지역 구분 조회 서비스
	 * @return locationList
	 */
	List<Location> selectLocation();
	
	
	/** 특정 지역 코스 목록 조회 서비스
	 * @param cp
	 * @param locationNum
	 * @return map
	 */
	Map<String, Object> selectLocationList(int cp, int locationNum);

	
	/** 특정 해시태그 목록 조회 서비스
	 * @param cp
	 * @param mLHashTag
	 * @return
	 */
	Map<String, Object> selectHashTagList(Map<String, Object> paramMap);


	/** 코스 메인 - 랜덤 해시태그 10개 조회 서비스
	 * @return list
	 */
	List<MoveLineHashTag> selectMoveLineMain();


	/** 코스 메인 - 
	 * @param lastNo
	 * @return
	 */
	List<MoveLineDetail> selectMoveLineMain2();


	/** 코스 즐겨찾기
	 * @param moveLineBookMark
	 * @return result
	 */
	int movelineBookmark(MoveLineBookmark moveLineBookMark);


	/** 코스 즐겨찾기 목록 조회
	 * @param moveLineBookMark
	 * @return result
	 */
	List<MoveLineBookmark> selectBookmarkList(MoveLineBookmark moveLineBookMark);


	/** 코스 테마별 목록 조회
	 * @param theme
	 * @return List
	 */
	Map<String, Object> selectMovelineTheme(Map<String, Object> paramMap);


	/** 코스 전체 목록 조회
	 * @return List
	 */
	Map<String, Object> selectAll(Map<String, Object> paramMap);


	/** 코스 상세 페이지 조회 - 단건
	 * @param movelineNo
	 * @return movelineDetail
	 */
	MoveLineDetail selectMovelineDetail(int movelineNo);


	/** 코스 상세 페이지 - 랜드마크 상세
	 * @param movelineNo
	 * @return List
	 */
	List<LandMarkDetail> selectLandmarkDetail(int movelineNo);


	/** 코스 상세 페이지 - 랜드마크 이미지 리스트
	 * @param movelineNo
	 * @return List
	 */
	List<LandMarkIMG> selectLandmarkImage(int movelineNo);


	/** 코스 상세 페이지 - 코스 이미지 리스트
	 * @param movelineNo
	 * @return List
	 */
	List<MoveLineImage> selectMovelineImage(int movelineNo);


	/** 코스 상세 페이지 - 코스 해시태그 리스트
	 * @param movelineNo
	 * @return List
	 */
	List<MoveLineHashTag> selectMovelineHashtag(int movelineNo);


	
	
	




	
	
	
	
	
	
	
	
	
	
	
	
	
	/** 해시태그 이름 조회 서비스
	 * @return hashtagList
	 */
	/*
	 * List<Location> selectHashTag();
	 */

//	/** 특정 해시태그 목록 조회 서비스
//	 * @param cp
//	 * @param mLHashTagNo
//	 * @return map
//	 */
//	Map<String, Object> selectHashTagList(int cp, int MLHashTagNo);
//
//
//	Map<String, Object> selectHashTagList(Map<String, Object> paramMap);

}