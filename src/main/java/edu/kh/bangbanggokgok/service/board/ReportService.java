package edu.kh.bangbanggokgok.service.board;

import edu.kh.bangbanggokgok.vo.admin.ReportMoveLine;

public interface ReportService {

	/** 코스 신고
	 * @param report
	 * @return result
	 */
	int reportML(ReportMoveLine report);

}
