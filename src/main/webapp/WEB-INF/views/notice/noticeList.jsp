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
					let noticeList = resp.dataList;
					var trTags = [];
					if(noticeList && noticeList.length > 0){
						$(noticeList).each(function(idx, notice){
							
							var tr = $("<tr>").prop("id", "tr_"+notice.not_no);
							
							tr.append(
								  $("<td>").html(notice.not_no)	
								, $("<td>").html(notice.not_title)	
								, $("<td>").html(notice.not_date)	
// 								, $("<td>").html(notice.not_div == 'E' ? '기업회원' : '일반회원')	
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
			let bo_no = regex.exec(id)[1];	
			location.href="<c:url value='/notice/noticeView.do'/>?what="+bo_no;
		}).css({cursor:"pointer"});
		
		$("#newBtn").on("click", function(){
			
			location.href="<c:url value='/notice/noticeInsert.do'/>";
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

<!-- 시작 -->
<!-- 게시판 목록 만들기 시작 8월 13일 -->
<br>
<h2>공지사항</h2>
<br>
<!-- <button type="button" id="btnWrite">글쓰기</button> -->
<!-- <table border="1" style = "width:600px"> -->
<!--    <tr> -->
<!--       <th>번호</th> -->
<!--       <th>제목</th> -->
<!--       <th>이름</th> -->
<!--       <th>작성일</th> -->
<!--       <th>조회수</th> -->
<!--    </tr> -->
<%--    <c:forEach var="row" items="${list}"> --%>
<!--       <tr> -->
<%--          <td>${row.bo_no}</td> --%>
<%--          <td><a href="${pageContext.request.contextPath }/board/view.do?bo_no=${row.bo_no}">${row.bo_title}</a></td> --%>
<%--          <td>${row.bo_writer}</td> --%>
<!--          <td> -->
<%--             ${row.bo_date} --%>
<!--             원하는 날짜형식으로 출력하기 위해 fmt태그 사용. -->
<%--             <fmt:formatDate value="${row.bo_date}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
<!--          </td> -->
<%--          <td>${row.bo_views}</td> --%>
<!--       </tr> -->
<%--    </c:forEach> --%>
<!-- </table> -->
<%-- <td><a href='<c:url value='/board/boardDetail?idx=${nList.IDX }'/>' --%>
<%-- 			 class="text-dark">${nList.TITLE }</a></td> --%>
<c:if test="${sessionScope.mem_id == 'admin' }">
<br>
<button id="newBtn" type="button" class="btn btn-danger-outlined">새글쓰기</button>
</c:if>


<table class="table table-bordered">
	<thead>
   <tr>
      <td>번호</td>
      <th>제목</th>
      <th>작성 날짜</th>
   </tr>
   </thead>
	<tbody id="listBody">
		<c:set var="noticeList" value="${pagingVO.dataList }"/>
		<c:if test="${not empty noticeList }">
			<c:forEach var="notice" items="${noticeList }">
				<tr id="tr_${notice.not_no }">
					<td>${notice.not_no }</td>
					<td>
<%-- 						<c:if test="${notice.bo_depth gt 1 }"> --%>
<%-- 							<c:forEach begin="1" end="${notice.bo_depth }" varStatus="vs"> --%>
<%-- 								&nbsp;&nbsp;${vs.last ? "re:" : "" } --%>
<%-- 							</c:forEach> --%>
<%-- 						</c:if> --%>
						${notice.not_title }
<%-- 						<c:if test="${notice.rep_cnt gt 0 }"> --%>
<%-- 							<span class="badge">${notice.rep_cnt }</span> --%>
<%-- 						</c:if> --%>
					</td>
					<td>
						${notice.not_date }
					</td>
<%-- 					<td>${notice.not_div eq 'E' ? '기업회원' : '일반회원' }</td> --%>
<%-- 					<td>${notice.not_date }</td> --%>
<%-- 					<td>${notice.not_hit }</td> --%>
				</tr>
			</c:forEach>
		</c:if>
				<c:if test="${empty noticeList }">
			<tr>
				<td colspan="3">
					조건에 맞는 게시글이 없음.
				</td>
			</tr>
		</c:if>
	</tbody>
	<tfoot>
		<tr>
		<td></td>
			<td style="width:450px">
			<div class="form-inline text-center" >
<!-- 														검색할때 검색 목록이 안떠서 수정 ↓ -->
				<select id="searchType" style="padding : 0px 20px; height:40px;">
					<option value="">전체</option>
					<option value="title" 
						${pagingVO.searchType eq 'title' ? 'selected' : '' }
					>제목</option>
					
					<option value="writer" 
						${pagingVO.searchType eq 'writer' ? 'selected' : '' }
					>작성자</option>
					<option value="content" 
						${pagingVO.searchType eq 'content' ? 'selected' : '' }
					>내용</option>
				</select>
				<input type="text" style="width:120px; height:40px;" id="searchWord" value="${pagingVO.searchWord}" />
				<input class="btn btn-danger-outlined" type="button" value="검색" id="searchBtn"/>
				
				</div>
			
			<td></td>
			</tr>
			<tr>
			<td colspan="3">
			<div id="pagingArea" class="text-center">
					${pagingVO.pagingHTMLForBS }

				</div>
			</td>
		</tr>
	</tfoot>	
</table>

<form id="searchForm">
	<input type="hidden" name="searchType" value="${pagingVO.searchType}"/>
	<input type="hidden" name="searchWord" value="${pagingVO.searchWord}"/>
	<input type="hidden" name="page" />
</form>
</div>