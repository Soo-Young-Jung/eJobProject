<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" data-toggle="tab" href="#home" role="tab">로그인기록</a>
		</li>
	</ul>
	<form id="pageForm">
		<input type="hidden" name="page"/>
		<input type="hidden" name="mem_id" value="${mem_id }"/>
	</form>
	
	<div class="tab-content tab-bordered">
		<div class="tab-pane active" id="home" role="tabpanel">
			<table class="table table-striped">
				<tr>
					<th>아이디</th>
					<th>로그인 기록</th>
				</tr>
			<c:set var="recordList" value="${pagingVO.dataList}"/>
			<c:if test="${not empty recordList}">
				<c:forEach var="item" items="${recordList}">
					<tr>
						<td>${item.mem_id }</td>
						<td>${item.login_time }</td>
					</tr>
				</c:forEach>
			</c:if>
			</table>
			<div id="pagingArea">
				${pagingVO.pagingHTMLForBS}
			</div>
		</div>
	</div>
</div>


<script>
	pageForm = $('#pageForm');
function ${pagingVO.funcName}(page){
	if(page<=0) return;
	pageForm.find("input[name='page']").val(page);
	pageForm.submit();
	pageForm.find("input[name='page']").val("");
};
</script>