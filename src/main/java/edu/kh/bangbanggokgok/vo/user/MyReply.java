package edu.kh.bangbanggokgok.vo.user;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class MyReply {
	
	private int movelineNo;
	private String movelineTitle;
	private String replyContent;
	private String movelineWriter;
	private int replyNo;
	private int rowNo;
	
}

