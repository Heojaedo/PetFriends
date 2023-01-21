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
<body>
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
								<td align=center>
									<table class="table_mymenu" width=360px>
										<tr>
											<td width=120px>
												<a href="/member/reserve">예약내역</a>
											</td>
											<td width=120px style="background-color:#eba070">
												<a href="/member/mypet"><span style="color:#ffffff">반려동물 카드</span></a>
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
								<td align=center><span style="font-size:20px;font-weight:bold;">반려동물카드</span></td>
							</tr>
							<tr>
								<td><div style="height:30px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<table style="width:500px;border:0px;">
										<tr>
											<td align=center>
												<!-- 현재년도 -->
												<c:set var="now" value="<%=new java.util.Date()%>" />
												<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
												<c:forEach var="mypet" items="${mypet}" varStatus="status">
													<table style="width:450px;border:0px;font-size:15px;">
														<tr>
															<td colspan=2><div style="height:10px;"></div></td>
														</tr>
														<tr>
															<td rowspan=2 style="padding:5px;">
																<c:choose>
																	<c:when test="${mypet.type == 'dog' && mypet.photo == ''}">
																		<img src="/image/dogPhoto.png" style="width:100px;height:80px;object-fit:cover;border-radius:3px;">
																	</c:when>
																	<c:when test="${mypet.type == 'cat' && mypet.photo == ''}">
																		<img src="/image/catPhoto.png" style="width:100px;height:80px;object-fit:cover;border-radius:3px;">
																	</c:when>
																	<c:otherwise>
																		<img src="/upload/${mypet.photo}" style="width:100px;height:80px;object-fit:cover;border-radius:3px;">
																	</c:otherwise>
																</c:choose>
															</td>
															<td style="width:320px;text-indent:5px;">${mypet.petname} / ${mypet.breed} / ${mypet.sex} / ${sysYear - mypet.year + 1}살 / ${mypet.weight}kg</td>
														</tr>
														<tr>
															<td style="text-indent:5px;"><a style="color:#eba070;text-decoration:none;" href="/member/pet/view?no=${mypet.petuid}">자세히 보기</a> <span style="color:#767676;">|</span> <a style="color:#eba070;text-decoration:none;" href="/member/pet/edit?no=${mypet.petuid}">수정하기</a> <span style="color:#767676;">|</span> <span style="color:#eba070;cursor:pointer;" onclick="petDelete(${mypet.petuid})">삭제하기</span></td>
														</tr>
														<tr>
															<td colspan=2><div style="height:10px;"></div></td>
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
									</table>
								</td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<button class="btn_form" onclick="location.href='/member/pet'">반려동물 등록</button>
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
</body>
</html>

<%@ include file="/include/footer.jsp" %>