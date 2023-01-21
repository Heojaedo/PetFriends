<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>

<style>
	.table_post { /* 위아래 여백 */
		margin-top:50px;
		margin-bottom:50px;
	}
	
	.post_title { /* 제목 입력란 */
		width:600px;
		height:35px;
		padding:5px;
		font-family: 'NEXON Lv2 Gothic';
		font-size:16px;
	}
	
	.post_introduce { /* 자기소개 입력란 */
		width:600px;
		height:300px;
		padding:5px;
		font-family: 'NEXON Lv2 Gothic';
		font-size:16px;
		resize:none;
	}
	
	.input_house { /* 돌봄환경 작성란 폰트 */
		height:30px;
		text-indent:5px;
		font-family: 'NEXON Lv2 Gothic';
		font-size:14px;
	}
	
	.post_price { /* 이용금액 입력란 */
		width:300px;
		height:35px;
		padding:5px;
		font-family: 'NEXON Lv2 Gothic';
		font-size:16px;		
	}
	
	.btn_form { /* 등록 버튼 */
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
	    border:0px;
	    background-color:#ffffff;
	    border:1px solid #eba070;
	    color:#eba070;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:16px;
	    cursor:pointer;
	}
</style>

<script>
let check = /^[0-9]+$/;

$(document).ready(function () {
	$("#price").keyup(function () {
		if(!check.test($("#price").val())) {
			alert("숫자만 입력하세요.");
			$("#price").val("");
		}
	});
	
	$("#file").on("change", function(event) {
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
			height:"160px"
		})
	} else {
		$(e).css({
			width:"160px",
			height:"auto"
		})
	}
}

function op1_change() {
	var op1 = $("input:radio[name='op1']:checked").val();
	
	if(op1 == 'on') {
		$("#op1_input").attr("disabled",false);
		$("#op1_input").focus();
	} else {
		$("#op1_input").attr("disabled",true);
	}
}

function post() {
	var op1 = $("input:radio[name='op1']").is(":checked");
	var op2 = $("input:radio[name='op2']").is(":checked");
	var op3 = $("input:radio[name='op3']").is(":checked");
	var op4 = $("input:radio[name='op4']").is(":checked");
	
	if(title.value == "") {
		alert("프로필 제목을 입력해주세요.");
		title.focus();
		return false;
	}
	if(introduce.value == "") {
		alert("자기소개를 작성해주세요.");
		introduce.focus();
		return false;
	}
	if(addr.value == "") {
		alert("위치를 입력해주세요.");
		addr.focus();
		return false;
	}
	if(op1 == false) {
	alert("돌봄공간을 선택해주세요.");
		return false;
	}
	if(op2 == false) {
		alert("12세 이하 아동 유무를 확인해주세요.");
		return false;
	}
	if(op3 == false) {
		alert("동거 반려동물 유무를 확인해주세요.");
		return false;
	}
	if(op4 == false) {
		alert("반려견 펜스 유무를 확인해주세요.");
		return false;
	}
	if($("#price").val() == "") {
		alert("이용금액은 필수 항목입니다.");
		$("#price").focus();
		return false;
	}
	$("#op1_6").attr("checked",false);
}

