package com.spring.domain;

import lombok.Data;

@Data
public class ReservePageMaker {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private ReserveCriteria cri;
	
	private int displayPageNum = 5;
	
	public ReservePageMaker(ReserveCriteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum)) * displayPageNum;
		this.startPage = (this.endPage - displayPageNum) + 1;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
