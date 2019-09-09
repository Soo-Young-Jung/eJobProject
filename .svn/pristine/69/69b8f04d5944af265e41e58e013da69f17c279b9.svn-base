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
<script type="text/javascript"
	src="<c:url value='/assets/js/ckeditor/ckeditor.js' />"></script>

	
<title>GuestBook</title>
<style type="text/css">
	input{
		margin: 3px;
	}
	#table{
		width : 1500px;
	
	}
	.reply{
		background : pink;

	}
	.modify{
		background : red;
	}
	.remove{
		background : yellow;
	}
	table{
		
		text-align: center;
	}
	
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
/*  	.btn{ */
/*  		width: 1500px; */
/*  	} */
 	#modal{
 		margin-top: 100px;
 	}
   	#btn{ 
   		margin-left:1300px; 
   	} 
	#sdf{
 		margin-left: 500px;
 	}
 	h2{
 		margin-left: 500px;
 	}
 	#x{
 		 font-size : 2em;
 		color : black;
 	}
 	#img{
 		margin-left: 400px;
 	}
</style>
</head>
<body>





<br><br><br>
<span><img id="img" style="width:50px" src="${pageContext.request.contextPath}/assets/img/건의.png"/>${event.evt_title}<label id="x">건의 게시판</label></span><br>
	
<button style="width:200px" id="btn" type="button" class="btn btn-danger btn-rounded">새글 작성</button>


	

	

<%-- 	 <button href="${pageContext.request.contextPath }/assets/img/elm/el10.jpg" class="btn btn-danger quick_view" data-fancybox="quick-view" data-qw-form="qw-form-1"> --%>
<!--         새글 쓰기 -->
<!--     </button> -->
<!-- 	<table> -->
<!-- 	<tr> -->
<!-- 		<td> -->
<!-- 		<br> -->
<!-- 			<select id="searchType" class="form-control"> -->
<%-- 					<option value="all" ${pagingVO.searchType eq 'all' ? "selected":"" }>전체</option>	 --%>
<%-- 					<option value="title" ${pagingVO.searchType eq 'title' ? "selected":"" }>제목</option>	 --%>
<%-- 					<option value="content" ${pagingVO.searchType eq 'content' ? "selected":"" }>내용</option>	 --%>
				
<!-- 				</select> -->
<!-- 		</td> -->
<!-- 		<td> -->
<%-- 			<br>	<input class="form-control" type="text" id="searchWord" value="${pagingVO.searchWord}"/> --%>
				
<!-- 		</td> -->
<!-- 		<td> -->
	
<!-- 		<input   type="button" value="검색" id="searchBtn"/> -->
				
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->
	
	
	
	
	

	
	
	
	
	
	
	
<br>
<br>
<br>	
<div class="container" >
<div class="row justify-content-center">

   <table  id="table" class="table table-striped">
      <thead>
         <tr>
         	<th style="width:120px">작성자ID</th>
            <th style="width:300px">제목</th>
<!--             <th style="width:300px">내용</th> -->
            <th style="width:100px">날짜</th>     
         </tr>
      </thead>
      <tbody id="listBody1">
         
      </tbody>
   </table>
   <div id='pagingArea'>

   </div>
   </div>
   </div>
   
   
 
   




	<div class="modal fade " id="exampleModalLong2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
			<div class="modal-dialog modal-lg">

			</div>
		</div>
   
   
   

   
<!--    /assets/img/elm/el10.jpg -->
<!--    /assets/img/elm/el7.jpg -->
   
    
<!--     <span class="hidden"> -->
<%--         <a class="quick_view" data-fancybox="quick-view" href="${pageContext.request.contextPath }/assets/img/elm/el7.jpg">#2</a> --%>
<!--     </span> -->

<!--      <div id="qw-form-1" class="hidden" > -->
<%--      <div class="bg-image" style="background-image: url('${pageContext.request.contextPath }/assets/img/elm/el5.jpg');"> --%>
<!-- 					<div class="project_specification"> -->
	
						
<%-- 						 <form id="insertForm" action="<c:url value='/suggestion/comment'/>" method="post" enctype="multipart/form-data"> --%>
<!--       <table class="table table-border"> -->
    
<!--           <tr> -->
             
<%--              <td><label>제목</label><input style="color:black" type="text" name="sug_title" value="${suggestion.sug_title }"/></td> --%>
<!--           </tr> -->
<!--           <tr> -->
<%--              <td><label>내용</label><textarea  name="sug_content1" value="${suggestion.sug_content }"></textarea></td>		 --%>
<!--           </tr> -->
       
        
<!--        </table> -->
<%--          <input type="hidden" name="mem_id" value="${mem_id }"/> --%>
<%--        <input type="hidden" name="sug_no" value="${suggestion.sug_no }"/> --%>
<%--         <input type="hidden" name="sug_date" value="${suggestion.sug_date }"/> --%>
<%--         <input type="hidden" name="sug_parent" value="${suggestion.sug_parent }"/> --%>
<%--         <input type="hidden" name="sug_depth" value="${suggestion.sug_depth }"/> --%>
<!--         <input type="submit"  value="확인" class="btn btn-danger-outlined"/> -->
<%--    </form>  --%>
					
<!-- 			</div> -->
<!-- 		</div>     -->
<!--      </div> -->
   
   
<div id="pagingArea">
		${pagingVO.pagingHTMLForBS }
		
</div>
   
<form id="searchForm">
	<input type="hidden" name="searchType" value="${pagingVO.searchType}"/>
	<input type="hidden" name="searchWord" value="${pagingVO.searchWord}"/>
	<input type="hidden" name="page" />
</form>
   






