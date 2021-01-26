package com.class4.command.mapping;

import java.sql.Timestamp;

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
	private Timestamp uaAge;
	private String uaGender;
}
