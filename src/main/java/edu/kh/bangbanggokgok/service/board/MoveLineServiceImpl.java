package edu.kh.bangbanggokgok.service.board;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bangbanggokgok.dao.board.MoveLineDAO;
import edu.kh.bangbanggokgok.vo.board.Location;
import edu.kh.bangbanggokgok.vo.board.MoveLineList;
import edu.kh.bangbanggokgok.vo.board.Pagination;

@Service
public class MoveLineServiceImpl implements MoveLineService{


	@Autowired
	private MoveLineDAO dao;

	// 지역 구분 조회 서비스 구현
	@Override
	public List<Location> selectLocation() {
		return dao.selectLocation();
	}
	
	
	// 해시태그 구분 조회 서비스 구현
	@Override
	public List<Location> selectHashTag() {
		return dao.selectHashTag();
	}


	@Override
	public List<String> selectMovelineList() {
		return null;
	}

	// 특정 지역 코스 목록 조회 서비스 구현
	@Override
	public Map<String, Object> selectLocationList(int cp, int locationNum) {
		
		// 특정 지역 코스 수 조회 DAO 및 페이지네이션 객체 생성
		int listCount = dao.locationListCount(locationNum);
		Pagination pagination = new Pagination(cp, listCount);
		
		// 특정 지역 코스 목록 조회
		List<MoveLineList> listBylocation = dao.selectLocationList(pagination, locationNum);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagination", pagination);
		map.put("listBylocation", listBylocation);
		
		return map;
	
	}

	
	// 특정 해시태그 목록 조회 서비스 구현
	@Override
	public Map<String, Object> selectHashTagList(int cp, int MLHashTagNo) {
		
		// 특정 해시태그 코스 수 조회 DAO 및 페이지네이션 객체 생성
		int listCount = dao.hashTagListCount(MLHashTagNo);
		Pagination pagination = new Pagination(cp, listCount);
		
		// 특정 해시태그 목록 조회
		List<MoveLineList> listByHashTag = dao.selectHashTagList(pagination, MLHashTagNo);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagination", pagination);
		map.put("listByHashTag", listByHashTag);
		
		return map;
	}
	
	
	
	
}
