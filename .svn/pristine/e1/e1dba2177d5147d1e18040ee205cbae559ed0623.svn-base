<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.form-control {
		width: 400px;
	}
	button[type='submit']{
		width: 200px;
		height : 50px;
	}
	button[type='button']{
		width: 200px;
		height : 50px;
	}
	.container{
		width: 100%;
 		text-align: center;
	}
	
	#aa{
		display: inline-block;
	}
</style>
<div class="container">
	<h2>본인인증</h2>
	<br><br>
	<h6 align="center">회원님의 정보를 안전하게 보호하기 이메일 인증을 해주시기 바랍니다</h6>
	<br><br>
	<div id="aa">
		<form id="authForm">
			<div class="row">
				<input  class="form-control" type="email" name="mail" id="mail" placeholder="이메일 입력"/>&nbsp;&nbsp;
				<button class="btn btn-danger-outlined" type="submit">전송</button>
			</div>
		</form>
		<span id="mailcode"></span>
		<div class="row">
			<input class="form-control" type="text" name="code" id="code" placeholder="코드입력">&nbsp;&nbsp;
			<button class="btn btn-danger-outlined" id="okBtn" type="button">확인</button>
		</div>
	</div>
<form id="okForm" action="${pageContext.request.contextPath}/mypage/loginrecord.do">
	<input type="hidden" name="mem_id" value="${mem_id }">
</form>
</div>
<script>
	$(function(){
		$('#okBtn').hide();
	})
	code1 = null;
	$('#authForm').on('submit', function(event){
		event.preventDefault();
		var data = $(this).serialize();
		$.ajax({
			url : "${pageContext.request.contextPath }/mypage/auth.do",
			data : data,
			method : "post",
			success : function(resp){
// 				$('#mailcode').html(resp.mailcode);
				code1 = resp.mailcode1;
				alert("메일전송이 완료되었습니다");
// 				alert(code);
				$('#okBtn').show();
			},
			error : function(errorResp) {
				console.log(errorResp.status + ", "
						+ errorResp.responseText)
			}
		})
	})
	
	
	$('#okBtn').on('click', function(){
		var code = $('#code').val();
		var mailcode = $('#mailcode').text();
		
		if(code == code1){
			$('#okForm').submit();		
		}
		
	})
	
</script>