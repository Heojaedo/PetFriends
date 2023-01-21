package com.spring.domain;

import lombok.Data;

@Data
public class PaymentVO {

	private String reserveuid;
	private String payuid;
	private String userid;
	private String price;
	private String paydate;
}
