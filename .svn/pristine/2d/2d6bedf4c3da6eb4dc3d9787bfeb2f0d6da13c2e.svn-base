<%@page import="kr.or.ddit.enumpkg.ServiceKind"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.list-group-item {cursor:pointer;}
    .list-group #hide{display:none;}
    
    #resultModal{
		margin-top: 5%;
	}
</style>    
	<div>
		<br><br><br>
	</div>
	<div class="col-lg-2 col-md-4 order-1 sidebar">
		<ul class="list-group">
			<li class="list-group-item"><a>이력서관리</a></li>
				<ul id="hide">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="addresume" class="list-group-item">간편이력서 등록</li><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="resumestatus" class="list-group-item">이력서현황</li><br>
				</ul>
			<li class="list-group-item"><a>입사지원관리</a></li>
				<ul id="hide">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="annList" class="list-group-item">입사지원 현황</li><br>
				</ul>
<!-- 			<li id="careerNet" class="list-group-item"><a>인적성검사</a></li> -->
			<li class="list-group-item"><a>스크랩한 공고</a></li>
				<ul id="hide">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="scrapLeft" class="list-group-item">스크랩한 공고</li><br>
				</ul>
			<li class="list-group-item"><a>개인정보 관리</a></li>
				<ul id="hide">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="infoman" class="list-group-item">개인정보 관리</li><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="loginrecord" class="list-group-item">로그인기록</li><br>
				</ul>
		</ul>
		<form id="idForm" action="${pageContext.request.contextPath}/mypage/authPath.do">
			<input type="hidden" name="mem_id" value="${mem_id }"/>
			<input type="hidden" name="div"/>
		</form>
		
		<form id="resumeForm" action="${pageContext.request.contextPath}/mypage/addresume.do">
			<input type="hidden" name="mem_id" value="${mem_id }"/>
		</form>
		
		<form id="statusForm" action="${pageContext.request.contextPath}/mypage/resumeStatus.do">
			<input type="hidden" name="mem_id" value="${mem_id }"/>
		</form>

	</div>
	
<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".list-group>li").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
    
    $('#loginrecord').on('click', function(){
    	$('#idForm').find("input[name='div']").val("login");
    	$('#idForm').submit();
    })
    
    $('#infoman').on('click', function(){
    	$('#idForm').find("input[name='div']").val("info");
    	$('#idForm').submit();
    })
    
    $('#addresume').on('click', function(){
    	$('#resumeForm').submit();
    })
    
    $('#resumestatus').on('click', function(){
    	$('#statusForm').submit();
    })
    
    $('#annList').on('click', function(){
    	location.href= "${pageContext.request.contextPath}/mypage/announceListView.do";
    })
    
    $('#careerNet').on('click', function(){
    	location.href = "${pageContext.request.contextPath}/mypage/careerNet.do"
    })
    
    $('#scrapLeft').on('click', function(){
		location.href= "${pageContext.request.contextPath}/mypage/scrapList.do";
	})
</script>

