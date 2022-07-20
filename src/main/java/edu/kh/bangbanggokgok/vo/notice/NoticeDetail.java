package edu.kh.bangbanggokgok.vo.notice;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class NoticeDetail {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeCreate;
	private String noticeEnd;
	private String noticeType;
	private int userNo;
	private String userName;
	
	private List<NoticeImage> imageList;

	


	
}
