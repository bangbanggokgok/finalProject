package edu.kh.bangbanggokgok.vo.admin;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ReportReply {
	private int reportNo;
	private int replyNo;
	private int userNo;
	private String reportReason;
}
