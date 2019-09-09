<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.col-md-6{
		width : 400px;
		height : 300px;
		margin-bottom: 50px;
	}
	#entImg{
		width : 340px;
		height : 130px;
	}
	.card_img{
		text-align : center;
	}
</style>
<div class="container">
<br><br>
<div class="row">

<c:forEach var="ann" items="${announceList }">
<%-- <c:forEach var="profile" end="2" items="${profileList }"> --%>
						<c:set var="profileImg"
							value="data:image/*;base64,${ann.mem_profileBase64}"
							scope="page" />

<div class="col-md-6 col-lg-4">
				<div class="card">
					<div class="card_img">
						<a href="project-style-1.html">
<%-- 							<c:if test="${profile.mem_id} eq ${ann.mem_id }"> --%>
						    	<img id="entImg" class="img-full initial loaded"  src="${profileImg }" data-was-processed="true" style="width: 150px;">
<%-- 						    </c:if> --%>
									<br><br>
						    		<h4 class="img_overlay-title">${ann.annl_title }</h4>
						    		<p class="img_overlay-desc">${ann.annl_date }일부터<br>${ann.annl_closeing }일까지 </p>
						</a>
						<div class="hover-overlay effect-scale"><a href="${pageContext.request.contextPath }/announce/announceView.do?annl_no=${ann.annl_no}">
								</a><div class="img_overlay-container"><a href="${pageContext.request.contextPath }/announce/announceView.do?annl_no=${ann.annl_no}">
						    		</a><div class="img_overlay-icon"><a href="project-style-1.html"></a>
<%-- 							    		<a href="${profileImg }" class="icon link quick_view" data-fancybox="quick-view1" data-qw-form="qw-form-1"><i class="fa fa-search"></i></a> --%>
							    		<a href="${pageContext.request.contextPath }/announce/announceView.do?annl_no=${ann.annl_no}" class="icon link"><i id="plus" class="fa fa-search"></i></a>
							    		<a href="${pageContext.request.contextPath }/announce/announceView.do?annl_no=${ann.annl_no}"><span style="color : white;">자세히보기</span></a>
										<span class="hidden">
											<a class="quick_view" data-fancybox="quick-view1" href="assets/img/projetcs/g1.jpg">#2</a>
										</span>
						    		</div>
						    	</div>
							</div>
						
					</div>
					<div id="qw-form-1" class="hidden">
						<div class="bg-image" style="background-image: url('assets/img/projetcs/bg-projects.jpg');">
							<div class="project_specification">
								<h2 class="text-primary">Project Details</h2>
								<div class="row">
									<div class="col-4 ">Clients:</div>
									<div class="col-8 ">Jake Hemswire</div>
								</div>
								<div class="row">
									<div class="col-4 ">Category:</div>
									<div class="col-8 ">Investment,Consulting</div>
								</div>
								<div class="row">
									<div class="col-4 ">Date:</div>
									<div class="col-8 ">20 June, 2017</div>
								</div>
								<div class="row">
									<div class="col-4 ">Status:</div>
									<div class="col-8 ">In Progress</div>
								</div>
								<div class="row">
									<div class="col-4 ">Website: </div>
									<div class="col-8  text-primary">www.info@example.com</div>
								</div>
							</div>
						</div>
		            </div>
				</div>
			</div>
			</c:forEach>
<%-- 			 </c:forEach> --%>
			
			</div>
			</div>