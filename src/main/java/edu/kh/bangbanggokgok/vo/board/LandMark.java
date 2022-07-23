package edu.kh.bangbanggokgok.vo.board;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class LandMark {
	private int landMarkNo;
	private String landMarkName;
	private String landMarkContent;
	private String landMarkAddress;
	private char landMarkFL;
	private String landMarkCreate;
	private String thumbnail;
	private String userName;
	private int locationType;
	private String locationName;
}
