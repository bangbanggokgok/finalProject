package edu.kh.bangbanggokgok.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.board.Location;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.board.MoveLineBookmark;
import edu.kh.bangbanggokgok.vo.board.MoveLineDetail;
import edu.kh.bangbanggokgok.vo.board.MoveLineList;
import edu.kh.bangbanggokgok.vo.board.Pagination;
import edu.kh.bangbanggokgok.vo.hashTag.MoveLineHashTag;

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

	
	/** 코스 즐겨찾기
	 * @param moveLineBookMark
	 * @return result
	 */
	public int bookmarkMoveline(MoveLineBookmark moveLineBookMark) {
		return sqlSession.insert("movelineMapper.bookmarkMoveline", moveLineBookMark);
	}


	/** 코스 즐겨찾기 목록 조회
	 * @param moveLineBookMark
	 * @return result
	 */
	public List<MoveLineBookmark> selectBookmarkList(MoveLineBookmark moveLineBookMark) {
		return sqlSession.selectList("movelineMapper.selectBookmarkList", moveLineBookMark);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	/** 특정 해시태그 수 조회 DAO
//	 * @param mLHashTagNo
//	 * @return listCount
//	 */
//	public int hashTagListCount(int mLHashTagNo) {
//		return sqlSession.selectOne("movelineMapper.hashTagListCount", mLHashTagNo);
//	}
//
//
//	/** 특정 해시태그 목록 조회 DAO
//	 * @param pagination
//	 * @param mLHashTagNo
//	 * @return listByHashTag
//	 */
//	public List<MoveLineList> selectHashTagList(Pagination pagination, int MLHashTagNo) {
//		
//		int offset=(pagination.getCurrentPage() -1) * pagination.getLimit();
//		
//		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
//		
//		return sqlSession.selectList("movelineMapper.selectHashTagList", MLHashTagNo, rowBounds);
//	}
//
//
//	public int hashTagListCount(Map<String, Object> paramMap) {
//		
//		return sqlSession.selectOne("movelineMapper.hashTagListCount", paramMap);
//
//	}
	
	

//	/** 코스 메인 조회 서비스 DAO (최신 코스)
//	 * @return
//	 */
//	public List<MoveLineDetail> selectMoveLineMain2(List<MoveLine> lastNo) {
//		return sqlSession.selectList("movelineMapper.selectMoveLineMain2", lastNo);
//	}

	/** 
	 * @param locationNum
	 * @return list
	 */
	/*
	 * public int selectMovelineBylocation() { return
	 * sqlSession.selectOne("movelineMapper.selectMovelineBylocation", locationNum);
	 * }
	 */


	/** 마지막 코스 번호 조회
	 * @return
	 */
	/*
	 * public int selectLastNo() { return
	 * sqlSession.selectOne("movelineMapper.selectLastNo"); }
	 */
	
	
	
	
	

}