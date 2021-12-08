package com.mozzle.web.dto.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private String post_id;
	private String mozzle_id;
	private String user_id;
	private String title;
	private String content;
	private int refer;
	private int step;
	private int depth;
	private String regdate;
}
