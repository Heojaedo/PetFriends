package com.spring.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.controller.AdminController;
import com.spring.domain.Petsitter_MemberVO;
import com.spring.domain.PushVO;
import com.spring.dto.PetsitterPermitDTO;

@Repository
public class AdminDAOIm implements AdminDAO {

	@Inject
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private static final String namespace = "com.spring.mapper.AdminMapper";
	
	@Override
	public int count() throws Exception {
		return session.selectOne(namespace+".count");
	}
	
	@Override
	public List<Petsitter_MemberVO> petsitter() throws Exception {
		return session.selectList(namespace+".list");
	}
	
	@Override
	public Petsitter_MemberVO petsitterView(String uid) throws Exception {
		return session.selectOne(namespace+".view", uid);
	}
	
	@Override
	public void petsitterPermit(String userid) throws Exception {
		session.update(namespace+".permit", userid);
	}
	
	@Override
	public void petsitterPermit2(PetsitterPermitDTO dto) throws Exception {
		session.update(namespace+".permit2", dto);
	}
	
	@Override
	public void petsitterMsg(PushVO vo) throws Exception {
		session.insert(namespace+".petsitterMsg", vo);
	}
	
	@Override
	public int petsitterCount() throws Exception {
		return session.selectOne(namespace+".petsitterCount");
	}
	
	@Override
	public List<Petsitter_MemberVO> petsitterList() throws Exception {
		return session.selectList(namespace+".petsitterList");
	}
	
	@Override
	public int petsitterSearchCount(String search) throws Exception {
		return session.selectOne(namespace+".petsitterSearchCount", search);
	}
	
	@Override
	public List<Petsitter_MemberVO> petsitterSearchList(String search) throws Exception {
		return session.selectList(namespace+".petsitterSearchList", search);
	}
}
