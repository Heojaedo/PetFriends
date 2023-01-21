package com.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.Criteria;
import com.spring.domain.ReviewVO;
import com.spring.dto.ReviewDTO;
import com.spring.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Inject
	private ReviewService service;
	
	@GetMapping("/detail")
	public void reviewDetail(String no, String page, Model model) throws Exception {
		ReviewVO vo = service.reviewInfo(no);
		
		//조회수 +1
		service.reviewHitUp(vo);
		
		model.addAttribute("page", page);
		model.addAttribute("review", service.reviewDetail(no));
		model.addAttribute("user", service.reviewUser(vo.getUserid()));
		model.addAttribute("petsitter", service.reviewPetsitter(vo.getReviewuid()));
		model.addAttribute("post", service.postUid(service.reviewPetsitter(vo.getReviewuid()).getPetsitter()));
		//logger.info(service.reviewPetsitter(vo.getReviewuid()).toString());
	}
	
	@GetMapping("/detail/petsitter")
	public void reviewDetailPetsitter(String no, String page, Model model) throws Exception {
		model.addAttribute("reviewUid", no);
		model.addAttribute("page", page);
		model.addAttribute("petsitter", service.reviewDetailPetsitter(no));
	}
	
	@GetMapping("/delete")
	public String reviewDelete(String no, HttpSession session, RedirectAttributes rttr) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		ReviewVO vo = service.reviewDetail(no);
		
		if(session_id.equals(vo.getUserid())) {
			service.reviewDelete(no);
			
			rttr.addFlashAttribute("text", "삭제되었습니다.");
		} else {
			rttr.addFlashAttribute("text", "권한이 없습니다.");
		}
		
		return "redirect:/review";
	}
	
	@GetMapping("/edit")
	public String reviewEdit(String no, String page, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		ReviewVO vo = service.reviewDetail(no);
		
		if(session_id.equals(vo.getUserid())) {
			model.addAttribute("no", no);
			model.addAttribute("page", page);
			model.addAttribute("review", service.reviewEdit(no));
			
			return "/review/edit";
		} else {
			rttr.addFlashAttribute("text", "권한이 없습니다.");
			
			return "redirect:/review?no="+no+"&page="+page;
		}
	}
	
	@PostMapping("/edit")
	public String reviewEditPost(ReviewVO vo, String page, RedirectAttributes rttr) throws Exception {
		//logger.info(""+vo.toString());
		
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		//vo.setHit(0);
		//vo.setReviewdate(signdate);
		service.reviewEditPost(vo);
		
		rttr.addFlashAttribute("text", "수정되었습니다.");
		
		return "redirect:/review?page"+page;
	}
}
