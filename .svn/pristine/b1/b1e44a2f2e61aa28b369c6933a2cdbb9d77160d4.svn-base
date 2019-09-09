<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.kakao, #naverIdLogin{
		text-align : center;
	}
	.btn-zip{
		margin-left : auto;
		margin-right : auto;
		width : 80%;
	}
	.input-zip{
		margin-left : auto;
		margin-right : auto;
		width : 80%;
	}
	#naverpng{
		width : 220px;
	}
	#resultModal{
		margin-top: 5%;
	}
	#openid{
		font-size : 25px;
	}
	.hidden{
		display : none;
	}

</style>
<div>
	<br><br><br>
	<br>
</div>
<form action="${pageContext.request.contextPath }/login/genlogin.do" method="post" class="register">
	<div  class="container">
		<div class="input-zip">
		<c:set var="idCookie" value="${cookie.loginId.value }"/>
			<div class="form-group col-md-12">
				<input type="text" class="form-control" id="mem_id" name="mem_id" aria-describedby="emailHelp" placeholder="ID"
					${not empty cookie.loginId } ? value="${cookie.loginId.value}" : "">
			</div>
			<div class="form-group col-md-12">
				<input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="Password">
			</div>
		</div>
		<div class="btn-zip">
			<button id="loginBtn" type="submit" class="btn btn-default btn-danger btn-block">로그인</button>
			<button id="joinBtn" type="button" class="btn btn-default btn-danger btn-block">회원가입</button>
		</div>
		<div class="input-zip">
			<div class="form-check col-md-6">
				<input id="checkbox-2" class="checkbox-custom form-check-input" name="saveId" value="idSave" type="checkbox"
				  ${not empty idCookie ? "checked" : ""} />
				<label for="checkbox-2" class="checkbox-custom-label form-check-label ">Remember me</label>
			</div>
			<div class="col-md-9 offset-md-3 text-right">
				<a id="findid" data-toggle="modal" data-target="#idModal" class="btn-link">Forgot id ?</a><br>
				<a id="findpass" data-toggle="modal" data-target="#passModal" class="btn-link">Forgot password ?</a>
			</div>
		</div>
		<br>
        </div>
		<span class="or text-center">OR</span>
		<div class="kakao">
			<a class="text-center" href="https://kauth.kakao.com/oauth/authorize?client_id=6bac559221453fbd9b9a548e88c6622d&redirect_uri=http://localhost/eJobProject/kakao/login.do&response_type=code">
	            <img src="${pageContext.request.contextPath }/img/kakao_account_login_btn_medium_narrow.png">
	        </a>
        </div>
        <br>
        <div id="naverIdLogin">
        	<a class="text-center" href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Yiwd1PDEhyRsA1fS2Cqd&redirect_uri=http%3A%2F%2Flocalhost%2FeJobProject%2Flogin%2Fnaverlogin.do&state=hLiDdL2uhPtsftcU">
	            <img id="naverpng" src="${pageContext.request.contextPath }/assets/img/naverlogin.PNG">
	        </a>
        </div>
<!-- <div id="naverIdLogin"></div> -->
	</form>
	

	
	<!--id Modal -->
		<div class="modal fade" id="idModal" tabindex="-1" role="dialog" aria-labelledby="idModalLabel">
		  <div class="modal-dialog">
		        	<form id="idForm">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span >&times;</span></button>
		        <h4 class="modal-title" id="idModalLabel">
		        	<label class="col-md-12 col-form-label">아이디 찾기</label>
		        </h4>
		      </div>
		      <div class="modal-body container">
		      <div class="form-group row">
		        <div class="col-md-4">
			        	<label class="col-md-12 col-form-label">이름</label>
			        	<input class="form-control" type="text" name="mem_name" placeholder="이름입력">
			        	<label class="col-md-12 col-form-label">이메일</label>
			        	<input class="form-control" type="text" name="mem_mail" placeholder="메일입력">
		        </div>
		      </div>
			  </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="idBtn">찾기</button>
		      </div>
		    </div>
		        	</form>
		  </div>
		</div>
		
		
		
		
		<!--pass Modal -->
		<div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="passModalLabel">
		  <div class="modal-dialog">
		        	<form id="passForm">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span >&times;</span></button>
		        <h4 class="modal-title" id="passModalLabel">
		        	<label class="col-md-12 col-form-label">비밀번호 찾기</label>
		        </h4>
		      </div>
		      <div class="modal-body container">
		      <div class="form-group row">
		        <div class="col-md-4">
			        	<label class="col-md-12 col-form-label">아이디</label>
			        	<input class="form-control" type="text" name="mem_id" placeholder="아이디입력">
			        	<label class="col-md-12 col-form-label">이름</label>
			        	<input class="form-control" type="text" name="mem_name" placeholder="이름입력">
			        	<label class="col-md-12 col-form-label">이메일</label>
			        	<input class="form-control" type="email" name="mem_mail" placeholder="메일입력">
		        </div>
		      </div>
			  </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="passBtn">찾기</button>
		      </div>
		    </div>
		        	</form>
		  </div>
		</div>
	
	
	
		<!--result Modal -->
		<div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span >&times;</span></button>
		        <h4 class="modal-title" id="resultModalLabel">
		        	<label class="col-md-12 col-form-label">아이디/비밀번호 찾기</label>
		        </h4>
		      </div>
		      <div class="modal-body container">
		      <div class="form-group row">
		        <div class="col-md-4">
		        	<c:if test="${success eq true}">
			        	<label class="col-md-12 col-form-label">회원님의 아이디는 '<span id="openid"></span>' 입니다.</label>
		        	</c:if>
		        	<c:if test="${success eq false}">
			        	<label class="col-md-12 col-form-label">회원님의 비밀번호는 '<span id="openid"></span>' 입니다.</label>
		        	</c:if>
		        </div>
		      </div>
			  </div>
		      <div class="modal-footer">
		        <button id="close" type="button" class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		<button id="resultBtn" data-toggle="modal" data-target="#resultModal"></button>
<script>
	$(function(){
		$('#resultBtn').hide();
	})
	var idForm = $('#idForm');
	$('#idBtn').on('click', function(){
		event.preventDefault();
		
		var data = idForm.serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/mypage/findId.do",
			data : data,
			method : "post",
			success : function(resp){
				if(resp.id == null){
					alert("입력하신 정보에 맞는 아이디가 존재하지 않습니다");
					return;
				}
				$('#idModal').modal("toggle");
				$('.modal-backdrop').remove()
				$('#openid').text(resp.id);
				$('#resultBtn').trigger('click');
			}
		})
	});
	
	
	var passForm = $('#passForm');
	$('#passBtn').on('click', function(){
		event.preventDefault();
		
		var data = passForm.serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/mypage/findPass.do",
			data : data,
			method : "post",
			success : function(resp){
				if(resp.pass == null){
					alert("입력하신 정보에 맞는 정보가 존재하지 않습니다");
					return;
				}
				$('#passModal').modal("toggle");
				$('.modal-backdrop').remove()
				$('#openid').text(resp.pass);
				$('#resultBtn').trigger('click');
			}
		})
	});
	
	$('#joinBtn').on('click', function(){
		location.href = "${pageContext.request.contextPath}/join/join.do";
	})
	
	
	$('#close').on('click', function(){
		$('#resultModal').modal('toggle');
		$('.modal-backdrop').remove()
	})
	
	if('${success}' == 'true'){
		alert("${message}");
	}
	
	
</script>

	
