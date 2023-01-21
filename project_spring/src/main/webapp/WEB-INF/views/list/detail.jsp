<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>

<link rel="stylesheet" href="/css/bxSlider.css"/>
<link rel="stylesheet" href="/css/datepicker.css"/>

<style>
	.post_table { /* 위아래 간격 띄우기 */
		margin-top:40px;
		margin-bottom:40px;
		width:1200px;
		border:0px;
	}
	
	.table_detail {
		float:left;
	}
	
	.table_date {
		float:right;
		width:390px;
		border:0px;
	}
	
	.datepicker { /* 날짜 input 스타일 */
		width:120px;
		height:30px;
		text-indent:5px;
		font-family: 'NEXON Lv2 Gothic';
	}
	
	.span_price {
		color:#ff7e00;
		font-size:18px;
		font-weight:bold;
	}
	
	.btn_form { /* 예약하기 버튼 */
	    width:90%;
	    height:35px;
	    border:0px;
	    background-color:#eba070;
	    color:#ffffff;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:16px;
	    cursor:pointer;
	}
	
	.table_calendar { /* 예약 가능일 달력 테이블 */
		margin-top:30px;
	}
</style>

<script>
$(document).ready(function () {
	$("#start").datepicker({
		dateFormat:'yy-mm-dd', //input에 입력되는 날짜 형식
		showOtherMonths:true, //이전달, 다음달 날짜 표시
		showMonthAfterYear:true, //년, 월 순서
		yearSuffix:"년",
		nextText:"다음달",
		prevText:"이전달",
		monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNamesMin:["일","월","화","수","목","금","토"],
		dayNames:["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		minDate:0,
		maxDate:"+2m",
		beforeShowDay:disableAllTheseDays,
		onClose:function(selectedDate) {
			$("#end").datepicker("option","minDate",selectedDate);
		}
	});
	$("#end").datepicker({
		dateFormat:'yy-mm-dd', //input에 입력되는 날짜 형식
		showOtherMonths:true, //이전달, 다음달 날짜 표시
		showMonthAfterYear:true, //년, 월 순서
		yearSuffix:"년",
		nextText:"다음달",
		prevText:"이전달",
		monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNamesMin:["일","월","화","수","목","금","토"],
		dayNames:["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		maxDate:"+3m",
		beforeShowDay:disableAllTheseDays,
		onClose:function(selectedDate) {
			$("#start").datepicker("option","maxDate",selectedDate);
		}
	});
	
	$("#calendar").datepicker({
		dateFormat:'yy-mm-dd', //input에 입력되는 날짜 형식
		showOtherMonths:true, //이전달, 다음달 날짜 표시
		showMonthAfterYear:true, //년, 월 순서
		yearSuffix:"년",
		nextText:"다음달",
		prevText:"이전달",
		monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNamesMin:["일","월","화","수","목","금","토"],
		dayNames:["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		minDate:0,
		maxDate:"+3m",
		beforeShowDay:disableAllTheseDays
	});
	
	$("#start").on("change", function () {
		$("#end").attr("disabled", false);
	});
	
	$("#end").on("change", function () {
		var end = $("#end").val();
		var start = $("#start").val();
		
		var enddate = end.split("-");
		var startdate = start.split("-");
		
		var checkout = new Date(enddate[0],enddate[1],enddate[2]);
		var checkin = new Date(startdate[0],startdate[1],startdate[2]);
		
		var btMs = checkout.getTime() - checkin.getTime();
		var btDay = btMs / (1000*60*60*24); //일수 차이
		
		console.log("일수 차이는?" + btDay);
		
		var price = ${petsitter.price} * $("input[name=pet]:checked").length;
		
		$("#price").empty();
		$("#price").append($.number(price * (btDay+1)) + "원");
		
		$("input[name=price]").attr("value", price * (btDay+1));
	});
});

function check(uid) {
	var end = $("#end").val();
	var start = $("#start").val();
	
	var enddate = end.split("-");
	var startdate = start.split("-");
	
	var checkout = new Date(enddate[0],enddate[1],enddate[2]);
	var checkin = new Date(startdate[0],startdate[1],startdate[2]);
	
	var btMs = checkout.getTime() - checkin.getTime();
	var btDay = btMs / (1000*60*60*24); //일수 차이
	
	var price = ${petsitter.price} * $("input[name=pet]:checked").length;
	
	$("#price").empty();
	$("#price").append($.number(price * (btDay+1)) + "원");
	
	$("input[name=price]").attr("value", price * (btDay+1));
}

function reserve() {
	if($("input[name=pet]:checked").length == 0) {
		alert("맡기실 반려동물을 선택해주세요.");
		return false;
	}
	if(start.value == "") {
		alert("예약날짜는 필수 항목입니다.");
		return false;
	}
	if(end.value == "") {
		alert("예약날짜는 필수 항목입니다.");
		return false;
	}
}

var dateString = "${dateString}";

const dateArr = dateString.split(",");

for(i=0;i<dateArr.length;i++) {
	//alert(dateArr[i]);
}

//alert(dateArr);
//console.log(Array.isArray(dateArr));

//제외할 날짜
var disabledDays = dateArr;

//alert(disabledDays);
//console.log(Array.isArray(disabledDays));

//alert(disabledDays.length);

function disableAllTheseDays(date) {
	var y = date.getFullYear();
	var m = date.getMonth();
	var d = date.getDate();
	
	for(i=0;i<disabledDays.length;i++) {
		if($.inArray(y + "-" + (m+1) + "-" + d,disabledDays) != -1) {
			return [false];
		}
	}
	return [true];
}
</script>

</head>
<body>
<table width=100%>
	<tr>
		<td align=center>
			<table style="width:1200px;border:0px;">
				<tr>
					<td align=center>
						<table class="post_table">
							<tr>
								<td>
									<table class="table_detail" style="width:790px;border:0px;">
										<tr>
											<td align=center>
												<div class="bxSlider">
													<c:forEach var="image" items="${image}">
														<div><img src="/postupload/${image.filename}" style="width:750px;height:500px;border-radius:5px;object-fit:contain;"></div>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td>
												<table style="width:100%;border:0px;">
													<tr>
														<td rowspan=3 width=100px><img src="/upload/${petsitter.photo}" width=80></td>
														<td><span style="font-size:18px;font-weight:bold;">${petsitter.title}</span></td>
													</tr>
													<tr>
														<td>${petsitter.petsittername} <span style="font-size:13px;">${petsitter.addr}</span></td>
													</tr>
													<tr>
														<td><a href="/list/detail/petsitter?no=${no}"><span style="font-size:13px;">펫시터 프로필 보기</span></a></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td><hr style="background:#767676;height:1px;border:0"></td>
										</tr>
										<tr>
											<td><span style="font-weight:bold;">돌봄환경</span></td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td>
												<table>
													<tr>
														<td style="width:190px;height:35px;background-color:#f7f7f7">돌봄공간</td>
														<td width=190px align=right>${petsitter.op1}</td>
														<td width=30px></td>
														<td style="width:190px;height:35px;background-color:#f7f7f7">12세 이하 아동</td>
														<td width=190px align=right>${petsitter.op2}</td>
													</tr>
													<tr>
														<td style="width:190px;height:35px;background-color:#f7f7f7">동거 반려동물</td>
														<td width=190px align=right>${petsitter.op3}</td>
														<td width=30px></td>
														<td style="width:190px;height:35px;background-color:#f7f7f7">반려견 펜스</td>
														<td width=190px align=right>${petsitter.op4}</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td><hr style="background:#767676;height:1px;border:0"></td>
										</tr>
										<tr>
											<td><span style="font-weight:bold;">이용금액 (하루)</span></td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td><fmt:formatNumber value="${petsitter.price}" />원</td>
										</tr>
										<tr>
											<td><hr style="background:#767676;height:1px;border:0"></td>
										</tr>
										<tr>
											<td><span style="font-weight:bold;">${petsitter.petsittername} 펫시터 반려동물 소개</span></td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td>
												<c:choose>
													<c:when test="${petsitter_pet.size() == 0}">
														지금은 같이 지내는 반려동물이 없어요.
													</c:when>
													<c:otherwise>
														<!-- 현재년도 -->
														<c:set var="now" value="<%=new java.util.Date()%>" />
														<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
														<c:forEach var="pp" items="${petsitter_pet}" varStatus="status">
															<table style="width:790px;border:0px;font-size:13px;">
																<tr>
																	<td rowspan=3 width=90px;><img src="/upload/${pp.photo}" style="width:70px;height:60px;object-fit:cover;border-radius:3px;"></td>
																	<td>${pp.petname}</td>
																</tr>
																<tr>
																	<td>${pp.breed} / ${pp.sex} / ${sysYear - pp.year + 1}살 / ${pp.weight}kg</td>
																</tr>
																<tr>
																	<td><a href="/list/detail/pet?no=${pp.petuid}&post=${no}">상세보기</a></td>
																</tr>
																<c:choose>
																	<c:when test="${status.last}">
																	
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td colspan=3><hr style="background:#767676;height:1px;border:0"></td>
																		</tr>
																	</c:otherwise>
																</c:choose>
															</table>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td><hr style="background:#767676;height:1px;border:0"></td>
										</tr>
										<tr>
											<td><span style="font-weight:bold;">고객후기</span></td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td>
												<c:choose>
													<c:when test="${review.size() == 0}">
														첫 후기를 작성해주세요 !
													</c:when>
													<c:otherwise>
														<!-- 현재년도 -->
														<c:set var="now" value="<%=new java.util.Date()%>" />
														<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
														<c:forEach var="re" items="${review}" varStatus="status">
															<table style="width:790px;border:0px;font-size:13px;">
																<tr>
																	<td><span style="font-size:16px;font-weight:bold;">${re.title}</span></td>
																</tr>
																<tr>
																	<td><div style="height:20px;"></div></td>
																</tr>
																<tr>
																	<td>${re.username}</td>
																</tr>
																<c:choose>
																	<c:when test="${status.last}">
																	
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td colspan=3><hr style="background:#767676;height:1px;border:0"></td>
																		</tr>
																	</c:otherwise>
																</c:choose>
															</table>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td align=right><a href="/review?search=${petsitter.petsittername}"><span style="color:#e27830;font-size:13px;font-weight:bold;">후기보러가기</span></a></td>
										</tr>
									</table>
									<table class="table_date">
										<tr>
											<td>
												<form method="post" onsubmit="return reserve()">
												<input type="hidden" name="userid" value="${sessionScope.id}">
												<input type="hidden" name="petsitter" value="${petsitter.petsitterid}">
												<input type="hidden" name="price" value="">
												
												<table style="width:390px;border:1px solid #e3e3e3;">
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td align=center><span style="font-weight:bold;">예약을 원하는 날짜와 시간을 선택하세요!</span></td>
													</tr>
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td align=center>
															<input class="datepicker" name="checkindate" id="start" placeholder="시작날짜" readonly> ~ 
															<input class="datepicker" name="checkoutdate" id="end" placeholder="마침날짜" readonly disabled>
														</td>
													</tr>
													<tr>
														<td align=center><hr style="width:350px;background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=center>하루케어 / <span class="span_price"><fmt:formatNumber value="${petsitter.price}" />원</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=center><hr style="width:350px;background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td align=center><span style="font-weight:bold;">맡기실 반려견 선택하기</span></td>
													</tr>
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td align=center>
															<table style="border:0px;">
																<tr>
																	<td>
																		<!-- 현재년도 -->
																		<c:set var="now" value="<%=new java.util.Date()%>" />
																		<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
																		<c:forEach var="pet" items="${pet}" varStatus="status">
																			<table style="width:350px;border:0px;font-size:13px;">
																				<tr>
																					<td style="padding:5px;">
																						<input type="checkbox" name="pet" value="${pet.petuid}" onclick="check(${pet.petuid})">
																					</td>
																					<td style="padding:5px;">
																						<c:choose>
																							<c:when test="${pet.type == 'dog' && pet.photo == ''}">
																								<img src="/image/dogPhoto.png" style="width:70px;height:60px;object-fit:cover;border-radius:3px;">
																							</c:when>
																							<c:when test="${pet.type == 'cat' && pet.photo == ''}">
																								<img src="/image/catPhoto.png" style="width:70px;height:60px;object-fit:cover;border-radius:3px;">
																							</c:when>
																							<c:otherwise>
																								<img src="/upload/${pet.photo}" style="width:70px;height:60px;object-fit:cover;border-radius:3px;">
																							</c:otherwise>
																						</c:choose>
																					</td>
																					<td style="width:300px;text-indent:5px;">
																						${pet.petname} / ${pet.breed} / ${pet.sex} / ${sysYear - pet.year + 1}살 / ${pet.weight}kg
																					</td>
																				</tr>
																				<c:choose>
																					<c:when test="${status.last}">
																					
																					</c:when>
																					<c:otherwise>
																						<tr>
																							<td colspan=3><hr style="background:#767676;height:1px;border:0"></td>
																						</tr>
																					</c:otherwise>
																				</c:choose>
																			</table>
																		</c:forEach>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td align=center>
															<table style="width:350px;border:0px;">
																<tr>
																	<td width=100px></td>
																	<td width=140px align=right><span style="font-weight:bold;">총 합계</span></td>
																	<td width=110px align=right><span style="font-weight:bold;"><span id="price">0원</span></span></td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td><div style="height:40px;"></div></td>
													</tr>
													<tr>
														<td align=center>
															<c:choose>
																<c:when test="${pet.size() > 0}">
																	<input class="btn_form" type="submit" value="예약하기">
																</c:when>
																<c:otherwise>
																	<input class="btn_form" type="button" value="반려견을 먼저 등록하세요" onclick="location.href='/member/mypet'">
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
												</table>
												</form>
												<table class="table_calendar" style="width:390px;border:1px solid #e3e3e3;">
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td align=center><span style="font-weight:bold;">예약가능일</span></td>
													</tr>
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td align=center><div id="calendar"></div></td>
													</tr>
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>

<%@ include file="/include/footer.jsp" %>