<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="${pageContext.request.contextPath}/insert" method="post" enctype="multipart/form-data">
<input name="mem_id" type="text" />
<input name="mem_pass" type="text" />
<input name="mem_name" type="text" />
<input name="mem_mail" type="text" />
<input name="mem_tel" type="text" />
<input name="mem_div" type="text" />
<input name="mem_delete" type="text" />
<input name="mem_alarm" type="text" />
<input type="file" class="form-control" name="mem_image" />
<input id="createBtn" type="submit" class="btn btn-primary" value="작성">
</form>
