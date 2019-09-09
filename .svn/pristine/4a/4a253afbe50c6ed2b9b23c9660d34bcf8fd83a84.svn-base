<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.3.4.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sessionTimer.js"></script>
<style>
	#topMenu{
		background : #FF0000;
	}
</style>
</head>
<body>
<div id="top">
	<jsp:include page="/includee/topMenu.jsp" />
</div>
<div id="left">
	<jsp:include page="/includee/leftMenu.jsp" />
</div>
<div id="content">
	 <%
		 String pageName = (String)request.getAttribute("pageName");
	 	if(StringUtils.isBlank(pageName)){
	 		%>
	 			컨텐츠 영역
	 		<%
	 		
	 	}else{
	 		%>
		 <jsp:include page="<%=pageName %>" />
		 <%
	 	}
	 %>
	 
	 
</div>
<div id="footer">
	<jsp:include page="/includee/footer.jsp" />
</div>
</body>
</html>









