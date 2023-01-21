package com.spring.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.PetVO;
import com.spring.domain.PostVO;
import com.spring.domain.Post_EditVO;
import com.spring.domain.ProfileVO;
import com.spring.domain.ReservationVO;
import com.spring.domain.ReviewVO;
import com.spring.dto.SearchDTO;
import com.spring.service.ListService;

@Controller
@RequestMapping("/list")
public class ListController {

	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Inject
	private ListService service;
	
	@GetMapping()
	public String List(String payMin, String payMax, String site, Model model) throws Exception {
		//리스트
		if(payMin == null && payMax == null && site == null) {
			model.addAttribute("list", service.list());
		} else {
			String strPayMin = "";
			String strPayMax = "";
			
			SearchDTO dto = new SearchDTO();
			
			if(payMin != null) {
				strPayMin = payMin;
			}
			
			if(payMax != null) {
				strPayMax = payMax;
			}
			
			if(strPayMin.equals("") && strPayMax.equals("")) {
				dto.setSite(site);
				//logger.info("==금액 검색 안함=="+dto.toString());
				model.addAttribute("search", dto);
				model.addAttribute("list", service.listSearch2(dto));
			} else {
				dto.setPayMin(strPayMin);
				dto.setPayMax(strPayMax);
				dto.setSite(site);
				//logger.info("==금액 검색 포함=="+dto.toString());
				model.addAttribute("search", dto);
				model.addAttribute("list", service.listSearch(dto));
			}
		}
		
		return "/list/petsitter";
	}
	
	@PostMapping("/thumb")
	@ResponseBody
	public void listThumb(String postuid) throws Exception {
		logger.info(""+postuid);
	}
	
	@GetMapping("/detail")
	public void Detail(String no, HttpSession session, Model model) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		//포스트 번호
		model.addAttribute("no", no);
		
		//View 페이지 - 업로드 이미지
		model.addAttribute("image", service.postImage(no));
		
		//View 페이지 - 펫시터 정보
		model.addAttribute("petsitter", service.postView(no));
		
		//View 페이지 - 펫시터 반려동물 불러오기
		model.addAttribute("petsitter_pet", service.petsitterPet(no));
		
		//View 페이지 - 펫시터 리뷰
		String petsitter = service.petsitterView(no).getPetsitterid();
		model.addAttribute("review", service.petsitterReview(petsitter));
		
		//View 페이지 - 사용자 반려동물 리스트
		model.addAttribute("pet", service.pet(session_id));
		
		//예약가능일 조회하기
		Set<ReservationVO> list = new HashSet<ReservationVO>();
		
		list.addAll(service.dateCheck(no));
		
		Object[] date = list.toArray();
		
		ArrayList<String> dateArray = new ArrayList<String>();
				
		for(ReservationVO vo : list) {
			//System.out.println("체크인:"+vo.getCheckindate());
			//System.out.println("체크아웃:"+vo.getCheckoutdate());
			
			ArrayList<String> dates = dateBetween(vo.getCheckindate(), vo.getCheckoutdate());
			
			//System.out.println("==결과:"+dates);
			
			dateArray.addAll(dates);
		}
		
		String dateString = String.join(",", dateArray);
		
		//System.out.println("변환전:"+dateArray);
		//System.out.println("변환후:"+dateString);
		
