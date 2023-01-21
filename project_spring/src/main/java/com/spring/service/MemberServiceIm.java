package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
import com.spring.persistence.MemberDAO;

@Service
public class MemberServiceIm implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Override
	public void createMember(MemberVO vo) throws Exception {
		dao.createMember(vo);
	}
	
	@Override
	public int idCheck(String userid) throws Exception {
		return dao.idCheck(userid);
	}
	
	@Override
	public int emailCheck(String email) throws Exception {
		return dao.emailCheck(email);
	}
	
	@Override
	public MemberVO readMember(LoginDTO dto) throws Exception {
		return dao.readMember(dto);
	}
	
	@Override
	public PushVO pushCheck(String userid) throws Exception {
		return dao.pushCheck(userid);
	}
	
	@Override
	public void pushChange(String userid) throws Exception {
		dao.pushChange(userid);
	}
	
	@Override
	public int reserveCount(String session_id) throws Exception {
		return dao.reserveCount(session_id);
	}
	
	@Override
	public List<Reservation_PetVO> reservePagingList(ReserveCriteria cri) throws Exception {
		return dao.reservePagingList(cri);
	}
	
	@Override
	public ReservationVO reserveTime(String uid) throws Exception {
		return dao.reserveTime(uid);
	}
	
	@Override
	public Petsitter_MemberVO petsitterProfile(String petsitter) throws Exception {
		return dao.petsitterProfile(petsitter);
	}
	
	@Override
	public Petsitter_MemberVO petsitterProfile2(String uid) throws Exception {
		return dao.petsitterProfile2(uid);
	}
	
	@Override
	public List<PetVO> reservePet(String reserveTime) throws Exception {
		return dao.reservePet(reserveTime);
	}
	
	@Override
	public PayInfoVO payInfo(String uid) throws Exception {
		return dao.payInfo(uid);
	}
	
	@Override
	public void paymentComplete(PaymentVO vo) throws Exception {
		dao.paymentComplete(vo);
	}
	
	@Override
	public PaymentVO paymentInfo(String reserveuid) throws Exception {
		return dao.paymentInfo(reserveuid);
	}
	
	@Override
	public void statusChange(String reservetime) throws Exception {
		dao.statusChange(reservetime);
	}
	
	@Override
	public void sittingComplete(String reservetime) throws Exception {
		dao.sittingComplete(reservetime);
	}
	
	@Override
	public MemberVO editMember(String session_id) throws Exception {
		return dao.editMember(session_id);
	}
	
	@Override
	public int editemailCheck(UpdateDTO dto) throws Exception {
		return dao.editemailCheck(dto);
	}
	
	@Override
	public int editemailCheck2(String email) throws Exception {
		return dao.editemailCheck2(email);
	}
	
	@Override
	public void updateMember(UpdateDTO dto) throws Exception {
		dao.updateMember(dto);
	}
	
	@Override
	public void updateMember2(UpdateDTO dto) throws Exception {
		dao.updateMember2(dto);
	}
	
	@Override
	public List<PetVO> mypet(String session_id) throws Exception {
		return dao.mypet(session_id);
	}
	
	@Override
	public void registPet(PetVO vo) throws Exception {
		dao.registPet(vo);
	}
	
	@Override
	public void deletePet(String petuid) throws Exception {
		dao.deletePet(petuid);
	}
	
	@Override
	public PetVO editPet(String petuid) throws Exception {
		return dao.editPet(petuid);
	}
	
	@Override
	public void updatePet(PetVO vo) throws Exception {
		dao.updatePet(vo);
	}
	
	@Override
	public void petsitter(PetsitterVO vo) throws Exception {
		dao.petsitter(vo);
	}
	
	@Override
	public int petsitterIdCheck(String session_id) throws Exception {
		return dao.petsitterIdCheck(session_id);
	}
	
	@Override
	public MemberVO roleCheck(String session_id) throws Exception {
		return dao.roleCheck(session_id);
	}
	
	@Override
	public int petsitterCount() throws Exception {
		return dao.petsitterCount();
	}
	
	@Override
	public int petsitterReserveCount(String session_id) throws Exception {
		return dao.petsitterReserveCount(session_id);
	}
	
	@Override
	public int paymentCount(String session_id) throws Exception {
		return dao.paymentCount(session_id);
	}
}
