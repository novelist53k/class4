package com.class4.command.user;

import java.security.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.class4.command.ReviewBoardVO;

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
	private String userYear;
	private String userDay;
	private String userMonth;
	private String userAge;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;
	private Timestamp regdate;
	private String genre;
	private String actor;
	private String director;
	private String[] genrelist;
	private String[] likeActor;
	private String[] likeDirector;
	private String path;
	private String fileRealName;
	
	
	private String checkPw;
	
	//
		private ArrayList<UserActorListVO> actorlist;
		private ArrayList<UserDirectorListVO> directorlist;
		private ArrayList<UserGenreListVO> usergenrelist;
		private ArrayList<ReviewBoardVO> userReview;
		@Override
		public String toString() {
			return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail1="
					+ userEmail1 + ", userEmail2=" + userEmail2 + ", userGender=" + userGender + ", userAge=" + userAge
					+ ", addrBasic=" + addrBasic + ", addrDetail=" + addrDetail + ", addrZipNum=" + addrZipNum
					+ ", regdate=" + regdate + ", path=" + path + ", fileRealName=" + fileRealName + "]";
		}
		
	

	
	
	
}

