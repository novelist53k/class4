package com.class4.movie.util;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String cMovie = "current";
	private String eMovie = "expected";
	public Criteria() {
		this(1,20,"current","expected");
	}
	public Criteria(int pageNum, int amount , String cMovie, String eMovie) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
}