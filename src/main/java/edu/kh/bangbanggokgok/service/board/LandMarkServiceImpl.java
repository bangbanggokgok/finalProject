package edu.kh.bangbanggokgok.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bangbanggokgok.dao.board.LandMarkDAO;
import edu.kh.bangbanggokgok.vo.board.LandMark;
import edu.kh.bangbanggokgok.vo.board.Location;

@Service
public class LandMarkServiceImpl implements LandMarkService{
	
	@Autowired
	private LandMarkDAO dao;
	
	// 랜드마크 목록 조회
	@Override
	public Map<String, Object> selectLandMarkList(int locationType) {
		
		int ListCount = dao.getListCount(locationType);
		
		List<LandMark> landMarkList = dao.selectLandMarkList(locationType);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ListCount",ListCount);
		map.put("landMarkList",landMarkList);
		
		return map;
	}




}
