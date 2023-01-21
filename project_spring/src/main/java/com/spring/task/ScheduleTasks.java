package com.spring.task;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.domain.PushVO;
import com.spring.domain.ReservationVO;

@Component
public class ScheduleTasks {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.spring.mapper.MemberMapper";
	
	@Scheduled(cron = "0 0/5 * * * ?")
	public void firstTask() throws Exception {
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate = sdf.format(now);
		
		System.out.println("현재시간:"+strDate);
		
		//오늘 날짜
		String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		
		//결제 대기 예약 리스트
		List<ReservationVO> paylist = session.selectList(namespace+".beforePayment");
		
		for(ReservationVO vo : paylist) {
			String permitdate = vo.getPermitdate();
			String today = strDate;
			
			//System.out.println("예약승인시각:"+permitdate);
			//System.out.println("현재시각:"+today);
			
			Date format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(permitdate);
			Date format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(today);
			
			//날짜 비교하기 (예약 승인 시간)
			long diffSec = (format2.getTime() - format1.getTime()) / 1000; //초 차이
			long diffMin = (format2.getTime() - format1.getTime()) / 60000; //분 차이
			long diffHor = (format2.getTime() - format1.getTime()) / 3600000; //시 차이
			
			//System.out.println("초차이:"+diffSec);
			//System.out.println("분차이:"+diffMin);
			//System.out.println("시차이:"+diffHor);
			
			if(diffHor >= 2) {
				System.out.println("현재시각:"+today);
				session.update(namespace+".reserveCancel", vo.getReservedate());
			} else {
				
			}
		}
		
		//yyyy-MM-dd 포맷 설정 (체크아웃 날짜 비교)
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		List<ReservationVO> list = session.selectList(namespace+".checkoutdate");
		
		for(ReservationVO vo : list) {
			//System.out.println(vo.getCheckoutdate());
			
			//비교할 date와 today를 데이터 포맷으로 변경
			Date date = new Date(dateFormat.parse(vo.getCheckoutdate()).getTime());
			Date today = new Date(dateFormat.parse(todayfm).getTime());
			
			//날짜 비교하기 (체크아웃 날짜)
			int compare = date.compareTo(today);
			
			if(compare > 0) {
				//System.out.println("===checkoutdate:안지남");
			} else if(compare < 0) {
				//System.out.println("===checkoutdate:지남");
				//session.update(namespace+".reserveComplete", vo.getReservedate());
			} else {
				//System.out.println("===checkoutdate:오늘");
			}
		}
	}
}