		model.addAttribute("dateArray", dateArray);
		model.addAttribute("dateString", dateString);
	}
	
	public ArrayList<String> dateBetween(String checkindate, String checkoutdate) throws Exception {
		final String Date_Pattern = "yyyy-M-d";
		String sd = checkindate;
		String ed = checkoutdate;
		
		SimpleDateFormat sdf = new SimpleDateFormat(Date_Pattern);
		Date startDate = sdf.parse(sd);
		Date endDate = sdf.parse(ed);
		
		ArrayList<String> dates = new ArrayList<String>();
		
		Date currentDate = startDate;
		
		while (currentDate.compareTo(endDate) <= 0) {
			dates.add(sdf.format(currentDate));
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		
		for(String date : dates) {
			//System.out.println("사이날짜:"+date);
		}
		
		return dates;
	}
	
	@PostMapping("/detail")
	public String Reservation(ReservationVO vo, RedirectAttributes rttr) throws Exception {
		//int checkinYear = Integer.parseInt(vo.getCheckindate().substring(0, 4));
		//int checkinMonth = Integer.parseInt(vo.getCheckindate().substring(5, 7));
		//int checkinDay = Integer.parseInt(vo.getCheckindate().substring(8, 10));
		//int checkoutYear = Integer.parseInt(vo.getCheckoutdate().substring(0, 4));
		//int checkoutMonth = Integer.parseInt(vo.getCheckoutdate().substring(5, 7));
		//int checkoutDay = Integer.parseInt(vo.getCheckoutdate().substring(8, 10));
		
		//String checkinDate = checkinYear+"-"+checkinMonth+"-"+checkinDay;
		//String checkoutDate = checkoutYear+"-"+checkoutMonth+"-"+checkoutDay;
		
		//vo.setCheckindate(checkinDate);
		//vo.setCheckoutdate(checkoutDate);
		
		logger.info("=========="+vo.toString());
		
		//예약 날짜
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		vo.setReservedate(signdate);
		vo.setStatus("예약");
		
		String[] pet = vo.getPet().split(",");
		
		for(int i=0;i<pet.length;i++) {
			vo.setPet(pet[i]);
			
			//예약하기
			service.reserve(vo);
		}
		
		//예약 알림 보내기
		//PushVO p = new PushVO();
		//p.setUserid(vo.getPetsitter());
		//p.setText("예약이 있습니다.");
		//p.setPushtime(signdate);
		//p.setStatus("");
		//service.pushReserve(p);

		rttr.addFlashAttribute("text", "예약되었습니다.");
		
		return "redirect:/member/reserve";
	}
	
	@GetMapping("/detail/petsitter")
	public void petsitterView(String no, Model model) throws Exception {
		model.addAttribute("no", no);
		model.addAttribute("petsitter", service.petsitterView(no));
	}
	
	@GetMapping("/detail/pet")
	public void petsitterPetView(String no, String post, Model model) throws Exception {
		PetVO rs = service.petsitterPetView(no);
		
		model.addAttribute("post", post);
		model.addAttribute("vo", rs);
	}
	
	@GetMapping("/detail/review")
	public void reserveReview(String no, Model model) throws Exception {
		model.addAttribute("petsitter", no);
		model.addAttribute("petsittername", service.petsitterName(no));
	}
	
	@PostMapping("/detail/review")
	public String reserveReviewPost(ReviewVO vo) throws Exception {
		logger.info(""+vo.toString());
		
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		
		String contents = vo.getContents();
		
		Matcher match = pattern.matcher(contents);
		
		String filename = null;
		
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		vo.setHit(0);
		vo.setReviewdate(signdate);
		
		int reviewuid = vo.getReviewuid();
		
		if(match.find()) {
			filename = match.group(1);
			
			logger.info("==대표 이미지=="+filename);
		}
		
		vo.setPreview(filename);
		service.review(vo);
		
		return "redirect:/review";
	}
	
	@PostMapping("/detail/review/imgUpload")
	@ResponseBody
	public ModelAndView image(MultipartHttpServletRequest mhsq) throws Exception {
		//logger.info("이미지 업로드");
		
		//등록 날짜
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		ModelAndView mav = new ModelAndView("jsonView");
		
		String uploadfolder = "C:\\jsp_project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project_spring\\resources\\reviewupload\\";
		
		File file = new File(uploadfolder);
		
		if(!file.isDirectory()) {
			file.mkdirs();
		}
		
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = mhsq.getFiles("upload");
		
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			
		} else {
			for(int i=0;i<mf.size();i++) {
				//원래 파일명
				String original = mf.get(i).getOriginalFilename();
				
				//파일명 중복처리
				SimpleDateFormat sd2 = new SimpleDateFormat("yyyyMMddHHmmss");
				String signdate2 = sd2.format(today);
				
				//저장되는 파일명
				String filename = signdate2 + "_" + original;
				
				//파일 경로
				String savepath = uploadfolder + filename;
				
				//파일 상대 경로
				String path = "/reviewupload/" + filename;
				
				//파일 사이즈
				long filesize = mf.get(i).getSize();
				
				//파일 업로드 폴더에 저장
				mf.get(i).transferTo(new File(savepath));
				
				mav.addObject("uploaded", true);
				mav.addObject("url", path);
				
				//System.out.println(mav);
			}
		}
		
		return mav;
	}
	
	@GetMapping("/post")
	public String Post(HttpSession session, Model model) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		//등록된 포스트 체크
		int count = service.petsitterPost(session_id);
		
		if(count == 0) {
			model.addAttribute("info", service.petsitterInfo(session_id));
			
			return "/list/post";
		} else {
			return "redirect:/list/post/edit";
		}
	}
	
	@PostMapping("/post")
	public String PostInsert(ProfileVO pf, PostVO p, MultipartHttpServletRequest mhsq) throws Exception {
		//등록 날짜
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		//프로필 업로드
		pf.setIntroduce(pf.getIntroduce().replace("\r\n","<br>"));
		pf.setRegidate(signdate);
		
		service.profile(pf);
		
		//포스트 업로드
		p.setRegidate(signdate);
		service.post(p);
		
		//포스트 번호
		int postuid = p.getUid();
		
		String uploadfolder = "C:\\jsp_project\\project_spring\\src\\main\\webapp\\resources\\postupload\\";
		
		File dir = new File(uploadfolder);
		
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = mhsq.getFiles("file");
		
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			
		} else {
			for(int i=0;i<mf.size();i++) {
				//원래 파일명
				String original = mf.get(i).getOriginalFilename();
				
				//파일명 중복 처리
				SimpleDateFormat sd2 = new SimpleDateFormat("yyyyMMddHHmmss");
				String signdate2 = sd2.format(today);
				
				//저장되는 파일명
				String filename = signdate2 + "_" + original;
				
				//파일 경로
				String savepath = uploadfolder + filename;
				
				//파일 사이즈
				long filesize = mf.get(i).getSize();
				
				//파일 업로드 폴더에 저장
				mf.get(i).transferTo(new File(savepath));
				
				fileUpload(postuid, original, filename, filesize, signdate);
			}
		}
		
		return "redirect:/list";
	}
	
	@GetMapping("/post/edit")
	public void postEdit(HttpSession session, Model model) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		Post_EditVO vo = service.postEdit(session_id);
		vo.setIntroduce(vo.getIntroduce().replace("<br>", "\r\n"));
		model.addAttribute("post", vo);
		
		int postuid = service.postEdit(session_id).getUid();
		model.addAttribute("file", service.postImage(postuid));
	}
	
	@PostMapping("/post/edit")
	public String postEditPost(ProfileVO pf, PostVO p, MultipartHttpServletRequest mhsq) throws Exception {
		//등록 날짜
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
		//프로필 업로드
		pf.setIntroduce(pf.getIntroduce().replace("\r\n","<br>"));
		service.profileEdit(pf);
		
		//포스트 업로드
		p.setEditdate(signdate);
		service.postUpdate(p);
		
		//포스트 번호
		int postuid = p.getUid();
		
		String uploadfolder = "C:\\jsp_project\\project_spring\\src\\main\\webapp\\resources\\postupload\\";
		
		File dir = new File(uploadfolder);
		
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = mhsq.getFiles("file");
		
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			
		} else {
			for(int i=0;i<mf.size();i++) {
				//원래 파일명
				String original = mf.get(i).getOriginalFilename();
				
				//파일명 중복 처리
				SimpleDateFormat sd2 = new SimpleDateFormat("yyyyMMddHHmmss");
				String signdate2 = sd2.format(today);
				
				//저장되는 파일명
				String filename = signdate2 + "_" + original;
				
				//파일 경로
				String savepath = uploadfolder + filename;
				
				//파일 사이즈
				long filesize = mf.get(i).getSize();
				
				//파일 업로드 폴더에 저장
				mf.get(i).transferTo(new File(savepath));
				
				fileUpload(postuid, original, filename, filesize, signdate);
			}
		}
		
		return "redirect:/list";
	}
	
	@PostMapping("/post/delfile")
	@ResponseBody
	public void delFile(String filenum) throws Exception {
		//logger.info(filenum);
		
		service.delFile(filenum);
	}
	
	@GetMapping("/post/delete")
	public String postDelete(HttpSession session, String no, RedirectAttributes rttr) throws Exception {
		String session_id = (String)session.getAttribute("id");
		
		//프로필 삭제
		service.profileDelete(session_id);
		
		//포스트 삭제
		service.postDelete(no);
		
		rttr.addFlashAttribute("text", "포스트가 삭제되었습니다.");
		
		return "redirect:/petsitter/reserve";
	}
	
	//파일 데이터베이스 업로드
	public void fileUpload(int postuid, String original, String filename, long filesize, String signdate) throws Exception {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("postuid", postuid);
		hm.put("original", original);
		hm.put("filename", filename);
		hm.put("filesize", filesize);
		hm.put("uploadtime", signdate);
		
		service.upload(hm);
	}
}
