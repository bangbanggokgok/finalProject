package edu.kh.bangbanggokgok.service.board;

import java.util.List;
import java.util.Map;

import edu.kh.bangbanggokgok.vo.board.BoardType;


public interface LandMarkService {
	
	/** 지역 코드, 이름 조회
	 * @return
	 */
	List<BoardType> selectBoardType();
	
	Map<String, Object> selectLandMarkList(int locationType);

	
}
