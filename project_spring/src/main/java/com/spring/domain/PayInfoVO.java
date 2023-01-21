package com.spring.domain;

import lombok.Data;

@Data
public class PayInfoVO {

	private String uid; //예약 번호
	private String username; //펫시터 이름
	private String photo;
	private String addr;
	private String checkindate;
	private String checkoutdate;
	private String price;
}
