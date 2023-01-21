package com.spring.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.domain.PostVO;
import com.spring.domain.ReviewVO;
import com.spring.domain.Review_PetsitterVO;

@Service
public class ReviewDAOIm implements ReviewDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.spring.mapper.ReviewMapper";
	
	@Override
	public List<ReviewVO> reviewList() throws Exception {
		return session.selectList(namespace+".reviewList");
	}
	
	@Override
	public int reviewCount() throws Exception {
		return session.selectOne(namespace+".reviewCount");
	}
	
	@Override
	public int searchCount(Criteria cri) throws Exception {
		return session.selectOne(namespace+".searchCount", cri);
	}
	
	@Override
	public List<ReviewVO> reviewPagingList(Criteria cri) throws Exception {
		return session.selectList(namespace+".reviewPagingList", cri);
	}
	
	@Override
	public List<ReviewVO> reviewSearchPaging(Criteria cri) throws Exception {
		return session.selectList(namespace+".reviewSearchPaging", cri);
	}
	
	@Override
	public ReviewVO reviewInfo(String reviewuid) throws Exception {
		return session.selectOne(namespace+".reviewInfo", reviewuid);
	}
	
	@Override
	public void reviewHitUp(ReviewVO vo) throws Exception {
		session.update(namespace+".reviewHitUp", vo);
	}
	
	@Override
	public ReviewVO reviewDetail(String reviewuid) throws Exception {
		return session.selectOne(namespace+".reviewDetail", reviewuid);
	}
	
	@Override
	public MemberVO reviewUser(String userid) throws Exception {
		return session.selectOne(namespace+".reviewUser", userid);
	}
	
	@Override
	public Review_PetsitterVO reviewPetsitter(int reviewuid) throws Exception {
		return session.selectOne(namespace+".reviewPetsitter", reviewuid);
	}
	
	@Override
	public Review_PetsitterVO reviewDetailPetsitter(String reviewuid) throws Exception {
		return session.selectOne(namespace+".reviewDetailPetsitter", reviewuid);
	}
	
	@Override
	public PostVO postUid(String petsitter) throws Exception {
		return session.selectOne(namespace+".postUid", petsitter);
	}
	
	@Override
	public void reviewDelete(String reviewuid) throws Exception {
		session.delete(namespace+".reviewDelete", reviewuid);
	}
	
	@Override
	public ReviewVO reviewEdit(String reviewuid) throws Exception {
		return session.selectOne(namespace+".reviewEdit", reviewuid);
	}
	
	@Override
	public void reviewEditPost(ReviewVO vo) throws Exception {
		session.update(namespace+".reviewEditPost", vo);
	}
	
	@Override
	public List<ReviewVO> reviewSlide() throws Exception {
		return session.selectList(namespace+".reviewSlide");
	}
}
