package edu.kh.bangbanggokgok.service.notice;

import java.util.Map;

import edu.kh.bangbanggokgok.vo.notice.NoticeDetail;

public interface NoticeService {

	/** 공지사항 목록 조회 서비스
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectNoticeList(int cp, String list);

	/** 공지 상세 조회 서비스
	 * @param boardNo
	 * @return
	 */
	NoticeDetail selectNoticeDetail(int boardNo);

}
