package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.Petsitter_MemberVO;
import com.spring.domain.PushVO;
import com.spring.dto.PetsitterPermitDTO;
import com.spring.persistence.AdminDAO;

@Service
public class AdminServiceIm implements AdminService {

	@Inject
	private AdminDAO dao;
	
	@Override
	public int count() throws Exception {
		return dao.count();
	}
	
	@Override
	public List<Petsitter_MemberVO> petsitter() throws Exception {
		return dao.petsitter();
	}
	
	@Override
	public Petsitter_MemberVO petsitterView(String uid) throws Exception {
		return dao.petsitterView(uid);
	}
	
	@Override
	public void petsitterPermit(String userid) throws Exception {
		dao.petsitterPermit(userid);
	}
	
	@Override
	public void petsitterPermit2(PetsitterPermitDTO dto) throws Exception {
		dao.petsitterPermit2(dto);
	}
	
	@Override
	public void petsitterMsg(PushVO vo) throws Exception {
		dao.petsitterMsg(vo);
	}
	
	@Override
	public int petsitterCount() throws Exception {
		return dao.petsitterCount();
	}
	
	@Override
	public List<Petsitter_MemberVO> petsitterList() throws Exception {
		return dao.petsitterList();
	}
	
	@Override
	public int petsitterSearchCount(String search) throws Exception {
		return dao.petsitterSearchCount(search);
	}
	
	@Override
	public List<Petsitter_MemberVO> petsitterSearchList(String search) throws Exception {
		return dao.petsitterSearchList(search);
	}
}
