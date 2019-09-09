<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#evtBtn {
	text-align: center;
}

#listCarousel, #listCarousel1 {
	height: 200px;
}

div.slick-list {
	height: 200px;
}

#banner-slider .slick-list {
	height: 550px;
}

/* .jinwon { */
/* 	border-left: 1px solid black; */
/* } */
#profileImg{
	width: 250px;
	max-height : 150px;
	margin-right: 20px;
}
#image_container{
	width : 1200px;
}
div[name='annTitle']{
		cursor:pointer;
		color : white;
		text-align : center;
		width : 230px;
		margin-left : 70px;
}
div[name='evtTitle']{
	text-align: center;
    width: 500px;
    margin-left: 300px;
    cursor:pointer;
	color : white;
}
#evtImg{
	margin-left: 210px;
}

#profileRow{
	margin-left : 130px;
}
#dalkongTable{
	margin-left : 160px;
}
#dalkongTable th,td{
	padding:5px;
}
#dalKongTd{
	width : 300px;
}
#annText{
	text-align : center;
}

</style>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->


<div class="main-wrapper home">
	<div class="container">
		
		<br> <br>
		
		<div class="heading">
			<h2 class="heading-v1-title">
				<i class="fa fa-bullhorn"></i> 마감 전 공고
			</h2>
		</div>
		
		<br>
		
		<div id="listCarousel" class="brand_carousel bg-white">
			<div id="brands" class="carousel_row">
				<c:if test="${announceList.size() gt 0 }">
					<c:forEach var="announce" items="${announceList }">
						<div class="jinwon" style="height: 150px;">
							<div class="brand_single">
								<div class="card bg-white mb-3"
									style="padding-top: 50px; max-width: 40rem; height: 200px;">
									<div id="${announce.annl_no }" name="annTitle" class="card-header bg-danger" style="height: 40px;">${announce.annl_title }</div>
									<div id="annText" class="card-body" style="height: 120px;">
										<h4 class="card-title">${announce.annl_date}일부터</h4>
										<p class="card-text">${announce.annl_closeing }일까지</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>


		<br> <br>
		
		<div class="heading ">
			<h2 class="heading-v1-title">
				<i class="fa fa-lightbulb-o"></i> 공모전
			</h2>
		</div>
		<br>
		<br>
		
		<section class="banner">
			<div id="banner-slider" class="element_row">
				<c:forEach var="event" items="${recentEvent }">
					<c:choose>
						<c:when test="${empty event.evt_profile}">
							<c:set var="img"
 								value="${pageContext.request.contextPath}/img/noimage.png" 
 								scope="page" /> 
 						</c:when> 
 						<c:otherwise> 
 							<c:set var="img" 
 								value="data:image/*;base64,${event.evt_profileBase64}" 
 								scope="page" /> 
 						</c:otherwise> 
 					</c:choose>
					<div class="jinwon" >
							<div class="brand_single">
								<div class="card bg-white mb-3"
									>
									<div id="${event.evt_no }" name="evtTitle" class="card-header bg-danger" >${event.evt_title }</div>
									<div class="card-body">
									<img id="evtImg" src="${img }">
<%-- 										<h4 class="card-title">${announce.annl_date}일부터</h4> --%>
<%-- 										<p class="card-text">${announce.annl_closeing }일까지</p> --%>
									</div>
								</div>
							</div>
						</div>
 				</c:forEach> 
 			</div> 
 		</section> 
		
		
		<br><br>
		
		
		
		
		
		<br> <br>
		
		<div class="heading ">
			<h2 class="heading-v1-title">
				<i class="fa fa-industry"></i> 기업 별 공고
			</h2>
		</div>
		
		<br>
		
		<div id="profileRow" class="row">
			<div class="col-md-4">
				<div id="image_container" class="image_container">
					<c:forEach var="profile" end="2" items="${profileList }">
						<c:set var="profileImg"
							value="data:image/*;base64,${profile.mem_profileBase64}"
							scope="application" />
						<img id="profileImg" src="${profileImg }" alt="${profile.ent_name }">
					</c:forEach>
				</div>
			</div>
		</div>
		
		<br> <br>
		
		<div class="heading">
			<h2 class="heading-v1-title">
				<i class="fa fa-twitch"></i> 블로그 인기 게시글
			</h2>
		</div>
		
		<br>
		
		<table id="dalkongTable">
			<tr>
				<c:forEach var="board" begin="0" end="2" items="${famousBoardList }">
					<td id="dalKongTd">
						<div class="card text-white bg-danger mb-3"
							style="max-width: 20rem;">
							<div class="card-header">
								<a href="${pageContext.request.contextPath }/bloghome/blogView.do?what=${board.bb_no }" target="_blank">
									<h4 class="card-title">${board.bc_title }</h4>
								</a>
							</div>
							<div class="card-body">
								<span>by <span> <a href="${pageContext.request.contextPath }/bloghome/blogHome.do?what=${board.bc_writer }" target="_blank" class="text-white">${board.bc_writer }</a>
								</span>
								</span><br><span class="text-white">조회수 : ${board.bc_hit } </span> <br>
								<br>
								<p class="card-text"></p>
								<a href="${pageContext.request.contextPath }/bloghome/blogView.do?what=${board.bb_no }" target="_blank" class="btn btn-danger">본문 보기</a>
							</div>
						</div>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="board" begin="3" end="5" items="${famousBoardList }">
					<td id="dalKongTd">
						<div class="card text-white bg-danger mb-3"
							style="max-width: 20rem;">
							<div class="card-header">
								<a href="${pageContext.request.contextPath }/bloghome/blogView.do?what=${board.bb_no }" target="_blank" >
									<h4 class="card-title">${board.bc_title }</h4>
								</a>
							</div>
							<div class="card-body">
								<span>by <span> <a href="${pageContext.request.contextPath }/bloghome/blogHome.do?what=${board.bc_writer }" target="_blank" class="text-white">${board.bc_writer }</a>
								</span>
								</span><br><span class="text-white"> ${board.bc_hit } 회 조회 </span> <br>
								<br>
								<p class="card-text"></p>
								<a href="${pageContext.request.contextPath }/bloghome/blogView.do?what=${board.bb_no }" target="_blank" class="btn btn-danger">본문 보기</a>
							</div>
						</div>
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>
</div>
<script type="text/javascript">
	<c:if test="${not empty message }">
	alert('${message}');
	<c:remove var="message" scope="session" />
	</c:if>
	
	$('div[name="annTitle"]').on('click', function(){
		var annl_no = $(this).prop('id');
		location.href = "${pageContext.request.contextPath}/announce/announceView.do?annl_no=" + annl_no;
	})
	
	$('img[id=profileImg]').on('click', function(){
		var ent_name = $(this).prop('alt');
		location.href = "${pageContext.request.contextPath}/announce/announceListView.do?searchAddr=&searchType=ent&searchWord=" + ent_name + "&page=&searchST=&searchFEB=0&searchCareer="
	})
	
	$('div[name="evtTitle"]').on('click', function(){
		var evt_no = $(this).prop('id');
		location.href = "${pageContext.request.contextPath}/event/eventInformation?evt_no="+ evt_no;
	})
	
</script>