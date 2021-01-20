package com.class4.command;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserlistVO {
	private List<String> actorList;
	private List<String> directorList;
	private List<String> genreList;
}
