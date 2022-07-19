package edu.kh.bangbanggokgok.vo.admin;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ReportMoveLine {
	private int reportNo;
	private String reportReason;
	private String reportFlag;
	private String reportDate;
	private int moveLineNo;
	private String moveLineTitle;
	private int userNo;
	private String userName;
}
