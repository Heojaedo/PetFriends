package com.spring.service;

import java.util.List;

import com.spring.domain.Petsitter_MemberVO;
import com.spring.domain.PushVO;
import com.spring.dto.PetsitterPermitDTO;

public interface AdminService {

	//펫시터 지원수
	public int count() throws Exception;
	
	//펫시터 지원 목록
	public List<Petsitter_MemberVO> petsitter() throws Exception;
	
	//펫시터 지원서 보기
	public Petsitter_MemberVO petsitterView(String uid) throws Exception;
	
	//펫시터 허가 - 권한 변경
	public void petsitterPermit(String userid) throws Exception;
	
	//펫시터 허가 - 지원서 상태 변경
	public void petsitterPermit2(PetsitterPermitDTO dto) throws Exception;
	
	//펫시터 승인 완료 메세지 보내기
	public void petsitterMsg(PushVO vo) throws Exception;
	
	//펫시터 수
	public int petsitterCount() throws Exception;
	
	//펫시터 리스트
	public List<Petsitter_MemberVO> petsitterList() throws Exception;
	
	//펫시터 수 - 검색
	public int petsitterSearchCount(String search) throws Exception;
	
	//펫시터 리스트 - 검색
	public List<Petsitter_MemberVO> petsitterSearchList(String search) throws Exception;
}
