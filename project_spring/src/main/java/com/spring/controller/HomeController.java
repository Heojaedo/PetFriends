package com.spring.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.Criteria;
import com.spring.domain.PageMaker;
import com.spring.domain.PaymentVO;
import com.spring.domain.ReviewVO;
import com.spring.service.ReviewService;

@Controller
public class HomeController {
	
	@Inject
	private ReviewService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception {
		model.addAttribute("review", service.reviewSlide());
		
		return "index";
	}
	
	@GetMapping("/description")
	public String description() {
		return "description";
	}
	
	@GetMapping("/review")
	public String review(Model model, Criteria cri) throws Exception {
		//리뷰 - 전체 리스트
		//model.addAttribute("review", service.reviewList());
		
		logger.info(""+cri.toString());
		
		if(cri.getSearch() == null) {
			//리뷰 - 전체 리뷰 수
			model.addAttribute("count", service.reviewCount());
			
			//리뷰 - 페이징 리스트
			model.addAttribute("cri", cri);
			model.addAttribute("list", service.reviewPagingList(cri));
			model.addAttribute("pageMaker", new PageMaker(cri, service.reviewCount()));
			logger.info(new PageMaker(cri, service.reviewCount()).toString());
			
			return "review";
		} else {
			//리뷰 - 검색 리뷰 수
			model.addAttribute("count", service.searchCount(cri));
			
			//리뷰 - 검색 페이징 리스트
			model.addAttribute("cri", cri);
			model.addAttribute("list", service.reviewSearchPaging(cri));
			model.addAttribute("pageMaker", new PageMaker(cri, service.searchCount(cri)));
			logger.info(new PageMaker(cri, service.reviewCount()).toString());
			
			return "review";
		}
	}
}
