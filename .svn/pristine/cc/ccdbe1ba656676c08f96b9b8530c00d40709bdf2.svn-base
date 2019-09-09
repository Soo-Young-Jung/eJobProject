<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<input id="aa" type="text">
<div id="textarea">

</div>
<button id="settext">보내기</button>

	<script src="${pageContext.request.contextPath }/assets/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/slick/slick.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/circle-progress/jquery.appear.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/isotope/isotope.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/lazyload/lazyload.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/fancybox/fancyMorph.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/counterUp/waypoint.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/counterUp/jquery.counterup.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/smoothscroll/smooth-scroll.polyfills.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/daterangepicker/js/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/daterangepicker/js/daterangepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/biznex.js"></script>
	<script type="text/javascript">
		$("#settext").on("click", function() {
			$.ajax({
		        type : 'get',
		        url : 'https://business.api.friday24.com/closedown/' + $("#aa").val(),
		        dataType : 'json',
		        beforeSend : function(xhr){
		            xhr.setRequestHeader("Authorization", "Bearer 506Ym044u48Y2tHdv3VZ");
		        },
		        error: function(xhr, status, error){
		            alert(error);
		        },
		        success : function(xml){
		            alert(xml.state);
		        }
		    });
		});
	</script>
	ㅁㄴㅇㅁㄴㅇㅁㄴㅇ
</body>


</html>