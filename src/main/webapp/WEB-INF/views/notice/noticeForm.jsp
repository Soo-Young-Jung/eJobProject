<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript"
	src="<c:url value='/js/ckeditor/ckeditor.js' />"></script>
<c:if test="${not empty message }">
	<div class="alert alert-danger alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>${message }</strong>
	</div>
</c:if>

<div class="container">
	<br>
	<c:choose>
		<c:when test="${not empty notice.not_no and notice.not_no gt 0}">
			<h4>${notice.not_no }번글수정</h4>
		</c:when>
		<c:otherwise>
			<br>
			<h4>글 작성</h4>
		</c:otherwise>
	</c:choose>
	<form:form commandName="notice" id="noticeForm" method="post">
		<!-- 글 수정 시 사용함 -->
		<c:choose>
			<c:when test="${not empty notice.not_no and notice.not_no gt 0}">
				<input type="hidden" name="not_no" value="${notice.not_no}" />
			</c:when>
			<c:otherwise>
				<input type="hidden" name="not_no" value="0" />
			</c:otherwise>
		</c:choose>

		<table class="table table-bordered">
			<tr>
				<th>작성자</th>
				<td><input type="text" required name="adm_id" readOnly
					class="form-control" value="${sessionScope.mem_id }" /> <form:errors
						path="adm_id" element="span" cssClass="error" /></td>
			</tr>
			
			<tr>
				<th>글제목</th>
				<td><input type="text" required name="not_title"
					class="form-control" value="${notice.not_title}" /> <form:errors
						path="not_title" element="span" cssClass="error" /></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td><textarea name="not_content" id="not_content"
						class="form-control" rows="2">${notice.not_content }</textarea> <form:errors
						path="not_content" element="span" cssClass="error" /></td>
			</tr>
			<tr>

<%-- 				<c:set var="enter" value="" /> --%>
<%-- 				<c:if test="${not_div == 'E' }"> --%>
<%-- 					<c:set var="enter" value="checked='checked'" /> --%>
<%-- 				</c:if> --%>
			
<%-- 				<c:set var="gen" value="" /> --%>
<%-- 				<c:if test="${not_div == 'G' }"> --%>
<%-- 					<c:set var="gen" value="checked='checked'" /> --%>
<%-- 				</c:if> --%>
				<th>구분</th>
				<td><input type="radio" name="not_div" value="E" ${notice.not_div eq 'E' ? 'checked' : '' } />기업회원
					<input type="radio" name="not_div" value="G" ${notice.not_div eq 'G' ? 'checked' : '' } />일반회원</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"
					class="btn btn-danger-outlined" value="완료" /> <input type="button"
					onclick="history.go(-1);" class="btn btn-danger-outlined"
					value="취소" /></td>
			</tr>
		</table>
	</form:form>
</div>
