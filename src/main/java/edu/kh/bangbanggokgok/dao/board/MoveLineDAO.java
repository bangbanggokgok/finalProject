package edu.kh.bangbanggokgok.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.board.Location;
import edu.kh.bangbanggokgok.vo.board.MoveLine;

@Repository
public class MoveLineDAO {

	@Autowired 
	private SqlSessionTemplate sqlSession;

	public List<Location> selectLocation() {
		return sqlSession.selectList("locationMapper.locationList");
	}

}