<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#name{
		font-size : 40px;
	}
	span, p, .st {
		font-size : 17px;
	}
	.dashboard{
		clear: both;
    	padding-top: 24px;
    	width: 100%;
	}
	table{
		text-align : center;
	}
	.Btndiv{
		text-align : right;
	}
	#name{
		color : black;
	}
	.row{
		margin-left : 40px;
	}
/* 	#Rtitle{ */
/* 		color : gray; */
/* 	} */
</style>
    
<div class="container">
	
	<div class="heading ">
		<h2 id="Rtitle" class="heading-v1-title">${resume.er_title }</h2>
		<hr color="black">
	</div>
	<br><br>
	
	<div class="row">
		&nbsp;&nbsp;&nbsp;<strong id="name">${resume.er_name }</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;<span>${resume.er_age } &nbsp; / &nbsp; </span> <span>&nbsp;${resume.er_gender eq "M" ? "남" : "여" } &nbsp; / &nbsp;</span>
		<span id="jobsearch">&nbsp; </span>
		
	</div>
	<br><br>
	<div class="row">
		&nbsp;&nbsp;&nbsp;<span><i class="fa fa-envelope-o"></i>&nbsp;${member.mem_mail } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		&nbsp;&nbsp;&nbsp;<span><i class="fa fa-mobile-phone"></i>&nbsp;${member.mem_tel } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		&nbsp;&nbsp;&nbsp;<span><i class="fa fa-phone"></i>&nbsp;${member.mem_tel } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	</div>
	<br>
	<div class="row">
		&nbsp;&nbsp;&nbsp;<span><i class="fa fa-home"></i>&nbsp;${member.mem_add1 } ${member.mem_add2 }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	</div>
	
	<br><br><br><br><br><br>
	<table class="table table-based">
		<tr>
			<td>
				<strong class="st">학력사항</strong>
				<p id="feb"></p>
			</td>
			<td>
				<strong class="st">경력사항</strong>
				<p>${resume.er_career }</p>
			</td>
			<td>
				<strong class="st">관심분야</strong>
				<p>${resume.er_interest }</p>
			</td>
			<td>
				<strong class="st">포트폴리오</strong>
				<c:url value='/bloghome/download.do' var="downloadURL">
								<c:param name="what" value="${resume.er_no }"/>
								<c:param name="div" value="MY"/>
				</c:url>
				<p><a href="${downloadURL }">${att.file_orgn }</a></p>
			</td>
		</tr>
	</table>
	<c:if test="${resume.er_career eq '경력' }">
		<br><br><br>
		<table class="table table-based">
			<tr>
				<td>
					<strong class="st">회사명</strong>
					<p>${career.ca_name }</p>
				</td>
				<td>
					<strong class="st">직책</strong>
					<p>${career.ca_position }</p>
				</td>
				<td>
					<strong class="st">입사일</strong>
					<p>${career.ca_join }</p>
				</td>
				<td>
					<strong class="st">퇴사일</strong>
					<p>${career.ca_retire }</p>
				</td>
			</tr>
		</table>
	</c:if>
	<br><br><br>
	<form id="deleteForm" action="${pageContext.request.contextPath}/mypage/deleteResume.do" method="post">
		<input type="hidden" name="er_no" value="${resume.er_no }">
		<input type="hidden" name="mem_id" value="${resume.mem_id }">
	</form>
		<div class="Btndiv">
			<button id="listBtn" class="btn btn-danger-outlined">목록으로</button>&nbsp;&nbsp;&nbsp;
			<button id="editBtn" class="btn btn-danger-outlined">수정</button>&nbsp;&nbsp;&nbsp;
			<button id="delBtn" class="btn btn-danger-outlined">삭제</button>&nbsp;&nbsp;&nbsp;
		</div>
	
<!-- 	<div class="dashboard"> -->
<!-- 		<ul> -->
<!-- 			<li> -->
				
<!-- 			</li> -->
<!-- 			<li> -->
				
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
</div>

<script>
	if(${resume.er_jobsearch eq "1"}){
		$('#jobsearch').html("구직준비중(재학생)")
	}
	
	if(${resume.er_jobsearch eq "2"}){
		$('#jobsearch').html("구직중")
	}
	
	if(${resume.er_jobsearch eq "3"}){
		$('#jobsearch').html("재직중")
	}
	
	if(${resume.er_feb eq "1"}){
		$('#feb').html("초등학교 졸업");
	}
	
	if(${resume.er_feb eq "2"}){
		$('#feb').html("중학교 졸업");
	}
	
	if(${resume.er_feb eq "3"}){
		$('#feb').html("고등학교 졸업");
	}
	
	if(${resume.er_feb eq "4"}){
		$('#feb').html("대학교/대학원 졸업");
	}
	
	$('#editBtn').on('click', function(){
		location.href = "${pageContext.request.contextPath}/mypage/editResume.do?what=" + ${resume.er_no};
	})
	
	$('#listBtn').on('click', function(){
		location.href = "${pageContext.request.contextPath}/mypage/resumeStatus.do?mem_id=${mem_id}";
	})
	
	$('#delBtn').on('click', function(){
		$('#deleteForm').submit();
	})
</script>