<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
		.img-full{
			width : 50%;
			height : 50%;
		}
		.card_img{
			text-align : center;
		}
	</style>
	<div>
		<br><br>
	</div>
<div class="container">
	<div class="card-deck">
	  <div class="card">
		<div class="card_img">
			<img class="img-full" src="${pageContext.request.contextPath }/assets/img/login/genmem.png" alt="일반회원">
		</div>
		<div class="card-block">
		  <h3 class="card-title">일반 회원가입</h3>
		  <p class="card-text">일반 사용자를 위한 회원가입 페이지 입니다.</p>
		  <a href="${pageContext.request.contextPath }/join/genJoin.do" class="btn btn-danger">회원가입 바로가기</a>
		</div>
	  </div>
	 <div class="card">
	   <div class="card_img">
		<img class="img-full" src="${pageContext.request.contextPath }/assets/img/login/enterprise.png" alt="기업회원">
	   </div>
	   <div class="card-block">
		 <h3 class="card-title">기업 회원가입</h3>
		 <p class="card-text">기업 사용자를 위한 회원가입 페이지 입니다.</p>
		 <a href="${pageContext.request.contextPath }/join/entJoin.do" class="btn btn-danger">회원가입 바로가기</a>
	   </div>
	 </div>
	
	</div>
</div>

