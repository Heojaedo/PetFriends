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
	
	.table_search {
		border:0px;
	}
	
	.input_site {
		padding:5px;
		width:150px;
		height:30px;
	}
	
	.btn_form { /* 회원가입 버튼 */
	    width:100px;
	    height:30px;
	    border:0px;
	    background-color:#eba070;
	    color:#ffffff;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:16px;
	    cursor:pointer;
	}
	
	.btn_form2 { /* 회원가입 버튼 */
	    width:100px;
	    height:30px;
	    border:1px solid #eba070;
	    background-color:#ffffff;
	    color:#eba070;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:16px;
	    cursor:pointer;
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
											<td width=120px>
												<a href="/admin/petsitter">펫시터 지원자</a>
											</td>
											<td width=120px style="background-color:#eba070">
												<a href="/admin/petsitter/list"><span style="color:#ffffff">펫시터 리스트</span></a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center><span style="font-size:20px;font-weight:bold;">펫시터 리스트</span></td>
							</tr>
							<tr>
								<td><div style="height:30px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<form method="GET">
									<table class="table_search">
										<tr>
											<td style="padding:5px;"><span style="font-weight:bold;">펫시터 이름</span></td>
											<td>
												<input class="input_site" name="search" value="${search}">
											</td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td colspan=2 align=center>
												<input class="btn_form" type="submit" value="찾기">
												<input class="btn_form2" type="button" value="초기화" onclick="location.href='/admin/petsitter/list'">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><div style="height:30px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<table style="width:500px;border:0px;">
										<tr>
											<td align=center>${count}명의 펫시터가 있습니다.</td>
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
															<td colspan=2 style="padding:5px;">승인 날짜 : ${fn:substring(list.permitdate,0,10)}</td>
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