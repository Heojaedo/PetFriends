package com.spring.domain;

import lombok.Data;

@Data
public class ReservationVO {

	private int uid;
	private String userid;
	private String username;
	private String pet;
	private String petsitter;
	private String checkindate;
	private String checkoutdate;
	private String price;
	private String status;
	private String reservedate;
	private String permitdate;
}
