package com.mozzle.web.dto.notice;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NotificationDto {
	//NOTICE_ID, USER_ID, MOZZLE_ID, "TYPE", NOTICE_TIME, READ_CHECKED, DELFLAG
	private int notice_id;
	private String user_id;
	private int mozzle_id;
	private String type;
	private String notice_time;
	private String read_checked;
	private String delflag;
}
