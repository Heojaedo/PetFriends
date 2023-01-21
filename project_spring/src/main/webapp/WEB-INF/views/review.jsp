<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>

<link rel="stylesheet" href="/css/page.css"/>

<style>
	.table_review {
		margin-top:40px;
		margin-bottom:40px;
	}
	
	.table_review a {
		color:#000000;
	}
	
	.review_title {
		font-size:28px;
		font-weight:bold;
		color:#e27830;
	}
	
	.review {
		color:#736659;
	}
	
	.table_search {
		border:0px;
		margin-top:40px;
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
$(document).ready(function () {
	$(".${cri.page}").addClass("active");
});
</script>

</head>
<body>
<table width=100% border=0>
	<tr>
		<td align=center>
			<table class="table_review" style="width:1200px;border:0px;">
				<tr>
					<td align=center>
						<span class="review_title">VOICE</span>
					</td>
				</tr>
				<tr>
					<td align=center>
						<form method="GET">
						<table class="table_search">
							<tr>
								<td style="padding:5px;"><span style="font-weight:bold;">펫시터 이름</span></td>
								<td>
									<input class="input_site" name="search" value="${cri.search}">
								</td>
							</tr>
							<tr>
								<td><div style="height:20px;"></div></td>
							</tr>
							<tr>
								<td colspan=2 align=center>
									<input class="btn_form" type="submit" value="찾기">
									<input class="btn_form2" type="button" value="초기화" onclick="location.href='/review'">
								</td>
							</tr>
						</table>
						</form>
					</td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:1000px;border:0px;">
							<tr>
								<td><div style="height:30px;"></div></td>
							</tr>
							<tr>
								<td>
									<span style="font-size:17px;font-weight:bold;">이용후기</span> <span style="font-size:13px;">${count}</span>
								</td>
							</tr>
							<tr>
								<td><div style="height:20px;"></div></td>
							</tr>
							<tr>
								<td><hr style="background:#767676;height:1px;border:0"></td>
							</tr>
							<c:forEach var="list" items="${list}" varStatus="status">
							<table class="review" style="width:1000px;border:0px;">
								<tr>
									<c:if test="${list.preview != null}">
										<td rowspan=2 style="width:100px;text-align:center;">
											<img src="${list.preview}" style="width:80px;height:50px;object-fit:cover;">
										</td>
									</c:if>
									<td style="padding:5px;">
										<a href="/review/detail?no=${list.reviewuid}&page=${cri.page}"><span style="font-size:15px;font-weight:bold;">${list.title}</span></a>
									</td>
								</tr>
								<tr>
									<td style="padding:5px;">
										<span style="font-weight:bold;">${list.username}</span> ${fn:substring(list.reviewdate,0,10)} <span style="font-weight:bold;">조회수</span> ${list.hit}
									</td>
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
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						  	<c:if test="${pageMaker.prev}">
						    <li class="page-item">
						      <a class="page-link" href="/review?search=${cri.search}&page=${pageMaker.startPage - 1}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    </c:if>
						    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						    <li class="page-item ${num}"><a class="page-link" href="/review?search=${cri.search}&page=${num}">${num}</a></li>
						    </c:forEach>
						    <c:if test="${pageMaker.next}">
						    <li class="page-item">
						      <a class="page-link" href="/review?search=${cri.search}&page=${pageMaker.endPage + 1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						    </c:if>
						  </ul>
						</nav>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>

<%@ include file="/include/footer.jsp" %>