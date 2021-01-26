package com.class4.command.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDirectorListVO {

	private String udid;
	private String dno;
	private int udno;
	private String udAge;
	private String udGender;
}
