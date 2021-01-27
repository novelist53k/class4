package com.class4.command.mapping;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.class4.command.ActorVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserActorVO {

	private int uano;
	private String uaId;
	private String ano;
	private String actorName;
	private Timestamp uaAge;
	private String uaGender;
	
	
}
