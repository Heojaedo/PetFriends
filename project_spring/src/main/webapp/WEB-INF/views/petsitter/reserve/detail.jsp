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
	    border:0px;
	    background-color:#ffffff;
	    border:1px solid #eba070;
	    color:#eba070;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:16px;
	    cursor:pointer;
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

if(${sessionScope.role != '펫시터'}) {
	alert("권한이 없습니다.");
	location.href="/";
}
</script>

</head>
<table width=100%>
	<tr>
		<td align=center>
			<table style="width:1200px;border:0px;">
				<tr>
					<td align=center>
						<form method="post">
						<input type="hidden" name="uid" value="${re.uid}">
						<table class="table_join_form" style="width:600px;border:1px solid #e3e3e3;">
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<table class="table_mymenu" width=240px>
										<tr>
											<td width=120px style="background-color:#eba070">
												<a href="/petsitter/reserve"><span style="color:#ffffff">예약목록</span></a>
											</td>
											<td width=120px>
												<a href="/list/post">펫시터 글쓰기</a>
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
														<td><div style="height:20px;"></div></td>
													</tr>
													<tr>
														<td><span style="font-size:15px;font-weight:bold;">예약일시</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td>${re.reservedate}</td>
													</tr>
													<tr>
														<td><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td><span style="font-size:15px;font-weight:bold;">예약회원</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=center>
															<table style="width:400px;border:0px;">
																<tr>
																	<td width=130px><img src="/upload/${member.photo}" style="width:120px;height:80px;object-fit:cover;border-radius:3px;"></td>
																	<td style="text-indent:5px;">${member.username}</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td><span style="font-size:15px;font-weight:bold;">예약날짜</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td>${re.checkindate} ~ ${re.checkoutdate}</td>
													</tr>
													<tr>
														<td><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td><span style="font-size:15px;font-weight:bold;">예약 반려동물</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=center>
															<c:forEach var="pet" items="${pet}" varStatus="status">
																<table style="width:400px;border:0px;">
																	<tr>
																		<td width=110px rowspan=2><img src="/upload/${pet.photo}" style="width:100px;height:80px;object-fit:cover;border-radius:3px;"></td>
																		<td style="text-indent:5px;">${pet.petname}</td>
																	</tr>
																	<tr>
																		<td style="text-indent:5px;"><a style="color:#eba070;text-decoration:none;" href="/petsitter/reserve/detail/pet?no=${pet.petuid}">자세히 보기</a></td>
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
														<td><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td><span style="font-size:15px;font-weight:bold;">요금</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td><fmt:formatNumber value="${re.price}" />원</td>
													</tr>
													<tr>
														<td><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td><span style="font-size:15px;font-weight:bold;">상태</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td>
															<c:if test="${re.status == '예약'}"><span style="color:#ff8000">${re.status}</span></c:if>
															<c:if test="${re.status == '결제 대기'}"><span style="color:#009500">${re.status}</span></c:if>
															<c:if test="${re.status == '결제 완료'}"><span style="color:#000095">${re.status}</span></c:if>
															<c:if test="${re.status == '완료'}"><span style="color:#000000">${re.status}</span></c:if>
															<c:if test="${re.status == '예약 취소'}"><span style="color:#b70048">${re.status}</span></c:if>
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
									<input class="btn_form" type="button" value="확인" onclick="location.href='/petsitter/reserve'">
									<c:if test="${re.status == '예약'}"><input class="btn_form2" type="submit" value="승인"></c:if>
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