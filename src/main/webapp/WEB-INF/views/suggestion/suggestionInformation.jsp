<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"	href="https://jqueryui.com/resources/demos/style.css">
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<c:url value='/bootstrap-3.3.7/css/bootstrap.min.css' ></c:url>" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7/css/bootstrap-theme.min.css" />
<!-- jquery -> jquery-ui -> bootstrap 순 -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.3.4.1.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href="path to/fancybox.min.css" rel="stylesheet">
	<script src="path to/fancybox.min.js"></script>
<script type="text/javascript"
	src="<c:url value='/assets/js/ckeditor/ckeditor.js' />"></script>
<style type="text/css">

	textarea{
		width:300px;
		height:200px;
	}
	label{
		color : white;
	}
	.table {
      border-collapse: collapse;
      border-top: 3px solid #168;
    }  
    .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    #moc{
    	width:1500px;
    }
    #table{
     text-align: center;
    }
    textarea{
		width:300px;
		height:200px;
	}
	 #modal{
 		margin-top: 100px;
 	}
 	 #modal2{
 		margin-top: 100px;
 	}
 	 #modal3{
 		margin-top: 100px;
 	}
 	 #modal4{
 		margin-top: 100px;
 	}
 	 #modal5{
 		margin-top: 100px;
 	}
 	
	.aa{
 		margin-left: 450px;
 	}
 		#x{
 		 font-size : 2em;
 		color : black;
 	}
 	#img{
 		margin-left: 400px;
 	}
</style>
<br><br><br>
	<span><img id="img" style="width:50px" src="${pageContext.request.contextPath}/assets/img/건의.png"/>${event.evt_title}<label id="x">건의 게시판</label></span><br>
<div class="container" >
<div class="row justify-content-center">
	
	
	  <button id="moc" class="btn btn-danger">목록으로</button>  
	<table class="table table-striped">
		<tr>
			<th>글번호</th>
			<td>${suggestion.sug_no}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${suggestion.mem_id}</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td>${suggestion.sug_title}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${suggestion.sug_date}</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td>${suggestion.sug_content}</td>
		</tr>
		<tr>
			<th>댓글쓰기/글삭제/수정하기</th>
			<td>
	<button style="width:200px" id="btn" type="button" class="btn btn-danger-outlined">댓글 작성</button>
    <button style="width:200px" id="btn2" type="button" class="btn btn-danger-outlined">글삭제</button>
    <button style="width:200px" id="btn3" type="button" class="btn btn-danger-outlined">수정하기</button>
    
    
	<div id="accordion" role="tablist" aria-multiselectable="true">
		<div class="card card-accordion">
			<div class="card-header" role="tab" id="heading1">
				<h6 class="mb-0">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
						댓글 보기
					</a>
				</h6>
			</div>
			<div id="collapse1" class="collapse show" role="tabpanel" aria-labelledby="heading1">
				<div class="card-block">
				
					<table id="table" class="table table-striped">
					<thead>
						<tr>
							<th>작성자</thd>
							<th>제목</th>
							<th>내용</th>
							<th>날짜</th>
							<th>수정/삭제</th>
						</tr>
					</thead>
					<tbody id="listbody">
						<c:set var="reply" value="${reply}"/>
						<c:choose>
							<c:when test="${not empty reply }">
								<c:forEach var="reply" items="${reply }">
									<tr >
										<td>${reply.mem_id }</td>
										<td>${reply.sug_title}</td>
										<td>${reply.sug_content }</td>
										<td>${reply.sug_date }</td>
										
										
										
										<td> 
										
										 <button id="btn4" value="${reply.mem_id }" name="${reply.sug_no }" href="${pageContext.request.contextPath }/assets/img/elm/el10.jpg" class="btn btn-danger quick_view mod" >
     										  수정
    									</button>
										 <button id="btn5" value="${reply.mem_id  }" name="${reply.sug_no }" href="${pageContext.request.contextPath }/assets/img/elm/el10.jpg" class="btn btn-danger quick_view sac" >
     										  삭제
    									</button>
    								
    									</td>
										
										
<%-- 										<td><button id="su" value="${reply.mem_id }" class="btn btn-danger" >수정</button> --%>
<!-- 										<button id="sac" class="btn btn-danger" >삭제</button></td> -->
										<input type="hidden" id="sug_no" value="${reply.sug_no }" />
										<input type="hidden" id="mem_id" value="${reply.mem_id }" />
									</tr>
								
								</c:forEach>
						
							</c:when>
						</c:choose>
						
					</tbody>				
					</table>
				
				</div>
			</div>
		</div>
	</div>
			</td>
		</tr>
				
	</table>
	</div>
