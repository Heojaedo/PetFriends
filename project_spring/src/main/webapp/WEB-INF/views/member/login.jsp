<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>

<link rel="stylesheet" href="/css/join.css"/>

<script>
$(document).ready(function () {
	$("#userid").focus();
});
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
								<td align=center><span style="font-size:20px;font-weight:bold;">로그인</span></td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<form method="post">
									<table style="width:300px;border:0px;">
										<tr>
											<td><label for="userid"><span class="span_join_title">아이디</span></label></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td><input class="input_join" name="userid" id="userid" placeholder="아이디" maxlength="20"></td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td><label for="userpw"><span class="span_join_title">비밀번호</span></label></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td><input class="input_join" type="password" name="userpw" placeholder="비밀번호" maxlength="20"></td>
										</tr>
										<tr>
											<td class="td_text"><c:if test="${msg eq ''}"><span style="color:red;">아이디 또는 비밀번호를 확인해주세요.</span></c:if></td>
										</tr>
										<tr>
											<td align=center><button class="btn_form">로그인</button></td>
										</tr>
									</table>
									</form>
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