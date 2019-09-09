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
			<li class="list-group-item"><a>공고관리</a></li>
				<ul id="hide">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="annListLeft" class="list-group-item">나의 공고 리스트</li><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="writeLeft" class="list-group-item">공고 글쓰기</li><br>
				</ul>
		</ul>
		<ul class="list-group">
			<li class="list-group-item"><a>개인정보 관리</a></li>
				<ul id="hide">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="ent" class="list-group-item">기업정보 관리</li><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="infoman" class="list-group-item">개인정보 관리</li><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li id="loginrecord" class="list-group-item">로그인기록</li><br>
				</ul>
		</ul>
		<form id="idForm" action="${pageContext.request.contextPath}/mypage/authPath.do">
			<input type="hidden" name="mem_id" value="${mem_id }"/>
			<input type="hidden" name="div"/>
		</form>
		
		<form>
			
		</form>

	</div>
	
<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 li 태그를 클릭했을때
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
    	$('#idForm').find("input[name='div']").val("ent_login");
    	$('#idForm').submit();
    })
    
    $('#infoman').on('click', function(){
    	$('#idForm').find("input[name='div']").val("ent_info");
    	$('#idForm').submit();
    })
    
    $('#ent').on('click', function(){
    	$('#idForm').find("input[name='div']").val("ent_edit");
    	$('#idForm').submit();
    })
    
   	
    $('#annListLeft').on('click', function(){
    	location.href = "${pageContext.request.contextPath}/entmypage/myAnnounce.do";
    })
    
   	$('#writeLeft').on('click', function(){
   		location.href = "${pageContext.request.contextPath}/announce/announceForm.do";
	})
</script>

