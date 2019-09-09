<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
.date-holder::after {
    border-left: 15px solid #dc3545;
}

</style>

	<div class="mobile-sticky-header-overlay"></div>
<div class="main-wrapper blog-grid-three-column">




<!-- TESTIMONIAL SECTION -->
<section class="blog-grid" style="padding-bottom: 0px; padding-top: 40px;" >
	<div class="container">
	<form id="searchForm">
				<div class="row align-items-center justify-content-center">
                		<div class="col-md-4">
                           <div class="form-group">
                              <input type="text" placeholder="주소" class="form-control" name="searchAddr" id="searchAddr" value="${announcePagingVO.searchAddr}">
                           </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                              <select id="inputState" name="searchType" id="searchType" class="browser-default custom-select announceselecter">
                              	<c:set var="searchType" value="${announcePagingVO.searchType}" scope="page" />
                                <option value="">전체</option>
                                <option value="title" ${searchType eq "title"?"selected":""} >글제목</option>
                                <option value="ent" ${searchType eq "ent"?"selected":""} >기업명</option>
                              </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                             <input type="text" placeholder="검색어 입력" class="form-control" id="searchWord" name="searchWord" value="${announcePagingVO.searchWord}">
                            </div>
                        </div>
                        <input type="hidden" name="page">
                        <div class="col-md-2">
							<div class="form-group">
								<input id="searchBtn" type="submit" value="검색" style="font-size: 16px; color: white;" class="btn form-control btn-danger btn-block" >
							</div>
            	        </div>
                	</div>
      <div id="accordion" role="tablist" aria-multiselectable="true">
		<div class="card card-accordion">
			<div class="card-header bg-danger" role="tab" id="heading1">
				<h6 class="mb-0">
					<a data-toggle="collapse" class="bg-danger" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
						검색조건 추가
					</a>
				</h6>
			</div>
			<div id="collapse1" class="collapse" role="tabpanel" aria-labelledby="heading1">
				<div class="card-block div_divider_parent">
					<div class="div_divider_child">
					<label>근로형태</label><br>
						<select id="searchST" name="searchST">
							<c:set var="searchST" value="${announcePagingVO.searchST}" scope="page" />
							<option value="">선택없음</option>
							<option value="임금근로자" ${searchST eq "임금근로자"?"selected":""} >임금근로자</option>
							<option value="정규직" ${searchST eq "정규직"?"selected":""} >정규직</option>
							<option value="비정규직근로자" ${searchST eq "비정규직근로자"?"selected":""} >비정규직근로자</option>
						</select>
					</div>
					<div class="div_divider_child">
					<label>최종학력</label><br>
						<select id="searchFEB" name="searchFEB">
							<c:set var="searchFEB" value="${announcePagingVO.searchFEB}" scope="page" />
							<option value="0">선택없음</option>
							<option value="1" ${searchFEB eq "1"?"selected":""} >중학교 졸업 이상</option>
							<option value="2" ${searchFEB eq "2"?"selected":""} >고등학교 졸업 이상</option>
							<option value="3" ${searchFEB eq "3"?"selected":""} >대학교 졸업 이상</option>
						</select>
					</div>
					<div class="div_divider_child">
					<label>경력</label><br>
						<input id="searchCareer" type="number" name="searchCareer" min="0" placeholder="경력(월단위) 입력" value="${announcePagingVO.searchCareer}">
					</div>
				</div>
			</div>
		</div>
	</div>
			</form>
		<div class="row">
			<div class="col-lg-12">
				<!-- blog Grid 2 column starts -->
				<div class="row" id="listBody">
					<c:set var="announceList" value="${announcePagingVO.dataList}"/>
					<c:if test="${not empty announceList}">
						<c:forEach var="announce" items="${announceList}">
							<div class="col-lg-4">
						<div class="card card-style3">
							<div class="card_img">
								<a href="${pageContext.request.contextPath}/announce/announceView.do?annl_no=${announce.annl_no}">
								<c:choose>
									<c:when test="${announce.mem_profileBase64 eq null}">
										<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="page"/>
									</c:when>
									<c:otherwise>
										<c:set var="Img" value="data:image/*;base64,${announce.mem_profileBase64}" scope="page"/>
									</c:otherwise>
								</c:choose>
								<img class="img-full" src="${Img}" alt="Card image" style="width: 350px; height: 350px">
								</a>

								<div class="date-holder bg-danger">
									<span>
										<c:choose>
											<c:when test="${announce.dday eq 0}">
												금일마감
											</c:when>
											<c:when test="${announce.dday lt 0}">
												마감
											</c:when>
											<c:otherwise>
												D-${announce.dday}
											</c:otherwise>
										</c:choose>
									</span>
								</div>
							</div>
							<div class="card-block">
								<ul class="list-inline">
									<li>
										<a href="<c:url value="/ent_info.do?mem_id=${announce.mem_id}"/>"><i class="fa fa-user-o" aria-hidden="true"></i> <span class="text-primary">${announce.ent_name}</span></a>
									</li>
									<li>
										<i class="fa fa-heart-o" aria-hidden="true"></i> ${announce.scrapCount}
									</li>
								</ul>
								<a href="${pageContext.request.contextPath}/announce/announceView.do?annl_no=${announce.annl_no}"><h4 class="card-title">${announce.annl_title}</h4></a>
							</div>
						</div>
					</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty announceList}">
						<h2>검색 결과 없음</h2>
					</c:if>
				</div>

				<!-- blog Grid 2 column ends -->
			</div>
		</div>
		<div style="float: right;">
			<c:if test="${mem_div eq 'E'}">
				<button class="btn form-control btn-danger btn-block" type="button" onclick="location.href='<c:url value="/announce/announceForm.do"/>';" >공고 채용글 올리기</button>
			</c:if>
		</div>
		
		<div id="pagingArea">
			${announcePagingVO.pagingHTMLForBS}
		</div>
	</div>
</section>


	
</div>


	<!-- JAVASCRIPTS -->
	<script type="text/javascript">
	

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
		
		searchForm = $("#searchForm");
		var searchType = $("#searchType");
		var searchWord = $("#searchWord");
		var searchAddr = $("#searchAddr");
		var searchST = $("#searchST");
		var searchFEB = $("#searchFEB");
		var searchCareer = $("#searchCareer");
		
		var listBody = $("#listBody");
		var pagingArea = $("#pagingArea");
		
		function makeImgTag(announce){
			return announce.mem_profileBase64?"data:image/*;base64,"+announce.mem_profileBase64
								:"<c:url value='/img/noimage.png'/>";
		};
		
		
	<c:if test="${not empty message }">
		alert('${message}');
		<c:remove var="message" scope="session" />
	</c:if>
		
	</script>
