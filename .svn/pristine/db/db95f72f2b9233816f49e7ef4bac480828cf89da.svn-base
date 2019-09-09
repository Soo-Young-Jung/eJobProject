<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<script type="text/javascript" src="<c:url value='/js/boardReply.js'/>" ></script>

<c:if test="${not empty message }">
	<div class="alert alert-danger alert-dismissible" role="alert">
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	  	<span aria-hidden="true">&times;</span>
	  </button>
	  <strong>${message }</strong>
	</div>
</c:if>
	<br>
	<br>
	<div class="container">
	<table class="table table-bordered">
		<tr>
			<th>작성자</th>
			<td>${notice.adm_id}</td>
		</tr>
		<tr>
<!-- 			<th>작성날짜</th> -->
<%-- 			<td>${notice.not_div eq 'E' ? '기업회원' : '일반회원' }</td> --%>
<%-- 			<td>${notice.not_date }</td> --%>
		</tr>
	<tr>
			<th>글제목</th>
			<td>${notice.not_title}</td>
		</tr>

		<tr>
			<th>글내용</th>
			<td>${notice.not_content}</td>
		</tr>
	</table>

	<input type="button" value="목록으로" class="btn btn-danger-outlined"
		onclick="location.href='<c:url value="/notice/noticeList.do"/>';"
	/>
	<c:if test="${sessionScope.mem_id == 'admin' }">
	<c:url value="/notice/noticeDelete.do" var="deleteBoardUrl">
		<c:param name="what" value="${notice.not_no }" />
	</c:url>
	<input type="button" id="boardDelBtn" value="글삭제" class="btn btn-danger-outlined"
		onclick="location.href='${deleteBoardUrl}';"
	/>
	
	<c:url value="/notice/noticeUpdate.do" var="updateBoardUrl">
		<c:param name="what" value="${notice.not_no }" />
	</c:url>
	<input type="button" id="" value="수정하기" class="btn btn-danger-outlined"
		onclick="location.href='${updateBoardUrl}';"
	/>
	</c:if>
	
	<table class="table table-bordered">
		<tbody id="listBody">
		
		</tbody>
		<tfoot>
			<tr>
				<td id="pagingArea">
				</td>
			</tr>
		</tfoot>
	</table>
	</div>
<!-- 	<div class="modal fade" id="delReplyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"> -->
<!-- 	  <div class="modal-dialog modal-sm" role="document"> -->
<!-- 	    <div class="modal-content"> -->
<!-- 	      <div class="modal-header"> -->
<!-- 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!-- 	        <h4 class="modal-title">삭제할 댓글의 비밀번호</h4> -->
<!-- 	      </div> -->
<%-- 	      <form method="post" id="deleteForm" action="<c:url value='/reply/replyDelete.do'/>"> --%>
<%-- 	      	  <input type="hidden" name="bo_no" value="${board.bo_no }"/> --%>
<!-- 	      	  <input type="hidden" name="rep_no" /> -->
<!-- 		      <div class="modal-body"> -->
<!-- 		          <div class="form-group"> -->
<!-- 		            <label>비밀번호:</label> -->
<!-- 		            <input type="text" class="form-control" name="rep_pass"> -->
<!-- 		          </div> -->
<!-- 		      </div> -->
<!-- 		      <div class="modal-footer"> -->
<!-- 		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!-- 		        <button type="submit" class="btn btn-primary">댓글삭제</button> -->
<!-- 		      </div> -->
<!-- 	      </form> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	</div> -->
<!-- 	<div class="modal fade" id="delBoardModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"> -->
<!-- 	  <div class="modal-dialog modal-sm" role="document"> -->
<!-- 	    <div class="modal-content"> -->
<!-- 	      <div class="modal-header"> -->
<!-- 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!-- 	        <h4 class="modal-title">글 삭제 비밀번호</h4> -->
<!-- 	      </div> -->
<%-- 	      <form method="post" id="deleteBoardForm" action="<c:url value='/board/boardDelete.do'/>"> --%>
<%-- 	      	  <input type="hidden" name="bo_no" value="${board.bo_no }"/> --%>
<!-- 		      <div class="modal-body"> -->
<!-- 		          <div class="form-group"> -->
<!-- 		            <label>게시글 비밀번호:</label> -->
<!-- 		            <input type="text" class="form-control" name="bo_pass"> -->
<!-- 		          </div> -->
<!-- 		      </div> -->
<!-- 		      <div class="modal-footer"> -->
<!-- 		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!-- 		        <button type="submit" class="btn btn-primary">게시글삭제</button> -->
<!-- 		      </div> -->
<!-- 	      </form> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	</div> -->
<script type="text/javascript">
	var boardModal = $("#delBoardModal").modal({show:false});
	boardModal.on("hide.bs.modal", function(){
		$(this).find("form")[0].reset();
	});
	boardModal.on("shown.bs.modal", function(){
		$(this).find('[name="bo_pass"]').focus();
	});
	$("#boardDelBtn").on("click", function(){
		boardModal.modal('show');
	});
</script>










