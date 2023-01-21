package com.spring.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.controller.ListController;
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
import com.spring.domain.UploadFileDTO;
import com.spring.domain.UploadVO;
import com.spring.dto.SearchDTO;
import com.spring.domain.Post_ProfileVO;

@Repository
public class ListDAOIm implements ListDAO {

	@Inject
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	private static final String namespace = "com.spring.mapper.ListMapper";
	
	@Override
	public List<Post_ProfileVO> list() throws Exception {
		List<Post_ProfileVO> list = session.selectList(namespace+".list");
		
		for(Post_ProfileVO vo : list) {
			//logger.info("postuid : "+vo.getUid());
			List<UploadFileDTO> uploadlist = session.selectList(namespace+".uploadlist", vo.getUid());
			//logger.info("filename"+uploadlist);
			vo.setList(uploadlist);
			vo.setReviewCount(session.selectOne(namespace+".reviewCount", vo.getPetsittername()));
		}
		
		return list;
	}
	
	@Override
	public List<Post_ProfileVO> listSearch(SearchDTO dto) throws Exception {
		List<Post_ProfileVO> list = session.selectList(namespace+".listSearch", dto);
		
		for(Post_ProfileVO vo : list) {
			//logger.info("postuid : "+vo.getUid());
			List<UploadFileDTO> uploadlist = session.selectList(namespace+".uploadlist", vo.getUid());
			//logger.info("filename"+uploadlist);
			vo.setList(uploadlist);
		}
		return list;
	}
	
	@Override
	public List<Post_ProfileVO> listSearch2(SearchDTO dto) throws Exception {
		List<Post_ProfileVO> list = session.selectList(namespace+".listSearch2", dto);
		
		for(Post_ProfileVO vo : list) {
			//logger.info("postuid : "+vo.getUid());
			List<UploadFileDTO> uploadlist = session.selectList(namespace+".uploadlist", vo.getUid());
			//logger.info("filename"+uploadlist);
			vo.setList(uploadlist);
		}
		return list;
	}
	
	@Override
	public List<UploadVO> postImage(String postuid) throws Exception {
		return session.selectList(namespace+".postImage", postuid);
	}
	
	@Override
	public Post_PetsitterVO postView(String postuid) throws Exception {
		return session.selectOne(namespace+".postView", postuid);
	}
	
	@Override
	public Post_PetsitterVO petsitterView(String postuid) throws Exception {
		return session.selectOne(namespace+".petsitterView", postuid);
	}
	
	@Override
	public PetVO petsitterPetView(String petuid) throws Exception {
		return session.selectOne(namespace+".petsitterPetView", petuid);
	}
	
	@Override
	public List<Post_PetsitterPetVO> petsitterPet(String postuid) throws Exception {
		return session.selectList(namespace+".petsitterPet", postuid);
	}
	
	@Override
	public List<ReviewVO> petsitterReview(String petsitter) throws Exception {
		return session.selectList(namespace+".petsitterReview", petsitter);
	}
	
	@Override
	public List<PetVO> pet(String session_id) throws Exception {
		return session.selectList(namespace+".pet", session_id);
	}
	
	@Override
	public List<ReservationVO> dateCheck(String postuid) throws Exception {
		return session.selectList(namespace+".dateCheck", postuid);
	}
	
	@Override
	public int petsitterPost(String session_id) throws Exception {
		return session.selectOne(namespace+".postCheck", session_id);
	}
	
	@Override
	public MemberVO petsitterInfo(String session_id) throws Exception {
		return session.selectOne(namespace+".info", session_id);
	}
	
	@Override
	public Post_EditVO postEdit(String session_id) throws Exception {
		return session.selectOne(namespace+".postEdit", session_id);
	}
	
	@Override
	public List<UploadVO> postImage(int postuid) throws Exception {
		return session.selectList(namespace+".postImage", postuid);
	}
	
	@Override
	public void profile(ProfileVO pf) throws Exception {
		session.insert(namespace+".profile", pf);
	}
	
	@Override
	public void profileEdit(ProfileVO pf) throws Exception {
		session.update(namespace+".profileEdit", pf);
	}
	
	@Override
	public void post(PostVO p) throws Exception {
		session.insert(namespace+".post", p);
	}
	
	@Override
	public void postUpdate(PostVO p) throws Exception {
		session.update(namespace+".postUpdate", p);
	}
	
	@Override
	public void delFile(String filename) throws Exception {
		session.update(namespace+".delFile", filename);
	}
	
	@Override
	public void profileDelete(String session_id) throws Exception {
		session.delete(namespace+".profileDelete", session_id);
	}
	
	@Override
	public void postDelete(String uid) throws Exception {
		session.delete(namespace+".postDelete", uid);
	}
	
	@Override
	public void upload(HashMap<String, Object> hm) throws Exception {
		session.insert(namespace+".upload", hm);
	}
	
	@Override
	public void reserve(ReservationVO vo) throws Exception {
		session.insert(namespace+".reserve", vo);
	}
	
	@Override
	public void pushReserve(PushVO p) throws Exception {
		session.insert(namespace+".pushReserve", p);
	}
	
	@Override
	public ReservationVO reviewInfo(String uid) throws Exception {
		return session.selectOne(namespace+".reviewInfo", uid);
	}
	
	@Override
	public MemberVO petsitterName(String petsitter) throws Exception {
		return session.selectOne(namespace+".petsitterName", petsitter);
	}
	
	@Override
	public void review(ReviewVO vo) throws Exception {
		session.insert(namespace+".review", vo);
	}
	
	@Override
	public void reviewFileUpload(HashMap<String, Object> hm) throws Exception {
		session.insert(namespace+".reviewFile", hm);
	}
}
