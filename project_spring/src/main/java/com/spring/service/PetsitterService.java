package com.spring.service;

import java.util.List;

import com.spring.domain.MemberVO;
import com.spring.domain.PetVO;
import com.spring.domain.PushVO;
import com.spring.domain.ReservationVO;
import com.spring.domain.ReserveCriteria;

public interface PetsitterService {

	//예약 목록 넘버링
	public int count(String session_id) throws Exception;
	
	//예약 목록
	public List<ReservationVO> reservePagingList(ReserveCriteria cri) throws Exception;
	
	//예약 상세보기 - 예약 시간 불러오기
	public ReservationVO reserveTime(String uid) throws Exception;
	
	//예약회원
	public MemberVO member(String uid) throws Exception;
	
	//예약 상세보기 - 반려동물 리스트
	public List<PetVO> reservePet(String reserveTime) throws Exception;
	
	//예약 상세보기 - 반려동물 자세히 보기
	public PetVO detailPet(String petuid) throws Exception;
	
	//예약 승인 - 상태 변경, 승인 시간 추가
	public void reservePermit(ReservationVO vo) throws Exception;
	
	//승인 메세지 보내기
	public void reservePush(PushVO vo) throws Exception;
}
