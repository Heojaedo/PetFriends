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
function resize(e) {
	var imgWidth = $(e).prop("naturalWidth");
	var imgHeight = $(e).prop("naturalHeight");
	
	if(imgWidth < imgHeight) {
		$(e).css({
			width:"auto",
			height:"60px"
		})
	} else {
		$(e).css({
			width:"60px",
			height:"auto"
		})
	}
}

if(${sessionScope.role != '관리자'}) {
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
												<a href="/admin/petsitter"><span style="color:#ffffff">펫시터 지원자</span></a>
											</td>
											<td width=120px>
												<a href="/admin/petsitter/list">펫시터 리스트</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center><span style="font-size:20px;font-weight:bold;">펫시터 지원자</span></td>
							</tr>
							<tr>
								<td><div style="height:30px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<table style="width:500px;border:0px;">
										<tr>
											<td align=center>${count}건의 펫시터 지원이 있습니다.</td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td align=center>
												<!-- 현재년도 -->
												<c:set var="now" value="<%=new java.util.Date()%>" />
												<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
												<c:forEach var="list" items="${petsitter}" varStatus="status">
													<table style="width:300px;border:0px;font-size:15px;">
														<tr>
															<td rowspan=2 style="width:70px;padding:5px;"><img src="/upload/${list.photo}" style="border-radius:3px;" onload="resize(this)"></td>
															<td style="width:70px;padding:5px;"><a href="/admin/petsitter/view?no=${list.uid}">${list.username}</a></td>
															<td style="width:160px;padding:5px;">|&nbsp;&nbsp;&nbsp;&nbsp;010-${fn:substring(list.phone,0,4)}-${fn:substring(list.phone,4,8)}</td>
														</tr>
														<tr>
															<td colspan=2 style="padding:5px;">지원 날짜 : ${fn:substring(list.appdate,0,10)}</td>
														</tr>
														<c:choose>
															<c:when test="${status.last}">
															
															</c:when>
															<c:otherwise>
																<tr>
																	<td colspan=3><hr style="background:#DCDCDC;height:1px;border:0"></td>
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