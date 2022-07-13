package edu.kh.bangbanggokgok.dao.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.board.BoardType;


@Repository
public class LandMarkDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<BoardType> selectBoardType() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("landMarkMapper.selectBoardType");
	}
}
