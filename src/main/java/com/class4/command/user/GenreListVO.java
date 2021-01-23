package com.class4.command.user;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GenreListVO {
	
	private Map<Integer, String> genrelist;
	
}
