<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 	<div class="main-wrapper basic-tables"> -->


<!-- Grid wrapper for ell elements -->

<div class="grid-wrapper section">
	<div class="container">

			<div class="col-12 col-lg-12 element-content">
				


<!-- =============================================
## tables
=============================================== -->
<!-- <div id="tables" class="element_single"> -->
<!-- 	<div class="display-single_element"> -->
		<h3 style="margin: 30px 0">우리 기업 공고 목록</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>공고명</th>
					<th>공고유형</th>
					<th>현재상태</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="announceList" value="${announcePagingVO.dataList}"/>
				<c:if test="${not empty announceList}">
				<c:forEach items="${announceList}" var="announce">
					<tr>
						<th scope="row"><a href="<c:url value='/announce/announceView.do?annl_no=${announce.annl_no}' />" >${announce.annl_title}</a></th>
						<th>
						<c:choose>
							<c:when test="${announce.annl_category eq 'N'}">
								즉시지원
							</c:when>
							<c:otherwise>
								홈페이지 지원
							</c:otherwise>
						</c:choose>
						</th>
						<th>
						<c:choose>
							<c:when test="${announce.dday < 0}">
								<c:choose>
									<c:when test="${announce.finished eq 'Y'}">
										<a href="<c:url value='/announce/successList.do?annl_no=${announce.annl_no}' />">종료</a>
									</c:when>
									<c:when test="${announce.annl_category eq 'Y'}">
										종료(홈페이지 지원)
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/announce/applicantList.do?annl_no=${announce.annl_no}' />">마감</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<a href="<c:url value='/announce/applicantList.do?annl_no=${announce.annl_no}' />">모집중</a>
							</c:otherwise>
						</c:choose>
						</th>
					</tr>
				</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div id="pagingArea">
			${announcePagingVO.pagingHTMLForBS}
		</div>
	</div>
	<!-- Tables here -->
	
</div>

					</div> <!-- element-content ends -->
<!-- 				</div> -->
<!-- 			</div> element main container ends -->
<!-- 		</div> Grid wrapper ends -->

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
		
		
		function ${announcePagingVO.funcName}(page){
			if(page<=0) return;
			searchForm.find("input[name='page']").val(page);
			searchForm.submit();
			searchForm.find("input[name='page']").val("");
		};
	</script>
