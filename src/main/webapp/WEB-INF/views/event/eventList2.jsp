<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.anim_item{
		width:300px;
		margin:30px;
	}
	.card{
		width:300px;
		
		margin:10px;
	}
</style>

<!-- <div class="h300 bg-image bg-fixed text-center" style="background-image: url('assets/img/background.png');"> -->
<!-- 		<div class="overlay-content"> -->
<!-- 			<h1 class="text-white pt50 mb-2">Demo Title</h1> -->
<!-- 			<p class="text-white">Lorem ipsum dolor sit amet.</p>		 -->
<!-- 	</div> -->
<!-- </div> -->




	<button id="id1" class="btn btn-danger-outlined" type="submit" value="고졸">고졸</button>
	<button id="id2" class="btn btn-danger-outlined" type="submit" value="대재">대재</button>
	<button id="id3" class="btn btn-danger-outlined" type="submit" value="대졸">대졸</button>





<div class="container" >
<div class="row justify-content-center">
	<c:set value="${event}" var="eventList"/>
				<c:choose>
					<c:when test="${not empty eventList }">
						<c:forEach items="${eventList }" var="event">	
										
						<div class="card card-body text-center">
    			  <div class="card-ribbon card-ribbon-top card-ribbon-left bg-primary text-white">Popular</div>
     			 <h4 class="card-title">
     				  ${event.evt_title }
    			  </h4>
     			
								<c:choose>
									<c:when test="${event.evt_profileBase64 eq null}">
										<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="application"/>
									</c:when>
									<c:otherwise>
										<c:set var="Img" value="data:image/*;base64,${event.evt_profileBase64 }" scope="application"/>
									</c:otherwise>
								</c:choose>
								<span><img  class="img" style="width: 280px; height:180px; margin-right: 10px; margin-left: 10px;" src="${Img }"/></span><br>

							<span>${event.evt_date }</span> <span>${event.evt_closeing }</span><br>
							<span>${event.evt_content }</span>
								
								<span><button style="width:300px;" class="btn1 btn-sm mt-3 btn-primary" value="${event.evt_no }" >이벤트 보러가기!!</button></span>
						
    					</div>				
						</c:forEach>
					</c:when>
				</c:choose>
	</div>	
</div>




<script type="text/javascript">
	

	
	
	
	$(".btn1").on("click", function(){
	
		
	
 		location.href="<c:url value='/event/eventInformation.do'/>?id=" + $(this).prop("value");

	})
	
	
	
		/////////////////////////////////////////////////////////////////////
		// Animation on scroll
		/////////////////////////////////////////////////////////////////////
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
	

		
		
	$(".btn1").on("click", function(){

  		location.href="<c:url value='/event/eventInformation'/>?evt_no=" + $(this).prop("value");
	})
	
	$(".btn").on("click", function(){
		
		var a = $(this).prop("value");
		location.href="<c:url value='/event4'/>?evt_qualification=" + $(this).prop("value");
		
	
	})


	$('#id1').on('click', function(){
   
      $('#id1').attr('class', 'btn btn-danger btn-rounded');
      $('#id2').attr('class', 'btn btn-danger-outlined');
      $('#id3').attr('class', 'btn btn-danger-outlined');
      $('#id4').attr('class', 'btn btn-danger-outlined');
   })
   $('#id2').on('click', function(){

	      $('#id1').attr('class', 'btn btn-danger btn-rounded');
	      $('#id2').attr('class', 'btn btn-danger-outlined');
	      $('#id3').attr('class', 'btn btn-danger-outlined');
	      $('#id4').attr('class', 'btn btn-danger-outlined');
   })
   $('#id3').on('click', function(){

	      $('#id1').attr('class', 'btn btn-danger btn-rounded');
	      $('#id2').attr('class', 'btn btn-danger-outlined');
	      $('#id3').attr('class', 'btn btn-danger-outlined');
	      $('#id4').attr('class', 'btn btn-danger-outlined');
   })
   $('#id4').on('click', function(){

	      $('#id1').attr('class', 'btn btn-danger btn-rounded');
	      $('#id2').attr('class', 'btn btn-danger-outlined');
	      $('#id3').attr('class', 'btn btn-danger-outlined');
	      $('#id4').attr('class', 'btn btn-danger-outlined');
	
   })
</script>











