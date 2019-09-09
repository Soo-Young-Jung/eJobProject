<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.img-full {
	width: 50%;
	height: 50%;
}

.card_img {
	text-align: center;
}

.card-block {
	text-align: center;
}
</style>
<div>
	<br>
	<br>
</div>
<div class="container">
	<div class="card-deck">
		<div class="card">
			<div class="card_img">
				<img class="img-full"
					src="${pageContext.request.contextPath }/assets/img/logo2.png">
			</div>
				<c:choose>
					<c:when test="${member.mem_div eq 'G' }">
						<div class="card-block">
							<h3 class="card-title">${member.mem_id }님 회원가입을 환영합니다</h3>
							<br><br>
							<a href="${pageContext.request.contextPath }/"
								class="btn btn-danger">홈으로</a>
							<a	href="${pageContext.request.contextPath }/login/genlogin.do"
								class="btn btn-danger">로그인</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="card-block">
							<h3 class="card-title">${ent.ent_name }님 회원가입을 환영합니다</h3>
							<a href="${pageContext.request.contextPath }/"
								class="btn btn-danger">홈으로</a> 
							<a href="${pageContext.request.contextPath }/login/genlogin.do"
								class="btn btn-danger">로그인</a>
						</div>
					</c:otherwise>
				</c:choose>
		</div>


	</div>
</div>

