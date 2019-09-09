<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 


<script type="text/javascript">
// 오류가 아님↓
	function ${pagingVO.funcName}(page){
		if(page<=0) return;
		var searchForm = $("#searchForm");
		searchForm.find("input[name='page']").val(page);
		searchForm.submit();
		searchForm.find("input[name='page']").val("");
	}
	$(function(){
		searchForm = $("#searchForm");
		//var searchType = $("#searchType");
		var searchWord = $("#searchWord");
		$("#searchBtn").on("click", function(){
			//searchForm.find("input[name='searchType']").val(searchType.val());
			searchForm.find("input[name='searchWord']").val(searchWord.val());
			searchForm.submit();
		});
		
		var listBody = $("div#listBody");
		var pagingArea = $("#pagingArea");
		
		searchForm.on("submit", function(event){
			var queryString = $(this).serialize();
			event.preventDefault();
			$.ajax({
				data : queryString,
				dataType : "json",
				success : function(resp) {
					let faqList = resp.dataList;
					var trTags = [];
					var htmlCode = '';
					if(faqList && faqList.length > 0){
						htmlCode += '<div id="accordion" role="tablist" aria-multiselectable="true">';
						$(faqList).each(function(idx, faq){
							
							htmlCode += '<div class="card card-accordion">';
							htmlCode += '<div class="card-header" role="tab" id="heading' + faq.faq_no +'">';
							htmlCode += '	<h6 class="mb-0">';
							htmlCode += '		<a data-toggle="collapse" href="#collapse' + faq.faq_no +'" aria-expanded="false" aria-controls="collapse' + faq.faq_no +'" class="collapsed">';
							htmlCode += '<img src="<c:url value='/img/q.gif'/>"> ' + faq.faq_title;
							htmlCode += '</a>';
							htmlCode += '</h6>';
							htmlCode += '</div>';
							htmlCode += '<div id="collapse' + faq.faq_no +'" data-parent="#accordion" class="collapse" role="tabpanel" aria-labelledby="heading' + faq.faq_no +'">';
							htmlCode += '	<div class="card-block">';
							htmlCode += '<img src="<c:url value='/img/a.gif'/>"> ' + faq.faq_content;
							htmlCode += '	</div>';
							htmlCode += '</div>';
							htmlCode += '</div>';
							
						});
					}else{
						htmlCode += '<div>조건에 맞는 FAQ가 없습니다.</div>';
					}
					listBody.html(htmlCode);
					pagingArea.html(resp.pagingHTMLForBS);
				},
				error : function(errorResp) {
					console.log(errorResp.status + ", "
							+ errorResp.responseText)
				}
			});
			return false;
		});
		
		listBody.on("click", ".editBtn", function(){
			let regex = /edit_([0-9]+)/igm;
			let id = $(this).prop("id");
			let faq_no = regex.exec(id)[1];	
			location.href="<c:url value='/faq/faqUpdate.do'/>?what="+faq_no;
		}).css({cursor:"pointer"});
		
		listBody.on("click", ".delBtn", function(){
			let regex = /del_([0-9]+)/igm;
			let id = $(this).prop("id");
			let faq_no = regex.exec(id)[1];	
			location.href="<c:url value='/faq/faqDelete.do'/>?what="+faq_no;
		}).css({cursor:"pointer"});
		
		$("#newBtn").on("click", function(){
			
			location.href="<c:url value='/faq/faqInsert.do'/>";
		});
	});
	
</script>
<!-- 사용하여서 가운데정렬 ↓ -->
<div class="container">
<c:if test="${not empty message }">
	<div class="alert alert-success alert-dismissible" role="alert">
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	  	<span aria-hidden="true">&times;</span>
	  </button>
	  <strong>${message }</strong>
	  <c:remove var="message" scope="session" />
	</div>
</c:if>


<br>
<h2>자주묻는질문</h2>
<br>

<c:if test="${sessionScope.mem_id == 'admin' }">
<br>
<button id="newBtn" type="button" class="btn btn-danger-outlined">새글쓰기</button>
</c:if>

	
	<div class="container-fluid" >
		<br>
		<div class="col-xs-6">궁금하신 점이 있다면 여기서 먼저 찾아보세요.</div>
		<div class="form-inline text-center col-xs-3" >
			<input style="width:115px; height:40px;" type="text" id="searchWord" value="${pagingVO.searchWord}"/>
			<input class="btn btn-danger-outlined" type="button" value="검색" id="searchBtn"/>
		</div>
	</div>

	<div id="listBody">
		<c:set var="faqList" value="${pagingVO.dataList }"/>
		<c:if test="${not empty faqList }">
				<div id="accordion" role="tablist" aria-multiselectable="true">
			<c:forEach var="faq" items="${faqList }" varStatus="vs">
					<div class="card card-accordion">
						<div class="card-header" role="tab" id="heading${faq.faq_no }">
							<h6 class="mb-0">
								<a data-toggle="collapse" href="#collapse${faq.faq_no }" aria-expanded="false" aria-controls="collapse${faq.faq_no }" class="collapsed">
									<img src="<c:url value='/img/q.gif'/>"> ${faq.faq_title }
									
								</a>
							</h6>
						</div>
						<div id="collapse${faq.faq_no }" data-parent="#accordion" class="collapse" role="tabpanel" aria-labelledby="heading${faq.faq_no }">
							<div class="card-block">
								<img src="<c:url value='/img/a.gif'/>"> ${faq.faq_content }
								<c:if test="${sessionScope.mem_id == 'admin' }">
								<hr>
			<button id="edit_${faq.faq_no }" type="button" class="btn btn-danger-outlined editBtn">수정</button>
			<button id="del_${faq.faq_no }" type="button" class="btn btn-danger-outlined delBtn">삭제</button>
					</c:if>
							</div>
						</div>
					</div>
						
					
			</c:forEach>
				</div>
			
		</c:if>
				<c:if test="${empty faqList }">
			<div>
					조건에 맞는 FAQ가 없습니다.
			</div>
		</c:if>
	</div>

			
	<div>
		<div id="pagingArea" class="text-center">
				${pagingVO.pagingHTMLForBS }
		</div>
	</div>	


<form id="searchForm">
	<input type="hidden" name="searchWord" value="${pagingVO.searchWord}"/>
	<input type="hidden" name="page" />
</form>
</div>