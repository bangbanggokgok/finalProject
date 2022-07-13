package edu.kh.bangbanggokgok.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bangbanggokgok.dao.board.LandMarkDAO;
import edu.kh.bangbanggokgok.vo.board.BoardType;

@Service
public class LandMarkServiceImpl implements LandMarkService{
	
	@Autowired
	private LandMarkDAO dao;
	
	// 지역 코드, 이름 조회
	@Override
	public List<BoardType> selectBoardType() {
		// TODO Auto-generated method stub
		return dao.selectBoardType();
	}
	
	@Override
	public Map<String, Object> selectLandMarkList(int locationType) {
		// TODO Auto-generated method stub
		return null;
	}




}
