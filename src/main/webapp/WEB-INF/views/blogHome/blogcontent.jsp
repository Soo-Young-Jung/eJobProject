<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#image {
	max-height : 500px;
	max-width : 500px;
}

#content {
	width: 450px;
}

#writerInfo{
	padding-top: 20px;
}

#blog1, #content1{
	width : 700px;
}

#br_content {
	width: 350px;
}

#title{
	width: 500px;
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
<div id="search1">
<div id="title" class="heading heading-v1 mb-3 bg-white bg-gray">
	<h2 class="heading-v1-title">최근 게시물</h2>
</div>
<br>
<br>
<c:set var="i" value="0" />
<c:if test="${blog.boardList.size() ne 0 }">
	<c:forEach var="board" items="${blog.boardList }">
		<div id="blog1">
			<input type="hidden" name="bb_no" value="${board.bb_no}" />
			<div id="writerInfo" class="card card-style3">
		<div id="content1" class="card-block">
			<h2 class="card-title">${board.bc_title}</h2>
			<ul class="list-inline">
				<li>
					<a id="writer" onclick="window.open('${pageContext.request.contextPath }/bloghome/blogHome.do?what=${board.bc_writer }')">
						<i class="fa fa-user-o" aria-hidden="true"></i>
						<span class="">${board.bc_writer }</span>
					</a>
				</li>
				<li><a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>
						${board.bc_hit}</a></li>
				<li><a href="#"><i class="fa fa-comments-o" id="viewReply"
						aria-hidden="true"></i>${board.br_cnt }</a></li>
			</ul>
			<br>
			<c:if test="${not empty board.bc_video }">
				<div class="promo-video-holder">
					<div class="promo-video">
					  	<img class="img-fluid" src="${pageContext.request.contextPath }/assets/img/home/v-poster.jpg" alt="">
					  	<a class="video-link" data-fancybox href="https://www.youtube.com/v/${board.bc_video }?version=3&amp;hl=ko_KR&amp;vq=hd720"><i class="fa fa-play play-icon" aria-hidden="true"></i></a>
					</div>
				</div>
			</c:if>
			<p>${board.bc_content}</p>
			<div class="social-share">
				<span>첨부파일</span>
				<ul class="social-icons ">
					<c:forEach var="attatch" items="${board.attatchList }">
						<c:url value='/bloghome/download.do' var="downloadURL">
							<c:param name="what" value="${attatch.ba_no }"/>
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
			<input type="button" value="본문으로" class="btn btn-inverse-outlined"
				onclick="location.href='<c:url value="/bloghome/blogView.do">
			<c:param name='what' value='${board.bb_no }' />
		</c:url>';" />
			<c:if test="${mem_id eq board.bc_writer}">
				<c:url value="/bloghome/blogBoardDelete.do" var="deleteBoardUrl">
					<c:param name="what" value="${board.bb_no }" />
				</c:url>
				<input id="boardDelBtn" type="button" value="글삭제"
					class="btn btn-inverse-outlined"
					onclick="location.href='${deleteBoardUrl}'" />
				<c:url value="/bloghome/blogboardUpdate.do" var="updateBoardUrl">
					<c:param name="what" value="${board.bb_no }" />
				</c:url>
				<input type="button" id="" value="수정하기"
					class="btn btn-inverse-outlined"
					onclick="location.href='${updateBoardUrl}';" />
			</c:if>
		</div>
		<br>
		<br>
		<br>
	</c:forEach>
</c:if>
</div>