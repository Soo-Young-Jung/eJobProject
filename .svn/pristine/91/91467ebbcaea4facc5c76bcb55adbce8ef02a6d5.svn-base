<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="${pageContext.request.contextPath }/assets/plugins/syotimer/jquery.syotimer.min.js"></script>

<style>
	h1{
		color : gray;
	}
	#imgtd{
		width: 300px;
		height:400px;
	}
	#div{
		color : white;
		border: 5px solid red;
	
		width: 100%;
		text-align : center;
		
	}
	label{
		font-size : 1.5em;
	}
	td{
		width : 300
	}
</style>


								<c:choose>
									<c:when test="${ent_info.mem_profileBase64 eq null}">
										<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="application"/>
									</c:when>
									<c:otherwise>
										<c:set var="Img" value="data:image/*;base64,${ent_info.mem_profileBase64 }" scope="application"/>
									</c:otherwise>
								</c:choose>
<%-- 								<span><img  class="img" style="width: 200px; height:250px; margin-right: 10px; margin-left: 10px;" src="${Img }"/></span><br> --%>
						<div class="card">
	
	
	
<br><br><br>
<div class="container" >
<h1>기업 정보</h1>		
<div class="row"  >
	<table class="table table-inverse" id="div">
	
		<tr>
			<td id="imgtd" rowspan="3">
			<div class="display-single_element">

		
			<div class="col-md-4">
				<div class="card" style="width: 300px; height:390px; margin-right: 10px; margin-left: 10px;">
					<div class="card_img">
						<a href="${Img }" data-fancybox="images">
						    <img class="img-full" src="${Img }" style="width: 300px; height:390px; margin-right: 10px; margin-left: 10px;"/>
						    <div class="hover-overlay effect-transformY">
						    	<h4 class="">Image Title Here</h4>
						    	
						    	
						    </div>
	
						</a>
					</div>
					

				</div>
			</div>
	</div>
	</td>
			<td ><label>기업이름</label></td>
			<td>${ent_info.ent_name}</td>
			<td><label>대표이름</label></td>
			<td>${ent_info.ent_ceo}</td>
		</tr>
		<tr>
			<td><label>우편번호</label></td>
			<td>${ent_info.ent_addr1}</td>
			<td><label>상세주소</label></td>
			<td>${ent_info.ent_ceo}</td>
		</tr>
		<tr>
			<td><label>기업전화번호</label></td>
			<td>${ent_info.ent_tel}</td>
			<td><label>기업메일</label></td>
			<td>${ent_info.ent_mail}</td>
		</tr>
	</table>	
</div>
	</div>



	
		<div class="card card-accordion">
			<div class="card-header" role="tab" id="heading1">
				<h6 class="mb-0">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
						채용 공고 보기
					</a>
				</h6>
			</div>
			<div id="collapse1" class="collapse show" role="tabpanel" aria-labelledby="heading1">
				<div class="card-block">
				<form action="<c:url value='/www'/>" >
					<table class="table table-striped">
					<thead>
						<tr>
							<td><label>공고 분류</label></td>
							<td><label>공고 제목</label></td>
							<td><label>공고 날짜</label></td>
							<td><label>마감 날짜</label></td>
							<td><label>경력</label></td>
							<td><label>성별</label></td>
							<td><label>급여</label></td>
						</tr>
					</thead>
					<tbody>
						<c:set var="announceList" value="${aaa}"/>
						<c:choose>
							<c:when test="${not empty announceList }">
								<c:forEach var="announce" items="${announceList }">
									<tr>
										<td>${announce.annl_category}</td>
										<td>${announce.annl_title }</td>
										<td>${announce.annl_date }</td>
										<td>${announce.annl_closeing }</td>
										<td>${announce.annl_career }</td>
										<td>${announce.annl_gender }</td>
										<td>${announce.annl_sal }</td>
										<td><input type="hidden" name="annl_no" value="${announce.annl_no}"/>
										<button type="submit">버튼</button></td>
								
									</tr>
								</c:forEach>
						
							</c:when>
						</c:choose>
						
					</tbody>
						
						
					</table>
					</form>
				</div>
			</div>
		</div>
	




	<div class="display-single_element">
		
			<div class="count-down bg-image titled circled" style="background-image: url('${pageContext.request.contextPath }/assets/img/promo-1.jpg');">
				<h1>남은 기간</h1>
				<div class="timer"></div>
			</div>
		</div>
		
		
		
		<footer class="footer element-footer">
		 <div class="container">
			 <div class="row justify-content-center">
				<div class="col-md-7">
				 	<div class="text-center copyright ">
						<p> © 2019 Copyright Biznex Bootstrap Template by <a class="text-primary"  target="_blank">Abdus</a>.</p>
				 	</div>
				</div>
			 </div>
		 </div>
		</footer>
		

<script>
		$('.timer').syotimer({
			year: 2019,		
			month: 9,
			day: 21,
			hour: 20,
			minute: 30
		});
		
			var $animation_elements = $('.animated');
			var $window = $(window);

			function check_if_in_view() {
				'use strict';
				var window_height = $window.height();
				var window_top_position = $window.scrollTop();
				var window_bottom_position = (window_top_position + window_height);

				$.each($animation_elements, function() {
					var $element = $(this);
					var element_height = $element.outerHeight();
					var element_top_position = $element.offset().top;
					var element_bottom_position = (element_top_position + element_height);
					var animationType = $(this).attr("data-animation");

					//check to see if this current container is within viewport
					if ((element_bottom_position >= window_top_position) && (element_top_position <= window_bottom_position)) {
						$element.addClass(animationType);
					} else {
						$element.removeClass(animationType);
					}
				});
			}

			$window.on('scroll resize', check_if_in_view);
			$window.trigger('scroll');
			
			


</script>


	









