package com.class4.util;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String release; //현재개봉작
	public Criteria() {
		this(1,20);
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
