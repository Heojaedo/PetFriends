package com.spring.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.domain.PetVO;
import com.spring.domain.PostVO;
import com.spring.domain.Post_EditVO;
import com.spring.domain.Post_PetsitterPetVO;
import com.spring.domain.Post_PetsitterVO;
import com.spring.domain.ProfileVO;
import com.spring.domain.PushVO;
import com.spring.domain.ReservationVO;
import com.spring.domain.ReviewVO;
import com.spring.domain.UploadVO;
import com.spring.dto.SearchDTO;
import com.spring.domain.Post_ProfileVO;
import com.spring.persistence.ListDAO;

@Service
public class ListServiceIm implements ListService {

	@Inject
	private ListDAO dao;
	
	@Override
	public List<Post_ProfileVO> list() throws Exception {
		return dao.list();
	}
	
	@Override
	public List<Post_ProfileVO> listSearch(SearchDTO dto) throws Exception {
		return dao.listSearch(dto);
	}
	
	@Override
	public List<Post_ProfileVO> listSearch2(SearchDTO dto) throws Exception {
		return dao.listSearch2(dto);
	}
	
	@Override
	public List<UploadVO> postImage(String postuid) throws Exception {
		return dao.postImage(postuid);
	}
	
	@Override
	public Post_PetsitterVO postView(String postuid) throws Exception {
		return dao.postView(postuid);
	}
	
	@Override
	public Post_PetsitterVO petsitterView(String postuid) throws Exception {
		return dao.petsitterView(postuid);
	}
	
	@Override
	public PetVO petsitterPetView(String petuid) throws Exception {
		return dao.petsitterPetView(petuid);
	}
	
	@Override
	public List<Post_PetsitterPetVO> petsitterPet(String postuid) throws Exception {
		return dao.petsitterPet(postuid);
	}
	
	@Override
	public List<ReviewVO> petsitterReview(String petsitter) throws Exception {
		return dao.petsitterReview(petsitter);
	}
	
	@Override
	public List<PetVO> pet(String session_id) throws Exception {
		return dao.pet(session_id);
	}
	
	@Override
	public List<ReservationVO> dateCheck(String postuid) throws Exception {
		return dao.dateCheck(postuid);
	}
	
	@Override
	public int petsitterPost(String session_id) throws Exception {
		return dao.petsitterPost(session_id);
	}
	
	@Override
	public MemberVO petsitterInfo(String session_id) throws Exception {
		return dao.petsitterInfo(session_id);
	}
	
	@Override
	public Post_EditVO postEdit(String session_id) throws Exception {
		return dao.postEdit(session_id);
	}
	
	@Override
	public List<UploadVO> postImage(int postuid) throws Exception {
		return dao.postImage(postuid);
	}
	
	@Override
	public void profile(ProfileVO pf) throws Exception {
		dao.profile(pf);
	}
	
	@Override
	public void profileEdit(ProfileVO pf) throws Exception {
		dao.profileEdit(pf);
	}
	
	@Override
	public void post(PostVO p) throws Exception {
		dao.post(p);
	}
	
	@Override
	public void postUpdate(PostVO p) throws Exception {
		dao.postUpdate(p);
	}
	
	@Override
	public void delFile(String filename) throws Exception {
		dao.delFile(filename);
	}
	
	@Override
	public void profileDelete(String session_id) throws Exception {
		dao.profileDelete(session_id);
	}
	
	@Override
	public void postDelete(String uid) throws Exception {
		dao.postDelete(uid);
	}
	
	@Override
	public void upload(HashMap<String, Object> hm) throws Exception {
		dao.upload(hm);
	}
	
	@Override
	public void reserve(ReservationVO vo) throws Exception {
		dao.reserve(vo);
	}
	
	@Override
	public void pushReserve(PushVO p) throws Exception {
		dao.pushReserve(p);
	}
	
	@Override
	public ReservationVO reviewInfo(String uid) throws Exception {
		return dao.reviewInfo(uid);
	}
	
	@Override
	public MemberVO petsitterName(String petsitter) throws Exception {
		return dao.petsitterName(petsitter);
	}
	
	@Override
	public void review(ReviewVO vo) throws Exception {
		dao.review(vo);
	}
	
	@Override
	public void reviewFileUpload(HashMap<String, Object> hm) throws Exception {
		dao.reviewFileUpload(hm);
	}
}
