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
</style>

<script>
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
									<table style="margin-top:40px;border:0px;">
										<tr>
											<td align=center><img src="/upload/${petsitter.photo}" style="border-radius:3px;" onload="resize(this)"></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td align=center>${petsitter.username}</td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td align=center>${petsitter.addr}</td>
										</tr>
									</table>
									<table style="margin-top:40px;width:600px;border:0px;">
										<tr>
											<td><span style="font-size:18px;font-weight:bold;">${petsitter.title}</span></td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td><hr style="background:#767676;height:1px;border:0"></td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td><span style="font-size:16px;font-weight:bold;">자기소개</span></td>
										</tr>
										<tr>
											<td><div style="height:10px;"></div></td>
										</tr>
										<tr>
											<td>${petsitter.introduce}</td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td><hr style="background:#767676;height:1px;border:0"></td>
										</tr>
										<tr>
											<td><div style="height:20px;"></div></td>
										</tr>
										<tr>
											<td><span style="font-size:16px;font-weight:bold;">펫시터 위치</span></td>
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
												geocoder.addressSearch('${petsitter.address}', function(result, status) {
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
											<td><div style="height:40px;"></div></td>
										</tr>
										<tr>
											<td align=center><input class="btn_form" type="button" value="확인" onclick="location.href='/review/detail?no=${reviewUid}&page=${page}'"></td>
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
		</td>
	</tr>
</table>
</body>
</html>

<%@ include file="/include/footer.jsp" %>