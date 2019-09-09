<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="main-wrapper page-error">

<!-- ERROR SECTION-->
<section class="error">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-6">
        <h1>${error} Page</h1>
        <p>죄송합니다.</p>
        <c:choose>
        	<c:when test="${error < 500}">
        		<p>해당 페이지는 존재하지 않습니다.</p>
        	</c:when>
        	<c:otherwise>
        		<p>현재 서버에 문제가 발생하였습니다.</p>
        	</c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath }" class="btn form-control btn-danger btn-block">Go Back</a>
      </div>
    </div>
  </div>
</section>
	

</div>


