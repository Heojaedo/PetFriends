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

import com.spring.domain.PetVO;
import com.spring.domain.PushVO;
import com.spring.domain.ReservationVO;
import com.spring.domain.ReserveCriteria;
import com.spring.domain.ReservePageMaker;
import com.spring.service.PetsitterService;

@Controller
@RequestMapping("/petsitter/")
public class PetsitterController {

	private static final Logger logger = LoggerFactory.getLogger(PetsitterController.class);
	
	@Inject
	private PetsitterService service;
	
	@GetMapping("reserve")
	public void reserve(HttpSession session, Model model, ReserveCriteria cri) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		cri.setUserid(session_id);
		
		//예약 목록 넘버링
		model.addAttribute("count", service.count(session_id));
		
		//예약 목록
		model.addAttribute("cri", cri);
		model.addAttribute("reserve", service.reservePagingList(cri));
		model.addAttribute("pageMaker", new ReservePageMaker(cri, service.count(session_id)));
	}
	
	@GetMapping("/reserve/detail")
	public void detail(String no, Model model) throws Exception {
		String reservetime = service.reserveTime(no).getReservedate();
		String petsitter = service.reserveTime(no).getPetsitter();
		
		model.addAttribute("re", service.reserveTime(no));
		
		//예약회원
		model.addAttribute("member", service.member(no));
		
		//반려동물 리스트
		model.addAttribute("pet", service.reservePet(reservetime));
	}
	
	@PostMapping("/reserve/detail")
	public String reservePermit(String uid, RedirectAttributes rttr) throws Exception {
		//예약 시간 불러오기
		String reservetime = service.reserveTime(uid).getReservedate();
		
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		//예약 승인 - 상태 변경, 승인 시간 추가
		ReservationVO vo = new ReservationVO();
		vo.setReservedate(reservetime);
		vo.setPermitdate(signdate);
		service.reservePermit(vo);
		
		//승인 메세지 보내기
		//PushVO vo = new PushVO();
		//vo.setUserid(service.member(uid).getUserid());
		//vo.setText("예약이 승인되었습니다. 결제 페이지로 이동합니다.");
		//vo.setPushtime(signdate);
		//vo.setStatus("");
		//service.reservePush(vo);
		
		rttr.addFlashAttribute("text", "예약이 승인되었습니다.");
		
		return "redirect:/petsitter/reserve";
	}
	
	@GetMapping("/reserve/detail/pet")
	public void reserveDetailPet(String no, Model model) throws Exception {
		PetVO rs = service.detailPet(no);
		
		model.addAttribute("vo", rs);
	}
}