</div>


   



<!-- 댓글 쓰기 -->
<div id="modal" class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-body">
                  <button type="button" class="close push-xs-right" data-dismiss="modal" aria-label="Close">
                     <i class="fa fa-close"></i>
                  </button>
                  <div class="container-fluid modal-item">
			<h2>제목</h2>
			<hr>
			 <form id="insertForm" action="<c:url value='/suggestion/comment2'/>" method="post" enctype="multipart/form-data">
			 
						   <input class="form-control" type="text" name="sug_title" id="searchWord" /><br>
						   	<h2>내용</h2>
					<hr>
							<textarea name="sug_content"></textarea><br>
				     <input type="hidden" name="mem_id" value="${mem_id }"/>
    				   <input type="hidden" name="sug_no" value="${suggestion.sug_no }"/>
      				  <input type="hidden" name="sug_date" value="${suggestion.sug_date }"/>
      				  <input type="hidden" name="sug_parent" value="${suggestion.sug_no}"/>
      				  <input type="hidden" name="sug_depth" value="${suggestion.sug_depth+1 }"/>

 					<button   style="width:130px" type="submit" class="btn btn-danger btn-rounded aa">확인</button>
 					<button  style="width:130px" type="button" class="btn btn-primary btn-rounded ch">취소</button>
                  				
			</form> 
		
                  </div>
               </div>
            </div>
         </div>
     </div>
 
 
 
 
 
 
 
 
 
 
 

<!-- 글 삭제 -->
<div id="modal2" class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-body">
                  <button type="button" class="close push-xs-right" data-dismiss="modal" aria-label="Close">
                     <i class="fa fa-close"></i>
                  </button>
                  <div class="container-fluid modal-item">
					
			 <form id="insertForm" action="<c:url value='/suggestion/delete'/>" method="post" enctype="multipart/form-data">		 
						   	<h2>삭제 하시겠습니까?</h2>
					
				 	<input type="hidden" name="sug_no" value="${suggestion.sug_no }"/>
	     	<input type="hidden" name="sug_parent" value="${suggestion.sug_parent }"/>
	     	<input type="hidden" name="sug_depth" value="${suggestion.sug_depth }"/>
	     	<input type="hidden" name="mem_id" value="${suggestion.mem_id }"/>
	     	<input type="hidden" name="sug_title" value="${suggestion.sug_title }"/>
	     	<input type="hidden" name="sug_content" value="${suggestion.sug_content }"/>
         	<button   style="width:130px" type="submit" class="btn btn-danger btn-rounded aa">확인</button>
 					<button  style="width:130px" type="button" class="btn btn-primary btn-rounded ch">취소</button>
						
			</form> 
                  </div>
               </div>
            </div>
         </div>
     </div>
 
 
 
 
 <!-- 글 수정 -->
<div id="modal3" class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-body">
                  <button type="button" class="close push-xs-right" data-dismiss="modal" aria-label="Close">
                     <i class="fa fa-close"></i>
                  </button>
                  <div class="container-fluid modal-item">
			
			 <form id="insertForm1" action="<c:url value='/suggestion/update2'/>" method="post" enctype="multipart/form-data">
			 				<h2>제목</h2>
						   <input class="form-control" type="text" name="sug_title" id="searchWord" value="${suggestion.sug_title }"/><br>
						   	<h2>내용</h2>
							<textarea name="sug_content1">${suggestion.sug_content }</textarea><br>
					<input type="hidden" name="mem_id" value="${suggestion.mem_id }"/>
						<input type="hidden" name="sug_no" value="${suggestion.sug_no }"/>
	 
                  	<button   style="width:130px" type="submit" class="btn btn-danger btn-rounded aa">확인</button>
 					<button  style="width:130px" type="button" class="btn btn-primary btn-rounded ch">취소</button>
						
			</form> 
	
                  </div>
               </div>
            </div>
         </div>
     </div>
 
 
 

<!-- 댓글 수정 -->
<div id="modal4" class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-body">
                  <button type="button" class="close push-xs-right" data-dismiss="modal" aria-label="Close">
                     <i class="fa fa-close"></i>
                  </button>
                  <div class="container-fluid modal-item">
					
	<form id="updateForm1"
			action="${pageContext.request.contextPath}/suggestion/update2"
			method="post">
		
