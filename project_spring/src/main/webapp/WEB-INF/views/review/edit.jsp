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
	
	.input_review_title {
		width:1100px;
		height:30px;
		border:0px;
		border-bottom:1px solid #e3e3e3;
	    font-family: 'NEXON Lv2 Gothic';
	    font-size:18px;
	    font-weight:bold;
	    outline:none;
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
	
	.ck-editor__editable { height: 600px; }
</style>

<script>
$(document).ready(function () {
	$("#save").click(function () {
		var data = editor.getData();
		
		if(title.value == "") {
			alert("제목을 입력해주세요.");
			return false;
		}
		
		if(!data) {
			alert("내용을 입력해주세요.");
			return false;
		}
	});
});
</script>

</head>
<body>
<form method="post">
<input name="reviewuid" value="${review.reviewuid}">
<input name="userid" value="${sessionScope.id}">
<input name="petsitter" value="${review.petsitter}">
<table width=100%>
	<tr>
		<td align=center>
			<table style="width:1200px;border:0px;">
				<tr>
					<td align=center>
						<table class="table_join_form" style="width:1200px;border:1px solid #e3e3e3;">
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center><span style="font-size:20px;font-weight:bold;">이용후기</span></td>
							</tr>
							<tr>
								<td><div style="height:40px;"></div></td>
							</tr>
							<tr>
								<td align=center><input class="input_review_title" id="title" name="title" value="${review.title}"></td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td style="padding:30px;">
									<textarea class="inputStyle" id="editor" name="contents">${review.contents}</textarea>
									<script>
										ClassicEditor
										.create(document.querySelector( '#editor' ), {
											ckfinder: {
												uploadUrl: '/list/detail/review/imgUpload'
											}
										})
										.then(newEditor => {
											editor = newEditor;
										})
										.catch(error => {
											console.error( error );
										})
									</script>
								</td>
							</tr>
							<tr>
								<td><div style="height:10px;"></div></td>
							</tr>
							<tr>
								<td align=center>
									<input class="btn_form" type="submit" id="save" value="수정">
									<input class="btn_form2" type="button" value="취소" onclick="location.href='/review/detail?no=${no}&page=${page}'">
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
</form>
</body>
</html>

<%@ include file="/include/footer.jsp" %>