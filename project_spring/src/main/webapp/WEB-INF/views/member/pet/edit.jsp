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
$(document).ready(function () {
	yearOption();
	monthOption();
	dayOption();
	$('select[name="year"]').find('option[value="${vo.year}"]').attr("selected",true);
	$('select[name="month"]').find('option[value="${vo.month}"]').attr("selected",true);
	$('select[name="day"]').find('option[value="${vo.day}"]').attr("selected",true);
	
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

function yearOption() {
	var dt = new Date();
	var com_year = dt.getFullYear();
	
	//올해 기준으로 20살까지
	for(var y = com_year; y >= (com_year - 20); y--) {
		$("#year").append("<option value='"+y+"')>"+y+"</option>");
	}
}

function monthOption() {
	for(var m = 1; m <= 12; m++) {
		var mm = m.toString();
		if(mm.length == 1) {
			mm = "0" + mm;
		}
		$("#month").append("<option value='"+mm+"'>"+mm+"</option>");
	}
}

function dayOption() {
	for(var d = 1; d <= 31; d++) {
		var dd = d.toString();
		if(dd.length == 1) {
			dd = "0" + dd;
		}
		$("#day").append("<option value='"+dd+"'>"+dd+"</option>");
	}
}

function change() {
	var type = $("input:radio[name='pet']:checked").val();
	
	if(type == 'dog') {
		location.href="/member/pet/edit?type=1&no="+${vo.petuid};
	} else {
		location.href="/member/pet/edit?type=2&no="+${vo.petuid};
	}
}

function mypet() {
	if(petname.value == "") {
		alert("이름을 입력해주세요 !");
		petname.focus();
		return false;
	}
	if(breed.value == "") {
		alert("품종을 입력해주세요 !");
		petname.focus();
		return false;
	}
	if(weight.value == "") {
		alert("몸무게를 입력해주세요 !");
		petname.focus();
		return false;
	}
}

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
									<table class="table_mymenu" width=360px>
										<tr>
											<td width=120px>
												<a href="/member/reserve">예약내역</a>
											</td>
											<td width=120px style="background-color:#eba070">
												<a href="/member/mypet"><span style="color:#ffffff">반려동물 카드</span></a>
											</td>
											<td width=120px>
												<a href="/member/edit">정보수정</a>
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
									<form method="post" onsubmit="return mypet()" enctype="multipart/form-data">
									<input type="hidden" name="petuid" value="${vo.petuid}">
									<input type="hidden" name="userid" value="${sessionScope.id}">
									<input style="display:none;" type="file" name="file" id="pet_photo" accept="image/*" onchange="readURL(this)">
									<table style="width:500px;border:0px;">
										<tr>
											<td align=center>
												<input type="radio" name="pet" id="pet_dog" value="dog" onchange="change()" <c:if test="${vo.type == 'dog' || type != '2'}">checked</c:if>> <label for="pet_dog"><a href="/member/pet/edit?type=1&no=${vo.petuid}">강아지</a></label>
												&nbsp;&nbsp;&nbsp;
												<input type="radio" name="pet" id="pet_cat" value="cat" onchange="change()" <c:if test="${vo.type == 'cat' || type == '2'}">checked</c:if>> <label for="pet_cat"><a href="/member/pet/edit?type=2&no=${vo.petuid}">고양이</a></label>
											</td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td align=center>
												<label for="pet_photo">
													<div class="div_photo">
														<img id="pet_prephoto" onload="resize(this)">
														<c:choose>
															<c:when test="${vo.photo != ''}">
																<img id="photo" src="/upload/${vo.photo}" onload="resize(this)">
															</c:when>
															<c:otherwise>
																<c:choose>
																	<c:when test="${vo.type == 'dog' && type == null}">
																		<img id="photo" src="/image/dogPhoto.png">
																	</c:when>
																	<c:when test="${vo.type == 'dog' && type == '1'}">
																		<img id="photo" src="/image/dogPhoto.png">
																	</c:when>
																	<c:when test="${vo.type == 'dog' && type == '2'}">
																		<img id="photo" src="/image/catPhoto.png">
																	</c:when>
																	<c:when test="${vo.type == 'cat' && type == null}">
																		<img id="photo" src="/image/catPhoto.png">
																	</c:when>
																	<c:when test="${vo.type == 'cat' && type == '1'}">
																		<img id="photo" src="/image/dogPhoto.png">
																	</c:when>
																	<c:when test="${vo.type == 'cat' && type == '2'}">
																		<img id="photo" src="/image/catPhoto.png">
																	</c:when>
																</c:choose>
															</c:otherwise>
														</c:choose>
													</div>
												</label>
											</td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<c:choose>
											<c:when test="${vo.type == 'cat' && type == null}">
												<%@ include file="/include/petcatedit.jsp" %>
											</c:when>
											<c:when test="${vo.type == 'cat' && type == '1'}">
												<%@ include file="/include/petdogedit.jsp" %>
											</c:when>
											<c:when test="${vo.type == 'cat' && type == '2'}">
												<%@ include file="/include/petcatedit.jsp" %>
											</c:when>
											<c:when test="${vo.type == 'dog' && type == null}">
												<%@ include file="/include/petdogedit.jsp" %>
											</c:when>
											<c:when test="${vo.type == 'dog' && type == '1'}">
												<%@ include file="/include/petdogedit.jsp" %>
											</c:when>
											<c:when test="${vo.type == 'dog' && type == '2'}">
												<%@ include file="/include/petcatedit.jsp" %>
											</c:when>
										</c:choose>
										<tr>
											<td><div style="height:40px;"></div></td>
										</tr>
										<tr>
											<td align=center>
												<input class="btn_form" type="submit" value="수정">
											</td>
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