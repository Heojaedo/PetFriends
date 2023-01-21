package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.domain.PostVO;
import com.spring.domain.ReviewVO;
import com.spring.domain.Review_PetsitterVO;
import com.spring.dto.ReviewDTO;

public interface ReviewService {

	//리뷰 - 전체 리스트
	public List<ReviewVO> reviewList() throws Exception;
	
	//리뷰 - 전체 리뷰 수
	public int reviewCount() throws Exception;
	
	//리뷰 - 검색 리뷰 수
	public int searchCount(Criteria cri) throws Exception;
	
	//리뷰 - 페이징 리스트
	public List<ReviewVO> reviewPagingList(Criteria cri) throws Exception;
	
	//리뷰 - 검색 페이징 리스트
	public List<ReviewVO> reviewSearchPaging(Criteria cri) throws Exception;
	
	//리뷰 모델 불러오기
	public ReviewVO reviewInfo(String reviewuid) throws Exception;
	
	//리뷰 - 조회수 +1
	public void reviewHitUp(ReviewVO vo) throws Exception;
	
	//리뷰 - 디테일
	public ReviewVO reviewDetail(String reviewuid) throws Exception;
	
	//리뷰 - 회원 정보
	public MemberVO reviewUser(String userid) throws Exception;
	
	//리뷰 - 펫시터 정보
	public Review_PetsitterVO reviewPetsitter(int reviewuid) throws Exception;
	
	//펫시터 불러오기
	public Review_PetsitterVO reviewDetailPetsitter(String reviewuid) throws Exception;
	
	//글번호 불러오기
	public PostVO postUid(String petsitter) throws Exception;
	
	//리뷰 - 삭제
	public void reviewDelete(String reviewuid) throws Exception;
	
	//리뷰 - 수정 페이지
	public ReviewVO reviewEdit(String reviewuid) throws Exception;
	
	//리뷰 - 데이터 수정
	public void reviewEditPost(ReviewVO vo) throws Exception;
	
	//리뷰 - 메인 페이지
	public List<ReviewVO> reviewSlide() throws Exception;
}
