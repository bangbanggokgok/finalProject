package edu.kh.bangbanggokgok.service.board;

import java.util.List;
import java.util.Map;

import edu.kh.bangbanggokgok.vo.board.LandMarkDetail;
import edu.kh.bangbanggokgok.vo.board.Location;


public interface LandMarkService {
	
	
	
	/** 랜드마크 특정 지역 목록 조회 서비스
	 * @param locationType
	 * @return map
	 */
	Map<String, Object> selectLandMarkList(int locationType);

	/** 랜드마크 전체 목록 조회 서비스
	 * @return
	 */
	Map<String, Object> selectAllLandMarkList();
	
	
	/** 랜드마크 상세조회 서비스
	 * @param landMakrNo
	 * @return
	 */
	LandMarkDetail selectLandMakrDetail(int landMakrNo);

	
}
