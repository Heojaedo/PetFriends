package com.spring.domain;

import lombok.Data;

@Data
public class PushVO {

	private int uid;
	private String userid;
	private String text;
	private String pushtime;
	private String status;
}
