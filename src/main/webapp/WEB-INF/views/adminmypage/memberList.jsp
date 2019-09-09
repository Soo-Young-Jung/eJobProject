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






<div class="container" >
<!-- <button class="btn1 btn-danger-outlined" type="submit">이벤트 작성</button> -->
<div class="row justify-content-center">
<table>
	<tr>
		<td>
		<br>
			<select id="searchType" class="form-control">
					<option value="all" ${pagingVO.searchType eq 'all' ? "selected":"" }>전체</option>	
					<option value="id" ${pagingVO.searchType eq 'id' ? "selected":"" }>아이디</option>	
					<option value="tel" ${pagingVO.searchType eq 'tel' ? "selected":"" }>전화번호</option>	
					<option value="name" ${pagingVO.searchType eq 'name' ? "selected":"" }>이름</option>		
				</select>
		</td>
		<td>
			<br>	<input class="form-control" type="text" id="searchWord" value="${pagingVO.searchWord}"/>
				
		</td>
		<td>
	 <button id="searchBtn" type="submit" class="btn btn-danger btn-rounded">검색</button>
<!-- 		<input   type="button" value="검색"  id="searchBtn"/> -->
				
		</td>
	</tr>
</table>
</div>
</div>






<div class="container" >
<div class="row justify-content-center">
<c:set value="${pagingVO.dataList }" var="memberList"/>
				<c:choose>
					<c:when test="${not empty memberList }">
						<c:forEach items="${memberList }" var="member">	
										
						<div class="card card-body text-center">
    			  <div class="card-ribbon card-ribbon-top card-ribbon-left bg-danger text-white">Popular</div>
     			 <h4 class="card-title">
     				  ${member.mem_id }
    			  </h4>
     			
								<c:choose>
									<c:when test="${member.mem_profileBase64 eq null}">
										<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="application"/>
									</c:when>
									<c:otherwise>
										<c:set var="Img" value="data:image/*;base64,${member.mem_profileBase64 }" scope="application"/>
									</c:otherwise>
								</c:choose>
								<span><img  class="img" style="width: 280px; height:180px; margin-right: 10px; margin-left: 10px;" src="${Img }"/></span><br>

							<span>${member.mem_name }</span><br>
							<span>${member.mem_tel }</span>
								
								<span><button style="width:300px;" class="btn btn-sm mt-3 btn-danger" value="${member.mem_id }" >상세정보 보기!!</button></span>
							
    				</div>
	
								
							
							
						</c:forEach>
					</c:when>
				</c:choose>
	</div>	
</div>




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
	

		
		
	$(".btn").on("click", function(){

  		location.href="<c:url value='/member/memberInformation'/>?mem_id=" + $(this).prop("value");
	})
	

</script>











