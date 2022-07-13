package edu.kh.bangbanggokgok.service.notice;

import java.util.Map;

public interface NoticeService {

	/** 공지사항 목록 조회 서비스
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectNoticeList(int cp);

}
