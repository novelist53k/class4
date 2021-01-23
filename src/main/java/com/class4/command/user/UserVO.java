package com.class4.command.user;

import java.security.Timestamp;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail1;
	private String userEmail2;
	private String userGender;
	private String userAge;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;
	private Timestamp regdate;
	private int genre;
	private String actor;
	private String director;
	private int[] genreLike;
	private String[] likeActor;
	private String[] likeDirector;
	private String path;
	private String fileRealName;
	
	private String checkPw;
	
	//마이페이지 1:N맵핑
		private ArrayList<UserActorListVO> actorlist;
		private ArrayList<UserActorListVO> directorlist;
		private ArrayList<UserActorListVO> usergenrelist;
		
	

	
	
	
}

