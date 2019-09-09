<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.anim_item{
		width:300px;
		margin:30px;
	}
	.card{
		width:400px;
		margin:10px;
	}
</style>

<div class="h300 bg-image bg-fixed text-center" style="background-image: url('assets/img/background.png');">
		<div class="overlay-content">
			<h1 class="text-white pt50 mb-2">Demo Title</h1>
			<p class="text-white">Lorem ipsum dolor sit amet.</p>		
	</div>
</div>







<div class="container" >
<div class="row justify-content-center">
<table>
	<tr>
		<td>
		<br>
			<select id="searchType" class="form-control">
					<option value="all" ${pagingVO.searchType eq 'all' ? "selected":"" }>전체</option>	
					<option value="name" ${pagingVO.searchType eq 'name' ? "selected":"" }>이름</option>	
					<option value="address" ${pagingVO.searchType eq 'address' ? "selected":"" }>주소</option>	
					<option value="tel" ${pagingVO.searchType eq 'hp' ? "selected":"" }>전화번호</option>	
				</select>
		</td>
		<td>
			<br>	<input class="form-control" type="text" id="searchWord" value="${pagingVO.searchWord}"/>
				
		</td>
		<td>
	
		<input  class="btn btn-danger btn-rounded" type="button" value="검색" id="searchBtn"/>
				
		</td>
	</tr>
</table>
</div>
</div>





<div class="container" >
<div class="row justify-content-center">
<c:set value="${pagingVO.dataList }" var="ent_infoList"/>
				<c:choose>
					<c:when test="${not empty ent_infoList }">
						<c:forEach items="${ent_infoList }" var="ent_info">	
										
							<div  class="anim_item animated swing" data-animation="swing">
								<div class="icon">
							<i class="fa fa-suitcase" aria-hidden="true"></i>
							</div>
									
								<c:choose>
									<c:when test="${ent_info.mem_profileBase64 eq null}">
										<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="application"/>
									</c:when>
									<c:otherwise>
										<c:set var="Img" value="data:image/*;base64,${ent_info.mem_profileBase64 }" scope="application"/>
									</c:otherwise>
								</c:choose>
								<span><img  class="img" style="width: 200px; height:250px; margin-right: 10px; margin-left: 10px;" src="${Img }"/></span><br>
								
								<span>${ent_info.ent_name }</span><br>
													
								<span>${ent_info.ent_tel }</span><br>
								<span><button class="btn1 btn-danger btn-rounded" value="${ent_info.mem_id }" >상세정보</button></span>
							
								</div>
						</c:forEach>
					</c:when>
				</c:choose>
	</div>	
</div>








<table class="table table-striped">
	<thead class="table-header thead-dark">
		<tr>
			<th>이미지</th>
			<th>알바생아이디</th>
			<th>알바생이름</th>
			<th>알바생나이</th>
			<th>알바생주소</th>
			<th>알바생휴대폰</th>
			<th>알바생휴대폰</th>
		</tr>
	</thead>
	<tbody id="listBody">
				<c:set value="${pagingVO.dataList }" var="ent_infoList"/>
				<c:choose>
					<c:when test="${not empty ent_infoList }">
						<c:forEach items="${ent_infoList }" var="ent_info">
							<tr>
								
								
								<c:choose>
									<c:when test="${ent_info.mem_profileBase64 eq null}">
										<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="application"/>
									</c:when>
									<c:otherwise>
										<c:set var="Img" value="data:image/*;base64,${ent_info.mem_profileBase64 }" scope="application"/>
									</c:otherwise>
								</c:choose>
								
				
								<td><img  class="img" style="width: 50px; margin-right: 10px; margin-left: 10px;" src="${Img }"/></td>
								<td>${ent_info.mem_id }</td>
								<td>${ent_info.ent_name }</td>
								<td>${ent_info.ent_ceo }</td>
								<td>${ent_info.ent_addr2 }</td>
								<td>${ent_info.ent_tel }</td>
								<td><button class="btn btn-danger btn-rounded" value="${ent_info.mem_id }" >상세정보</button></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
	</tbody>
</table>



<div id="pagingArea">
		${pagingVO.pagingHTMLForBS }
</div>

<form id="searchForm">
	<input type="hidden" name="searchType" value="${pagingVO.searchType}"/>
	<input type="hidden" name="searchWord" value="${pagingVO.searchWord}"/>
	<input type="hidden" name="page" />
</form>

<script type="text/javascript">
	function ${pagingVO.funcName}(page){
		if(page<=0) return;
		searchForm.find("input[name='page']").val(page);
		searchForm.submit();
		searchForm.find("input[name='page']").val("");
	}
	searchForm = $("#searchForm");
	var searchType = $("#searchType");
	var searchWord = $("#searchWord");

	
	$("#searchBtn").on("click", function(){
	
		searchForm.find("input[name='searchType']").val(searchType.val());
		searchForm.find("input[name='searchWord']").val(searchWord.val());
		searchForm.submit();
	});
	
	$(".btn1").on("click", function(){
	
		
	
		location.href="<c:url value='/ent_info/ent_infoinformation.do'/>?id=" + $(this).prop("value");

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
	
</script>











