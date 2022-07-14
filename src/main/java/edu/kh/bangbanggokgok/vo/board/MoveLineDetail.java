package edu.kh.bangbanggokgok.vo.board;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class MoveLineDetail {
	
	private int movelineNo;
	private String movelineTitle;
	private String movelineContent;
	private String createDate;
	private String updateDate;
	private String deleteDate;
	private String locationType;
	private String locationName;
	private String movelineTheme;
	private int readCount;
	
	private int mlHashNo;
	private String mlHashName;
	
	
	private int userNo;
	private String userName;
	private String profileImage;

	private List<MoveLineIMG> imageList;
	private String thumbnail;

}
