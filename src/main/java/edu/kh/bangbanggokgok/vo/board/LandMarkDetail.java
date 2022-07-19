package edu.kh.bangbanggokgok.vo.board;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LandMarkDetail {
	
	private int landMakrNo;
	private int landMarkX;
	private int landMarkY;
	private String landMarkName;
	private String landMarkContent;
	private String landMarkAddress;
	private String landMarkCreate;
	private String userName;
	private int userNo;
	
	private List<LandMarkIMG> imageList;
	
	private int locationNum;
}
