package edu.kh.bangbanggokgok.vo.reply;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Reply {

	private int replyNo;
    private String replyContent;
    private String createDate;
    private String updateDate;
    private String deleteDate;
    private int userNo;
    private int movelineNo;
    private int parentReplyNo;
    
    private String userName;
    private String profileImage;
	
}
