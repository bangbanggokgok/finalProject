package edu.kh.bangbanggokgok.vo.board;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LandMarkDetail {
	
	private int landMarkNo;
	private double landMarkX;
	private double landMarkY;
	private String landMarkName;
	private String landMarkContent;
	private String landMarkAddress;
	private String landMarkCreate;
	private String userName;
	private int userNo;
	
	private List<LandMarkIMG> imageList;
	
	private String locationName;
	private int locationNum;
}
