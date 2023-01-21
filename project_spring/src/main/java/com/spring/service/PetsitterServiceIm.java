package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.domain.PetVO;
import com.spring.domain.PushVO;
import com.spring.domain.ReservationVO;
import com.spring.domain.ReserveCriteria;
import com.spring.persistence.PetsitterDAO;

@Service
public class PetsitterServiceIm implements PetsitterService {

	@Inject
	private PetsitterDAO dao;
	
	@Override
	public int count(String session_id) throws Exception {
		return dao.count(session_id);
	}
	
	@Override
	public List<ReservationVO> reservePagingList(ReserveCriteria cri) throws Exception {
		return dao.reservePagingList(cri);
	}
	
	@Override
	public ReservationVO reserveTime(String uid) throws Exception {
		return dao.reserveTime(uid);
	}
	
	@Override
	public MemberVO member(String uid) throws Exception {
		return dao.member(uid);
	}
	
	@Override
	public List<PetVO> reservePet(String reserveTime) throws Exception {
		return dao.reservePet(reserveTime);
	}
	
	@Override
	public PetVO detailPet(String petuid) throws Exception {
		return dao.detailPet(petuid);
	}
	
	@Override
	public void reservePermit(ReservationVO vo) throws Exception {
		dao.reservePermit(vo);
	}
	
	@Override
	public void reservePush(PushVO vo) throws Exception {
		dao.reservePush(vo);
	}
}
