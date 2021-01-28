package com.class4.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchHistoryVO {
	
	private int shno;
	private String searchUserId;	// 사용자 id
	private String keyword;	// 검색어
	
}
