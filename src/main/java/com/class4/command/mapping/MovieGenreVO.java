package com.class4.command.mapping;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieGenreVO {

	private int mgno;
	private String mno;
	private String genre;
}
