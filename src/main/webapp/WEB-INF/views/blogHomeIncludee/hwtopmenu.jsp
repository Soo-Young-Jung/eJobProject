<%@page import="kr.or.ddit.vo.BlogVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header id="pageTop" class="header" style="height: 91px;" fill-rule="evenodd" fill="rgb(255, 0, 0)">
		<!-- NAVBAR -->
		
	<nav id="topMenu" class="navbar navbar-expand-md main-nav bg-secondary" style="opacity: 1;">
				<a class="navbar-brand" href="${pageContext.request.contextPath }">
					<img src="${pageContext.request.contextPath }/assets/img/logo3.png" alt="Logo">
				</a>
			<div class="container">
				<button class="navbar-toggler navbar-toggler-right">
					<span class="burger-menu icon-toggle"><i class="fa fa-bars"></i></span>
				</button>

				<div class="navbar-collapse">
			
					<ul class="navbar-nav ml-auto">
					
						<li class="nav-item dropdown drop_single ">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="javascript:void(0)">커뮤니티</a>
							<ul class="dropdown-menu dd_first">
								<li><a href="${pageContext.request.contextPath }/notice/noticeList.do">공지사항</a></li>
								<li><a href="${pageContext.request.contextPath }/faq/faqList.do">FAQ</a></li>
								<li><a href="${pageContext.request.contextPath }/suggestion1">건의 게시판</a></li>
							</ul>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath }/announce/announceListView.do"><span class="sr-only">(current)</span>공고 게시판</a>
						</li>
						
						<li class="nav-item dropdown drop_single ">
							<a id="event" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="javascript:void(0)">이벤트</a>
						</li>

		<li class="nav-item dropdown drop_single ">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="javascript:void(0)">기업</a>
							<ul class="dropdown-menu dd_first">
								<li><a href="${pageContext.request.contextPath }/ent_info">기업회원 </a></li>
								<li><a href="${pageContext.request.contextPath }/member">일반회원</a></li>
								<li><a href="page-team.html">Team</a></li>
								<li><a href="page-aboutus.html">About Us</a></li>
								<li><a href="page-career.html">Career</a></li>
								<li><a href="page-career-details.html">Career details</a></li>
								<li><a href="404.html">404 page</a></li>
								<li><a href="page-comingsoon.html">Coming Soon</a></li>
							</ul>
						</li>

						<li class="nav-item dropdown drop_single ">
							<a class="nav-link dropdown-toggle" 
								aria-haspopup="true" aria-expanded="false" 
								onclick="window.open('${pageContext.request.contextPath }/bloghome/blogHome.do?what=${member.mem_id }')">
								내 블로그
							</a>
						</li>
						
						<li class="nav-item dropdown drop_single ">
							<a id="loginMenu" class="nav-link dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" href="${pageContext.request.contextPath }/login/genlogin.do"
								>로그인</a>
						</li>
						
						<li class="nav-item dropdown drop_single ">
							<a id="mypage" class="nav-link dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false"
								>마이페이지</a>
						</li>
						
						<li class="nav-item dropdown drop_single ">
							<a id="logoutMenu" class="nav-link dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" href="${pageContext.request.contextPath }/login/logout.do"
								>로그아웃</a>
						</li>
						
						<!-- header search -->
						<li class="nav-item">
							<c:if test="${not empty mem_id }">
								<a href="" id="alarmBtn" class="btn-search nav-link"><i class="fa fa-bell-o"></i></a>
								<form id="alarmForm" class="search_form" method="post"
								action='<c:url value='alarm/alarmList.do'>
									<c:param name='what' value='${mem_id }' />
								</c:url>'>
									<table class="table">
										<thead>
											<tr>
												<td>
													알림
												</td>
											</tr>
										</thead>
										<tbody id="listBody">
										</tbody>
									</table>
								</form>
							</c:if>
						</li>
					</ul>
				</div>
				<form id="mypageForm" action="${pageContext.request.contextPath }/mypage/main.do">
					<input type="hidden" name="mem_id" value="${mem_id }">
				</form>
				<!-- header search ends-->
			</div><!-- NAVBAR ENDS-->
		</nav></header>
		
<script>
	function delCookie(cookie_name) {
	    set_cookie(cookie_name, "", 0 , 0);
	}
	
	$('#logoutMenu').on('click', function(){
		delCookie('loginId');
	})
	
	if("${success}" == "false"){
		$('#loginMenu').hide();
		$('#logoutMenu').show();
		$('#mypage').show();
	}else{
		$('#loginMenu').show();
		$('#logoutMenu').hide();
		$('#mypage').hide();
	}
	
	$('#mypage').on('click', function(){
		$('#mypageForm').submit();
	})
	
	$('#alarmBtn').on('click', function(){
		
		var listBody = $("tbody#listBody");
		
		$.ajax({
			url : "${pageContext.request.contextPath}/alarm/alarmList.do",
			dataType : "json",
			success : function(resp) {
				let alarmList = resp;
				var trTags = [];
				if(alarmList && alarmList.length > 0){
					$(alarmList).each(function(idx, alarm){
						var tr = $("<tr>");
						trTags.push(tr);
						var td = $("<td>");
						tr.html(td);
						var innerTrs = [];
						if(alarm.al_div==1){
							innerTrs.push(
								$("<tr>").append(
									$("<td>").text(alarm.mem_id2+"님이 회원님의 게시글 "+alarm.bc_title+"에 댓글을 남기셨습니다.")
								)
							);
						}else if(alarm.al_div==2){
							innerTrs.push(
								$("<tr>").append(
									$("<td>").text("축하드립니다! "+alarm.annl_title+"의 채용 공고에서 합격하셨습니다!")
								)
							);
						}else if(alarm.al_div==3){
							innerTrs.push(
								$("<tr>").append(
									$("<td>").append(
											$("<a>").prop({
												"href":"${pageContext.request.contextPath }/announce/announceView.do?annl_no="+alarm.annl_no
											})
											.text(alarm.ent_name+"에서 회원님에게 '"+alarm.cnnl_title+"' 공고 건을 권유 하셨습니다.")
										)
								)
							);
						}else if(alarm.al_div==4){
							innerTrs.push(
								$("<tr>").append(
									$("<td>").text(alarm.mem_id2+"님이 회원님을 팔로우하기 시작했습니다.")
								)
							);
						}
						
						td.html(innerTrs);
					});
				}else{
					trTags.push(
							$("<tr>").append($("<td>")
									 .text("알림 없음.")
							)		 
						);
				}
				listBody.html(trTags);
			},
			error : function(errorResp) {
				console.log(errorResp.status + ", "
						+ errorResp.responseText)
			}
		})
		
	})
	
	$('#event').on('click', function(){
		location.href = "${pageContext.request.contextPath}/event"
	})
</script>
<div class="mobile-sticky-header-overlay"></div>
<!-- BREDCRUMB -->
<section class="bredcrumb">
	<div class="bg-image text-center" style="background-image: url('${pageContext.request.contextPath }/assets/img/bg2.png');">
		<h1>
			<a href="
				<c:url value='blogHome.do' >
					<c:param name='what' value='${blog.mem_id }' />
				</c:url>
				">
				${blog.blog_name }
			</a>
		</h1>
	</div>
</section>