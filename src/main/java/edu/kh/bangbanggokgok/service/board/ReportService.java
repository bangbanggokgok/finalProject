package edu.kh.bangbanggokgok.service.board;

import edu.kh.bangbanggokgok.vo.admin.ReportMoveLine;
import edu.kh.bangbanggokgok.vo.admin.ReportReply;

public interface ReportService {

	/** 코스 신고
	 * @param report
	 * @return result
	 */
	int reportML(ReportMoveLine report);


	/** 댓글 신고
	 * @param report
	 * @return result
	 */
	int reportReply(ReportReply report);

}
