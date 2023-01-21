<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<link rel="stylesheet" href="/css/bxSlider.css"/>

<style>
	.table_index {
		margin-top:40px;
		margin-bottom:40px;
	}
	
	.review_title {
		font-size:28px;
		font-weight:bold;
		color:#e27830;
	}
	
	.review_slide {
		border:1px solid #DCDCDC;
		width:250px;
	}
	
	.review_slide:hover {
		cursor:pointer;
	}
	
	.td_title {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		max-width: 250px;
	}
</style>

<script>
	function review(uid) {
		location.href="/review/detail?no="+uid+"&page=1";
	}
</script>

<table width=100%>
	<tr>
		<td align=center>
			<table class="table_index" style="width:1200px;height:500px;border:0px;">
				<tr>
					<td align=center>
						<img src="/image/service.png" width=200><br>
						<p><span style="font-size:20px;font-weight:bold;">SERVICE</span></p>
						<p>돌봄 내용</p>
					</td>
					<td align=center>
						<a href="/description"><img src="/image/step.png" width=200></a>
						<p><span style="font-size:20px;font-weight:bold;">STEP</span></p>
						<p>이용절차</p>
					</td>
					<td align=center>
						<a href="/list"><img src="/image/reservation.png" width=200></a>
						<p><span style="font-size:20px;font-weight:bold;">RESERVATION</span></p>
						<p>예약하기</p>
					</td>
					<td align=center>
						<a href="/review"><img src="/image/voice.png" width=200></a>
						<p><span style="font-size:20px;font-weight:bold;">VOICE</span></p>
						<p>이용후기</p>
					</td>
				</tr>
			</table>
			<table class="table_review" style="width:1200px;height:300px;border:0px;">
				<tr>
					<td align=center><span class="review_title">VOICE</span></td>
				</tr>
				<tr>
					<td><div style="height:20px;"></div></td>
				</tr>
				<tr>
					<td style="text-align:center">
						<div class="flex_container">
						<c:forEach var="review" items="${review}">
							<table class="review_slide" onclick="review(${review.reviewuid})">
								<tr>
									<td align=center colspan=2 style="padding:5px;"><img src="${review.preview}" style="width:250px;height:150px;object-fit:contain;"></td>
								</tr>
								<tr>
									<td class="td_title" colspan=2 style="width:150px;padding:5px;"><span style="font-size:20px;font-weight:bold;">${review.title}</span></td>
								</tr>
								<tr>
									<td align=left style="width:150px;padding:5px;"><span style="font-size:16px;font-weight:bold;">${review.username}님 </span></td>
									<td align=right style="width:100px;padding:5px;"><span style="color:#e27830;font-size:13px;font-weight:bold;">후기보러가기</span></a></td>
								</tr>
							</table>
						</c:forEach>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<%@ include file="/include/footer.jsp" %>