package edu.kh.bangbanggokgok.vo.board;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MoveLine {

	private int movelineNo;
	private String movelineTitle;
	private String movelineContent;
	private String createDate;
	private String updateDate;
	private String deleteDate;
	private String movelineTheme;
	private int userNo;
	private String locationName;
	private int readCount;
	private String reNameImage;
}
