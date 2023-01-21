package com.spring.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.controller.PetsitterController;
import com.spring.domain.MemberVO;
import com.spring.domain.PetVO;
import com.spring.domain.PushVO;
import com.spring.domain.ReservationVO;
import com.spring.domain.ReserveCriteria;

@Repository
public class PetsitterDAOIm implements PetsitterDAO {

	@Inject
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(PetsitterController.class);
	
	private static final String namespace = "com.spring.mapper.PetsitterMapper";
	
	@Override
	public int count(String session_id) throws Exception {
		return session.selectOne(namespace+".count", session_id);
	}
	
	@Override
	public List<ReservationVO> reservePagingList(ReserveCriteria cri) throws Exception {
		return session.selectList(namespace+".reserve", cri);
	}
	
	@Override
	public ReservationVO reserveTime(String uid) throws Exception {
		return session.selectOne(namespace+".reserveTime", uid);
	}
	
	@Override
	public MemberVO member(String uid) throws Exception {
		return session.selectOne(namespace+".member", uid);
	}
	
	@Override
	public List<PetVO> reservePet(String reserveTime) throws Exception {
		return session.selectList(namespace+".reservePet", reserveTime);
	}
	
	@Override
	public PetVO detailPet(String petuid) throws Exception {
		return session.selectOne(namespace+".detailPet", petuid);
	}
	
	@Override
	public void reservePermit(ReservationVO vo) throws Exception {
		session.update(namespace+".reservePermit", vo);
	}
	
	@Override
	public void reservePush(PushVO vo) throws Exception {
		session.insert(namespace+".reservePush", vo);
	}
}
