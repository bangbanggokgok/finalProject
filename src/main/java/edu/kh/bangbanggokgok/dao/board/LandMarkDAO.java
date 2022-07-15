package edu.kh.bangbanggokgok.dao.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.LandMarkIMG;


@Repository
public class LandMarkDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;


	/** 특정 지역 랜드마크 게시글 수 조회
	 * @param locationType
	 * @return ListCount
	 */
	public int getListCount(int locationType) {
		
		return sqlSession.selectOne("landMarkMapper.getListCount", locationType);
	}

	/** 랜드마크 목록 조회 DAO
	 * @param locationType
	 * @return
	 */
	public List<LandMark> selectLandMarkList(int locationType) {
		return sqlSession.selectList("landMarkMapper.selectLandMarkList", locationType);
	}

	/** 랜드마크 전체 게시글 수 조회 DAO
	 * @return
	 */
	public int getListCount() {
		return sqlSession.selectOne("landMarkMapper.getListAllCount");
	}

	/** 랜드마크 전체 게시글 조회
	 * @return
	 */
	public List<LandMark> selectAllLandMarkList() {
		return sqlSession.selectList("landMarkMapper.selectAllLandMarkList");
	}

	/** 랜드마크 슬라이드 이미지 조회
	 * @return
	 */
	public List<LandMarkIMG> selectLandMakrIMG() {		
		return sqlSession.selectList("landMakrMapper.selectLandMarkIMG");
	}
}
