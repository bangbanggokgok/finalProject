package edu.kh.bangbanggokgok.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.board.Location;
import edu.kh.bangbanggokgok.vo.board.MoveLineList;
import edu.kh.bangbanggokgok.vo.board.Pagination;

@Repository
public class MoveLineDAO {

	@Autowired 
	private SqlSessionTemplate sqlSession;

	
	/** 지역 구분 조회 DAO
	 * @return locationList
	 */
	public List<Location> selectLocation() {
		return sqlSession.selectList("locationMapper.locationList");
	}

	
	/** 해시태그 구분 조회 DAO
	 * @return hashtagList
	 */
	public List<Location> selectHashTag() {
		return sqlSession.selectList("hasTagMapper.hashtagList");
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


	/** 특정 해시태그 수 조회 DAO
	 * @param mLHashTagNo
	 * @return listCount
	 */
	public int hashTagListCount(int mLHashTagNo) {
		return sqlSession.selectOne("movelineMapper.hashTagListCount", mLHashTagNo);
	}


	/** 특정 해시태그 목록 조회 DAO
	 * @param pagination
	 * @param mLHashTagNo
	 * @return listByHashTag
	 */
	public List<MoveLineList> selectHashTagList(Pagination pagination, int MLHashTagNo) {
		
		int offset=(pagination.getCurrentPage() -1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("movelineMapper.selectHashTagList", MLHashTagNo, rowBounds);
	}



	

	
	
	
	
	
	

}