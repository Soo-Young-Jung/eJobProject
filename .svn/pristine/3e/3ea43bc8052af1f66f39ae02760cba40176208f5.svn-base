<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="main-wrapper basic-tables">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Grid wrapper for ell elements -->

<div class="grid-wrapper section">
	<div class="container">
		<div class="row">

			<div class="col-12 col-lg-12 element-content">
				


<!-- =============================================
## tables
=============================================== -->
<div id="tables" class="element_single">
	<div class="display-single_element">
		<h3 style="margin: 30px 0">[${announceVO.annl_title}] ${succ eq true?"합격자":"지원자"} 목록</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th style="width: 10px; text-align: center;">#</th>
					<th style="text-align: center;">유저명</th>
					<th style="text-align: center;">나이</th>
					<th style="text-align: center;">성별</th>
					<th style="text-align: center;">경력</th>
					<th style="text-align: center;">이력서</th>
					<th style="text-align: center;">블로그</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="applicantMemberList" value="${pagingVO.dataList}"/>
				<c:if test="${succ eq false}">
				<c:if test="${not empty applicantMemberList}">
				<form id="succ" method="post">
					<c:forEach items="${applicantMemberList}" var="applicantMember">
						
							<tr 
							<c:forEach items="${recList}" var="recMember">
							${applicantMember.mem_id eq recMember?"style='background-color: gray; color: white;'":""}
							</c:forEach>
							 >
<!-- 							<tr  > -->
								<th scope="row">
									<input type="checkbox" name="mem_id" value="${applicantMember.mem_id}" >
								</th>
								<td style="text-align: center;">
								${applicantMember.mem_name}
								</td>
								<td style="text-align: center;">
								${applicantMember.er_age}세
								</td>
								<td style="text-align: center;">
								<c:if test="${applicantMember.er_gender eq 'M'}">남</c:if>
								<c:if test="${applicantMember.er_gender eq 'F'}">여</c:if>
								</td>
								<td style="text-align: center;">
								${applicantMember.er_career}
								</td>
								<td style="text-align: center;">
								<button 
								<c:forEach items="${recList}" var="recMember">
								${applicantMember.mem_id eq recMember?"style='background-color: black; color: white;'":""}
								</c:forEach>
								onclick="window.open('${pageContext.request.contextPath }/mypage/resumeView.do?what=${applicantMember.er_no }')"
								type="button"
								>이력서 확인하기</button>
								</td>
								<td style="text-align: center;">
								<button 
								<c:forEach items="${recList}" var="recMember">
								${applicantMember.mem_id eq recMember?"style='background-color: black; color: white;'":""}
								</c:forEach>
								onclick="window.open('${pageContext.request.contextPath }/bloghome/blogHome.do?what=${applicantMember.mem_id }')"
								type="button"
								>블로그 바로가기</button>
								</td>
							</tr>
							<input type="hidden" name="annl_no" value="${announceVO.annl_no}" >
					</c:forEach>
				</form>
				</c:if>
			</c:if>
				<c:if test="${succ eq true}">
				<c:if test="${not empty applicantMemberList}">
					<c:forEach items="${applicantMemberList}" var="applicantMember">
						<tr>
							<th scope="row">
								${applicantMember.mem_id}
							</th>
							<td>
							${applicantMember.mem_name}
							</td>
							<td>
							${applicantMember.er_age}세
							</td>
							<td>
							<c:if test="${applicantMember.er_gender eq 'M'}">남</c:if>
							<c:if test="${applicantMember.er_gender eq 'F'}">여</c:if>
							</td>
							<td>
							${applicantMember.er_career}
							</td>
							<td>
							<button onclick="window.open('${pageContext.request.contextPath }/mypage/resumeView.do?what=${applicantMember.er_no }')">이력서 확인하기</button>
							</td>
							<td>
							<button onclick="window.open('${pageContext.request.contextPath }/bloghome/blogHome.do?what=${applicantMember.mem_id }')">블로그 바로가기</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</c:if>
			</tbody>
		</table>
		<div class="col-md-2 ">
				<button type="button" class="btn form-control btn-danger btn-block" onclick="location.href='${pageContext.request.contextPath }/announce/myAnnounce.do'">
				공고목록
				</button>
		</div>
		<c:if test="${succ eq false}">
			<c:if test="${announceVO.dday < 0}">
			<div class="col-md-2 ">
						<button type="button" class="btn form-control btn-danger btn-block" data-toggle="modal" id="clear_modal" data-target="#myModal">
						  합격 처리
						</button>
				</div>
			</c:if>
		</c:if>		
	</div>
		<div id="pagingArea">
			${pagingVO.pagingHTMLForBS}
		</div>
	<!-- Tables here -->
	<c:if test="${succ eq false}">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		  <div class="modal-dialog" style="margin: 28rem auto;">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">주의</h4>
		      </div>
		      <div class="modal-body container">
		      <div class="form-group row">
		        <div class="col-md-4">
		    	    현재 선택한 인원을 합격으로 처리합니다.
		        </div>
		      </div>
		      <div class="form-group row">
		        <div class="col-md-4">
		        <button class="btn form-control btn-danger" form="succ">확인</button>
		        <button type="button" data-dismiss="modal" aria-label="Close" class="btn form-control btn-danger">취소</button>
		        </div>
		       </div>
			</div>
			</div>
		</div> <!-- element-content ends -->
	</div>
	</c:if>		
				
				
			</div> <!-- element main container ends -->
		</div> <!-- Grid wrapper ends -->
	</div>

	<!-- JAVASCRIPTS -->
	<script>
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
		
		
		function ${pagingVO.funcName}(page){
			if(page<=0) return;
			searchForm.find("input[name='page']").val(page);
			searchForm.submit();
			searchForm.find("input[name='page']").val("");
		};
	</script>
