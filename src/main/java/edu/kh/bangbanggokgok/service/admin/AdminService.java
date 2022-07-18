package edu.kh.bangbanggokgok.service.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.bangbanggokgok.vo.notice.NoticeDetail;
import edu.kh.bangbanggokgok.vo.user.User;

public interface AdminService {

	/** 공지 삽입
	 * @param detail
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @return noticeNo
	 * @throws IOExeption
	 */
	int insertNotice(NoticeDetail detail, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException;

	/** 회원 조회
	 * @param cp
	 * @param loginUser
	 * @return Map
	 */
	Map<String, Object> selectUserList(int cp, String list);


	/** 문의 조회
	 * @param cp
	 * @param list
	 * @return map
	 */
	Map<String, Object> selectInquiryList(int cp, String list);

	/** 신고 조회
	 * @param cp
	 * @param list
	 * @return map
	 */
	Map<String, Object> selectreportList(int cp, String list);

}
