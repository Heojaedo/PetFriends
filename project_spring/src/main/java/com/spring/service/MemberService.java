package com.spring.service;

import java.util.List;

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

public interface MemberService {

	//회원가입
	public void createMember(MemberVO vo) throws Exception;
	
	//회원가입 - 아이디 체크
	public int idCheck(String userid) throws Exception;
	
	//회원가입 - 이메일 체크
	public int emailCheck(String email) throws Exception;
	
	//로그인
	public MemberVO readMember(LoginDTO dto) throws Exception;
	
	//알림 확인
	public PushVO pushCheck(String userid) throws Exception;
	
	//알림 상태 변경
	public void pushChange(String userid) throws Exception;
	
	//예약 넘버링
	public int reserveCount(String session_id) throws Exception;
	
	//예약내역
	public List<Reservation_PetVO> reservePagingList(ReserveCriteria cri) throws Exception;
	
	//예약 상세보기 - 예약 시간 불러오기
	public ReservationVO reserveTime(String uid) throws Exception;
	
	//예약 상세보기 - 펫시터 정보
	public Petsitter_MemberVO petsitterProfile(String petsitter) throws Exception;
	
	//예약 상세보기 - 펫시터 프로필 보기
	public Petsitter_MemberVO petsitterProfile2(String uid) throws Exception;
	
	//예약 상세보기 - 반려동물 리스트
	public List<PetVO> reservePet(String reserveTime) throws Exception;
	
	//결제 정보
	public PayInfoVO payInfo(String uid) throws Exception;
	
	//결제 내역 저장
	public void paymentComplete(PaymentVO vo) throws Exception;
	
	//결제 내역 보기
	public PaymentVO paymentInfo(String reserveuid) throws Exception;
	
	//예약 테이블 결제 상태 변경
	public void statusChange(String reservetime) throws Exception;
	
	//돌봄 완료 상태 변경
	public void sittingComplete(String reservetime) throws Exception;
	
	//정보수정 화면
	public MemberVO editMember(String session_id) throws Exception;
	
	//정보수정 - 이메일 체크 (본인 이메일)
	public int editemailCheck(UpdateDTO dto) throws Exception;
	
	//정보수정 - 이메일 중복 체크
	public int editemailCheck2(String email) throws Exception;
	
	//정보수정
	public void updateMember(UpdateDTO dto) throws Exception;
	
	//정보수정 - 비밀번호 변경 x
	public void updateMember2(UpdateDTO dto) throws Exception;
	
	//반려동물 카드
	public List<PetVO> mypet(String session_id) throws Exception;
	
	//반려동물 등록
	public void registPet(PetVO vo) throws Exception;
	
	//반려동물 삭제
	public void deletePet(String petuid) throws Exception;
	
	//반려동물 카드 수정 화면
	public PetVO editPet(String petuid) throws Exception;
	
	//반려동물 카드 수정
	public void updatePet(PetVO vo) throws Exception;
	
	//펫시터 지원하기
	public void petsitter(PetsitterVO vo) throws Exception;
	
	//펫시터 중복지원 방지
	public int petsitterIdCheck(String session_id) throws Exception;
	
	//알림 - 관리자, 펫시터, 회원 확인
	public MemberVO roleCheck(String session_id) throws Exception;
	
	//알림 - 펫시터 지원수
	public int petsitterCount() throws Exception;
	
	//알림 - 펫시터 메뉴 예약 갯수
	public int petsitterReserveCount(String session_id) throws Exception;
	
	//알림 - 결제 대기 갯수
	public int paymentCount(String session_id) throws Exception;
}
