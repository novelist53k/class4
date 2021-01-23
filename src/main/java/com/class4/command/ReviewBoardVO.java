package com.class4.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewBoardVO {
	
	private int bno;
	private int mno;
	private String writer;
	private String movieTitle;
	private String content;
	private Timestamp regDate;
	private Timestamp updateDate;
	
}