function del_file(filenum) {
	$.ajax({
		url:"/list/post/delfile",
		type:"post",
		data:{filenum:filenum},
		success:function() {
			$("."+filenum).empty();
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function postDelete(uid) {
	if(confirm("삭제하시겠습니까?")) {
		location.href="/list/post/delete?no="+uid;
	} else {
		return false;
	}
}

if(${sessionScope.role != '펫시터'}) {
	alert("권한이 없습니다.");
	history.back();
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
						<table class="table_post" style="width:800px;border:1px solid #e3e3e3;">
							<tr>
								<td align=center>
									<form method="post" onsubmit="return post()" enctype="multipart/form-data">
									<input type="hidden" name="userid" value="${sessionScope.id}">
									<input type="hidden" name="petsitterid" value="${sessionScope.id}">
									<input type="hidden" name="petsittername" value="${post.petsittername}">
									<input type="hidden" name="uid" value="${post.uid}">
									<table style="margin-top:40px;border:0px;">
										<tr>
											<td align=center><img src="/upload/${post.photo}" style="border-radius:3px;" onload="resize(this)"></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td align=center>${post.petsittername}</td>
										</tr>
									</table>
									<table style="margin-top:40px;width:600px;border:0px;">
										<tr>
											<td><input class="post_title" name="title" id="title" value="${post.title}"></td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td><span style="font-size:16px;font-weight:bold;">자기소개</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td><textarea class="post_introduce" name="introduce" id="introduce">${post.introduce}</textarea></td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td><span style="font-size:16px;font-weight:bold;">펫시터 위치</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td><input class="post_title" name="addr" id="addr" value="${post.addr}"></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<div id="map" style="width:100%;height:350px;"></div>
												
												<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05d63331dab4466ade52aa2aa234df6b&libraries=services"></script>
												<script>
												var mapContainer = document.getElementById('map'), // 지도를 표시할 div
												    mapOption = {
												        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
												        level: 6 // 지도의 확대 레벨
												    };
												
												// 지도를 생성합니다
												var map = new kakao.maps.Map(mapContainer, mapOption);
												
												// 주소-좌표 변환 객체를 생성합니다
												var geocoder = new kakao.maps.services.Geocoder();
												
												// 주소로 좌표를 검색합니다
												geocoder.addressSearch('${post.address}', function(result, status) {
													// 정상적으로 검색이 완료됐으면
													if (status === kakao.maps.services.Status.OK) {
														
														var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
														
														// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
														map.setCenter(coords);
													}
													
													//지도에 표시할 원을 생성합니다
													var circle = new kakao.maps.Circle({
														center : coords,  // 원의 중심좌표 입니다
														radius: 1000, // 미터 단위의 원의 반지름입니다
														strokeWeight: 5, // 선의 두께입니다
														strokeColor: '#75B8FA', // 선의 색깔입니다
														strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
														strokeStyle: 'dashed', // 선의 스타일 입니다
														fillColor: '#CFE7FF', // 채우기 색깔입니다
														fillOpacity: 0.3  // 채우기 불투명도 입니다
													});
													
													// 지도에 원을 표시합니다
													circle.setMap(map);
												});
												</script>
											</td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td><span style="font-size:16px;font-weight:bold;">돌봄공간</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<input type="radio" name="op1" id="op1_1" value="아파트" onchange="op1_change()" <c:if test="${post.op1 == '아파트'}">checked</c:if>> <label for="op1_1">아파트</label>
												<input type="radio" name="op1" id="op1_2" value="오피스텔" onchange="op1_change()"<c:if test="${post.op1 == '오피스텔'}">checked</c:if>> <label for="op1_2">오피스텔</label>
												<input type="radio" name="op1" id="op1_3" value="단독 주택" onchange="op1_change()" <c:if test="${post.op1 == '단독 주택'}">checked</c:if>> <label for="op1_3">단독 주택</label>
												<input type="radio" name="op1" id="op1_4" value="빌라" onchange="op1_change()" <c:if test="${post.op1 == '빌라'}">checked</c:if>> <label for="op1_4">빌라</label>
												<input type="radio" name="op1" id="op1_5" value="원룸" onchange="op1_change()" <c:if test="${post.op1 == '원룸'}">checked</c:if>> <label for="op1_5">원룸</label>
												<c:choose>
													<c:when test="${post.op1 != '아파트' && post.op1 != '오피스텔' && post.op1 != '단독 주택' && post.op1 != '빌라' && post.op1 != '원룸'}">
														<input type="radio" name="op1" id="op1_6" onchange="op1_change()" checked> <label for="op1_6">기타</label>
														<input class="input_house" name="op1" id="op1_input" value="${post.op1}">
													</c:when>
													<c:otherwise>
														<input type="radio" name="op1" id="op1_6" onchange="op1_change()"> <label for="op1_6">기타</label>
														<input class="input_house" name="op1" id="op1_input" disabled>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td><span style="font-size:16px;font-weight:bold;">12세 이하 아동</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<input type="radio" name="op2" id="op2_1" value="있어요" <c:if test="${post.op2 == '있어요'}">checked</c:if>> <label for="op2_1">있어요</label>
												<input type="radio" name="op2" id="op2_2" value="없어요" <c:if test="${post.op2 == '없어요'}">checked</c:if>> <label for="op2_2">없어요</label>
											</td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td><span style="font-size:16px;font-weight:bold;">동거 반려동물</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<input type="radio" name="op3" id="op3_1" value="있어요" <c:if test="${post.op3 == '있어요'}">checked</c:if>> <label for="op3_1">있어요</label>
												<input type="radio" name="op3" id="op3_2" value="없어요" <c:if test="${post.op3 == '없어요'}">checked</c:if>> <label for="op3_2">없어요</label>
											</td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td><span style="font-size:16px;font-weight:bold;">반려견 펜스</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>
												<input type="radio" name="op4" id="op4_1" value="있어요" <c:if test="${post.op4 == '있어요'}">checked</c:if>> <label for="op4_1">있어요</label>
												<input type="radio" name="op4" id="op4_2" value="없어요" <c:if test="${post.op4 == '없어요'}">checked</c:if>> <label for="op4_2">없어요</label>
											</td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td><span style="font-size:16px;font-weight:bold;">이용금액</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td><input class="post_price" name="price" id="price" value="${post.price}"></td>
										</tr>
										<tr>
											<td><div style="height:30px;"></div></td>
										</tr>
										<tr>
											<td>
												<input type="file" name="file" id="file" accept="image/*" onchange="file_upload()" multiple>
											</td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td>
												<c:forEach var="file" items="${file}">
													<div class="${file.filenum}" style="float:left;margin-right:10px;">
													<input type="hidden" name="filename" value="${file.filenum}">
													<img src="/postupload/${file.filename}" style="width:100px;height:70px;object-fit:contain;border:1px solid #DCDCDC;">
													<span style="font-weight:bold;cursor:pointer;" onclick="del_file(${file.filenum})">&#10006;</span>
													</div>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td><div style="height:40px;"></div></td>
										</tr>
										<tr>
											<td align=center>
												<input class="btn_form" type="submit" value="수정">
												<input class="btn_form2" type="button" value="삭제" onclick="postDelete(${post.uid})">
											</td>
										</tr>
										<tr>
											<td><div style="height:40px;"></div></td>
										</tr>
									</table>
									</form>
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