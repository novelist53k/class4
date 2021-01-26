package com.class4.command.mapping;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieDirectorVO {

	private int mdno;
	private String mno;
	private String dno;
	
	
	public MovieDirectorVO(String mno, String dno) {
		this.mno = mno;
		this.dno = dno;
	}
	
	
	
}
