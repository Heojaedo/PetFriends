<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>

<link rel="stylesheet" href="/css/join.css"/>

<script src="/js/js_edit.js"></script>

<style>
	.div_photo { /* 미리보기 이미지 박스 */
		width:200px;
		height:200px;
		border:1px solid #DCDCDC;
		border-radius:10px;
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
		font-family: 'NEXON Lv2 Gothic';
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
$(document).ready(function () {
	$("#pet_photo").on("change", function(event) {
		$("#photo").hide();
		
		var file = event.target.files[0];
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#pet_prephoto").attr("src",e.target.result);
		}
		reader.readAsDataURL(file);
	});
});

function q1_change() {
	var q1 = $("input:radio[name='q1']:checked").val();
	
	if(q1 == 'on') {
		$("#q1_input").attr("disabled",false);
		$("#q1_input").focus();
	} else {
		$("#q1_input").attr("disabled",true);
	}
}

function petsitter() {
	var q1 = $("input:radio[name='q1']").is(":checked");
	var q2 = $("input:radio[name='q2']").is(":checked");
	var q3 = $("input:radio[name='q3']").is(":checked");
	var q4 = $("input:radio[name='q4']").is(":checked");
	var q5 = $("input:radio[name='q5']").is(":checked");
	var q6 = $("input:radio[name='q6']").is(":checked");
	
	if(introduce.value == "") {
		alert("1번 항목을 작성해주세요.");
		introduce.focus();
		return false;
	}
	if(q1 == false) {
		alert("2번 항목을 선택해주세요.");
		return false;
	}
	if(q2 == false) {
		alert("3번 항목을 선택해주세요.");
		return false;
	}
	if(q3 == false) {
		alert("4번 항목을 선택해주세요.");
		return false;
	}
	if(q4 == false) {
		alert("5번 항목을 선택해주세요.");
		return false;
	}
	if(q5 == false) {
		alert("6번 항목을 선택해주세요.");
		return false;
	}
	if(q6 == false) {
		alert("7번 항목을 선택해주세요.");
		return false;
	}
	$("#q1_6").attr("checked",false);
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
								<td align=center><span style="font-size:20px;font-weight:bold;">펫프렌즈의 '파트너펫시터'가 되어 보세요 !</span></td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<form method="post" onsubmit="return petsitter()" enctype="multipart/form-data">
									<table style="width:500px;border:0px;">
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
															<textarea class="textarea_pet" name="introduce" id="introduce"></textarea>
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
															<input type="radio" name="q1" id="q1_1" value="아파트" onchange="q1_change()"> <label for="q1_1">아파트</label>
															<br><br>
															<input type="radio" name="q1" id="q1_2" value="오피스텔" onchange="q1_change()"> <label for="q1_2">오피스텔</label>
															<br><br>
															<input type="radio" name="q1" id="q1_3" value="단독 주택" onchange="q1_change()"> <label for="q1_3">단독 주택</label>
															<br><br>
															<input type="radio" name="q1" id="q1_4" value="빌라" onchange="q1_change()"> <label for="q1_4">빌라</label>
															<br><br>
															<input type="radio" name="q1" id="q1_5" value="원룸" onchange="q1_change()"> <label for="q1_5">원룸</label>
															<br><br>
															<input type="radio" name="q1" id="q1_6" onchange="q1_change()"> <label for="q1_6">기타</label>
															<br><br>
															<input class="input_pet" style="width:150px;" name="q1" id="q1_input" disabled>
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
															<input type="radio" name="q2" id="q2_1" value="예"> <label for="q2_1">예</label>
															<br><br>
															<input type="radio" name="q2" id="q2_2" value="아니오"> <label for="q2_2">아니오</label>
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
															<input type="radio" name="q3" id="q3_1" value="예"> <label for="q3_1">예</label>
															<br><br>
															<input type="radio" name="q3" id="q3_2" value="아니오"> <label for="q3_2">아니오</label>
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
															<input type="radio" name="q4" id="q4_1" value="예"> <label for="q4_1">예</label>
															<br><br>
															<input type="radio" name="q4" id="q4_2" value="아니오"> <label for="q4_2">아니오</label>
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
															<input type="radio" name="q5" id="q5_1" value="예"> <label for="q5_1">예</label>
															<br><br>
															<input type="radio" name="q5" id="q5_2" value="아니오"> <label for="q5_2">아니오</label>
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
															<input type="radio" name="q6" id="q6_1" value="예"> <label for="q6_1">예</label>
															<br><br>
															<input type="radio" name="q6" id="q6_2" value="아니오"> <label for="q6_2">아니오</label>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td><div style="height:40px;"></div></td>
										</tr>
										<tr>
											<td align=center><button class="btn_form">제출하기</button></td>
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

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/postcode.js"></script>

<%@ include file="/include/footer.jsp" %>