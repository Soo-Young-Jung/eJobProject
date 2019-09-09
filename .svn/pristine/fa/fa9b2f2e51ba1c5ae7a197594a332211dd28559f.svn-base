<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#a{
		width : 140px;
		height : 140px;
	}
	em{
		font-size : 50px;
		font-weight : bold;
	}
	.container{
		width: 100%;
 		text-align: center;
	}
	
	#aa{
		display: inline-block;
	}
	div[name='annTitle']{
		cursor:pointer;
		color : white;
		text-align : center;
		width : 260px;
		margin-left : 70px;
}
</style>
<div class="container">
	<div id="aa">
		<button name="resume" id="a" class="btn btn-danger btn-rounded btn-lg"><em>${count }</em>/10<br>이력서</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button name="ann" id="a" class="btn btn-danger btn-rounded btn-lg"><em>${annCnt }</em><br>입사지원 완료</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button name="scrap" id="a" class="btn btn-danger btn-rounded btn-lg"><em>${scrapCnt }</em><br>스크랩</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>	
	<br><br><br><br><br><br><br>
	
	<div class="heading">
			<h2 class="heading-v1-title"><i class="fa fa-bullhorn"></i> 마감 전 공고</h2>
		</div>
		<div id="listCarousel" class="brand_carousel bg-white">
			<div id="brands" class="carousel_row">
				<c:if test="${announceList.size() gt 0 }">
					<c:forEach var="announce" items="${announceList }">
						<div class="jinwon" style="height: 150px;">
							<div class="brand_single">
								<div class="card bg-white mb-3" style="padding-top:50px; max-width: 40rem; height: 200px;">
									<div id="${announce.annl_no }" name="annTitle" class="card-header bg-danger" style="height: 40px;">${announce.annl_title }</div>
									<div class="card-body" style="height: 120px;">
										<h4 class="card-title">${announce.annl_date}일 부터</h4>
										<p class="card-text">${announce.annl_closeing }일 까지</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
</div>

<form id="statusForm" action="${pageContext.request.contextPath}/mypage/resumeStatus.do">
			<input type="hidden" name="mem_id" value="${mem_id }"/>
</form>

<script>
	$('button[name="resume"]').on('click', function(){
		$('#statusForm').submit();
	})
	
	$('button[name="ann"]').on('click', function(){
		location.href= "${pageContext.request.contextPath}/mypage/announceListView.do";
	})
	
	$('button[name="scrap"]').on('click', function(){
		location.href= "${pageContext.request.contextPath}/mypage/scrapList.do";
	})
	
	$('div[name="annTitle"]').on('click', function(){
		var annl_no = $(this).prop('id');
		location.href = "${pageContext.request.contextPath}/announce/announceView.do?annl_no=" + annl_no;
	})
	
</script>