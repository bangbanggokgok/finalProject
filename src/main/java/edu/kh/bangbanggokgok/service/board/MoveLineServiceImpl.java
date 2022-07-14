package edu.kh.bangbanggokgok.service.board;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bangbanggokgok.dao.board.MoveLineDAO;
import edu.kh.bangbanggokgok.vo.board.Location;

@Service
public class MoveLineServiceImpl implements MoveLineService{

	@Autowired
	private MoveLineDAO dao;

	@Override
	public List<Location> selectLocation() {
		return dao.selectLocation();
	}

	@Override
	public List<String> selectMovelineList() {
		return null;
	}


	
}
