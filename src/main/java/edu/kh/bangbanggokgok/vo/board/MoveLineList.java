package edu.kh.bangbanggokgok.vo.board;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MoveLineList {
	
	// 지역별 게시글 목록 조회용 VO
	
	private int movelineNo;
	private String movelineTitle;
	private String landMarkName;
	private String movelineHashName;
	private String locationName;
	private String thumbnail;
	
}