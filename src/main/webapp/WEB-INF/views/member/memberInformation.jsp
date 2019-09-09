<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${pageContext.request.contextPath }/assets/plugins/syotimer/jquery.syotimer.min.js"></script>

<style>
	#imgtd{
		width : 300px;
	}

</style>

	<c:choose>
		<c:when test="${member.mem_profileBase64 eq null}">
			<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="application"/>
		</c:when>
		<c:otherwise>
			<c:set var="Img" value="data:image/*;base64,${member.mem_profileBase64 }" scope="application"/>
		</c:otherwise>
	</c:choose>
	
	
	
	
	
	
	
	
	
	<br><br>
	
	
	<div class="container" >	
	<div class="row justify-content-center"  >
	

	
	<div style="height: auto; width: 100%; border:2px solid #c8c8c8;" >

	<h2>회원 상세정보</h2><br><br>
	<hr >
	<p><img style="width:50px" src="${pageContext.request.contextPath}/assets/img/이벤트1.png"/>${member.mem_id}</p>



<div class="container" >	
<div class="row justify-content-center"  >	


</div>
</div>

<div class="container" >
	
<div class="row justify-content-center"  >
	<table  style="width:800px" class="table table-striped" id="div">
	
		<tr>
			<td id="imgtd" rowspan="7">
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
			<td ><label>※ 아이디</label></td>
			<td>${member.mem_id}</td>		
		</tr>
<!-- 		<tr> -->
<!-- 			<td><label>분야</label></td> -->
<%-- 			<td>${event.evt_title}</td>	 --%>
<!-- 		</tr> -->
		<tr>
			<td><label>※  회원 이름</label></td>
			<td>${member.mem_name}</td>	
		</tr>
		<tr>
			<td><label>※  회원 메일</label></td>
			<td>${member.mem_mail}</td>	
		</tr>
		<tr>
			<td><label>※  전화번호</label></td>
			<td>${member.mem_tel}</td>	
		</tr>
		<tr>
			<td><label>※  주소</label></td>
			<td>${member.mem_add1}</td>	
		</tr>
		<tr>
			<td><label>※  상세주소</label></td>
			<td>${member.mem_add2}</td>	
		</tr>
			
	</table>	
</div>
	</div>
	
	

	
	

	
	
	</div>
	
</div>
</div>


	

	
	
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

	