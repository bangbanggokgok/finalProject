package edu.kh.bangbanggokgok.vo.user;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class User {

	private int userNo;
	private String userEmail;
	private String userPW;
	private String userName;
	private String userTel;
	private String adminFlag;
	private String userAddress;
	private String registDate;
	private String secessionDate;
	private String profileImage;
	
}
