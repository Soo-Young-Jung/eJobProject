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
		<c:when test="${not empty faq.faq_no and faq.faq_no gt 0}">
			<h4>FAQ ${faq.faq_no }번 글 수정</h4>
		</c:when>
		<c:otherwise>
			<br>
			<h4>글 작성</h4>
		</c:otherwise>
	</c:choose>
	<form:form commandName="faq" id="faqForm" method="post">
		<!-- 글 수정 시 사용함 -->
		<c:choose>
			<c:when test="${not empty faq.faq_no and faq.faq_no gt 0}">
				<input type="hidden" name="faq_no" value="${faq.faq_no}" />
			</c:when>
			<c:otherwise>
				<input type="hidden" name="faq_no" value="0" />
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
				<th>질문 제목</th>
				<td><input type="text" required name="faq_title"
					class="form-control" value="${faq.faq_title}" /> <form:errors
						path="faq_title" element="span" cssClass="error" /></td>
			</tr>
			<tr>
				<th>대답</th>
				<td><textarea name="faq_content" id="faq_content"
						class="form-control" rows="2">${faq.faq_content }</textarea> <form:errors
						path="faq_content" element="span" cssClass="error" /></td>
			</tr>
			<tr>

			<tr>
				<td colspan="2"><input type="submit"
					class="btn btn-danger-outlined" value="완료" /> <input type="button"
					onclick="history.go(-1);" class="btn btn-danger-outlined"
					value="취소" /></td>
			</tr>
		</table>
	</form:form>
</div>
