$(document).ready(function () {
	$("#userid").focusout(function () {
		var userid = $("#userid").val();
		$.ajax({
			url:"/member/idCheck",
			type:"post",
			data:{userid:userid},
			success:function(count) {
				if(count == 0 && userid.length > 0) { //사용 가능한 아이디
					$(".id_form").css("display","none");
					$(".id_pass").css("display","inline-block");
					$(".id_over").css("display","none");
					$(".id_must").css("display","none");
					$("#id_checkbox").prop("checked",true);
				} else if(count == 1 && userid.length > 0){ //중복된 아이디
					$(".id_form").css("display","none");
					$(".id_pass").css("display","none");
					$(".id_over").css("display","inline-block");
					$(".id_must").css("display","none");
					$("#id_checkbox").prop("checked",false);
				} else if(count == 9 && userid.length > 0) { //아이디 형식
					$(".id_form").css("display","inline-block");
					$(".id_pass").css("display","none");
					$(".id_over").css("display","none");
					$(".id_must").css("display","none");
					$("#id_checkbox").prop("checked",false);
				} else { //공백
					$(".id_form").css("display","none");
					$(".id_pass").css("display","none");
					$(".id_over").css("display","none");
					$(".id_must").css("display","inline-block");
					$("#id_checkbox").prop("checked",false);
				}
			},
			error:function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	$("#userpw").focusout(function () {
		var userpw = $("#userpw").val();
		$.ajax({
			url:"/member/pwCheck",
			type:"post",
			data:{userpw:userpw},
			success:function(count) {
				if(count == 0 && userpw.length > 0) { //사용 가능한 비밀번호
					$(".pw_form").css("display","none");
					$(".pw_must").css("display","none");
					$("#pw_checkbox").prop("checked",true);
				} else if(count == 9 && userpw.length > 0) { //비밀번호 형식
					$(".pw_form").css("display","inline-block");
					$(".pw_must").css("display","none");
					$("#pw_checkbox").prop("checked",false);
				} else { //공백
					$(".pw_form").css("display","none");
					$(".pw_must").css("display","inline-block");
					$("#pw_checkbox").prop("checked",false);
				}
			},
			error:function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	$("#userpw").keyup(function () {
		$("#pw2_checkbox").prop("checked",false);
	});
	
	$("#userpw2").focusout(function () {
		var userpw = $("#userpw").val();
		var userpw2 = $("#userpw2").val();
		$.ajax({
			url:"/member/pw2Check",
			type:"post",
			data:{userpw:userpw,userpw2:userpw2},
			success:function(count) {
				if(count == 0 && userpw2.length > 0) { //비밀번호 일치
					$(".pw2_same").css("display","none");
					$(".pw2_must").css("display","none");
					$("#pw2_checkbox").prop("checked",true);
				} else if(count == 9 && userpw2.length > 0) { //비밀번호 불일치
					$(".pw2_same").css("display","inline-block");
					$(".pw2_must").css("display","none");
					$("#pw2_checkbox").prop("checked",false);
				} else { //공백
					$(".pw2_same").css("display","none");
					$(".pw2_must").css("display","inline-block");
					$("#pw2_checkbox").prop("checked",false);
				}
			},
			error:function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	$("#username").focusout(function () {
		var username = $("#username").val();
		$.ajax({
			url:"/member/nameCheck",
			type:"post",
			data:{username:username},
			success:function(count) {
				if(count == 0 && username.length > 0) { //이름 확인
					$(".name_form").css("display","none");
					$(".name_must").css("display","none");
					$("#name_checkbox").prop("checked",true);
				} else if(count == 9 && username.length > 0) { //이름 형식
					$(".name_form").css("display","inline-block");
					$(".name_must").css("display","none");
					$("#name_checkbox").prop("checked",false);
				} else { //공백
					$(".name_form").css("display","none");
					$(".name_must").css("display","inline-block");
					$("#name_checkbox").prop("checked",false);
				}
			},
			error:function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	$("#email").focusout(function () {
		var email = $("#email").val();
		$.ajax({
			url:"/member/emailCheck",
			type:"post",
			data:{email:email},
			success:function(count) {
				if(count == 0 && email.length > 0) { //이메일 확인
					$(".email_form").css("display","none");
					$(".email_over").css("display","none");
					$(".email_must").css("display","none");
					$("#email_checkbox").prop("checked",true);
				} else if(count == 1 && email.length > 0){ //중복된 이메일
					$(".email_form").css("display","none");
					$(".email_over").css("display","inline-block");
					$(".email_must").css("display","none");
					$("#email_checkbox").prop("checked",false);
				} else if(count == 9 && email.length > 0) { //이메일 형식
					$(".email_form").css("display","inline-block");
					$(".email_over").css("display","none");
					$(".email_must").css("display","none");
					$("#email_checkbox").prop("checked",false);
				} else { //공백
					$(".email_form").css("display","none");
					$(".email_over").css("display","none");
					$(".email_must").css("display","inline-block");
					$("#email_checkbox").prop("checked",false);
				}
			},
			error:function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	$("#phone").focusout(function () {
		var phone = $("#phone").val();
		$.ajax({
			url:"/member/phoneCheck",
			type:"post",
			data:{phone:phone},
			success:function(count) {
				if(count == 0 && phone.length > 0) { //이름 확인
					$(".phone_form").css("display","none");
					$(".phone_must").css("display","none");
					$("#phone_checkbox").prop("checked",true);
				} else if(count == 9 && phone.length > 0) { //이름 형식
					$(".phone_form").css("display","inline-block");
					$(".phone_must").css("display","none");
					$("#phone_checkbox").prop("checked",false);
				} else { //공백
					$(".phone_form").css("display","none");
					$(".phone_must").css("display","inline-block");
					$("#phone_checkbox").prop("checked",false);
				}
			},
			error:function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
});

function join() {
	var userid = $("#userid").val();
	var userpw = $("#userpw").val();
	var userpw2 = $("#userpw2").val();
	var username = $("#username").val();
	var email = $("#email").val();
	var phone = $("#phone").val();
	var zipcode = $("#sample2_postcode").val();
	var detailaddr = $("#sample2_detailAddress").val();
	
	$.ajax({
		url:"/member/idCheck",
		type:"post",
		data:{userid:userid},
		success:function(count) {
			if(count == 0 && userid.length > 0) { //사용 가능한 아이디
				$(".id_form").css("display","none");
				$(".id_pass").css("display","inline-block");
				$(".id_over").css("display","none");
				$(".id_must").css("display","none");
				$("#id_checkbox").prop("checked",true);
			} else if(count == 1 && userid.length > 0){ //중복된 아이디
				$(".id_form").css("display","none");
				$(".id_pass").css("display","none");
				$(".id_over").css("display","inline-block");
				$(".id_must").css("display","none");
				$("#id_checkbox").prop("checked",false);
			} else if(count == 9 && userid.length > 0) { //아이디 형식
				$(".id_form").css("display","inline-block");
				$(".id_pass").css("display","none");
				$(".id_over").css("display","none");
				$(".id_must").css("display","none");
				$("#id_checkbox").prop("checked",false);
			} else { //공백
				$(".id_form").css("display","none");
				$(".id_pass").css("display","none");
				$(".id_over").css("display","none");
				$(".id_must").css("display","inline-block");
				$("#id_checkbox").prop("checked",false);
			}
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	$.ajax({
		url:"/member/pwCheck",
		type:"post",
		data:{userpw:userpw},
		success:function(count) {
			if(count == 0 && userpw.length > 0) { //사용 가능한 비밀번호
				$(".pw_form").css("display","none");
				$(".pw_must").css("display","none");
				$("#pw_checkbox").prop("checked",true);
			} else if(count == 9 && userpw.length > 0) { //비밀번호 형식
				$(".pw_form").css("display","inline-block");
				$(".pw_must").css("display","none");
				$("#pw_checkbox").prop("checked",false);
			} else { //공백
				$(".pw_form").css("display","none");
				$(".pw_must").css("display","inline-block");
				$("#pw_checkbox").prop("checked",false);
			}
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	$.ajax({
		url:"/member/pw2Check",
		type:"post",
		data:{userpw:userpw,userpw2:userpw2},
		success:function(count) {
			if(count == 0 && userpw2.length > 0) { //비밀번호 일치
				$(".pw2_same").css("display","none");
				$(".pw2_must").css("display","none");
				$("#pw2_checkbox").prop("checked",true);
			} else if(count == 9 && userpw2.length > 0) { //비밀번호 불일치
				$(".pw2_same").css("display","inline-block");
				$(".pw2_must").css("display","none");
				$("#pw2_checkbox").prop("checked",false);
			} else { //공백
				$(".pw2_same").css("display","none");
				$(".pw2_must").css("display","inline-block");
				$("#pw2_checkbox").prop("checked",false);
			}
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	$.ajax({
		url:"/member/nameCheck",
		type:"post",
		data:{username:username},
		success:function(count) {
			if(count == 0 && username.length > 0) { //이름 확인
				$(".name_form").css("display","none");
				$(".name_must").css("display","none");
				$("#name_checkbox").prop("checked",true);
			} else if(count == 9 && username.length > 0) { //이름 형식
				$(".name_form").css("display","inline-block");
				$(".name_must").css("display","none");
				$("#name_checkbox").prop("checked",false);
			} else { //공백
				$(".name_form").css("display","none");
				$(".name_must").css("display","inline-block");
				$("#name_checkbox").prop("checked",false);
			}
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	$.ajax({
		url:"/member/emailCheck",
		type:"post",
		data:{email:email},
		success:function(count) {
			if(count == 0 && email.length > 0) { //이메일 확인
				$(".email_form").css("display","none");
				$(".email_over").css("display","none");
				$(".email_must").css("display","none");
				$("#email_checkbox").prop("checked",true);
			} else if(count == 1 && email.length > 0){ //중복된 이메일
				$(".email_form").css("display","none");
				$(".email_over").css("display","inline-block");
				$(".email_must").css("display","none");
				$("#email_checkbox").prop("checked",false);
			} else if(count == 9 && email.length > 0) { //이메일 형식
				$(".email_form").css("display","inline-block");
				$(".email_over").css("display","none");
				$(".email_must").css("display","none");
				$("#email_checkbox").prop("checked",false);
			} else { //공백
				$(".email_form").css("display","none");
				$(".email_over").css("display","none");
				$(".email_must").css("display","inline-block");
				$("#email_checkbox").prop("checked",false);
			}
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	$.ajax({
		url:"/member/phoneCheck",
		type:"post",
		data:{phone:phone},
		success:function(count) {
			if(count == 0 && phone.length > 0) { //이름 확인
				$(".phone_form").css("display","none");
				$(".phone_must").css("display","none");
				$("#phone_checkbox").prop("checked",true);
			} else if(count == 9 && phone.length > 0) { //이름 형식
				$(".phone_form").css("display","inline-block");
				$(".phone_must").css("display","none");
				$("#phone_checkbox").prop("checked",false);
			} else { //공백
				$(".phone_form").css("display","none");
				$(".phone_must").css("display","inline-block");
				$("#phone_checkbox").prop("checked",false);
			}
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	$.ajax({
		url:"/member/zipCheck",
		type:"post",
		data:{zipcode:zipcode,detailaddr:detailaddr},
		success:function(count) {
			if(count == 0) { //우편번호 찾기 x
				$(".addr_form").css("display","inline-block");
				$(".addr_must").css("display","none");
			} else if(count == 1){ //상세주소 입력 x
				$(".addr_form").css("display","none");
				$(".addr_must").css("display","inline-block");
			} else { //우편번호 찾기, 상세주소 입력 o
				$(".addr_form").css("display","none");
				$(".addr_must").css("display","none");
			}
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	if($("input[name=id_checkbox]").prop("checked") == false) {
		$("input[name=userid]").focus();
		return false;
	}
	
	if($("input[name=pw_checkbox]").prop("checked") == false) {
		$("input[name=userpw]").focus();
		return false;
	}
	
	if($("input[name=pw2_checkbox]").prop("checked") == false) {
		$("input[name=userpw2]").focus();
		return false;
	}
	
	if($("input[name=name_checkbox]").prop("checked") == false) {
		$("input[name=username]").focus();
		return false;
	}
	
	if($("input[name=email_checkbox]").prop("checked") == false) {
		$("input[name=email]").focus();
		return false;
	}
	
	if($("input[name=phone_checkbox]").prop("checked") == false) {
		$("input[name=phone]").focus();
		return false;
	}
	
	if($("#sample2_postcode").val() == "") {
		return false;
	}
	
	if($("#sample2_detailAddress").val() == "") {
		sample2_detailAddress.focus();
		return false;
	}
	
	document.submit();
}