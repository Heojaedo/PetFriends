package com.spring.domain;

import lombok.Data;

@Data
public class Reservation_PetVO {

	private int uid;
	private String userid;
	private String pet;
	private String petsitter;
	private String username; //펫시터 이름
	private String checkindate;
	private String checkoutdate;
	private String price;
	private String status;
	private String reservedate;
	private String type;
	private String petname;
	private String breed;
	private String year;
	private String month;
	private String day;
	private String weight;
	private String sex;
	private String photo;
}
