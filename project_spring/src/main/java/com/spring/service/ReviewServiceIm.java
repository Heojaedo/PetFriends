package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.domain.PostVO;
import com.spring.domain.ReviewVO;
import com.spring.domain.Review_PetsitterVO;
import com.spring.persistence.ReviewDAO;

@Service
public class ReviewServiceIm implements ReviewService {

	@Inject
	private ReviewDAO dao;
	
	@Override
	public List<ReviewVO> reviewList() throws Exception {
		return dao.reviewList();
	}
	
	@Override
	public int reviewCount() throws Exception {
		return dao.reviewCount();
	}
	
	@Override
	public int searchCount(Criteria cri) throws Exception {
		return dao.searchCount(cri);
	}
	
	@Override
	public List<ReviewVO> reviewPagingList(Criteria cri) throws Exception {
		return dao.reviewPagingList(cri);
	}
	
	@Override
	public List<ReviewVO> reviewSearchPaging(Criteria cri) throws Exception {
		return dao.reviewSearchPaging(cri);
	}
	
	@Override
	public ReviewVO reviewInfo(String reviewuid) throws Exception {
		return dao.reviewInfo(reviewuid);
	}
	
	@Override
	public void reviewHitUp(ReviewVO vo) throws Exception {
		dao.reviewHitUp(vo);
	}
	
	@Override
	public ReviewVO reviewDetail(String reviewuid) throws Exception {
		return dao.reviewDetail(reviewuid);
	}
	
	@Override
	public MemberVO reviewUser(String userid) throws Exception {
		return dao.reviewUser(userid);
	}
	
	@Override
	public Review_PetsitterVO reviewPetsitter(int reviewuid) throws Exception {
		return dao.reviewPetsitter(reviewuid);
	}
	
	@Override
	public Review_PetsitterVO reviewDetailPetsitter(String reviewuid) throws Exception {
		return dao.reviewDetailPetsitter(reviewuid);
	}
	
	@Override
	public PostVO postUid(String petsitter) throws Exception {
		return dao.postUid(petsitter);
	}
	
	@Override
	public void reviewDelete(String reviewuid) throws Exception {
		dao.reviewDelete(reviewuid);
	}
	
	@Override
	public ReviewVO reviewEdit(String reviewuid) throws Exception {
		return dao.reviewEdit(reviewuid);
	}
	
	@Override
	public void reviewEditPost(ReviewVO vo) throws Exception {
		dao.reviewEditPost(vo);
	}
	
	@Override
	public List<ReviewVO> reviewSlide() throws Exception {
		return dao.reviewSlide();
	}
}
