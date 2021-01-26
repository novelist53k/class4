package com.class4.command.mapping;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDirectorVO {
	
	private int udno;
	private String udId;
	private String dno;
	private Timestamp udAge;
	private String udGender;
	
}
