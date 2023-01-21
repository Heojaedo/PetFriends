package com.spring.domain;

import lombok.Data;

@Data
public class ReviewVO {

	private int reviewuid;
	private String userid;
	private String username;
	private String petsitter;
	private String petsittername;
	private String title;
	private String contents;
	private int hit;
	private String reviewdate;
	private String preview;
}
