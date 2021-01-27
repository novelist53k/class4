package com.class4.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminVO {
	
	private int adminNO;
	private String adminId;		// 관리자 ID
	private String adminKey;	// 영화진흥위원회 api키
	
}
