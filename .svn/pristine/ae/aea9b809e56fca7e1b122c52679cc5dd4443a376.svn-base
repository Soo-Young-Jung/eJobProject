<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <style>
    	.form-group col-md-12{
    		width : 100px;
    	}
    </style>
    
<form:form commandName="member" method="post" action="${pageContext.request.contextPath }/join/entjoin.do" class="register">
	<div class="container">
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">아이디</label>
					<input type="text" class="form-control" id="mem_id" name="mem_id" aria-describedby="emailHelp" placeholder="ID">
					<span class="token tag" id="msgArea"></span>
					<button id="chkBtn" class="btn btn-danger-outlined" type="button">중복검사</button>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">비밀번호</label>
				<input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="Password">
				<form:errors  path="mem_pass" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">이름</label>
				<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="Name">
				<form:errors  path="mem_name" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">이메일</label>
				<input type="email" class="form-control" id="mem_mail" name="mem_mail" placeholder="Email">
				<form:errors  path="mem_mail" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">전화번호</label>
				<input type="tel" class="form-control" id="mem_tel" name="mem_tel" placeholder="Tel">
				<form:errors  path="mem_tel" element="span" cssClass="error" />
			</div>
		</div>
		<br><br>
		<input type="hidden" id="mem_div" name="mem_div" value="E">
		<button id="joinBtn" type="submit" class="btn btn-default btn-danger btn-block">다음</button>
	</div>
	
	
</form:form>

<script>
	$('#chkBtn').on('click', function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/login/genCheck.do",
			data : {"mem_id" : $('#mem_id').val() },
			method : "post",
			dataType : "json",
			success : function(resp){
				if(resp.success){
					$('#msgArea').html(resp.message);
					$('#joinBtn').removeAttr("disabled");
				}else{
					$('#msgArea').html(resp.message);
					$('#joinBtn').attr("disabled","disabled");
				}
			}
		})
	})
	
</script>
	
