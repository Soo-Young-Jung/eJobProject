<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${pageContext.request.contextPath }/assets/js/jquery.min.3.4.1.js"></script>
<script type="text/javascript">
	function ${blogBoardPagingVO.funcName}(page){
		if(page<=0) return;
		searchForm.find("input[name='page']").val(page);
		searchForm.submit();
		searchForm.find("input[name='page']").val("");
	}
	
	$(function(){
		searchForm = $("#searchForm");
		var searchType = $("#searchType");
		var searchWord = $("#searchWord");
		$("#searchBtn").on("click", function(){
			searchForm.find("input[name='searchType']").val(searchType.val());
			searchForm.find("input[name='searchWord']").val(searchWord.val());
			searchForm.submit();
		});
		
		var listBody = $("tbody#listBody");
		var pagingArea = $("#pagingArea");
		
		searchForm.on("submit", function(event){
			var queryString = $(this).serialize();
			event.preventDefault();
			$.ajax({
				data : queryString,
				dataType : "json",
				success : function(resp) {
					let blogboardList = resp.dataList;
					var trTags = [];
					if(blogboardList && blogboardList.length > 0){
						$(blogboardList).each(function(idx, blogboard){
							var tr = $("<tr>").prop("id", "tr_"+blogboard.bb_no);
							tr.append(
								$("<td>").text(blogboard.rnum)
								, $("<td>").text(blogboard.bc_title)
								, $("<td>").text(blogboard.bc_date)		
								, $("<td>").text(blogboard.bc_hit)	
							);
							trTags.push(tr);
						});
					}else{
						trTags.push(
						  $("<tr>").append(
							$("<td>").prop({colspan:5})
								     .text("조건에 맞는 글이 없음.")
						  )
						);
					}
					listBody.html(trTags);
					pagingArea.html(resp.pagingHTMLForBS);
				},
				error : function(errorResp) {
					console.log(errorResp.status + ", "
							+ errorResp.responseText)
				}
			});
			return false;
		});
		
		listBody.on("click", "tr", function(){
			let regex = /tr_([0-9]+)/igm;
			let id = $(this).prop("id");
			let bb_no = regex.exec(id)[1];			
			location.href="<c:url value='/bloghome/blogView.do'/>?what="+bb_no;
		}).css({cursor:"pointer"});
		
		$("#newBtn").on("click", function(){
			location.href="<c:url value='/bloghome/blogWriteForm.do'/>";
		});
	});
</script>
<style>
	#blogtable{
		width : 750px;
	}
	#title{
		width : 800px;
	}
	#searchWord{
		width : 600px;
	}
	#search1{
		width : 750px;
	}
</style>
<div id="title" class="heading heading-v1 mb-3 bg-white bg-gray">
	<h2 class="heading-v1-title">${bc_name }</h2>
</div>
<br>
<br>
<div id="search1">
	<div class="col-md-10">
	<input class="form-control mr-sm-2" type="text" id="searchWord"
		value="${pagingVO.searchWord}" placeholder="Search..." required>
	<button class="btn_search my-2 my-sm-0" type="submit" id="searchBtn">
		<i class="fa fa-search"></i>
	</button>
	<select id="searchType" class="form-inline form-control select-drop">
		<option value="">전체</option>
		<option value="title"
			${pagingVO.searchType eq 'title' ? 'selected' : '' }>제목</option>
		<option value="content"
			${pagingVO.searchType eq 'content' ? 'selected' : '' }>내용</option>
	</select>
	</div>
</div>
<br>
<br>
<table class="table table-striped" id="blogtable">
	<thead>
		<tr>
			<th width="10">번호</th>
			<th width=270>제목</th>
			<th width=120>작성일</th>
			<th width=60>조회 수</th>
		</tr>
	</thead>
	<tbody id="listBody">
		<c:set var="blogboardList" value="${blogBoardPagingVO.dataList }"/>
		<c:if test="${not empty blogboardList }">
			<c:forEach var="blogboard" items="${blogboardList }">
				<tr id="tr_${blogboard.bb_no }">
					<td width=50>${blogboard.rnum }</td>
					<td width=330>
						${blogboard.bc_title }
						<c:if test="${blogboard.br_cnt gt 0 }">
							<span class="badge badge-danger">${blogboard.br_cnt }</span>
						</c:if>
					</td>
					<td width=20>${blogboard.bc_date }</td>
					<td width=100>${blogboard.bc_hit }</td>
				</tr>
			</c:forEach>
		</c:if>
				<c:if test="${empty blogboardList }">
			<tr>
				<td colspan="5">
					조건에 맞는 게시글이 없음.
				</td>
			</tr>
		</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
			</td>
			<td colspan="6" class="form-inline text-center">
				<div id="pagingArea" class="text-center pagination">
					${blogBoardPagingVO.pagingHTMLForBS }
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<span class="badge badge-light">
					<a href="<c:url value='/bloghome/blogWriteForm.do'>
						<c:param name='bc_no' value='${bc_no }' />
					</c:url>">새 글
					</a>
				</span>
			</td>
		</tr>
	</tfoot>
</table>
<form id="searchForm">
	<input type="hidden" name="searchType" value="${blogBoardPagingVO.searchType}"/>
	<input type="hidden" name="searchWord" value="${blogBoardPagingVO.searchWord}"/>
	<input type="hidden" name="page" />
</form>