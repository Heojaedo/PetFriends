<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>

<style>
	.table_post { /* 포스트 테이블 */
		width:1000px;
		height:200px;
		border:1px solid #e3e3e3;
	}
	
	.table_post:hover {
		cursor:pointer;
	}
	
	.post_title { /* 제목 */
		font-size:20px;
		font-weight:bold;
	}
	
	.post_price {
		color:#ff7e00;
		font-size:18px;
		font-weight:bold;
	}
	
	.table_search {
		border:0px;
		margin-top:40px;
	}
	
	.input_pay {
		width:100px;
		height:30px;
	}
	
	.input_site {
		padding:5px;
		width:500px;
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
function post_click(uid) {
	location.href="/list/detail?no="+uid;
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
						<form method="GET">
						<table class="table_search">
							<tr>
								<td width=70px>이용요금</td>
								<td width=450px>
									<input class="input_pay" name="payMin" value="${search.payMin}">원 ~ <input class="input_pay" name="payMax" value="${search.payMax}">원
								</td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td>지역</td>
								<td>
									<input class="input_site" name="site" value="${search.site}" placeholder="예) 동래구, 해운대구, 미남역">
								</td>
							</tr>
							<tr>
								<td><div style="height:20px;"></div></td>
							</tr>
							<tr>
								<td colspan=2 align=center>
									<input class="btn_form" type="submit" value="찾기">
									<input class="btn_form2" type="button" value="초기화" onclick="location.href='/list'">
								</td>
							</tr>
						</table>
						</form>
					</td>
				</tr>
				<tr>
					<td align=center>
						<table style="margin-top:40px;margin-bottom:40px;width:1200px;border:0px;">
							<tr>
								<td align=center>
									<c:set var="number" value="${list.size()}" />
									<c:forEach var="list" items="${list}" varStatus="status">
										<table class="table_post" onclick="post_click(${list.uid})">
											<tr>
												<td rowspan=3 style="width:300px;height:240px;">
													<div class="bxSlider">
														<c:forEach var="file" items="${list.list}">
															<img src="/postupload/${file.filename}" style="width:300px;height:240px;object-fit:cover;">
														</c:forEach>
													</div>
												</td>
												<td colspan=2 style="height:100px;text-indent:10px;"><span class="post_title">${list.title}</span></td>
											</tr>
											<tr>
												<td colspan=2 style="height:70px;text-indent:10px;">
													<img src="/upload/${list.photo}" width=60> ${list.petsittername}
												</td>
											</tr>
											<tr style="height:70px;text-indent:10px;background-color:#faeee0;">
												<td><span class="post_price"><fmt:formatNumber value="${list.price}" />원</span></td>
												<td align=right>
													<c:if test="${list.reviewCount != '0'}">
														<span style="font-weight:bold;">고객후기 ${list.reviewCount}개</span>&nbsp;&nbsp;&nbsp;
													</c:if>
												</td>
											</tr>
										</table>
										<c:choose>
											<c:when test="${status.last}">
											
											</c:when>
											<c:otherwise>
												<div style="height:20px;"></div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
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