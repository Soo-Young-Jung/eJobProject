<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<!DOCTYPE html>
<html lang="en">
<head>

	<!-- SITE TITTLE -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>이잡어때 - 블로그 홈</title>

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

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>

<body id="body" class="blog-classic boxed-menu">

	<div id="top">
		<tiles:insertAttribute name="blogtop" />
	</div>
	<div id="right">
		<div class="main-wrapper blog-classic-right-sidebar">
			<section class="blog-grid">
				<div class="container">
					<div class="row">
						<div id="content">
							<tiles:insertAttribute name="blogcontent" />
							<tiles:insertAttribute name="blogright" />
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="blogfooter" />
	</div>

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
	<script src="${pageContext.request.contextPath }/assets/js/biznex.js"></script>
	
	<script>
	$('#slickimage').slick({
	  slidesToShow: 3,		// Number of slides to show
	  slidesToScroll: 1,	// Number of slides to scroll
	  arrows: true			// set navigation arrows to show
	});
	</script>
</body>
