package com.class4.command.mapping;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.class4.command.DirectorVO;

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
	private String directorName;
	private Timestamp udAge;
	private String udGender;
	
}
