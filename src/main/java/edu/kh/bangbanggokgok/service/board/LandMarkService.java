package edu.kh.bangbanggokgok.service.board;

import java.util.List;
import java.util.Map;

import edu.kh.bangbanggokgok.vo.board.BoardType;


public interface LandMarkService {
	
	/** 지역 코드, 이름 조회
	 * @return boardTypeList
	 */
	List<BoardType> selectBoardType();
	
	
	/** 랜드마크 목록 조회 서비스
	 * @param locationType
	 * @return map
	 */
	Map<String, Object> selectLandMarkList(int locationType);

	
}
