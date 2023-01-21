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
								<td align=center><span style="font-size:20px;font-weight:bold;">결제 내역</span></td>
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
														<td style="padding:5px;background-color:#DCDCDC;"><span style="font-size:15px;font-weight:bold;">결제 번호</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td style="padding:5px;">${payment.payuid}</td>
													</tr>
													<tr>
														<td><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td style="padding:5px;background-color:#DCDCDC;"><span style="font-size:15px;font-weight:bold;">요금</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td style="padding:5px;"><fmt:formatNumber value="${payment.price}" />원</td>
													</tr>
													<tr>
														<td><hr style="background:#767676;height:1px;border:0"></td>
													</tr>
													<tr>
														<td style="padding:5px;background-color:#DCDCDC;"><span style="font-size:15px;font-weight:bold;">결제 날짜</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td style="padding:5px;">${payment.paydate}</td>
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
									<input class="btn_form" type="button" value="확인" onclick="location.href='/member/reserve/detail?no=${no}'">
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