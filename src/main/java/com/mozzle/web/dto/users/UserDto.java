package com.mozzle.web.dto.users;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
//	USER_ID, USER_PW, USER_NAME, AUTH_CODE, BIRTH, EMAIL, TEL, DELFLAG
	private String user_id;
	private String user_pw;
	private String user_name;
	private	int auth_code;
	private String birth;
	private String email;
	private String tel;
	private String delflag;
	

}
