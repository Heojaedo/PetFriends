<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.min.js"></script>

<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script src="/js/build/ckeditor.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>
<style>
	@font-face {
		font-family: 'NEXON Lv2 Gothic';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
	body {
	    font-family: 'NEXON Lv2 Gothic';
	}
	
	* { /* 전체 마진 패딩 초기화 */
		margin:0px;
		padding:0px;
	}
	
	table {
		border-collapse:collapse;
	}
	
	a { /* a 태그 밑줄 제거 */
		text-decoration:none;
		font-family: 'NEXON Lv2 Gothic';
		color:#e27830;
	}
	
	a:hover { /* a 태그 마우스 오버 시 밑줄 */
		text-decoration:underline;
		color:#e27830;
	}
	
	a:visited {
		color:#e27830;
	}
	
	.table_header { /* 헤더 테이블 뒷배경 */
		background-color:#faeee0;
		width:100%;
	}
	
	.span_name {
		font-family: 'NEXON Lv2 Gothic';
		color:#e27830;
		font-weight:bold;
	}
	
	.span_name:hover { /* 이름 마우스 오버 시 밑줄 + 커서 포인터 */
		text-decoration:underline;
		cursor:pointer;
	}
	
	.header_title {
		font-weight:bold;
	}
	
	.header_div { /* 펫시터 집가기 div */
		display: flex;
		justify-content: center;
		align-items: center;
		flex-wrap: nowrap;
	}
	
	.div_my { /* 부모 div relative 설정 */
		position:relative;
	}
	
	.div_my2 { /* 마이페이지 메뉴 박스 */
		background-color:#ffffff;
		border:2px solid #e27830;
		width:150px;
		height:100px;
		font-size:14px;
		position:absolute;
		display:none;
		z-index:100;
	}
	
	.div_my2 .menu { /* 마이페이지 메뉴 정렬 */
		position:absolute;
		top:23px;
		left:3px;
	}
	
	.div_my2 .menu li { /* 마이페이지 메뉴 시작점 제거 */
		list-style-type:none;
	}
	
	.div_logo {
		position:relative;
	}
	
	#div_push {
		position:absolute;
		top:30px;
		left:300px;
		font-size:18px;
		font-weight:bold;
	}
</style>

<script>
$(document).ready(function () {
	$(".span_name").click(function () {
		$(".div_my2").css("display","flex");
	});
	$(".div_my2").mouseover(function () {
		$(".div_my2").css("display","flex");
	});
	$(".div_my2").mouseout(function () {
		$(".div_my2").css("display","none");
	});
	
	$.ajax({
		url:"/member/pushCheck",
		type:"post",
		data:"userid=${sessionScope.id}",
		dataType:"json",
		success:function(map) {
			if(${sessionScope.role != null && sessionScope.role == '관리자'}) {
				if(map.applicantsCount == 0) {
					$("#div_push").hide();
				} else {
					$("#div_push").append(map.applicantsCount+"건의 펫시터 지원이 있습니다.");	
				}
			} else if(${sessionScope.role != null && sessionScope.role == '펫시터'}) {
				if(map.reserveCount == 0) {
					$("#div_push").hide();
					if(map.paymentCount == 0) {
						
					} else {
						$("#div_push").append(map.paymentCount+"건의 결제 대기 예약이 있습니다.");
					}
				} else {
					$("#div_push").append(map.reserveCount+"건의 예약이 있습니다.");
					if(map.paymentCount == 0) {
						
					} else {
						$("#div_push").append("<br>"+map.paymentCount+"건의 결제 대기 예약이 있습니다.");
					}
				}
			} else if(${sessionScope.role != null && sessionScope.role == '회원'}) {
				if(map.paymentCount == 0) {
					$("#div_push").hide();
				} else {
					$("#div_push").append(map.paymentCount+"건의 결제 대기 예약이 있습니다.");
				}
			}
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	$(".bxSlider").bxSlider({
		mode:"fade",
		auto:true,
		pager:false,
		controls:false
	});
	
	$(".flex_container").bxSlider({
		mode:"horizontal",
		slideWidth: 1000,
		moveSlides: 1,
		minSlides: 4,
		maxSlides: 4,
		slideMargin: 10,
		touchEnabled : (navigator.maxTouchPoints > 0),
		auto:true,
		pager:false,
		controls:true
	});
});

var text = "${text}";

if(text != "") {
	alert(text);
}
</script>

</head>
<body>

<center>

<table class="table_header">
	<tr>
		<td align=center>
			<table style="width:1200px;border:0px;">
				<tr>
					<td width=600px>
						<div class="div_logo">
							<a href="/"><img src="/image/petfriends.png" height=80></a>
							<div id="div_push">
							</div>
						</div>
					</td>
					<td width=100px align=center>
						<c:choose>
							<c:when test="${sessionScope.role == '회원'}">
								<a href="/member/petsitter"><span class="header_title">펫시터 되기</span></a>
							</c:when>
							<c:when test="${sessionScope.role == '펫시터'}">
								<a href="/petsitter/reserve"><span class="header_title">펫시터 메뉴</span></a>
							</c:when>
							<c:when test="${sessionScope.role == '관리자'}">
								<a href="/admin/petsitter"><span class="header_title">관리자 메뉴</span></a>
							</c:when>
						</c:choose>
					</td>
					<c:choose>
						<c:when test="${sessionScope.id == null}">
							<td width=100px align=center>
								<a href="/member/join"><span class="header_title">회원가입</span></a>
							</td>
							<td width=100px align=center>
								<a href="/member/login"><span class="header_title">로그인</span></a>
							</td>
						</c:when>
						<c:otherwise>
							<td width=100px align=center>
								<div class="div_my">
									<span class="span_name">${sessionScope.name}님 ▼</span>
									<div class="div_my2">
										<ul class="menu">
											<li><a href="/member/reserve">예약내역</a></li>
											<li><a href="/member/mypet">반려동물 카드</a></li>
											<li><a href="/member/edit">정보수정</a></li>
										</ul>
									</div>
								</div>
							</td>
							<td width=100px align=center>
								<a href="/member/logout"><span class="header_title">로그아웃</span></a>
							</td>
						</c:otherwise>
					</c:choose>
					<td width=100px align=center>
						<a href="/description"><span class="header_title">이용방법</span></a>
					</td>
					<td width=100px align=center>
						<div class="header_div" style="width:50px;height:50px;padding:2px;border:2px solid #e27830;text-align:center;">
							<a href="/list">
								<span class="header_title">펫시터 집가기</span>
							</a>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>