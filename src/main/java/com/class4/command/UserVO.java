package com.class4.command;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	private String userId;
	private String password;
	private String userName;
	private String userEmail1;
	private String userEmail2;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;
	private Timestamp regdate;
	
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", password=" + password + ", userName=" + userName + ", userEmail1="
				+ userEmail1 + ", userEmail2=" + userEmail2 + ", addrBasic=" + addrBasic + ", addrDetail=" + addrDetail
				+ ", addrZipNum=" + addrZipNum + ", regdate=" + regdate + "]";
	}
	
}
