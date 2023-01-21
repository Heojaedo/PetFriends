<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>

<link rel="stylesheet" href="/css/join.css"/>

<style>
	.table_mymenu { /* 메뉴 테이블 스타일 */
		border-collapse:collapse;
		border:1px solid #DCDCDC;
		font-size:16px;
		text-align:center;
	}
	
	.table_mymenu td {
		border-collapse:collapse;
		border:1px solid #DCDCDC;
		padding:10px;
	}
	
	.table_reserve {
		border:1px solid black;
	}
	
	.table_reserve th {
		border:1px solid black;
		background-color:#ffe8d0;
		padding:5px;
	}
	
	.table_reserve td {
		border:1px solid black;
		padding:5px;
	}
	
	.btn_form { /* 버튼 */
	    width:150px;
	    height:35px;
	    border:0px;
	    background-color:#eba070;
	    color:#ffffff;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:16px;
	    cursor:pointer;
	}
	
	.btn_form2 { /* 버튼 */
	    width:150px;
	    height:35px;
	    border:1px solid #eba070;
	    background-color:#ffffff;
	    color:#eba070;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:16px;
	    cursor:pointer;
	}
</style>

<script>
var IMP = window.IMP;   // 생략 가능
IMP.init("imp85828767"); // 예: imp00000000

function pay() {
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card',
	    merchant_uid: new Date().getTime()+'_'+${pay.uid}, // 상점에서 관리하는 주문 번호
	    name : '펫프렌즈:결제테스트',
	    amount : ${pay.price}
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		url: "/member/reserve/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid,
		    		reserveuid: ${pay.uid},
		    		payuid: new Date().getTime()+'_'+${pay.uid},
		    		userid : '${sessionScope.id}',
		    		price : ${pay.price}
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		},
				success:function(data) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n결제 번호 : ' + data.payuid;
	    			msg += '\n결제 금액 : ' + $.number(data.price) + '원';
	    			msg += '\n결제 일시 : ' + data.paydate;
	    			
	    			alert(msg);
	    			
	    			location.href="/member/reserve";
				},
				error:function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}

if(${sessionScope.id == null}) {
	alert("로그인 후 이용하세요.");
	location.href="/member/login";
}
</script>

</head>
<table width=100%>
	<tr>
		<td align=center>
			<table style="width:1200px;border:0px;">
				<tr>
					<td align=center>
						<table class="table_join_form" style="width:600px;border:1px solid #e3e3e3;">
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center><span style="font-size:20px;font-weight:bold;">결제하기</span></td>
							</tr>
							<tr>
								<td><div style="height:30px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<table style="width:450px;border:1px solid #9da0a2;">
										<tr>
											<td align=center>
												<table style="width:400px;border:0px;">
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td align=center>
															<table style="width:400px;border:0px;">
																<tr>
																	<td align=center>
																		<table style="width:200px;border:0px;border-right:1px solid #DCDCDC;float:left;">
																			<tr>
																				<td align=center><span style="font-size:15px;font-weight:bold;">맡기실 반려견 정보</span></td>
																			</tr>
																			<tr>
																				<td><hr style="background:#767676;height:1px;border:0"></td>
																			</tr>
																			<tr>
																				<td align=center>
																					<!-- 현재년도 -->
																					<c:set var="now" value="<%=new java.util.Date()%>" />
																					<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
																					<c:forEach var="pet" items="${pet}" varStatus="status">
																						<table style="width:198px;border:0px;">
																							<tr>
																								<td align=center><img src="/upload/${pet.photo}" style="width:100px;height:80px;object-fit:cover;border-radius:3px;"></td>
																							</tr>
																							<tr>
																								<td><div style="height:10px;"></div></td>
																							</tr>
																							<tr>
																								<td align=center>${pet.petname}</td>
																							</tr>
																							<tr>
																								<td><div style="height:10px;"></div></td>
																							</tr>
																							<tr>
																								<td align=center>${pet.breed} / ${pet.sex} / ${sysYear - pet.year + 1}살 / ${pet.weight}kg</td>
																							</tr>
																							<c:choose>
																								<c:when test="${status.last}">
																								
																								</c:when>
																								<c:otherwise>
																									<tr>
																										<td><hr style="background:#767676;height:1px;border:0"></td>
																									</tr>
																								</c:otherwise>
																							</c:choose>
																						</table>
																					</c:forEach>
																				</td>
																			</tr>
																		</table>
																		<table style="width:200px;border:0px;float:right;">
																			<tr>
																				<td align=center><span style="font-size:15px;font-weight:bold;">펫시터 정보</span></td>
																			</tr>
																			<tr>
																				<td><hr style="background:#767676;height:1px;border:0"></td>
																			</tr>
																			<tr>
																				<td align=center><img src="/upload/${pay.photo}" style="width:100px;height:80px;object-fit:cover;border-radius:3px;"></td>
																			</tr>
																			<tr>
																				<td><div style="height:10px;"></div></td>
																			</tr>
																			<tr>
																				<td align=center>${pay.username}</td>
																			</tr>
																			<tr>
																				<td><div style="height:10px;"></div></td>
																			</tr>
																			<tr>
																				<td align=center>${pay.addr}</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td style="padding:5px;background-color:#DCDCDC;"><span style="font-size:15px;font-weight:bold;">예약 정보</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td style="padding:5px;">체크인</td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td style="padding:5px;">${pay.checkindate}</td>
													</tr>
													<tr>
														<td><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td style="padding:5px;">체크아웃</td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td style="padding:5px;">${pay.checkoutdate}</td>
													</tr>
													<tr>
														<td><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td style="padding:5px;background-color:#DCDCDC;"><span style="font-size:15px;font-weight:bold;">결제 정보</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td style="padding:5px;">결제 금액</td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td style="padding:5px;"><fmt:formatNumber value="${pay.price}" />원</td>
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
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<input class="btn_form" type="button" value="결제하기" onclick="pay()">
									<input class="btn_form2" type="button" value="취소" onclick="location.href='/member/reserve'">
								</td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</html>

<%@ include file="/include/footer.jsp" %>