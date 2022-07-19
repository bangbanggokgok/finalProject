package edu.kh.bangbanggokgok.vo.board;

import java.util.List;

import edu.kh.bangbanggokgok.vo.hashTag.MoveLineHashTag;
import edu.kh.bangbanggokgok.vo.image.MoveLineImage;
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
	
	private int MLHashTagNo;
	private String MLHashTag;
	
	
	private int userNo;
	private String userName;
	private String profileImage;

	private List<MoveLineImage> imageList;
	private String thumbnail;

	
	private int landMarkNo;
	private int landMarkX;
	private int landMarkY;
	private String landMarkName;
	private String landMarkContent;
	private String landMarkAddress;
	private char landMarkFL;
	private String landMarkCreate;
	
	private List<LandMark> landmarkList;
	private List<MoveLineHashTag> hashtagList;
}