<!-- 	     	<input type="hidden" name="sug_no" /> -->
<!-- 	     	<input type="hidden" name="sug_parent" /> -->
<!-- 	     	<input type="hidden" name="sug_depth" /> -->
    	<div class="modal-body">
        		 
        		 <h2>제목</h2>
        		 <input class="form-control" type="text" name="sug_title" value="" />
        	
        		 <h2>내용</h2>
        		 <textarea  name="sug_content2"></textarea>
        		 <input type="hidden" name="mem_id" />
				<input type="hidden" name="sug_no" />
        		 
<!--         		   <input type="submit"  value="확인" class="btn btn-danger-outlined"/> -->
 				<button   style="width:130px" type="submit" class="btn btn-danger btn-rounded aa">확인</button>
 				<button  style="width:130px" type="button" class="btn btn-primary btn-rounded ch">취소</button>
		</form>			
                  </div>
               </div>
            </div>
         </div>
     </div>




	
	
<!-- 댓글 삭제 -->
<div id="modal5" class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-body">
                  <button type="button" class="close push-xs-right" data-dismiss="modal" aria-label="Close">
                     <i class="fa fa-close"></i>
                  </button>
                  <div class="container-fluid modal-item">
						<form  action="${pageContext.request.contextPath}/suggestion/delete" method="post">
		
	     					<input type="hidden" name="sug_no" />
	     					<input type="hidden" name="mem_id" />
	     				   <input type="submit"  value="확인" class="btn btn-danger-outlined"/>
					</form>
		
                  </div>
               </div>
            </div>
         </div>
     </div>	
	
	
	
	
	
	
	
	
	
<script>

CKEDITOR.replace('sug_content',{});
CKEDITOR.replace('sug_content1',{});
CKEDITOR.replace('sug_content2',{});
	
	var updateForm1 = $("#updateForm1");
	
	var deleteForm1 = $("#deleteForm1");
	
	var listbody = $("#listbody");
	
	
	var modal = $("#modal");
	var modal2 = $("#modal2");
	var modal3 = $("#modal3");
	var modal4 = $("#modal4");
	var modal5 = $("#modal5");
	$("#btn").on("click", function(){
		modal.modal('show');
	})
	
	$("#btn2").on("click", function(){
		modal2.modal('show');
	})
	
	$("#btn3").on("click", function(){
		modal3.modal('show');
	})
	
	$("#btn4").on("click", function(){
		modal4.modal('show');
	})
	
	$("#btn5").on("click", function(){
		modal5.modal('show');
	})
	
	
	$(".ch").on("click", function(){
	
		modal.modal('hide');
		modal2.modal('hide');
		modal3.modal('hide');
		modal4.modal('hide');
		modal5.modal('hide');
	})
	
	$(".mod").on("click", function(){
		
// 		alert($(this).attr('value'));
// 		alert($(this).attr('name'));
			
			    var checkBtn = $(this);
			
			 
			    var tr = checkBtn.parent().parent();
			    var td = tr.children();
			    
			   
			    var a1 = td.eq(0).text();
			    var a2 = td.eq(1).text();
			    var a3 = td.eq(2).text();
			    updateForm1.find("input[name='sug_title']").val(a1);
			    updateForm1.find("input[name='sug_content']").val(a2);
			    updateForm1.find("input[name='mem_id']").val($(this).attr('value'));
			    updateForm1.find("input[name='sug_no']").val($(this).attr('name'));

// 		updialog1.dialog("open");
	})
	
	$(".sac").on("click", function(){
		
// 		alert($(this).attr('value'));
// 		alert($(this).attr('name'));
		  var checkBtn = $(this);
			
			 
		    var tr = checkBtn.parent().parent();
		    var td = tr.children();
		    
		   
		    var a1 = td.eq(0).text();
		    var a2 = td.eq(1).text();
		    var a3 = td.eq(2).text();
		
		    deleteForm1.find("input[name='mem_id']").val($(this).attr('value'));
		    deleteForm1.find("input[name='sug_no']").val($(this).attr('name'));
// 		deletedialog.dialog("open");
	})
	$("#moc").on("click", function(){
		location.href="<c:url value='/suggestion1'/>";
	})

	   if("${message}"!=""){
	   alert("${message}");
   }
	

</script>









