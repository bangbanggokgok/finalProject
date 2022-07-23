package edu.kh.bangbanggokgok.service.board;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bangbanggokgok.dao.board.MoveLineDAO;
import edu.kh.bangbanggokgok.vo.board.Location;
import edu.kh.bangbanggokgok.vo.board.MoveLine;
import edu.kh.bangbanggokgok.vo.board.MoveLineBookmark;
import edu.kh.bangbanggokgok.vo.board.MoveLineDetail;
import edu.kh.bangbanggokgok.vo.board.MoveLineList;
import edu.kh.bangbanggokgok.vo.board.Pagination;
import edu.kh.bangbanggokgok.vo.hashTag.MoveLineHashTag;

@Service
public class MoveLineServiceImpl implements MoveLineService{


	@Autowired
	private MoveLineDAO dao;

	// 코스 메인 - 지역 구분 조회 서비스 구현
	@Override
	public List<Location> selectLocation() {
		return dao.selectLocation();
	}
	

//	@Override
//	public List<String> selectMovelineList() {
//		return null;
//	}

	
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
		map.put("movelineList", listBylocation);
		
		return map;
	
	}


	// 특정 해시태그 목록 조회 서비스
	@Override
	public Map<String, Object> selectHashTagList(Map<String, Object> paramMap) {
		
		// 특정 해시태그 코스 수 조회 DAO 및 페이지네이션 객체 생성
		int listCount = dao.hashTagListCount(paramMap);
		Pagination pagination = new Pagination((int)paramMap.get("cp"), listCount);
		
		// 특정 해시태그 목록 조회
		List<MoveLineList> listByHashTag = dao.selectHashTagList(paramMap, pagination);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagination", pagination);
		map.put("movelineList", listByHashTag);
		
		return map;
		
	}


	// 코스 메인 - 랜덤 해시태그 10개 조회 서비스
	@Override
	public List<MoveLineHashTag> selectMoveLineMain() {
		return dao.selectMoveLineMain();
	}

	
	// 코스 메인 - 최신 코스 3개 조회
	@Override
	public List<MoveLineDetail> selectMoveLineMain2() {
		return dao.selectMoveLineMain2();
	}

	
	// 코스 즐겨찾기
	@Override
	public int movelineBookmark(MoveLineBookmark moveLineBookMark) {
		return dao.bookmarkMoveline(moveLineBookMark);
	}

	
	// 코스 즐겨찾기 목록 조회
	@Override
	public List<MoveLineBookmark> selectBookmarkList(MoveLineBookmark moveLineBookMark) {
		return dao.selectBookmarkList(moveLineBookMark);
	}


	// 코스 테마별 목록 조회
	@Override
	public Map<String, Object> selectMovelineTheme(Map<String, Object> paramMap) {
		
		int listCount = dao.themeListCount(paramMap);
		Pagination pagination = new Pagination((int)paramMap.get("cp"), listCount);
		
		List<MoveLineList> listByTheme = dao.selectMovelineTheme(paramMap, pagination);
		
		System.out.println("themList : " + listByTheme);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagination", pagination);
		map.put("movelineList", listByTheme);
		
		return map;
	}


	// 코스 전체 목록 조회
	@Override
	public Map<String, Object> selectAll(Map<String, Object> paramMap) {
		
		int listCount = dao.allListCount(paramMap);
		
		Pagination pagination = new Pagination((int)paramMap.get("cp"), listCount);
		
		List<MoveLineList> listByAll = dao.selectMovelineTheme(paramMap, pagination);
		
		System.out.println("listByAll : " + listByAll);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagination", pagination);
		map.put("movelineList", listByAll);

		return map;
	}


//	@Override
//	public List<String> selectMovelineList() {
//		// TODO Auto-generated method stub
//		return null;
//	}


	// 코스 상세 페이지 조회
	@Override
	public List<MoveLineDetail> selectMovelineDetail(int movelineNo) {
		
		List<MoveLineDetail> selectMovelineDetail = dao.selectMovelineDetail(movelineNo);
		
		System.out.println("MovelineDetail : " + selectMovelineDetail);
		
		return selectMovelineDetail;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
