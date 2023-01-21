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
	.textarea_pet { /* 반려동물 등록 페이지 textarea 스타일 */
		width:500px;
		height:100px;
		padding:10px;
	    font-family: 'NEXON Lv2 Gothic';
		font-size:14px;
		resize:none;
	}
	
	.btn_permit { /* 승인 버튼 */
	    width:110px;
	    height:35px;
	    border:0px;
	    background-color:#eba070;
	    color:#ffffff;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:16px;
	    cursor:pointer;
	}
	
	.btn_list { /* 목록 버튼 */
	    width:110px;
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
								<td align=center><span style="font-size:20px;font-weight:bold;">펫시터 지원자</span></td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<table style="width:500px;border:0px;">
										<tr>
											<td align=center>
												<table style="width:500px;border:0px;">
													<tr>
														<td width=100px><span class="span_join_title">이름</span></td>
														<td>${petsitter.username}</td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td width=100px><span class="span_join_title">휴대폰번호</span></td>
														<td>010-${fn:substring(petsitter.phone,0,4)}-${fn:substring(petsitter.phone,4,8)}</td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
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
														<td><span class="span_join_title">1. 자기소개를 적어주세요.</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td>
															<textarea class="textarea_pet" name="introduce" id="introduce" readonly>${petsitter.introduce}</textarea>
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
														<td><span class="span_join_title">2. 지금 살고 있는 집의 종류를 알려주세요.</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=left>
															<input type="radio" checked> ${petsitter.q1}
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
														<td><span class="span_join_title">3. 함께 거주하고 있는 12세 미만의 아동이 있나요?</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=left>
															<input type="radio" checked> ${petsitter.q2}
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
														<td><span class="span_join_title">4. 자택 실내에서 흡연을 하는 가족이나 동거인이 있나요?</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=left>
															<input type="radio" checked> ${petsitter.q3}
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
														<td><span class="span_join_title">5. 펫시터로 활동한 경험이 있나요?</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=left>
															<input type="radio" checked> ${petsitter.q4}
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
														<td><span class="span_join_title">6. 동물병원이나 애견 호텔, 펫샵 등 반려동물 관련 업종 경력이 있나요?</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=left>
															<input type="radio" checked> ${petsitter.q5}
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
														<td><span class="span_join_title">7. 현재 반려견을 키우고 있거나 혹은 과거에 반려견을 키운 경험이 있나요?</span></td>
													</tr>
													<tr>
														<td><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td align=left>
															<input type="radio" checked> ${petsitter.q6}
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td><div style="height:40px;"></div></td>
										</tr>
										<tr>
											<form method="post">
											<input type="hidden" name="userid" value="${petsitter.userid}">
											<td align=center>
												<c:if test="${petsitter.role == '회원'}">
												<input type="submit" class="btn_permit" value="승인">
												</c:if>
												<input type="button" class="btn_list" value="목록" onclick="history.back()">
											</td>
											</form>
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