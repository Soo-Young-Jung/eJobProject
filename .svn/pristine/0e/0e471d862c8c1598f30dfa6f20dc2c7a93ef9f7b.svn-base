<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- BLOG LEFT SIDEBAR -->
	<div class="media-box">
		<div class="media-icon">
			<c:choose>
				<c:when test="${empty blog.mem_profile}">
					<c:set var="img" value="${pageContext.request.contextPath}/img/noimage.png" scope="application"/>
				</c:when>
				<c:otherwise>
					<c:set var="img" value="data:image/*;base64,${blog.mem_imgBase64}" scope="application"/>
				</c:otherwise>
			</c:choose>
			<img src="${img}" alt="img" class="comment_img">
		</div>
		<div class="media-content" style="margin-left: 30px;">
			<a href="<c:url value='blogInfo.do' >
				<c:param name='what' value='${blog.mem_id}' />
			</c:url>"><h6>${blog.mem_name}</h6></a>
			<h6>${blog.blog_introduce }</h6>
			<p>
				<i class="fa fa-calendar" aria-hidden="true"></i>개설일 : ${blog.blog_date}
			</p>
		</div>
	</div>
	<br> <br>
	<div class="col-lg-6 order-2 blog-sidebar sidebar">
		<h4>♡메뉴♡</h4>
		<ul class="list-group">
			<c:forEach var="category" items="${blog.categoryList }">
				<li class="list-group-item" id='${category.bc_no }'>
					<a href="<c:url value='/bloghome/blogboardlist.do'>
							<c:param name='bc_no' value='${category.bc_no }' />
   						</c:url>">
						${category.bc_name }
					</a>
				</li>
			</c:forEach>
			<c:if test="${mem_id eq blog.mem_id }">
				<li class="list-group-item"><a
					href="<c:url value='/bloghome/blogOption.do'>
						<c:param name='what' value='${blog.mem_id}' />
					</c:url>">블로그 설정</a>
				</li>
			</c:if>
		</ul>
		<h4>#인기 해시태그#</h4>
		<form id="tagSearch" method="post" action="<c:url value='/bloghome/blogtaglist.do'/>">
			<input type="hidden" name="searchType" value="tag" />
			<input type="hidden" name="searchWord" value="" />
		</form>
		<div id="tagZone" class="tags">
			<c:forEach var="hashTag" items='${blog.hashList }'>
				<button id="tagBtn" class="btn no-bg btn-secondary-outlined btn-mid" value="${hashTag.hash_name}" >
					${hashTag.hash_name }
				</button>
			</c:forEach>
		</div>
	</div>
	
	<script>
		$(function(){
			$("#tagZone").on('click', "#tagBtn", function(){
				var tagdata = $(this).attr('value');
				tagdata = tagdata.trim();
				tagSearch = $("#tagSearch");
				
				$("input[name=searchWord]").attr('value', tagdata);
				tagSearch.submit();
			})
		})
	</script>