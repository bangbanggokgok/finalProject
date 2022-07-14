package edu.kh.bangbanggokgok.dao.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.board.LandMark;


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
}
