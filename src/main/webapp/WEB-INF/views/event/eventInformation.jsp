<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${pageContext.request.contextPath }/assets/plugins/syotimer/jquery.syotimer.min.js"></script>
<link rel="stylesheet"	href="https://jqueryui.com/resources/demos/style.css">
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<c:url value='/bootstrap-3.3.7/css/bootstrap.min.css' ></c:url>" />
<style>
	#imgtd{
		width : 300px;
	}
	
	 #modal{
 		margin-top: 100px;
 	}
 	 #modal2{
 		margin-top: 100px;
 	}
 	.aa{
 		margin-left: 450px;
 	}
</style>

	<c:choose>
		<c:when test="${event.evt_profileBase64 eq null}">
			<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="page"/>
		</c:when>
		<c:otherwise>
			<c:set var="Img" value="data:image/*;base64,${event.evt_profileBase64 }" scope="page"/>
		</c:otherwise>
	</c:choose>
	
	
	

	
	
	
	
	
	<br><br>
	
	
	<div class="container" >	
	<div class="row justify-content-center"  >
	
	
	
	
	
	
	
	
	
	
   <button style="width:1500px" id="ji" class="btn btn-danger">지원 하기</button> 
	
	

	
	<div style="height: auto; width: 100%;" >

	<div class="heading heading-v1 text-center mb-3 mt-5 bg-white bg-gray">
		<h2 class="heading-v1-title">공모전 상세정보</h2>
	</div>
	<br><br>
	<hr >
	<p><img style="width:50px" src="${pageContext.request.contextPath}/assets/img/이벤트1.png"/>${event.evt_title}</p>



<div class="container" >	
<div class="row justify-content-center"  >	




<%-- 	<button id= "delete" class="btn btn-danger-outlined" value="${event.evt_no}" style="width:800px" type="submit">삭  제</button> --%>
	
	<c:choose>
		<c:when test='${mem eq "admin"}'>
				
   			 <button style="width:800px" id="sac" class="btn btn-danger btn-mid" value="${event.evt_no}"  type="submit">삭제</button>
			<button id= "update" class="btn btn-danger-outlined" value="${event.evt_no}" style="width:800px" type="submit">정보 수정</button>
			
		</c:when>
		<c:otherwise>
	
		</c:otherwise>
	</c:choose>	
	

</div>
</div>

<div class="container" >
	
<div class="row justify-content-center"  >
	<table  style="width:800px" class="table table-striped" id="div">
	
		<tr>
			<td id="imgtd" rowspan="7">

						    <img class="img-full" src="${Img }" style="width: 300px; height:390px; margin-right: 10px; margin-left: 10px;"/>

	
	
	
	
	</td>
			<td ><label>※ 이벤트번호</label></td>
			<td>${event.evt_no}</td>		
		</tr>
<!-- 		<tr> -->
<!-- 			<td><label>분야</label></td> -->
<%-- 			<td>${event.evt_title}</td>	 --%>
<!-- 		</tr> -->
		<tr>
			<td><label>※  이벤트제목</label></td>
			<td>${event.evt_title}</td>	
		</tr>
		<tr>
			<td><label>※  이벤트날짜</label></td>
			<td>${event.evt_date}</td>	
		</tr>
		<tr>
			<td><label>※  이벤트마감</label></td>
			<td>${event.evt_closeing}</td>	
		</tr>
		<tr>
			<td><label>※  참가자격</label></td>
			<td>${event.evt_closeing}</td>	
		</tr>
		<tr>
			<td><label>※  1등시상금</label></td>
			<td>${event.evt_money}</td>	
		</tr>
		
		<tr>
			<td><label>※  홈페이지</label></td>
			<td><a href="https://www.thinkcontest.com/" target="_blank">https://www.thinkcontest.com/</a></td>
		</tr>
		<tr>
			<td><label>※  이벤트내용</label></td>
			<td>${event.evt_content}</td>
		</tr>
		
	</table>	
</div>
	</div>
	
	


