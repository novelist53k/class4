package com.class4.command;

import java.security.Timestamp;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CurrentFilmVO {
	
	private int mno;
	private String title;
	private String ftitle;
	private String genre;
	private String grade;
	private Date regdate;
	private String director;
	private String actor;
	private String subhead;
	private String content;
	private String poster;
	private String trailer;
	


}
