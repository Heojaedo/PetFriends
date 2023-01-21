<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>

<link rel="stylesheet" href="/css/join.css"/>

<script src="/js/js_join.js"></script>

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
								<td align=center><span style="font-size:20px;font-weight:bold;">회원가입</span></td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<form method="post" onsubmit="return join()" enctype="multipart/form-data">
									<input style="display:none;" type="file" name="file" id="pet_photo" accept="image/*" onchange="readURL(this)">
									<table style="width:300px;border:0px;">
										<tr>
											<td align=center>
												<label for="pet_photo">
													<div class="div_photo">
														<img id="pet_prephoto" onload="resize(this)">
														<img id="photo" src="/image/memberPhoto.png">
													</div>
												</label>
											</td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td align=center>사진 업로드</td>
										</tr>
										<tr>
											<td><div style="height:40px;"></div></td>
										</tr>
										<tr>
											<td><label for="userid"><span class="span_join_title">아이디</span></label></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<input class="input_join" name="userid" id="userid" placeholder="아이디" maxlength="20">
												<div style="display:none;"><input type="checkbox" name="id_checkbox" id="id_checkbox"></div>
											</td>
										</tr>
										<tr>
											<td class="td_text">
												<span class="id_form" style="color:red;display:none;">5~16자의 영문, 숫자, 특수기호(_)만 사용 가능합니다.</span>
												<span class="id_pass" style="color:blue;display:none;">멋진 아이디네요 !</span>
												<span class="id_over" style="color:red;display:none;">중복된 아이디입니다 !</span>
												<span class="id_must" style="color:red;display:none;">필수 정보입니다.</span>
											</td>
										</tr>
										<tr>
											<td><label for="userpw"><span class="span_join_title">비밀번호</span></label></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<input class="input_join" type="password" name="userpw" id="userpw" placeholder="비밀번호" maxlength="20">
												<div style="display:none;"><input type="checkbox" name="pw_checkbox" id="pw_checkbox"></div>
											</td>
										</tr>
										<tr>
											<td class="td_text">
												<span class="pw_form" style="color:red;display:none;">8~16자의 영문, 숫자, 특수문자를 사용하세요.</span>
												<span class="pw_must" style="color:red;display:none;">필수 정보입니다.</span>
											</td>
										</tr>
										<tr>
											<td><label for="userpw2"><span class="span_join_title">비밀번호 확인</span></label></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<input class="input_join" type="password" name="userpw2" id="userpw2" placeholder="비밀번호 확인" maxlength="20">
												<div style="display:none;"><input type="checkbox" name="pw2_checkbox" id="pw2_checkbox"></div>
											</td>
										</tr>
										<tr>
											<td class="td_text">
												<span class="pw2_same" style="color:red;display:none;">비밀번호가 일치하지 않습니다.</span>
												<span class="pw2_must" style="color:red;display:none;">필수 정보입니다.</span>
											</td>
										</tr>
										<tr>
											<td><label for="username"><span class="span_join_title">이름</span></label></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<input class="input_join" name="username" id="username" placeholder="이름" maxlength="20">
												<div style="display:none;"><input type="checkbox" name="name_checkbox" id="name_checkbox"></div>
											</td>
										</tr>
										<tr>
											<td class="td_text">
												<span class="name_form" style="color:red;display:none;">한글만 사용 가능합니다.</span>
												<span class="name_must" style="color:red;display:none;">필수 정보입니다.</span>		
											</td>
										</tr>
										<tr>
											<td><label for="email"><span class="span_join_title">이메일</span></label></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<input class="input_join" name="email" id="email" placeholder="이메일" maxlength="30">
												<div style="display:none;"><input type="checkbox" name="email_checkbox" id="email_checkbox"></div>
											</td>
										</tr>
										<tr>
											<td class="td_text">
												<span class="email_form" style="color:red;display:none;">이메일 주소를 다시 확인해주세요.</span>
												<span class="email_over" style="color:red;display:none;">중복된 이메일입니다 !</span>
												<span class="email_must" style="color:red;display:none;">필수 정보입니다.</span>		
											</td>
										</tr>
										<tr>
											<td><label for="phone"><span class="span_join_title">휴대폰번호</span></label></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<input style="width:50px;height:35px;padding:5px;font-size:16px;" value="010" disabled> -
												<input style="width:233px;height:35px;padding:5px;font-size:16px;" name="phone" id="phone" placeholder="8자리 입력" maxlength="8">
												<div style="display:none;"><input type="checkbox" name="phone_checkbox" id="phone_checkbox"></div>
											</td>
										</tr>
										<tr>
											<td class="td_text">
												<span class="phone_form" style="color:red;display:none;">8자리의 숫자를 입력해주세요.</span>
												<span class="phone_must" style="color:red;display:none;">필수 정보입니다.</span>		
											</td>
										</tr>	
										<tr>
											<td><span class="span_join_title">우편번호</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<table class="table_zipcode">
													<tr>
														<td>
															<input style="width:145px;height:35px;padding:5px;font-size:16px;" name="zipcode" id="sample2_postcode" placeholder="우편번호" readonly>
														</td>
														<td>
															<input class="btn_zipcode" type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
														</td>
													</tr>
													<tr>
														<td colspan=2><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td colspan=2>
															<input style="width:300px;height:35px;padding:5px;font-size:16px;" name="address" id="sample2_address" placeholder="주소" readonly>
														</td>
													</tr>
													<tr>
														<td colspan=2><div style="height:10px;"></div></td>
													</tr>
													<tr>
														<td>
															<input style="width:145px;height:35px;padding:5px;font-size:16px;" name="detailaddr" id="sample2_detailAddress" placeholder="상세주소" maxlength="20">
														</td>
														<td>
															<input style="width:145px;height:35px;padding:5px;font-size:16px;" name="extraaddr" id="sample2_extraAddress" placeholder="참고항목" readonly>
														</td>
													</tr>
													<tr>
														<td class="td_text" colspan=2>
															<span class="addr_form" style="color:red;display:none;">우편번호를 입력해주세요.</span>
															<span class="addr_must" style="color:red;display:none;">상세주소를 입력해주세요.</span>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td align=center><button class="btn_form">회원가입</button></td>
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