<div class="container" >
	<p><img style="width:50px" src="${pageContext.request.contextPath}/assets/img/이벤트1.png"/>${event.evt_title}</p>
	<br><br>	
	<h2 style="color:#8F7CEE">※ 유의 사항</h2>
	<p>- 규격에 맞지 않거나 참가신청서가 누락된 경우 심사 대상에서 제외됩니다.</p>
	<p>- 본인이 직접 제작한 작품만 출품 가능하며, 모작이나 대작 또는 타 공모전 입상작</p>
	<p>  등으로 밝혀질 경우 사상이 취소됩니다.</p>
	<p>- 수상작에 대한 저작재산권은 농림색품교육문화정보원에 귀속합니다.</p>
	<p>- 접수된 작품의 저작권과 관련된 모든 문제의 책임은 응모자에게 있습니다.</p>
	<br>
	<br>
	<h2 style="color:#8F7CEE">※ 문의 사항</h2>
	<p>- 운영사무국 : 070-4808-3352 (월~금 09:00 ~ 17:00)</p>
</div>	
	
	
	
	
	<br><br>
	<div class="container" >	
	<div class="row justify-content-center"  >
	<img src="${pageContext.request.contextPath}/assets/img/이벤트.png">
	</div>
	</div>
	
	
	</div>
	
</div>
</div>








	
	
	
	<!-- 지원하기 -->
	<div id="modal" class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-body">
                  <button type="button" class="close push-xs-right" data-dismiss="modal" aria-label="Close">
                     <i class="fa fa-close"></i>
                  </button>
                  <div class="container-fluid modal-item">
				<h2>홈페이지로 이동 하시겠습니까?</h2>
				<hr>
			<a class="btn btn-danger btn-rounded aa" href="http://www.xn--3e0bj10cv0b.com/bbs/write.php?bo_table=request/" target="_blank">홈페이지로 이동</a>
				<button  style="width:130px" type="button" class="btn btn-primary btn-rounded ch">취소</button>
<!-- 				<button id="homepage" style="width:80px" class="btn btn-primary-outlined">홈페이지로 이동</button>	 -->
                  </div>
               </div>
            </div>
         </div>
     </div>
	
	
	
	<!-- 삭제 -->
	<div id="modal2" class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-body">
                  <button type="button" class="close push-xs-right" data-dismiss="modal" aria-label="Close">
                     <i class="fa fa-close"></i>
                  </button>
                  <div class="container-fluid modal-item">
                 <h2>정말로 삭제 하시겠습니까?</h2> 
                 <hr>
			<form id="deleteForm" action="${pageContext.request.contextPath}/delete" method="post">
	     	<input type="hidden" name=evt_no value="${event.evt_no }"/>
<%-- 	     	<input type="hidden" name="sug_parent" value="${suggestion.sug_parent }"/> --%>
<%-- 	     	<input type="hidden" name="sug_depth" value="${suggestion.sug_depth }"/> --%>
<%-- 	     	<input type="hidden" name="mem_id" value="${suggestion.mem_id }"/> --%>
<%-- 	     	<input type="hidden" name="sug_title" value="${suggestion.sug_title }"/> --%>
<%-- 	     	<input type="hidden" name="sug_content" value="${suggestion.sug_content }"/> --%>
	     	<div class="modal-body">
<!--     			 <input type="submit"  value="확인" class="btn btn-danger-outlined"/> -->
    			 <button   style="width:130px" type="submit" class="btn btn-danger btn-rounded aa">확인</button>
    			 <button  style="width:130px" type="button" class="btn btn-primary btn-rounded ch">취소</button>
    		</div>
		</form>
					
                  </div>
               </div>
            </div>
         </div>
     </div>
	
	
<script>


	var modal = $("#modal");
	var modal2 = $("#modal2");

	$("#ji").on("click", function(){
		modal.modal('show');
	})
	$(".ch").on("click", function(){
	
		modal.modal('hide');
		modal2.modal('hide');
	})

	
	
	$("#sac").on("click", function(){
		modal2.modal('show');
	})
	



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
			

		$("#update").on("click", function(){
		
			location.href="<c:url value='/update'/>?evt_no=" + $(this).prop("value");
		})	
		
		$("#delete").on("click", function(){
			location.href="<c:url value='/delete'/>?evt_no=" + $(this).prop("value");
		})
		
		function getParameterByName(name) {
   			 name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
   			 var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
      		  results = regex.exec(location.search);
   			 return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
		
		
		var message = getParameterByName("message");
		if(message != ""){
			alert(message);
		}



			
			
</script>

	