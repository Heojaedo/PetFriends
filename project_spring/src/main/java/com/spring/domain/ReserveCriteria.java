package com.spring.domain;

import lombok.Data;

@Data
public class ReserveCriteria {

	private String userid;
	private int page; //현재 페이지
	private int pageStart;
	private int amount; //페이지 당 출력 게시물 수
	
	public ReserveCriteria() {
		this.page = 1;
		this.amount = 5;
	}
	
	public int getPageStart() {
		return (this.page - 1) * this.amount;
	}
}
