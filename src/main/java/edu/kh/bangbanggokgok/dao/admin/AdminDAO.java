package edu.kh.bangbanggokgok.dao.admin;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.admin.ReportMoveLine;
import edu.kh.bangbanggokgok.vo.admin.ReportReply;
import edu.kh.bangbanggokgok.vo.notice.NoticeDetail;
import edu.kh.bangbanggokgok.vo.notice.NoticeImage;
import edu.kh.bangbanggokgok.vo.notice.Pagination;
import edu.kh.bangbanggokgok.vo.question.Question;
import edu.kh.bangbanggokgok.vo.question.QuestionDetail;
import edu.kh.bangbanggokgok.vo.user.User;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 공지 삽입
	 * @param detail
	 * @return noticeNo
	 */
	public int insertNotice(NoticeDetail detail) {
		
		int result = sqlSession.insert("adminMapper.insertNotice", detail);
		if (result > 0) result = detail.getNoticeNo();
		return result;
	}

	/** 공지 이미지 삽입 DAO
	 * @param noticeImageList
	 * @return result
	 */
	public int insertNoticeImageList(List<NoticeImage> noticeImageList) {
		return sqlSession.insert("adminMaaper.insertNoticeImageList", noticeImageList);
	}

	
	
	
	
	/** 회원 조회 DAO
	 * @param loginUser 
	 * @return result
	 */
	public int getUserListCount(String list) {
		return sqlSession.selectOne("adminMapper.getUserListCount", list);
	}

	/** 회원 목록 조회 DAO
	 * @param pagination
	 * @param adminFlag
	 * @return
	 */
	public List<User> selectUserList(Pagination pagination, String list) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("adminMapper.selectUserList", list, rowBounds);
	}

	/** 문의 수 조회 DAO
	 * @param list
	 * @return result
	 */
	public int getInquiryListCount(String list) {
		return sqlSession.selectOne("adminMapper.getIquiryListCount", list);
	}
	

	/** 문의 목록 조회 DAO
	 * @param pagination
	 * @param list
	 * @return result
	 */
	public List<Question> selectInquiryList(Pagination pagination, String list) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("adminMapper.selectInquiryList", list, rowBounds);
	}

	/** 신고 수 조회 DAO
	 * @param list
	 * @return reportListCount
	 */
	public int getReportListCount(String list) {
		return sqlSession.selectOne("adminMapper.getReportListCount", list);
	}

	/** 코스 신고 목록 조회 DAO
	 * @param pagination
	 * @param list
	 * @return
	 */
	public List<ReportMoveLine> selectReportList(Pagination pagination, String list) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("adminMapper.selectReportList", list, rowBounds);
	}

	/** 문의 상세조회
	 * @param questionNo
	 * @return
	 */
	public QuestionDetail selectQuestionDetail(int questionNo) {
		return sqlSession.selectOne("adminMapper.selectQuestionDetail", questionNo);
	}

	/** 문의 답변 등록
	 * @param detail
	 * @return result
	 */
	public int insertAnswer(QuestionDetail detail) {
		return sqlSession.update("adminMapper.insertAnswer", detail);
	}

	/** 신고 처리
	 * @param report
	 * @return result
	 */
	public int updateReport(ReportMoveLine report) {
		return sqlSession.update("adminMapper.updateReport", report);
	}

	/** 댓글 신고 수 조회
	 * @param list
	 * @return
	 */
	public int getReplyReportCount(String list) {
		return sqlSession.selectOne("adminMapper.getReplyReportCount", list);
	}

	/** 댓글 신고 목록 조회
	 * @param pagination
	 * @param list
	 * @return
	 */
	public List<ReportReply> selectReplyReport(Pagination pagination, String list) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("adminMapper.selectReplyReport", list, rowBounds);
	}

	/** 활동 회원 수 조회
	 * @param list
	 * @return
	 */
	public int getSignUpUserCount(String list) {
		return sqlSession.selectOne("adminMapper.getSignUpUserCount", list);
	}


	/** 활동 회원 목록 조회
	 * @param pagination
	 * @param list
	 * @return
	 */
	public List<User> selectSignUpUser(Pagination pagination, String list) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("adminMapper.selectSignUpUser", list, rowBounds);
	}

	/** 탈퇴 회원 수 조회
	 * @param list
	 * @return
	 */
	public int getSecessionCount(String list) {
		return sqlSession.selectOne("adminMapper.getSecessionCount", list);
	}

	public List<User> selectSecessionUser(Pagination pagination, String list) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("adminMapper.selectSecessionUser", list, rowBounds);
	}
	
	

}
