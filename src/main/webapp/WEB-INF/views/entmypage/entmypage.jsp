<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#a{
		width : 140px;
		height : 140px;
	}
	em{
		font-size : 50px;
	}
	.container{
		width: 100%;
 		text-align: center;
	}
	
	#aa{
		display: inline-block;
	}
</style>
<div class="container">
		<div id="aa">
			<button name="annListContent" id="a" class="btn btn-danger btn-rounded btn-lg"><em>${count }</em><br>공고</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button name="ann" id="a" class="btn btn-danger btn-rounded btn-lg"><em>${annCnt }</em><br>종료된 공고</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
</div>

<script>
$('button[name="annListContent"]').on('click', function(){
	location.href = "${pageContext.request.contextPath}/entmypage/myAnnounce.do";
})
</script>