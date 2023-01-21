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
	
	.btn {
	    width:100px;
	    height:35px;
	    border:1px solid #eba070;
	    background-color:#ffffff;
	    color:#eba070;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:16px;
	    font-weight:bold;
	    cursor:pointer;
	}
	
	.btn:hover {
		color:#eba070;
	}
</style>

<script>
function petDelete(uid) {
	if(confirm("삭제하시겠습니까?")) {
		location.href="/member/pet/delete?no="+uid;
	} else {
		return false;
	}
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
						<form action="/member/reserve/pay" method="get">
						<input type="hidden" name="no" value="${no}">
						<table class="table_join_form" style="width:600px;border:1px solid #e3e3e3;">
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<table class="table_mymenu" width=360px>
										<tr>
											<td width=120px style="background-color:#eba070">
												<a href="/member/reserve"><span style="color:#ffffff">예약내역</span></a>
											</td>
											<td width=120px>
												<a href="/member/mypet">반려동물 카드</a>
											</td>
											<td width=120px>
												<a href="/member/edit">회원정보수정</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center><span style="font-size:20px;font-weight:bold;">예약내역</span></td>
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
														<td colspan=2><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td colspan=2><span style="font-size:15px;font-weight:bold;">예약일시</span></td>
													</tr>
													<tr>
														<td colspan=2><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td colspan=2>${re.reservedate}</td>
													</tr>
													<tr>
														<td colspan=2><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td colspan=2><span style="font-size:15px;font-weight:bold;">펫시터</span></td>
													</tr>
													<tr>
														<td colspan=2><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td colspan=2 align=center>
															<table style="width:400px;border:0px;">
																<tr>
																	<td width=130px rowspan=2><img src="/upload/${petsitter.photo}" style="width:120px;height:80px;object-fit:cover;border-radius:3px;"></td>
																	<td style="text-indent:5px;">${petsitter.username}</td>
																</tr>
																<tr>
																	<td style="text-indent:5px;"><a href="/member/reserve/detail/petsitter?no=${no}">펫시터 프로필 보기</a></td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td colspan=2><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td colspan=2><span style="font-size:15px;font-weight:bold;">예약날짜</span></td>
													</tr>
													<tr>
														<td colspan=2><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td colspan=2>${re.checkindate} ~ ${re.checkoutdate}</td>
													</tr>
													<tr>
														<td colspan=2><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td colspan=2><span style="font-size:15px;font-weight:bold;">예약 반려동물</span></td>
													</tr>
													<tr>
														<td colspan=2><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td colspan=2 align=center>
															<c:forEach var="pet" items="${pet}" varStatus="status">
																<table style="width:400px;border:0px;">
																	<tr>
																		<td width=110px><img src="/upload/${pet.photo}" style="width:100px;height:80px;object-fit:cover;border-radius:3px;"></td>
																		<td style="text-indent:5px;">${pet.petname}</td>
																	</tr>
																	<c:choose>
																		<c:when test="${status.last}">
																		
																		</c:when>
																		<c:otherwise>
																			<tr>
																				<td colspan=2><hr style="background:#767676;height:1px;border:0"></td>
																			</tr>
																		</c:otherwise>
																	</c:choose>
																</table>
															</c:forEach>
														</td>
													</tr>
													<tr>
														<td colspan=2><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td colspan=2><span style="font-size:15px;font-weight:bold;">요금</span></td>
													</tr>
													<tr>
														<td colspan=2><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td colspan=2>
															<fmt:formatNumber value="${re.price}" />원
															&nbsp;&nbsp;
															<c:if test="${re.status == '결제 완료' || re.status == '완료'}">
																<a href="/member/payment?no=${no}">결제 내역 보기</a>
															</c:if>
														</td>
													</tr>
													<tr>
														<td colspan=2><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td colspan=2><span style="font-size:15px;font-weight:bold;">상태</span></td>
													</tr>
													<tr>
														<td colspan=2><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td>
															<c:if test="${re.status == '예약'}"><span style="color:#ff8000">${re.status}</span></c:if>
															<c:if test="${re.status == '결제 대기'}"><span style="color:#009500">${re.status}</span></c:if>
															<c:if test="${re.status == '결제 완료'}"><span style="color:#000095">${re.status}</span></c:if>
															<c:if test="${re.status == '완료'}"><span style="color:#000000">${re.status}</span></c:if>
															<c:if test="${re.status == '예약 취소'}"><span style="color:#b70048">${re.status}</span></c:if>
														</td>
														<td align=right>
															<c:if test="${re.status == '결제 완료'}"><input type="button" class="btn" value="돌봄완료" onclick="location.href='/member/reserve/check?no=${no}'"></c:if>
														</td>
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
									<input class="btn_form" type="button" value="확인" onclick="location.href='/member/reserve'">
									<c:if test="${re.status == '결제 대기'}"><input class="btn_form2" type="submit" value="결제하기"></c:if>
									<c:if test="${re.status == '완료'}"><input class="btn_form2" type="button" value="후기쓰러가기" onclick="location.href='/list/detail/review?no=${re.petsitter}'"></c:if>
								</td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
						</table>
						</form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</html>

<%@ include file="/include/footer.jsp" %>