<%@page import="kr.or.ddit.enumpkg.ServiceKind"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<div>
<br><br><br>
</div>

<div class="col-lg-2 col-md-4 order-1 sidebar">
      <h4>공모전</h4>
      <ul class="list-group">
<%--          <c:forEach var="category" items=${blog.categoryList }> --%>
<%--             <li class="list-group-item" id=${category.bc_no }> --%>
<%--                <a href="<c:url value='/bloghome/blogboardlist.do'/>"> --%>
<%--                   ${category.bc_name } --%>
<!--                </a> -->
<!--             </li> -->
<%--          </c:forEach> --%>
<%--          <c:if test="${member.mem_div eq 'A' }"> --%>
<%--          </c:if> --%>
<%--          <li class="list-group-item"><a href="<c:url value='/event/eventInsert1'/>">이벤트 작성</a></li> --%>
         <li class="list-group-item"><a href="<c:url value='/event'/>">전체</a></li>
         <li class="list-group-item"><a href="<c:url value='/event1'/>">주최기관별</a></li>
         <li class="list-group-item"><a href="<c:url value='/event3'/>">응모대상별</a></li>
      </ul>
    
</div>

