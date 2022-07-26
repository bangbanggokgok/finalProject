package edu.kh.bangbanggokgok.dao.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bangbanggokgok.vo.admin.ReportMoveLine;
import edu.kh.bangbanggokgok.vo.admin.ReportReply;

@Repository
public class ReportDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 코스 신고 DAO
	 * @param report
	 * @return result
	 */
	public int reportML(ReportMoveLine report) {
		return sqlSession.insert("reportMapper.reportML", report);
	}

	/** 댓글 신고 DAO
	 * @param report
	 * @return result
	 */
	public int reportReply(ReportReply report) {
		return sqlSession.insert("reportMapper.reportReply", report);
	}
}
