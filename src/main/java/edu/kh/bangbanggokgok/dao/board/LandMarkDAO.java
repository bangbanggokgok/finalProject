package edu.kh.bangbanggokgok.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import edu.kh.bangbanggokgok.vo.board.LandMarkIMG;
import edu.kh.bangbanggokgok.vo.board.Pagination2;
import oracle.net.aso.l;

@Repository
public class LandMarkDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 랜드마크 슬라이드 이미지 조회
	 * 
	 * @return
	 */
	public List<LandMarkIMG> selectLandmarkImageList() {
		return sqlSession.selectList("landMarkMapper.selectLandMarkIMG");
	}

	/**
	 * 랜드마크 상세 조회
	 * 
	 * @param landMakrNo
	 * @return detail
	 */
	public LandMarkDetail selectLandmarkDetail(int landMarkNo) {
		return sqlSession.selectOne("landMarkMapper.selectLandMarkDetail", landMarkNo);
	}

	/**
	 * 게시글 삽입 DAO
	 * 
	 * @param detail
	 * @return landMarkNo
	 */
	public int insertLandMark(LandMarkDetail detail) {

		int result = sqlSession.insert("landMarkMapper.insertLandMark", detail);
		if (result > 0)
			result = detail.getLandMarkNo();
		return result;
	}

	/**
	 * 게시글 이미지 삽입
	 * 
	 * @param landMarkImageList
	 * @return
	 */
	public int insertLandMarkImageList(List<LandMarkIMG> landMarkImageList) {
		return sqlSession.insert("landMarkMapper.insertLandMarkImageList", landMarkImageList);
	}

	public int updateLandmark(LandMarkDetail detail) {
		return sqlSession.update("landMarkMapper.updateLandmark", detail);
	}

	public int deleteLandmarkImage(Map<String, Object> map) {
		return sqlSession.delete("landMarkMapper.deleteLandmarkImage", map);
	}

	public int updateLandmarkImage(LandMarkIMG img) {
		return sqlSession.update("landMarkMapper.updateLandmarkImage", img);
	}

	public int insertLandmarkImage(LandMarkIMG img) {
		return sqlSession.insert("landMarkMapper.insertLandmarkImage", img);
	}

	public int landmarkBookmark(Map<String, String> infoB) {
		return sqlSession.selectOne("landMarkMapper.landmarkBookmark", infoB);
	}

	public int insertLandBookmark(Map<String, String> infoB) {
		return sqlSession.insert("landMarkMapper.insertLandBookmark", infoB);
	}

	public int landmarkBookmarkDelete(Map<String, String> infoA) {
		return sqlSession.delete("landMarkMapper.deleteLandBookmark", infoA);
	}

	public String rankLandmark(int landmarkNo) {
		return sqlSession.selectOne("landMarkMapper.rankLandmark", landmarkNo);
	}

	public int insertRankPoint(Map<String, String> map) {
		return sqlSession.insert("landMarkMapper.insertRankPoint", map);
	}

	public int deleteRankPoint(Map<String, String> map) {
		return sqlSession.delete("landMarkMapper.deleteRankPoint", map);
	}

	public int addPointChcek(Map<String, Integer> map) {
		return sqlSession.selectOne("landMarkMapper.selectAddPoint", map);
	}

//	/**
//	 * 특정 지역 랜드마크 게시글 수 조회
//	 * 
//	 * @param locationType
//	 * @return
//	 */
//	public int getListCount(int locationType) {
//		return sqlSession.selectOne("landMarkMapper.getListCount", locationType);
//	}
//
	/**
	 * 특정 지역 랜드마크 목록 조회 DAO
	 * @param pagination 
	 * 
	 * @param locationType
	 * @return
	 */
	public List<LandMark> selectLandMarkList(Pagination2 pagination, int locationType) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset,pagination.getLimit());
		return sqlSession.selectList("landMarkMapper.selectLandMarkList", locationType , rowBounds);
	}

//	public List<LandMark> selectLandMarkPagination(int locationType) {	
//		return sqlSession.selectList("landMarkMapper.selectlandMarkPagination", locationType);
//	}

	public List<LandMark> rankLandMarkList(int locationType) {
		return sqlSession.selectList("landMarkMapper.rankLandMarkList", locationType);
	}

	public int selectLandmarkCount(int locationNum) {
		return sqlSession.selectOne("landMarkMapper.selectLandmarkCount", locationNum);
	}

	public int deleteLandmark(int landmarkNo) {
		return sqlSession.update("landMarkMapper.deleteLandmark", landmarkNo);
	}

}
