package edu.kh.bangbanggokgok.service.board;

import java.util.List;

import edu.kh.bangbanggokgok.vo.board.Location;

public interface MoveLineService {

	List<String> selectMovelineList();

	List<Location> selectLocation();
}