package edu.kh.bangbanggokgok.vo.question;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class QuestionDetail {
	
	private int questionNo;
	private String questionTitle;
	private String questionContent;
	private String createDate;
	private String questionAnswer;
	private int userNo;
	private String managerName;
	

}
