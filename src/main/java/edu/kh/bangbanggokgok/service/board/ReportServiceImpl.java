package edu.kh.bangbanggokgok.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bangbanggokgok.dao.board.ReportDAO;
import edu.kh.bangbanggokgok.vo.admin.ReportMoveLine;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDAO dao;

	// 코스 신고
	@Override
	public int reportML(ReportMoveLine report) {
		return dao.reportML(report);
	}
	
	
	
	
}
