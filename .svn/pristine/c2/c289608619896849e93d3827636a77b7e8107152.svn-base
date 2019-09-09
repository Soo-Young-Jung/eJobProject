<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<header id="pageTop" class="header" style="height: 91px;" fill-rule="evenodd" fill="rgb(255, 0, 0)">
		<!-- NAVBAR -->
		
	<nav id="topMenu" class="navbar navbar-expand-md main-nav bg-danger" style="opacity: 1;">
				<a class="navbar-brand" href="${pageContext.request.contextPath }">
					<img src="${pageContext.request.contextPath }/assets/img/logo2.png" alt="Logo">
				</a>
			<div class="container">
				<button class="navbar-toggler navbar-toggler-right">
					<span class="burger-menu icon-toggle"><i class="fa fa-bars"></i></span>
				</button>

				<div class="navbar-collapse">
					<ul class="navbar-nav ml-auto">
					
						<li class="nav-item dropdown drop_single ">
							<a id="mypage" class="nav-link dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false"
								>마이페이지 홈</a>
						</li>
						
						<li class="nav-item dropdown drop_single ">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="javascript:void(0)">이력서관리</a>
							<ul class="dropdown-menu dd_first">
								<li><a href="${pageContext.request.contextPath}/mypage/addresume.do">간편이력서 등록</a></li>
								<li><a id="resumestatus1" href="#">이력서 현황</a></li>
							</ul>
						</li>

						<li class="nav-item dropdown drop_single ">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="javascript:void(0)">입사지원관리</a>
							<ul class="dropdown-menu dd_first">
								<li><a id="ann" href="#">입사지원 현황</a></li>
							</ul>
						</li>

						<li class="nav-item dropdown drop_single ">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="javascript:void(0)">스크랩/최근본</a>
							<ul class="dropdown-menu dd_first">
								<li><a href="#">스크랩한 공고</a></li>
								<li><a href="#">관심기업</a></li>
							</ul>
						</li>


						
						<li class="nav-item dropdown drop_single ">
							<a id="loginMenu" class="nav-link dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" href="${pageContext.request.contextPath }/login/genlogin.do"
								>로그인</a>
						</li>
						
						
						<li class="nav-item dropdown drop_single ">
							<a id="logoutMenu" class="nav-link dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" href="${pageContext.request.contextPath }/login/logout.do"
								>로그아웃</a>
						</li>
						
					</ul>
				</div>
				
				<form id="mypageForm" action="${pageContext.request.contextPath }/mypage/main.do">
					<input type="hidden" name="mem_id" value="${mem_id }">
				</form>
				
				<form id="statusForm1" action="${pageContext.request.contextPath}/mypage/resumeStatus.do">
					<input type="hidden" name="mem_id" value="${mem_id }"/>
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
		
		$('#resumestatus1').on('click', function(){
    		$('#statusForm1').submit();
    	})
    	
    	$('#ann').on('click', function(){
    		location.href= "${pageContext.request.contextPath}/mypage/announceListView.do";
    	})
	</script>