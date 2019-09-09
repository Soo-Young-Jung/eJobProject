<%@page import="kr.or.ddit.vo.BlogVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#image{
		max-height : 500px;
		max-width : 500px;
	}
	#content{
		width : 450px;
	}
	#writerInfo{
		padding-top: 20px;
	}
	#blog1, #content1{
		width : 700px;
	}
	#br_content{
		width : 500px;
	}
	#dateDiv{
		width:60px;
		height:60px;
	}
	.date-holder::after {
   		border-left: 15px solid #dc3545;
	}
	#writer{
		cursor:pointer;
	}
</style>
<c:if test="${not empty message }">
	<div class="alert alert-danger" role="alert">
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	  	<span aria-hidden="true">&times;</span>
	  </button>
	  <strong>${message }</strong>
	  <c:remove var="message" scope="session" />
	</div>
</c:if>
<div id="blog1">
	<input type="hidden" name="bb_no" value="${blogboard.bb_no}" />
	<div id="writerInfo" class="card card-style3">
		<div id="content1" class="card-block">
			<h2 class="card-title">${blogboard.bc_title}</h2>
			<ul class="list-inline">
				<li><a id="writer" onclick="window.open('${pageContext.request.contextPath }/bloghome/blogHome.do?what=${blogboard.bc_writer }')"><i class="fa fa-user-o" aria-hidden="true"></i>
						<span class="">${blogboard.bc_writer }</span></a></li>
				<li><a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>
						${blogboard.bc_hit}</a></li>
				<li><a href="#"><i class="fa fa-comments-o" id="viewReply"
						aria-hidden="true"></i>${blogboard.br_cnt }</a></li>
			</ul>
			<br>
			<c:if test="${not empty blogboard.bc_video }">
				<div class="promo-video-holder">
					<div class="promo-video">
					  	<img class="img-fluid" src="${pageContext.request.contextPath }/assets/img/home/v-poster.jpg" alt="">
					  	<a class="video-link" data-fancybox href="https://www.youtube.com/v/${blogboard.bc_video }?version=3&amp;hl=ko_KR&amp;vq=hd720"><i class="fa fa-play play-icon" aria-hidden="true"></i></a>
					</div>
				</div>
			</c:if>
			<p>${blogboard.bc_content}</p>
			<div class="social-share">
				<span>첨부파일</span>
				<ul class="social-icons ">
					<c:forEach var="attatch" items="${blogboard.attatchList }">
						<c:url value='/bloghome/download.do' var="downloadURL">
							<c:param name="what" value="${attatch.ba_no }"/>
							<c:param name="div" value="BL"/>
						</c:url>
						<c:set var="downTitle" 
						       value="크기:${attatch.ba_fancysize },다운수:${attatch.ba_download}"/>
						       
						<li><a href="${downloadURL }" title="${downTitle }">${attatch.ba_filename }</a></li> |
					</c:forEach>
				</ul>
			</div>
			<form id="tagSearch" method="post" action="<c:url value='/bloghome/blogtaglist.do'/>">
				<input type="hidden" name="searchType" value="tag" />
				<input type="hidden" name="searchWord" value="" />
			</form>
			<div class="social-share">
				<span>해시태그</span>
				<br>
				<c:forEach var="hashtag" items="${blogboard.hashtagList }">
					<div id="hashswan">
						${hashtag.hash_name }
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<input type="button" value="목록으로" class="btn btn-inverse-outlined" 
		onclick="location.href='<c:url value="/bloghome/blogboardlist.do">
			<c:param name='bc_no' value='${blogboard.bc_no }' />
		</c:url>';"
	/>
	<c:if test="${mem_id eq blogboard.bc_writer}">
		<c:url value="/bloghome/blogBoardDelete.do" var="deleteBoardUrl">
			<c:param name="what" value="${blogboard.bb_no }" />
		</c:url>
		<input id="boardDelBtn" type="button" value="글삭제" class="btn btn-inverse-outlined"
			onclick="location.href='${deleteBoardUrl}'"
		/>
		<c:url value="/bloghome/blogboardUpdate.do" var="updateBoardUrl">
			<c:param name="what" value="${blogboard.bb_no }" />
		</c:url>
		<input type="button" id="" value="수정하기" class="btn btn-inverse-outlined"
			onclick="location.href='${updateBoardUrl}';"
		/>
	</c:if>
	
	<form id="searchForm" action="<c:url value='/reply/replyList.do'/>">
		<input type="hidden" name="bb_no" value="${blogboard.bb_no }" />
		<input type="hidden" name="page" />
	</form>
	
	<form id="replyForm" action="<c:url value='/reply/replyInsert.do' />" 
			method="post" class="form-inline">
		<input type="hidden" name="bb_no" value="${blogboard.bb_no }"/>
		<input type="hidden" name="br_writer" value="${mem_id }" />
		<input type="hidden" name="br_no" />
		<table class="table">
			<tr>
				<td colspan="3">
					<div class="form-group">
						<input id="br_content" class="form-control" type="text" name="br_content">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" class="btn btn-danger-outlined" value="댓글쓰기" />
					</div>
				</td>
			</tr>
		</table>
	</form>
	
	<input type="hidden" id="holymoly" value="${mem_id }">
	
	<table class="table table-warning">
		<tbody id="listBody">
			
		</tbody>
		<tfoot>
			<tr>
				<td id="pagingArea">
					
				</td>
			</tr>
		</tfoot>
	</table>
	
	<div class="modal fade" id="delReplyModal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<form method="post" id="deleteForm"
						action="<c:url value='/reply/replyDelete.do'/>">
						<input type="hidden" name="br_no" />
						<input type="hidden" name="br_writer" />
						<div class="modal-body">
							<div class="form-group">
								<label>댓글 삭제를 계속하시겠습니까?</label>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-danger-outlined">삭제</button>
							<button type="button" class="btn btn-primary-outlined" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="delBoardModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">글 삭제 비밀번호</h4>
	      </div>
	      <form method="post" id="deleteBoardForm" action="<c:url value='/board/boardDelete.do'/>">
	      	  <input type="hidden" name="bb_no" value="${blogboard.bb_no }"/>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">게시글삭제</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
