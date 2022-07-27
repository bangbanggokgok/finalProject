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
	NoticeDetail selectNoticeDetail(int noticeNo);

	/** 공지 ajax 조회
	 * @param cp
	 * @param list
	 * @return map
	 */
	Map<String, Object> selectNotice(int cp, String list);

	/** 이벤트 ajax 조회
	 * @param cp
	 * @param list
	 * @return
	 */
	Map<String, Object> selectEvent(int cp, String list);

}
