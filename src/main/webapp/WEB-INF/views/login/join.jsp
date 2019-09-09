<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <style>
    	.form-group col-md-12{
    		width : 100px;
    	}
    </style>
    
<form:form commandName="member" method="post" action="${pageContext.request.contextPath }/join/join.do" class="register">
	<div class="container">
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">아이디</label>
				<c:choose>
					<c:when test="${not empty kakaoId }">
						<input type="text" class="form-control" id="mem_id" name="mem_id" aria-describedby="emailHelp" placeholder="ID"
							value="${kakaoId }">
					</c:when>
					<c:when test="${not empty naverId }">
						<input type="text" class="form-control" id="mem_id" name="mem_id" aria-describedby="emailHelp" placeholder="ID"
							value="${naverId }">
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control" id="mem_id" name="mem_id" aria-describedby="emailHelp" placeholder="ID" value="${member.mem_id }">
					</c:otherwise>
				</c:choose>
					<span class="token tag" id="msgArea"></span>
					<form:errors  path="mem_id" element="span" cssClass="error" />
					<button id="chkBtn" class="btn btn-danger-outlined" type="button">중복검사</button>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">비밀번호</label>
				<input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="Password" value="${member.mem_pass }">
				<form:errors  path="mem_pass" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">이름</label>
				<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="Name" value="${member.mem_name }">
				<form:errors  path="mem_name" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">이메일</label>
				<input type="email" class="form-control" id="mem_mail" name="mem_mail" placeholder="Email" value="${member.mem_mail }">
				<form:errors  path="mem_mail" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">전화번호</label>
				<input type="tel" class="form-control" id="mem_tel" name="mem_tel" placeholder="Tel" value="${member.mem_tel }">
				<form:errors  path="mem_tel" element="span" cssClass="error" />
			</div>
		</div>
		<br><br>
		<input type="hidden" id="mem_div" name="mem_div" value="G">
		<button id="joinBtn" type="submit" class="btn btn-default btn-danger btn-block">회원가입</button>
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
	
// 	$('#joinBtn').on('submit', function(event){
// 		event.preventDefault();
// 		var data = $(this).serialize();
// 		$.ajax({
// 			url : "${pageContext.request.contextPath}//join/join.do",
// 			data : data,
// 			method : "post",
// 			dataType : "json",
// 			success : function(resp){
// 				$('#msgArea').html("${message}");
// 			}
// 		})
		
// 		return false;
// 	})
	
</script>
	