</div>

<script type="text/javascript">
	
	//해시태그 분할
	var content = document.getElementById('hashswan').innerHTML; // html 안에 'content'라는 아이디를 content 라는 변수로 정의한다.
	
	var splitedArray = content.split(','); // 공백을 기준으로 문자열을 자른다.
	var linkedContent = '';
	for(var word in splitedArray)
	{
	  word = splitedArray[word];
	  //해시태그 버튼 생성
	  word = '<a href="#" id="hash_tag" class="badge badge-light" value="'+word+'"><i class="fa fa-hashtag"></i>'+word+'</a>'; 
	  linkedContent += word+' ';
	}
	document.getElementById('hashswan').innerHTML = linkedContent;
	
	$("#hashswan").on("click", ".badge", function(){
		var tagdata = $(this).attr('value');
		tagdata = tagdata.trim();
		tagSearch = $("#tagSearch");
		
		$("input[name=searchWord]").attr('value', tagdata);
		tagSearch.submit();

	});
	
	//페이징처리
	function paging(page){
		if(page<=0) return;
		searchForm.find("input[name='page']").val(page);
		searchForm.submit();
		searchForm.find("input[name='page']").val("");
	}
	
	$(function(){
		
		searchForm = $("#searchForm"); // 댓글 페이징 폼
		var listBody = $("tbody#listBody");
		var pagingArea = $("#pagingArea");
		
		var mem_id = $("input#holymoly").val();
		
		var griffin = function(event){
			event.preventDefault();
			var action = $(this).attr("action");
			var queryString = $(this).serialize();
			$.ajax({
				url : action,
				data : queryString,
				dataType : "json",
				success : function(resp) {
					let replyList = resp.dataList;
					var trTags = [];
					var holymoly = $("#holymoly").attr("value");
					if(replyList && replyList.length > 0){
						$(replyList).each(function(idx, reply){
							display = (reply.br_writer == holymoly ? "inline-block" : "none;")
							var tr = $("<tr>");
							trTags.push(tr);
							var td = $("<td>");
							tr.html(td);
							var table = $("<table class='table table-striped'>");
							td.html(table);
							var innerTrs = [];
							innerTrs.push(
								$("<tr>").append(
									$("<td>").prop("colspan", 3).text(reply.br_writer)	
									, $("<td class='text-right'>").prop("colspan", 2).text(reply.br_date)	
								)
								, $("<tr>").append(
									$("<td>").prop("colspan", 3)
											 .text(reply.br_content)
										, $("<td>").prop({"colspan":2})
											.append($("<button data-toggle='modal' data-target='#delReplyModal'>")
												.prop({
												"class":"btn btn-danger",
												"id":"delReplyBtn",
												"style":"display:" + display+""
											})
											.data({brNo:reply.br_no, brWriter:reply.br_writer})
											.text("삭제")
										  )
								)
							);
							table.html(innerTrs);
						});
					}else{
						trTags.push(
							$("<tr>").append($("<td>")
									 .text("댓글 없음.")
							)		 
						);
					}
					listBody.html(trTags);
					pagingArea.html(resp.pagingHTMLForBS);
				},
				error : function(errorResp) {
					console.log(errorResp.status + ", "
							+ errorResp.responseText)
				}
			}); // ajax end
			return false;
		}; // submit handler end
		
		var viewReply = $("#viewReply"); // 삭제 버튼
		var replyForm = $("#replyForm"); // 댓글 등록 폼
		var deleteForm = $("#deleteForm"); // 댓글 삭제 폼
		var delReplyModal = $("#delReplyModal").modal({show:false});
		var boardModal = $("#delBoardModal").modal({show:false});
		
		searchForm.on('submit', griffin);
	    
	    searchForm.trigger("submit");   //이벤트 발생 
		
		// 댓글 등록과 삭제에서 공통 사용할 핸들러
		var commonHandler = function(event){
			event.preventDefault();
			var action = $(this).attr("action");
			var method = $(this).attr("method");
			var queryString = $(this).serialize();
			$.ajax({
				url:action,
				data : queryString,
				method : method,
				dataType : "json",
				success : function(resp) {
					if(resp.success){
						viewReply.trigger("click");
						replyForm[0].reset();
						delReplyModal.modal("hide");
						$('.modal-backdrop').remove();
					}else if(!resp.success){
						alert("로그인이 필요한 서비스입니다.");
					}
				},
				error : function(errorResp) {
					console.log(errorResp.status + ", "
							+ errorResp.responseText);
				}
			});
			$('.modal-backdrop').remove();
			paging(1);
			return false;
			} // commonHandler end
			
			replyForm.on("submit", commonHandler); 
	
			// 비동기 댓글 등록
			// 비동기 댓글 삭제
			
			deleteForm.on("submit", function(){
				delReplyModal.modal("hide");
			})
			
			// 모달창이 닫힌 후 댓글삭제 폼 리셋.
			delReplyModal.on("hidden.bs.modal", function(){
				deleteForm[0].reset();
			});
			
			// "삭제" 버튼 클릭시 모달창 열기
			$('tbody').on("click", "button", function(){
				var br_no = $(this).data("brNo");
				var br_writer = $(this).data("brWriter");
				deleteForm.find("input[name='br_no']").val(br_no);
				deleteForm.find("input[name='br_writer']").val(br_writer);
				delReplyModal.modal("show");
			});
			
			deleteForm.on("submit", commonHandler);
			
		// 	boardModal.on("hide.bs.modal", function(){
		// 		$(this).find("form")[0].reset();
		// 	});
			
		// 	$("#boardDelBtn").on("click", function(){
		// 		boardModal.modal('show');
		// 	});
		})

</script>