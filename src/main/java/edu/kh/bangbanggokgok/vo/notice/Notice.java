package edu.kh.bangbanggokgok.vo.notice;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeCreate;
	private String noticeEnd;
	private String noticeType;
	private int userNo;
	
}
