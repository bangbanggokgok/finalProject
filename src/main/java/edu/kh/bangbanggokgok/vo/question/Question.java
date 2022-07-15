package edu.kh.bangbanggokgok.vo.question;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Question {
	
	private int questionNo;
	private String questionTitle;
	private String createDate;
	private String questionAnswer;
	private int userNo;
	
}
