package edu.kh.bangbanggokgok.service.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bangbanggokgok.dao.notice.NoticeDAO;
import edu.kh.bangbanggokgok.vo.notice.Notice;
import edu.kh.bangbanggokgok.vo.notice.NoticeDetail;
import edu.kh.bangbanggokgok.vo.notice.Pagination;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO dao;

	// 공지사항 목록 조회 서비스
	@Override
	public Map<String, Object> selectNoticeList(int cp, String list) {
		
		int listCount = dao.getListCount();
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Notice> noticeList = dao.selectNoticeList(pagination, list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("noticeList", noticeList);
		
		return map;
	}

	// 게시글 상세 조회 서비스 구현
	@Override
	public NoticeDetail selectNoticeDetail(int noticeNo) {
		return dao.selectnoticeDetail(noticeNo);
	}

	// 공지 ajax
	@Override
	public Map<String, Object> selectNotice(int cp, String list) {
		int listCount = dao.getnoticeListCount();
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Notice> allNoticeList = dao.selectAllNoticeList(pagination, list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("allNoticeList", allNoticeList);
		return map;
	}

	// 이벤트 ajax
	@Override
	public Map<String, Object> selectEvent(int cp, String list) {
		int listCount = dao.getEventListCount();
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Notice> allEventList = dao.selectAllEventList(pagination, list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("allNoticeList", allEventList);
		return map;
	}
	
	
	
}
