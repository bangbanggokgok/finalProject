package edu.kh.bangbanggokgok.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import edu.kh.bangbanggokgok.vo.board.LandMarkIMG;
import edu.kh.bangbanggokgok.vo.board.Location;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.board.MoveLineBookmark;
import edu.kh.bangbanggokgok.vo.board.MoveLineDetail;
import edu.kh.bangbanggokgok.vo.board.MoveLineList;
import edu.kh.bangbanggokgok.vo.board.Pagination;
import edu.kh.bangbanggokgok.vo.hashTag.MoveLineHashTag;
import edu.kh.bangbanggokgok.vo.image.MoveLineImage;

@Repository
public class MoveLineDAO {

	@Autowired 
	private SqlSessionTemplate sqlSession;

	
	/** 코스 메인 - 지역 구분 조회 DAO
	 * @return locationList
	 */
	public List<Location> selectLocation() {
		return sqlSession.selectList("locationMapper.locationList");
	}

	
	/** 해시태그 이름 조회 DAO
	 * @return hashtagList
	 */
	public List<Location> selectHashTag() {
		return sqlSession.selectList("hashTagMapper.hashtagList");
	}

	
	/** 특정 지역 코스 수 조회 DAO
	 * @param locationNum
	 * @return listCount
	 */
	public int locationListCount(int locationNum) {
		return sqlSession.selectOne("movelineMapper.locationListCount", locationNum);
	}
	
	
	/** 특정 지역 코스 목록 조회 DAO
	 * @param pagination
	 * @param locationNum
	 * @return listBylocation
	 */
	public List<MoveLineList> selectLocationList(Pagination pagination, int locationNum) {

		int offset=(pagination.getCurrentPage() -1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("movelineMapper.selectLocationList", locationNum, rowBounds);
	}


	/** 특정 해시태그가 작성된 전체 코스 수 조회
	 * @param mLHashTag
	 * @return
	 */
	public int hashTagListCount(Map<String, Object> paramMap) {
		
		return sqlSession.selectOne("movelineMapper.hashtagListCount", paramMap);
	}


	/** 특정 해시태그가 작성된 코스 목록 조회
	 * @param pagination
	 * @param mLHashTag
	 * @return
	 */
	public List<MoveLineList> selectHashTagList(Map<String, Object> paramMap, Pagination pagination) {
		
		int offset=(pagination.getCurrentPage() -1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("movelineMapper.selectHashTagList", paramMap, rowBounds);
	}


	/** 코스 메인 - 랜덤 해시태그 10개 조회 서비스 DAO
	 * @return list
	 */
	public List<MoveLineHashTag> selectMoveLineMain() {
		
		return sqlSession.selectList("movelineMapper.selectMoveLineMain");
	}


	/** 코스 메인 - 최신 코스 3개 조회
	 * @return list
	 */
	public List<MoveLineDetail> selectMoveLineMain2() {
		return sqlSession.selectList("movelineMapper.selectMoveLineMain2");	
	}

	
	/** 코스 즐겨찾기 목록 조회
	 * @param moveLineBookMark
	 * @return result
	 */
	public List<MoveLineBookmark> selectBookmarkList(MoveLineBookmark moveLineBookMark) {
		return sqlSession.selectList("movelineMapper.selectBookmarkList", moveLineBookMark);
	}
	
	
	/** 코스 즐겨찾기
	 * @param moveLineBookMark
	 * @return result
	 */
	public int bookmarkMoveline(MoveLineBookmark moveLineBookMark) {
		return sqlSession.insert("movelineMapper.bookmarkMoveline", moveLineBookMark);
	}


	/** 특정 테마별 전체 수 조회
	 * @param paramMap
	 * @return
	 */
	public int themeListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("movelineMapper.themeListCount", paramMap);
	}


	/** 코스 테마별 목록 조회
	 * @param theme
	 * @return
	 */
	public List<MoveLineList> selectMovelineTheme(Map<String, Object> paramMap, Pagination pagination) {
		
		int offset=(pagination.getCurrentPage() -1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("movelineMapper.selectMovelineTheme", paramMap, rowBounds);

	}


	// 전체 코스 수 조회
		public int allListCount(Map<String, Object> paramMap) {
			return sqlSession.selectOne("movelineMapper.allListCount", paramMap);
		}
	
		
	// 코스 전체 목록 조회
	public List<MoveLineBookmark> selectAll(Map<String, Object> paramMap, Pagination pagination) {
		
		int offset=(pagination.getCurrentPage() -1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("movelineMapper.selectAll", rowBounds);
	}


	/** 코스 상세 페이지 - 단건
	 * @param movelineNo
	 * @return list
	 */
	public MoveLineDetail selectMovelineDetail(int movelineNo) {
		
		return sqlSession.selectOne("movelineMapper.selectMovelineDetail", movelineNo);
	}


	/** 코스 상세 페이지 - 랜드마크 상세
	 * @param movelineNo
	 * @return list
	 */
	public List<LandMarkDetail> selectLandmarkDetail(int movelineNo) {
		return sqlSession.selectList("movelineMapper.selectLandMarkDetail", movelineNo);
	}


	/** 코스 상세 페이지 - 랜드마크 이미지 리스트
	 * @param movelineNo
	 * @return
	 */
	public List<LandMarkIMG> selectLandmarkImage(int movelineNo) {
		return sqlSession.selectList("movelineMapper.selectLandmarkImage", movelineNo);
	}


	/** 코스 상세 페이지 - 코스 이미지 리스트
	 * @param movelineNo
	 * @return list
	 */
	public List<MoveLineImage> selectMovelineImage(int movelineNo) {
		return sqlSession.selectList("movelineMapper.selectMovelineImage", movelineNo);
	}

	
	/** 코스 상세 페이지 - 코스 해시태그
	 * @param movelineNo
	 * @return list
	 */
	public List<MoveLineHashTag> selectMovelineHashtag(int movelineNo) {
		return sqlSession.selectList("movelineMapper.selectMovelineHashtag", movelineNo);
	}


	/** 클릭된 랜드마크 이름 세팅
	 * @param landmarkNo
	 * @return landmarkName
	 */
	public String setLandmarkName(int landmarkNo) {
		return sqlSession.selectOne("movelineMapper.selectLandmarkName");
	}


	/** 특정 지역에 따른 랜드마크 조회
	 * @param locationName
	 * @return
	 */
	public List<LandMark> connectLocation(String locationName) {
		return sqlSession.selectList("movelineMapper.connectLocation", locationName);
	}


	public int deleteMoveline(int movelineNo) {
		return sqlSession.update("movelineMapper.deleteMoveline", movelineNo);
	}

	/** 특정 랜드마크 이미지 세팅 목록 조회 DAO
	 * @param landMarkNo
	 * @return list
	 */
	public List<LandMarkIMG> setLandmarkImages(int landMarkNo) {
		return sqlSession.selectList("movelineMapper.setLandmarkImages",landMarkNo);
	}


	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}