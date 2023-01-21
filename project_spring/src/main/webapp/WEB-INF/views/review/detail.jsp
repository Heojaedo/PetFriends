<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫프렌즈</title>

<style>
	.table_review {
		margin-top:40px;
		margin-bottom:40px;
	}
	
	.table_review a {
		color:#000000;
	}
	
	.review_title {
		font-size:28px;
		font-weight:bold;
		color:#e27830;
	}
	
	.review {
		color:#736659;
	}
	
	.image > img { /* 게시글 사진 최대 크기 설정 */
		max-width:1000px;
	}
	
	.btn_form { /* 버튼 */
	    width:100px;
	    height:35px;
	    border:0px;
	    background-color:#eba070;
	    color:#ffffff;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:16px;
	    cursor:pointer;
	}
	
	.table_review_user a:hover {
		text-decoration:none;
	}
	
	.table_petsitter a:hover {
		text-decoration:underline;
		color:#e27830;
	}
</style>

<script>
function reviewDelete(uid) {
	if(confirm("삭제하시겠습니까?")) {
		location.href="/review/delete?no="+uid;
	} else {
		return false;
	}
}
</script>

</head>
<body>
<table width=100% border=0>
	<tr>
		<td align=center>
			<table class="table_review" style="width:1200px;border:0px;">
				<tr>
					<td align=center>
						<span class="review_title">VOICE</span>
					</td>
				</tr>
				<tr>
					<td align=center>
						<table style="width:1000px;border:0px;">
							<tr>
								<td><div style="height:30px;"></div></td>
							</tr>
							<tr>
								<td style="text-indent:10px;">
									<span style="font-size:20px;font-weight:bold;">${review.title}</span>
								</td>
							</tr>
							<tr>
								<td><div style="height:20px;"></div></td>
							</tr>
							<tr>
								<td style="padding:10px;">
									<table class="table_review_user">
										<tr>
											<td rowspan=2 style="padding:5px;">
												<img src="/upload/${user.photo}" style="width:80px;height:60px;object-fit:cover;">
											</td>
											<td colspan=5 style="font-size:14px;text-indent:10px;"><span style="font-weight:bold;">${user.username}</span></td>
										</tr>
										<tr>
											<td style="width:50px;font-size:13px;text-indent:10px;text-align:center;">
												<span style="font-weight:bold;">작성일</span>
											</td> 
											<td style="width:160px;font-size:13px;text-align:center;">
												${review.reviewdate} 
											</td>
											<td style="width:50px;font-size:13px;text-align:center;">
												<span style="font-weight:bold;">조회수</span>
											</td> 
											<td style="width:50px;font-size:13px;text-align:center;">
												${review.hit}
											</td>
											<td style="width:100px;font-size:13px;text-align:center;"> 
												<c:if test="${sessionScope.id != null && sessionScope.id eq review.userid}">
													<a href="/review/edit?no=${review.reviewuid}&page=${page}"><span style="color:#e27830;">수정</span></a>
													&nbsp;&nbsp;&nbsp; 
													<span style="color:#e27830;cursor:pointer;" onclick="reviewDelete(${review.reviewuid})">지우기</span>
												</c:if>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><hr style="background:#767676;height:1px;border:0"></td>
							</tr>
							<tr>
								<td style="padding:10px;">${review.contents}</td>
							</tr>
							<tr>
								<td><div style="height:20px;"></div></td>
							</tr>
							<tr>
								<td>
									<table class="table_petsitter" style="width:100%;border:0px;">
										<tr>
											<td rowspan=3 width=100px><img src="/upload/${petsitter.photo}" width=80></td>
											<td><span style="font-size:18px;font-weight:bold;">${petsitter.username}</span></td>
										</tr>
										<tr>
											<td><span style="font-size:13px;">${petsitter.addr}</span></td>
										</tr>
										<tr>
											<td>
												<a href="/review/detail/petsitter?no=${review.reviewuid}&page=${page}"><span style="color:#e27830;font-size:13px;">펫시터 프로필 보기</span></a>
												&nbsp;&nbsp;<span style="color:#767676;">|</span>&nbsp;&nbsp;
												<a href="/list/detail?no=${post.uid}"><span style="color:#e27830;font-size:13px;">예약하러가기</span></a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><hr style="background:#767676;height:1px;border:0"></td>
							</tr>
							<tr>
								<td><div style="height:20px;"></div></td>
							</tr>
							<tr>
								<td style="text-indent:10px;"><input class="btn_form" type="button" value="목록" onclick="location.href='/review?page=${page}'"></td>
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