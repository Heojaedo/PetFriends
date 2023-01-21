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
	
	.div_photo { /* 미리보기 이미지 박스 */
		width:200px;
		height:200px;
		position:relative;
		cursor:pointer;
	}
	
	#photo {
		width:180px;
		height:180px;
		object-fit:cover;
		border-radius:3px;
	}
	
	.div_photo > img { /* 미리보기 이미지 */
		width:auto;
		height:auto;
		margin:auto;
		max-width:100%;
		max-height:100%;
		position:absolute;
		top:0; bottom:0; left:0; right:0;
		border-radius:5px;
	}
	
	.input_pet { /* 반려동물 등록 페이지 작성란 폰트 */
		padding:5px;
		font-size:14px;
	}
	
	.select_pet { /* 반려동물 등록 페이지 select 폰트 */
		padding:5px;
		font-size:14px;
	}
	
	.textarea_pet { /* 반려동물 등록 페이지 textarea 스타일 */
		width:500px;
		height:100px;
		padding:10px;
	    font-family: 'NEXON Lv2 Gothic';
		font-size:14px;
		resize:none;
	}
</style>

<script>
function resize(e) {
	var imgWidth = $(e).prop("naturalWidth");
	var imgHeight = $(e).prop("naturalHeight");
	
	if(imgWidth < imgHeight) {
		$(e).css({
			width:"auto",
			height:"200px"
		})
	} else {
		$(e).css({
			width:"200px",
			height:"auto"
		})
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
									<table style="width:500px;border:0px;">
										<tr>
											<td align=center>
												<div class="div_photo">
													<c:choose>
														<c:when test="${vo.photo != ''}">
															<img id="photo" src="/upload/${vo.photo}" onload="resize(this)">
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${vo.type == 'dog'}">
																	<img id="photo" src="/image/dogPhoto.png">
																</c:when>
																<c:otherwise>
																	<img id="photo" src="/image/catPhoto.png">
																</c:otherwise>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</div>
											</td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td align=center>
												<!-- 현재년도 -->
												<c:set var="now" value="<%=new java.util.Date()%>" />
												<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
												<table style="width:500px;border:0px;">
													<tr>
														<td align=center><span style="font-weight:bold;">${vo.petname}</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=center>${vo.breed} / ${vo.sex} / ${sysYear - vo.year + 1}살 / ${vo.weight}kg</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<c:choose>
											<c:when test="${vo.type == 'dog'}">
												<%@ include file="/include/petdogview.jsp" %>
											</c:when>
											<c:otherwise>
												<%@ include file="/include/petcatview.jsp" %>
											</c:otherwise>
										</c:choose>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td align=center>
												<table style="width:500px;border:0px;">
													<tr>
														<td><span class="span_join_title">동물병원 정보</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=left>
															${vo.hospital} (${vo.tel1}) ${vo.tel2}-${vo.tel3} ${vo.address}
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
												<input class="btn_form" type="button" value="확인" onclick="history.back()">
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