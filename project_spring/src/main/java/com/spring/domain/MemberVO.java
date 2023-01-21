package com.spring.domain;

import lombok.Data;

@Data
public class MemberVO {

	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String phone;
	private String zipcode;
	private String address;
	private String detailaddr;
	private String extraaddr;
	private String photo;
	private String joindate;
	private String role;
}
