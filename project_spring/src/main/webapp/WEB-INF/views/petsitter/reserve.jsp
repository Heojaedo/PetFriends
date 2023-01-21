<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>

<link rel="stylesheet" href="/css/join.css"/>
<link rel="stylesheet" href="/css/page.css"/>

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
		border:1px solid #9da0a2;
	}
	
	.table_reserve th {
		border:1px solid #9da0a2;
		background-color:#ffe8d0;
		padding:5px;
		text-align:center;
	}
	
	.table_reserve td {
		border:1px solid #9da0a2;
		padding:5px;
	}
</style>

<script>
if(${sessionScope.role != '펫시터'}) {
	alert("권한이 없습니다.");
	location.href="/";
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
									<table style="width:500px;border:0px;">
										<tr>
											<td align=center>
												<c:choose>
													<c:when test="${reserve.size() == 0}">
														내역이 없습니다.
													</c:when>
													<c:otherwise>
														<table class="table_reserve">
															<tr>
																<th width=50px>No</th>
																<th width=100px>예약회원</th>
																<th width=150px>예약일</th>
																<th width=100px>상태</th>
																<th width=100px>비고</th>
															</tr>
														<c:set var="num" value="${count}" />
														<c:forEach var="re" items="${reserve}" varStatus="status">
															<tr>
																<td align=center>${num}</td>
																<td align=center>${re.username}</td>
																<td align=center>${fn:substring(re.reservedate,0,10)}</td>
																<td align=center>
																	<c:if test="${re.status == '예약'}"><span style="color:#ff8000">${re.status}</span></c:if>
																	<c:if test="${re.status == '결제 대기'}"><span style="color:#009500">${re.status}</span></c:if>
																	<c:if test="${re.status == '결제 완료'}"><span style="color:#000095">${re.status}</span></c:if>
																	<c:if test="${re.status == '완료'}"><span style="color:#000000">${re.status}</span></c:if>
																	<c:if test="${re.status == '예약 취소'}"><span style="color:#b70048">${re.status}</span></c:if>
																</td>
																<td align=center><a href="/petsitter/reserve/detail?no=${re.uid}">상세보기</a></td>
															</tr>
														<c:set var="num" value="${num-1}" />
														</c:forEach>
														</table>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<c:if test="${count != 0}">
							<tr>
								<td>
									<nav aria-label="Page navigation example">
									  <ul class="pagination justify-content-center">
									  	<c:if test="${pageMaker.prev}">
									    <li class="page-item">
									      <a class="page-link" href="/petsitter/reserve?page=${pageMaker.startPage - 1}" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									    </c:if>
									    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									    <li class="page-item ${num}"><a class="page-link" href="/petsitter/reserve?page=${num}">${num}</a></li>
									    </c:forEach>
									    <c:if test="${pageMaker.next}">
									    <li class="page-item">
									      <a class="page-link" href="/petsitter/reserve?page=${pageMaker.endPage + 1}" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									    </c:if>
									  </ul>
									</nav>
								</td>
							</tr>
							</c:if>
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