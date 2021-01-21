package com.class4.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {	
	
	private int rno;
	private int bno;
	private String id;
	private String content;
	private Timestamp regDate;
	private Timestamp updateDate;
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", id=" + id + ", content=" + content + ", regDate=" + regDate
				+ ", updateDate=" + updateDate + "]";
	}
	
	
}
