package com.class4.movie.util;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1,20);
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
