package com.spring.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.controller.MemberController;
import com.spring.domain.MemberVO;
import com.spring.domain.PayInfoVO;
import com.spring.domain.PaymentVO;
import com.spring.domain.PetVO;
import com.spring.domain.PetsitterVO;
import com.spring.domain.Petsitter_MemberVO;
import com.spring.domain.PushVO;
import com.spring.domain.ReservationVO;
import com.spring.domain.Reservation_PetVO;
import com.spring.domain.ReserveCriteria;
import com.spring.dto.LoginDTO;
import com.spring.dto.UpdateDTO;

@Repository
public class MemberDAOIm implements MemberDAO {

	@Inject
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private static final String namespace = "com.spring.mapper.MemberMapper";
	
	@Override
	public void createMember(MemberVO vo) throws Exception {
		session.insert(namespace+".insert", vo);
	}
	
	@Override
	public int idCheck(String userid) throws Exception {
		return session.selectOne(namespace+".idCheck", userid);
	}
	
	@Override
	public int emailCheck(String email) throws Exception {
		return session.selectOne(namespace+".emailCheck", email);
	}
	
	@Override
	public MemberVO readMember(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".select", dto);
	}
	
	@Override
	public PushVO pushCheck(String userid) throws Exception {
		return session.selectOne(namespace+".pushCheck", userid);
	}
	
	@Override
	public void pushChange(String userid) throws Exception {
		session.update(namespace+".pushChange", userid);
	}
	
	@Override
	public int reserveCount(String session_id) throws Exception {
		return session.selectOne(namespace+".reserveCount", session_id);
	}
	
	@Override
	public List<Reservation_PetVO> reservePagingList(ReserveCriteria cri) throws Exception {
		return session.selectList(namespace+".reservePagingList", cri);
	}
	
	@Override
	public ReservationVO reserveTime(String uid) throws Exception {
		return session.selectOne(namespace+".reserveTime", uid);
	}
	
	@Override
	public Petsitter_MemberVO petsitterProfile(String petsitter) throws Exception {
		return session.selectOne(namespace+".petsitterProfile", petsitter);
	}
	
	@Override
	public Petsitter_MemberVO petsitterProfile2(String uid) throws Exception {
		return session.selectOne(namespace+".petsitterProfile2", uid);
	}
	
	@Override
	public List<PetVO> reservePet(String reserveTime) throws Exception {
		return session.selectList(namespace+".reservePet", reserveTime);
	}
	
	@Override
	public PayInfoVO payInfo(String uid) throws Exception {
		return session.selectOne(namespace+".payInfo", uid);
	}
	
	@Override
	public void paymentComplete(PaymentVO vo) throws Exception {
		session.insert(namespace+".paymentComplete", vo);
	}
	
	@Override
	public PaymentVO paymentInfo(String reserveuid) throws Exception {
		return session.selectOne(namespace+".paymentInfo", reserveuid);
	}
	
	@Override
	public void statusChange(String reservetime) throws Exception {
		session.update(namespace+".statusChange", reservetime);
	}
	
	@Override
	public void sittingComplete(String reservetime) throws Exception {
		session.update(namespace+".sittingComplete", reservetime);
	}
	
	@Override
	public MemberVO editMember(String session_id) throws Exception {
		return session.selectOne(namespace+".edit", session_id);
	}
	
	@Override
	public int editemailCheck(UpdateDTO dto) throws Exception {
		return session.selectOne(namespace+".editemailCheck", dto);
	}
	
	@Override
	public int editemailCheck2(String email) throws Exception {
		return session.selectOne(namespace+".editemailCheck2", email);
	}
	
	@Override
	public void updateMember(UpdateDTO dto) throws Exception {
		session.update(namespace+".update", dto);
	}
	
	@Override
	public void updateMember2(UpdateDTO dto) throws Exception {
		session.update(namespace+".update2", dto);
	}
	
	@Override
	public List<PetVO> mypet(String session_id) throws Exception {
		return session.selectList(namespace+".mypet", session_id);
	}
	
	@Override
	public void registPet(PetVO vo) throws Exception {
		session.insert(namespace+".registPet", vo);
	}
	
	@Override
	public void deletePet(String petuid) throws Exception {
		session.delete(namespace+".deletePet", petuid);
	}
	
	@Override
	public PetVO editPet(String petuid) throws Exception {
		return session.selectOne(namespace+".editPet", petuid);
	}
	
	@Override
	public void updatePet(PetVO vo) throws Exception {
		session.update(namespace+".updatePet", vo);
	}
	
	@Override
	public void petsitter(PetsitterVO vo) throws Exception {
		session.insert(namespace+".petsitter", vo);
	}
	
	@Override
	public int petsitterIdCheck(String session_id) throws Exception {
		return session.selectOne(namespace+".petsitterIdCheck", session_id);
	}
	
	@Override
	public MemberVO roleCheck(String session_id) throws Exception {
		return session.selectOne(namespace+".roleCheck", session_id);
	}
	
	@Override
	public int petsitterCount() throws Exception {
		return session.selectOne(namespace+".petsitterCount");
	}
	
	@Override
	public int petsitterReserveCount(String session_id) throws Exception {
		return session.selectOne(namespace+".petsitterReserveCount", session_id);
	}
	
	@Override
	public int paymentCount(String session_id) throws Exception {
		return session.selectOne(namespace+".paymentCount", session_id);
	}
}
