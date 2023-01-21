package com.spring.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.MemberVO;
import com.spring.domain.PageMaker;
import com.spring.domain.PaymentVO;
import com.spring.domain.PetVO;
import com.spring.domain.PetsitterVO;
import com.spring.domain.PushVO;
import com.spring.domain.ReserveCriteria;
import com.spring.domain.ReservePageMaker;
import com.spring.dto.LoginDTO;
import com.spring.dto.UpdateDTO;
import com.spring.persistence.MemberDAO;
import com.spring.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	
	//첨부파일 저장 경로
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@GetMapping("join")
	public void Join() throws Exception {
		
	}
	
	@PostMapping("join")
	public String JoinInsert(MemberVO vo, MultipartFile file, RedirectAttributes rttr) throws Exception {
		//회원가입 날짜
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		String filename = "";
		
		if(file.isEmpty() == true) {
			
		} else { //파일이 존재
			//파일명
			SimpleDateFormat sd2 = new SimpleDateFormat("yyyyMMddHHmmss");
			String signdate2 = sd2.format(today);
			filename = signdate2 + "_" + file.getOriginalFilename();
			
			//파일 업로드
			byte[] fileData = file.getBytes();
			File target = new File(uploadPath, filename);
			FileCopyUtils.copy(fileData, target);
		}
		
		vo.setPhoto(filename);
		vo.setJoindate(signdate);
		vo.setRole("회원");
		
		service.createMember(vo);
		
		rttr.addFlashAttribute("text", "회원가입이 완료되었습니다.");
		
		return "redirect:/";
	}
	
	@GetMapping("login")
	public void Login() throws Exception {
		
	}
	
	@PostMapping("login")
	public String LoginSelect(LoginDTO dto, RedirectAttributes rttr, HttpSession session) throws Exception {
		MemberVO rs = service.readMember(dto);
		
		if(rs == null) {
			rttr.addFlashAttribute("msg", "");
			
			return "redirect:login";
		} else {
			session.setAttribute("id", rs.getUserid());
			session.setAttribute("name", rs.getUsername());
			session.setAttribute("role", rs.getRole());
			
			PushVO vo = service.pushCheck(rs.getUserid());
			
			if(vo == null) {
				
			} else {
				//알림 상태 변경
				service.pushChange(vo.getUserid());
				
				rttr.addFlashAttribute("text", vo.getText());
			}
			
			return "redirect:/";
		}
	}
	
	@PostMapping("pushCheck")
	@ResponseBody
	public Map<String, Integer> pushCheck(String userid) throws Exception {
		//logger.info("====="+userid);
		
		int applicantsCount = 0; //펫시터 지원수
		int reserveCount = 0; //예약 갯수
		int paymentCount = 0; //결제 대기 갯수
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		if(!userid.equals("")) {
			//관리자, 펫시터, 회원 확인
			MemberVO vo = service.roleCheck(userid);
			
			if(vo.getRole().equals("관리자")) {
				//펫시터 지원수
				applicantsCount = service.petsitterCount();
				
				map.put("applicantsCount", applicantsCount);
				map.put("reserveCount", reserveCount);
				
				return map;
			} else if(vo.getRole().equals("펫시터")) {
				//예약 갯수
				reserveCount = service.petsitterReserveCount(userid);
				
				//결제 대기 갯수
				paymentCount = service.paymentCount(userid);
				
				map.put("reserveCount", reserveCount);
				map.put("paymentCount", paymentCount);
				
				logger.info(""+map);
				return map;
			} else {
				//결제 대기 갯수
				paymentCount = service.paymentCount(userid);
				
				map.put("reserveCount", reserveCount);
				map.put("paymentCount", paymentCount);
				
				return map;
			}
		} else {
			return map;
		}
	}
	
	@GetMapping("logout")
	public String Logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("edit")
	public void Edit(HttpSession session, MemberVO vo, Model model) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		MemberVO rs = service.editMember(session_id);
		
		model.addAttribute("vo", rs);
	}
	
	@PostMapping("edit")
	public String EditInsert(UpdateDTO dto, MultipartFile file, RedirectAttributes rttr) throws Exception {
		String filename = "";
		
		if(file.isEmpty() == true) {
			//파일명 불러오기
			MemberVO vo = service.editMember(dto.getUserid());
			
			filename = vo.getPhoto();
		} else { //파일이 존재
			//파일명
			Date today = new Date();
			SimpleDateFormat sd2 = new SimpleDateFormat("yyyyMMddHHmmss");
			String signdate2 = sd2.format(today);
			filename = signdate2 + "_" + file.getOriginalFilename();
			
			//파일 업로드
			byte[] fileData = file.getBytes();
			File target = new File(uploadPath, filename);
			FileCopyUtils.copy(fileData, target);
		}
		
		dto.setPhoto(filename);
		
		if(dto.getUserpw().equals("")) { //비밀번호 변경 x
			service.updateMember2(dto);
		} else { //비밀번호 변경
			service.updateMember(dto);
		}
		
		rttr.addFlashAttribute("text", "회원정보가 수정되었습니다.");
		
		return "redirect:/";
	}
	
	@GetMapping("petsitter")
	public String petsitter(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		//펫시터 중복지원 방지
		int count = service.petsitterIdCheck(session_id);
		
		if(count == 1) {
			rttr.addFlashAttribute("text", "이미 펫시터에 지원하셨습니다 !");
			
			return "redirect:/";
		} else {
			return "/member/petsitter";
		}
	}
	
	@PostMapping("petsitter")
	public String petsitterPost(HttpSession session, PetsitterVO vo, RedirectAttributes rttr) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		//신청일
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		vo.setUserid(session_id);
		vo.setIntroduce(vo.getIntroduce().replace("\r\n","<br>"));
		vo.setAppdate(signdate);
		vo.setStatus("지원");

		service.petsitter(vo);
		
		rttr.addFlashAttribute("text", "펫시터 지원 완료 !");
		
		return "redirect:/";
	}
	
	@GetMapping("mypet")
	public void MyPet(HttpSession session, Model model) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		model.addAttribute("mypet", service.mypet(session_id));
	}
	
	@GetMapping("pet")
	public void PetRegist(String type, Model model) throws Exception {
		model.addAttribute("type", type);
	}
	
	@PostMapping("pet")
	public String PetRegistInsert(String type, PetVO vo, MultipartFile file) throws Exception {
		//반려동물 등록 날짜
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		String filename = "";
		
		if(file.isEmpty() == true) {
			
		} else { //파일이 존재
			//파일명
			SimpleDateFormat sd2 = new SimpleDateFormat("yyyyMMddHHmmss");
			String signdate2 = sd2.format(today);
			filename = signdate2 + "_" + file.getOriginalFilename();
			
			//파일 업로드
			byte[] fileData = file.getBytes();
			File target = new File(uploadPath, filename);
			FileCopyUtils.copy(fileData, target);
		}
		
		vo.setPhoto(filename);
		vo.setRegidate(signdate);
		
		if(type == null) {
			vo.setType("dog");
			
			service.registPet(vo);
		} else {
			if(type.equals("2")) {
				vo.setType("cat");
				
				service.registPet(vo);
			} else {
				vo.setType("dog");
				
				service.registPet(vo);
			}
		}
		
		return "redirect:mypet";
	}
	
	@GetMapping("pet/delete")
	public String PetDelete(String no) throws Exception {
		service.deletePet(no);
		
		return "redirect:/member/mypet";
	}
	
	@GetMapping("pet/view")
	public void PetView(String no, Model model) throws Exception {
		PetVO rs = service.editPet(no);
		
		model.addAttribute("vo", rs);
	}
	
	@GetMapping("pet/edit")
	public void PetEdit(String type, String no, PetVO vo, Model model) throws Exception {
		PetVO rs = service.editPet(no);
		
		model.addAttribute("type", type);
		model.addAttribute("vo", rs);
	}
	
	@PostMapping("pet/edit")
	public String PetUpdate(String type, PetVO vo, MultipartFile file) throws Exception {
		String filename = "";
		
		if(file.isEmpty() == true) {
			//파일명 불러오기
			PetVO rs = service.editPet(String.valueOf(vo.getPetuid()));
			
			filename = rs.getPhoto();
		} else { //파일이 존재
			//파일명
			Date today = new Date();
			SimpleDateFormat sd2 = new SimpleDateFormat("yyyyMMddHHmmss");
			String signdate2 = sd2.format(today);
			filename = signdate2 + "_" + file.getOriginalFilename();
			
			//파일 업로드
			byte[] fileData = file.getBytes();
			File target = new File(uploadPath, filename);
			FileCopyUtils.copy(fileData, target);
		}
		
		vo.setPhoto(filename);
		
		if(type == null) {
			vo.setType("dog");
			
			service.updatePet(vo);
		} else {
			if(type.equals("2")) {
				vo.setType("cat");
				
				service.updatePet(vo);
			} else {
				vo.setType("dog");
				
				service.updatePet(vo);
			}
		}
		
		return "redirect:/member/mypet";
	}
	
	@GetMapping("reserve")
	public void reserveList(HttpSession session, Model model, ReserveCriteria cri) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		cri.setUserid(session_id);
		
		//예약 넘버링
		model.addAttribute("count", service.reserveCount(session_id));
		
		//logger.info(""+cri.toString());
		
		model.addAttribute("cri", cri);
		model.addAttribute("reserve", service.reservePagingList(cri));
		model.addAttribute("pageMaker", new ReservePageMaker(cri, service.reserveCount(session_id)));
	}
	
	@GetMapping("reserve/detail")
	public void reserveDetail(String no, Model model) throws Exception {
		String reservetime = service.reserveTime(no).getReservedate();
		String petsitter = service.reserveTime(no).getPetsitter();
		
		//예약 번호
		model.addAttribute("no", no);
		
		model.addAttribute("re", service.reserveTime(no));
		
		//펫시터 정보
		model.addAttribute("petsitter", service.petsitterProfile(petsitter));
		
		//반려동물 리스트
		model.addAttribute("pet", service.reservePet(reservetime));
	}
	
	@GetMapping("reserve/detail/petsitter")
	public void petsitterProfile2(String no, Model model) throws Exception {
		model.addAttribute("no", no);
		model.addAttribute("petsitter", service.petsitterProfile2(no));
	}
	
	@GetMapping("reserve/pay")
	public void reservePay(String no, Model model) throws Exception {
		model.addAttribute("pay", service.payInfo(no));
		
		String reservetime = service.reserveTime(no).getReservedate();
		
		//반려동물 리스트
		model.addAttribute("pet", service.reservePet(reservetime));
	}
	
	@PostMapping("reserve/payments/complete")
	@ResponseBody
	public PaymentVO paymentsComplete(PaymentVO vo) throws Exception {
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		vo.setPaydate(signdate);
		
		//결제 내역 저장
		service.paymentComplete(vo);
		
		//예약 시간 불러오기
		String reservetime = service.reserveTime(vo.getReserveuid()).getReservedate();
		
		//예약 테이블 결제 상태 변경
		service.statusChange(reservetime);
		
		return vo;
	}
	
	@GetMapping("reserve/check")
	public String sittingComplete(String no) throws Exception {
		String reservetime = service.reserveTime(no).getReservedate();
		
		service.sittingComplete(reservetime);
		
		return "redirect:/member/reserve/detail?no="+no;
	}
	
	@GetMapping("payment")
	public void paymentInfo(String no, Model model) throws Exception {
		model.addAttribute("no", no);
		model.addAttribute("payment", service.paymentInfo(no));
	}
	
	@PostMapping("idCheck")
	@ResponseBody
	public int idCheck(String userid) throws Exception {
		//영문, 숫자, '_' 으로만 이루어진 5~16자 아이디
		String regex = "^[a-zA-Z0-9_]{5,16}$";
		
		int count = 9;
		
		if(!Pattern.matches(regex, userid)) {
			return count;
		} else {
			count = service.idCheck(userid);
			
			return count;
		}
	}
	
	@PostMapping("pwCheck")
	@ResponseBody
	public int pwCheck(String userpw) throws Exception {
		//영문, 숫자, 특수문자로 이루어진 8~16자 비밀번호
		String regex = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{8,16}$";
		
		int count = 9;
		
		if(!Pattern.matches(regex, userpw)) {
			return count;
		} else {
			count = 0;
			
			return count;
		}
	}
	
	@PostMapping("pw2Check")
	@ResponseBody
	public int pw2Check(String userpw, String userpw2) throws Exception {
		int count = 0;
		
		if(!userpw.equals(userpw2)) {
			count = 9;
		}
		
		return count;
	}
	
	@PostMapping("nameCheck")
	@ResponseBody
	public int nameCheck(String username) throws Exception {
		//한글
		String regex = "^[가-힣]*$";
		
		int count = 9;
		
		if(!Pattern.matches(regex, username)) {
			return count;
		} else {
			count = 0;
			
			return count;
		}
	}
	
	@PostMapping("emailCheck")
	@ResponseBody
	public int emailCheck(String email) throws Exception {
		//이메일
		String regex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		
		int count = 9;
		
		if(!Pattern.matches(regex, email)) {
			return count;
		} else {
			count = service.emailCheck(email);
			
			return count;
		}
	}
	
	@PostMapping("phoneCheck")
	@ResponseBody
	public int phoneCheck(String phone) throws Exception {
		//8자리의 숫자
		String regex = "^[0-9]{8}$";
		
		int count = 9;
		
		if(!Pattern.matches(regex, phone)) {
			return count;
		} else {
			count = 0;
			
			return count;
		}
	}
	
	@PostMapping("zipCheck")
	@ResponseBody
	public int zipCheck(String zipcode, String detailaddr) throws Exception {
		int count = 0;
		
		if(zipcode.equals("")) { //우편번호 찾기 x
			return count;
		} else {
			if(detailaddr.equals("")) { //상세주소 입력 x
				count = 1;
				
				return count;
			} else {
				count = 2;
				
				return count;
			}
		}
	}
	
	@PostMapping("edit/emailCheck")
	@ResponseBody
	public int editemailCheck(String userid,String email) throws Exception {
		//이메일
		String regex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		
		int count = 9;
		
		if(!Pattern.matches(regex, email)) {
			return count; //이메일 형식 - count = 9
		} else {
			UpdateDTO dto = new UpdateDTO();
			dto.setUserid(userid);
			dto.setEmail(email);
				
			count = service.editemailCheck(dto); //아이디와 입력한 이메일 체크
			
			if(count == 1) { //원래 내 이메일일 경우
				count = 2;
				
				return count; //원래 이메일 - count = 2
			} else { //다시 중복 체크 - count = 0
				count = service.editemailCheck2(email);
				
				if(count == 1) {
					return count; //중복된 이메일 - count = 1
				} else {
					return count; //사용 가능한 이메일 - count = 0
				}
			}
		}
	}
}
