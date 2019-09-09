<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<!DOCTYPE html>
<html>
<head>
<!-- SITE TITTLE -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>이잡어때 - 공모전</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7/css/bootstrap-theme.min.css"/>

	<!-- PLUGINS CSS STYLE -->
	<link href="${pageContext.request.contextPath }/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/assets/plugins/selectbox/select_option1.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/assets/plugins/slick/slick.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath }/assets/plugins/slick/slick-theme.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath }/assets/plugins/prismjs/prism.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/assets/plugins/fancybox/fancyMorph.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/assets/plugins/selectbox/select_option1.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/assets/plugins/thin-line-icons/css/thin-line-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/assets/plugins/isotope/isotope.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/assets/plugins/animate/animate.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/assets/plugins/daterangepicker/css/daterangepicker.css" rel="stylesheet">

	<!-- CUSTOM CSS -->
	<link href="${pageContext.request.contextPath }/assets/css/biznex.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/default.css" id="option_color">

	<!-- FAVICON -->
	<link href="${pageContext.request.contextPath }/assets/img/eJoblogo.png" rel="shortcut icon">

<%-- <title><tiles:getAsString name="title" /></title> --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.min.3.4.1.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/sessionTimer.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
	pre{
 		background-color : #ffffff;
	}
	.align-center { text-align: center; }
</style>
<style>
	input{
		width : 100px;
	}
</style>
</head>
<body id="body" class="home-classic boxed-menu">
<div id="top">	
	<tiles:insertAttribute name="eventtopMenu" />
</div>
<div id="left">
	<tiles:insertAttribute name="eventleftMenu" />
</div>
<div id="content">
 	<div>
 	<br>
 	<br>
 	</div>
 	<tiles:insertAttribute name="eventcontent"/>	
	<!-- JAVASCRIPTS -->
	<script src="${pageContext.request.contextPath }/assets/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/slick/slick.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/chartjs/chart.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/circle-progress/jquery.appear.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/isotope/isotope.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/lazyload/lazyload.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/fancybox/fancyMorph.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/counterUp/waypoint.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/counterUp/jquery.counterup.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/smoothscroll/smooth-scroll.polyfills.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/syotimer/jquery.syotimer.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/daterangepicker/js/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/daterangepicker/js/daterangepicker.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDU79W1lu5f6PIiuMqNfT1C6M0e_lq1ECY"></script>
	<script src="${pageContext.request.contextPath }/assets/js/biznex.js"></script>

</div>
<div id="footer">
	<tiles:insertAttribute name="footer" />
</div>
</body>
</html>









