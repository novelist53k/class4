package com.class4.command;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



//영화정보VO
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieListVO {
	
	private String movieCd; //영화코드
	private String title;
	private String ftitle;
	private String grade; //심의정보
	private Date openDt;  //개봉일
	private String subhead;
	private String content;
	private String poster;
	private String trailer;
	


}