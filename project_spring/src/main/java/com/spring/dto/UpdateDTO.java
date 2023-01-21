package com.spring.dto;

import lombok.Data;

@Data
public class UpdateDTO {

	private String userid;
	private String userpw;
	private String email;
	private String zipcode;
	private String address;
	private String detailaddr;
	private String extraaddr;
	private String photo;
}
