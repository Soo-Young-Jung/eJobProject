<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <style>
    	.form-group col-md-12{
    		width : 100px;
    	}
    </style>
    
<form:form  id="editForm" commandName="member" method="post" action="${pageContext.request.contextPath }/mypage/editEnt.do" class="register" enctype="multipart/form-data">
	<div class="container">
		<h2>개인정보 관리</h2>
		<br><br>
		<table class="table table-bordered">
		<input type="hidden" name="mem_pass" value="${member.mem_pass }"/>
		<tr>
			<td id="t1" align="center" >
					<label class="col-md-12 col-form-label">아이디</label>
			</td>
			<td><input class="form-control" type="text" name="mem_id" placeholder="ID" value="${member.mem_id}" readonly/></td>
		</tr>
		<tr>
			<td id="t1" align="center" >
					<label class="col-md-12 col-form-label">이름</label>
			</td>
			<td><input class="form-control" type="text" name="mem_name" placeholder="NAME" value="${member.mem_name}" /></td>
		</tr>
		<tr>
			<td id="t1" align="center" >
					<label class="col-md-12 col-form-label">이메일</label>
			</td>
			<td><input class="form-control" type="text" name="mem_mail" placeholder="MAIL" value="${member.mem_mail}" /></td>
		</tr>	
		<tr>
			<td id="t1" align="center" >
					<label class="col-md-12 col-form-label">전화번호</label>
			</td>
			<td><input class="form-control" type="text" name="mem_tel" placeholder="TEL" value="${member.mem_tel}" /></td>
		</tr>
		<tr>
				<td id="t1" align="center" ><label class="col-md-12 col-form-label">프로필 사진</label></td>
				<td>
					<c:choose>
						<c:when test="${member.mem_profileBase64 eq null}">
							<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="application"/>
						</c:when>
					<c:otherwise>
						<c:set var="Img" value="data:image/*;base64,${member.mem_profileBase64 }" scope="application"/>
					</c:otherwise>
					</c:choose>
					
 					<img  src="${Img }" style="width: 300px; height:390px; margin-right: 10px; margin-left: 10px;"/>	
					<input type="file" class="form-control" name="mem_image"  />
				</td>
			</tr>
	
		</table>
		<br><br>
			<button id="editBtn" type="submit" class="btn btn-danger-outlined">수정</button>
		</div>
</form:form>

<script>
	
$('#editBtn').on('click', function(){
	$('#editForm').submit();
//    	if(${success}){
//    		alert("수정에 성공하였습니다");
//    	}else{
//    		alert("${message}");
//    	}
})
</script>
	
