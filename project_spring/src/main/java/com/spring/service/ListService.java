package com.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.domain.PetVO;
import com.spring.domain.PostVO;
import com.spring.domain.Post_EditVO;
import com.spring.domain.Post_PetsitterPetVO;
import com.spring.domain.Post_PetsitterVO;
import com.spring.domain.Post_ProfileVO;
import com.spring.domain.ProfileVO;
import com.spring.domain.PushVO;
import com.spring.domain.ReservationVO;
import com.spring.domain.ReviewVO;
import com.spring.domain.UploadVO;
import com.spring.dto.SearchDTO;

@Service
public interface ListService {

	//리스트
	public List<Post_ProfileVO> list() throws Exception;
	
	//리스트 - 검색어
	public List<Post_ProfileVO> listSearch(SearchDTO dto) throws Exception;
	
	//리스트 - 금액 검색 x
	public List<Post_ProfileVO> listSearch2(SearchDTO dto) throws Exception;
	
	//View 페이지 - 업로드 이미지
	public List<UploadVO> postImage(String postuid) throws Exception;
	
	//View 페이지 - 펫시터 정보
	public Post_PetsitterVO postView(String postuid) throws Exception;
	
	//펫시터 프로필 보기
	public Post_PetsitterVO petsitterView(String postuid) throws Exception;
	
	//펫시터 반려동물 보기
	public PetVO petsitterPetView(String petuid) throws Exception;
	
	//View 페이지 - 펫시터 반려동물 불러오기
	public List<Post_PetsitterPetVO> petsitterPet(String postuid) throws Exception;
	
	//View 페이지 - 펫시터 리뷰
	public List<ReviewVO> petsitterReview(String petsitter) throws Exception;
	
	//View 페이지 - 사용자 반려동물 리스트
	public List<PetVO> pet(String session_id) throws Exception;
	
	//예약가능일 조회
	public List<ReservationVO> dateCheck(String postuid) throws Exception;
	
	//등록된 포스트 체크
	public int petsitterPost(String session_id) throws Exception;
	
	//글쓰기 페이지 펫시터 정보 불러오기
	public MemberVO petsitterInfo(String session_id) throws Exception;
	
	//포스트 수정화면
	public Post_EditVO postEdit(String session_id) throws Exception;
	
	//포스트 수정화면 - 첨부파일
	public List<UploadVO> postImage(int postuid) throws Exception;
	
	//프로필 업로드
	public void profile(ProfileVO pf) throws Exception;
	
	//프로필 수정
	public void profileEdit(ProfileVO pf) throws Exception;
	
	//포스트 업로드
	public void post(PostVO p) throws Exception;
	
	//포스트 수정
	public void postUpdate(PostVO p) throws Exception;
	
	//첨부파일 삭제 처리
	public void delFile(String filename) throws Exception;
	
	//프로필 삭제
	public void profileDelete(String session_id) throws Exception;
	
	//포스트 삭제
	public void postDelete(String uid) throws Exception;
	
	//파일 데이터베이스 업로드
	public void upload(HashMap<String, Object> hm) throws Exception;
	
	//예약하기
	public void reserve(ReservationVO vo) throws Exception;
	
	//예약 알림 보내기
	public void pushReserve(PushVO p) throws Exception;
	
	//리뷰 - 펫시터 정보
	public ReservationVO reviewInfo(String uid) throws Exception;
	
	//리뷰 - 펫시터 이름 불러오기
	public MemberVO petsitterName(String petsitter) throws Exception;
	
	//리뷰 작성
	public void review(ReviewVO vo) throws Exception;
	
	//리뷰 파일 데이터베이스 업로드
	public void reviewFileUpload(HashMap<String, Object> hm) throws Exception;
}