<!-- 글 쓰기 -->
<div id="modal" class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-body">
                  <button type="button" class="close push-xs-right" data-dismiss="modal" aria-label="Close">
                     <i class="fa fa-close"></i>
                  </button>
                  <div class="container-fluid modal-item">
			<h2>제목</h2>
			 <form id="insertForm" action="<c:url value='/suggestion/comment'/>" method="post" enctype="multipart/form-data">
			 
						   <input class="form-control" type="text" name="sug_title" id="searchWord" /><br>
						   	<h2>내용</h2>
							<textarea name="sug_content"></textarea><br>
			    <input type="hidden" name="mem_id" value="${mem_id }"/>
   			    <input type="hidden" name="sug_no" value="${suggestion.sug_no }"/>
     		   <input type="hidden" name="sug_date" value="${suggestion.sug_date }"/>
     		   <input type="hidden" name="sug_parent" value="${suggestion.sug_parent }"/>
     		   <input type="hidden" name="sug_depth" value="${suggestion.sug_depth }"/>

<!--  					 <input type="submit"  value="확인" class="btn btn-danger-outlined"/> -->
<!--  					  <input type="submit"  value="취소" class="btn btn-danger-outlined"/> -->




<!--                    <button id="ok" style="width:80px" class="btn btn-danger-outlined" type="submit">확인</button> -->               
                    <button  id="sdf" style="width:130px" type="submit" class="btn btn-danger btn-rounded aa">확인</button>
 					<button  style="width:130px" type="button" class="btn btn-primary btn-rounded ch">취소</button>
						
			</form> 
<!-- <button id="close" style="width:80px" class="btn btn-primary-outlined">취소</button>	 -->
                  </div>
               </div>
            </div>
         </div>
     </div>





</body>




<script>
// CKEDITOR.replace('sug_content');

CKEDITOR.replace(
			'sug_content',
			{
				extraPlugins : 'image',
				filebrowserImageUploadUrl : "${uploadImageUrl}"
			});






var modal = $("#modal");

$("#btn").on("click", function(){
	modal.modal('show');
})



$("#close").on("click", function(){
	modal.modal('close');
})


$(".ch").on("click", function(){
	
		modal.modal('hide');
		
})

// modal = $("#modal").dialog({
		
// 		 autoOpen : false,
// 	        height : 400,
// 	        width : 350,
// 	        modal : true,
// 	        buttons : {
        
// 	           "삽입" : function() {
	        	   
// 	        	   insertForm.submit();
// 	        	   writedialog.dialog("close");
	        	   
// 	           },
// 	           "취소" : function() {
// 	        	   writedialog.dialog("close");
// 	           }
// 	        },
// 	        close : function() {
// 	        	writedialog.dialog("close");
// 	        }
// 	});









var listBody1 = $('#listBody1');
var pagingArea = $('#pagingArea');
var insertForm = $('#insertForm');



function paging(page){
    if(page<=0) return;
    suggestion(page);
}

	function suggestion(page){
		$.ajax({
			url:"${pageContext.request.contextPath}/suggestion",
			method:"get",
			data:{"page": page},
			dataType:"json",
			success:function(resp){
				let dataList = resp.dataList;
				var a =	'<img src="http://sample.paged.kr/purewhite/theme/pagedtheme/skin/board/basic/img/icon_reply.gif" class="icon_reply" alt="답변글" title="">Re:';

				var trTags=[];
				$(dataList).each(function(idx, suggestion){
					var sug_title = "";
					if(suggestion.sug_depth!=1){
						  
						
					
						
						for(i=1; i<suggestion.sug_depth; i++){
							sug_title += a;
						}
					}
					var tr = $("<tr>")
							.append($("<td>").text(suggestion.mem_id))
							.append($("<td>").html(sug_title + suggestion.sug_title))
// 							.append($("<td>").html(suggestion.sug_content))
							.append($("<td>").text(suggestion.sug_date))
							
                            .prop("value", suggestion.sug_no);
                         
					trTags.push(tr);
				});
				listBody1.html(trTags);
	             pagingArea.html(resp.pagingHTMLForBS);
			},
			error: function(){
				
			}
		});	
		
	}
	
	
  
	
   
//    $("#newBtn").on("click", function(){
// 	   insertmodal.dialog("open");
	   
// 	});
//  //댓글 모달창
// 	insertmodal = $("#insertmodal").dialog({
		
// 		 autoOpen : false,
// 	        height : 400,
// 	        width : 350,
// 	        modal : true,
// 	        buttons : {
        
// 	           "삽입" : function() {
	        	   
// 	        	   insertForm.submit();
// 	        	   writedialog.dialog("close");
	        	   
// 	           },
// 	           "취소" : function() {
// 	        	   writedialog.dialog("close");
// 	           }
// 	        },
// 	        close : function() {
// 	        	writedialog.dialog("close");
// 	        }
// 	});
   
   
   listBody1.on("click", "tr", function(){
		var sug_no = $(this).prop("value");
		location.href="<c:url value='/suggestion/information'/>?sug_no=" + sug_no;
	}).css({cursor:"pointer"});
	
   if("${message}"!=""){
	   alert("${message}");
   }
   
   
   
   
//    function ${pagingVO.funcName}(page){
// 		if(page<=0) return;
// 		searchForm.find("input[name='page']").val(page);
// 		searchForm.submit();
// 		searchForm.find("input[name='page']").val("");
// 	}
//    searchForm = $("#searchForm");
   
// 	var searchType = $("#searchType");
// 	var searchWord = $("#searchWord");
   
// 	$("#searchBtn").on("click", function(){
		
// 		searchForm.find("input[name='searchType']").val(searchType.val());
// 		searchForm.find("input[name='searchWord']").val(searchWord.val());
// 		searchForm.submit();
// 	});

  suggestion();
   
</script>

</html>