package com.mozzle.web.dto.member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
//	USER_ID, USER_PW, USER_NAME, AUTH_CODE, BIRTH, EMAIL, TEL, DELFLAG
	private int userNum;
	private String userName;
	private String userId;
	private String userPw;
	private	String birth;
	private String email;
	private String tel;
	
	public MemberDto(String userName, String userId, String userPw, String birth, String email, String tel) {
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
		this.birth = birth;
		this.email = email;
		this.tel = tel;
	}

}
