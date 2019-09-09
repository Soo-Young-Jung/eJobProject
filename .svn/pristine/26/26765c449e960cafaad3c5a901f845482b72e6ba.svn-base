<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="mobile-sticky-header-overlay"></div>
	<div class="main-wrapper project-style-2">

<!-- BREDCRUMB -->
<section class="bredcrumb">
	<div class="bg-image text-center" style="background-image: url('assets/img/bg-bredcrumb.jpg');">
		<h1>${ent_info.ent_name} 기업 소개</h1>
	</div>
</section>
<section class="project-details">
	<div class="container">
		<h4>${ent_info.ent_name}</h4>
		<div class="row">
			<div class="col-md-6">
				<ul class="styled_list one-column">
					<li class=""><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 대표 : ${ent_info.ent_ceo}</li>
					<li class=""><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 회사 분류 : ${ent_info.ent_category}</li>
					<li class=""><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 우편번호 : ${ent_info.ent_addr1}</li>
					<li class=""><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 상세주소 : ${ent_info.ent_addr2}</li>
					<li class=""><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 전화번호 : ${ent_info.ent_tel}</li>
					<li class=""><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 기업메일 : ${ent_info.ent_mail}</li>
				</ul>
			</div>
			<div class="col-md-5 ml-auto">
				<c:choose>
					<c:when test="${ent_info.mem_profileBase64 eq null}">
						<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="application"/>
					</c:when>
					<c:otherwise>
						<c:set var="Img" value="data:image/*;base64,${ent_info.mem_profileBase64}" scope="application"/>
					</c:otherwise>
				</c:choose>
				<img class="img-full" src="${Img}" alt="Card image" style="width: 350px; max-height: 350px">
			</div>
		</div>
	</div>
</section>
</div>
