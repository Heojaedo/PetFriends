package com.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.Petsitter_MemberVO;
import com.spring.domain.PushVO;
import com.spring.dto.PetsitterPermitDTO;
import com.spring.service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
	@GetMapping("petsitter")
	public void petsitter(Model model) throws Exception {
		model.addAttribute("count", service.count());
		model.addAttribute("petsitter", service.petsitter());
	}
	
	@GetMapping("petsitter/view")
	public void petsitterView(String no, Model model) throws Exception {
		Petsitter_MemberVO vo = service.petsitterView(no);
		
		vo.setIntroduce(vo.getIntroduce().replace("<br>", "\r\n"));
		
		model.addAttribute("petsitter", vo);
	}
	
	@PostMapping("petsitter/view")
	public String petsitterPermit(String userid, RedirectAttributes rttr) throws Exception {
		//회원 테이블 역할 업데이트
		service.petsitterPermit(userid);
		
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		//펫시터 테이블 상태, 승인 시간 업데이트
		PetsitterPermitDTO dto = new PetsitterPermitDTO();
		dto.setUserid(userid);
		dto.setPermitdate(signdate);
		service.petsitterPermit2(dto);
		
		//펫시터 승인 완료 메세지 보내기
		PushVO vo = new PushVO();
		vo.setUserid(userid);
		vo.setText("펫시터가 되신 것을 축하합니다 !");
		vo.setPushtime(signdate);
		vo.setStatus("");
		service.petsitterMsg(vo);
		
		rttr.addFlashAttribute("text", "펫시터 지원이 승인되었습니다.");
		
		return "redirect:/admin/petsitter";
	}
	
	@GetMapping("petsitter/list")
	public void petsitterList(String search, Model model) throws Exception {
		if(search == null) {
			
			model.addAttribute("count", service.petsitterCount());
			model.addAttribute("petsitter", service.petsitterList());
			
		} else if(search != null && search.equals("")) {
			
			model.addAttribute("count", service.petsitterCount());
			model.addAttribute("petsitter", service.petsitterList());
			
		} else if(search != null && !search.equals("")){
			
			model.addAttribute("search", search);
			model.addAttribute("count", service.petsitterSearchCount(search));
			model.addAttribute("petsitter", service.petsitterSearchList(search));
			
		}
	}
}
