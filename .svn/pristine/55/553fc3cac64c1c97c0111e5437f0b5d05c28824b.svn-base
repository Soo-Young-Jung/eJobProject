<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#followtable {
		width: 200px;
	}
	
	#title {
		width: 800px;
	}
	
	#image {
		max-height: 300px;
		width: 300px;
	}
	
	#info {
		height: 100px;
		width: 300px;
	}
	
	#jinwon{
		padding-left : 100px;
	}
	
	#jgwon{
		padding : 20px;
	}
</style>
<div id="title" class="heading heading-v1 mb-3 bg-white bg-gray">
	<h2 class="heading-v1-title">블로그 지기 정보</h2>
</div>
<section id="jgwon" class="project_specification">
	<div class="row">
		<div id="jinwon" class="col-md-6 col-lg-4">
			<div class="card team-card">
				<div class="card_img text-center">
					<c:choose>
						<c:when test="${empty blog.mem_profile}">
							<c:set var="img"
								value="${pageContext.request.contextPath}/img/noimage.png"
								scope="application" />
						</c:when>
						<c:otherwise>
							<c:set var="img"
								value="data:image/*;base64,${blog.mem_imgBase64}"
								scope="application" />
						</c:otherwise>
					</c:choose>
					<img id="image" src="${img}" class="img-full" alt="이미지를 재설정해주세요ㅠ">
					<div class="hover-overlay effect-transformY">
						<c:if test="${empty mem_id}">
							<h4>로그인 후 가능한 서비스 입니다.</h4>
						</c:if>
						<c:if test="${not empty mem_id }">
							<c:if test="${mem_id ne blog.mem_id }">
								<h4>
									<c:set var="followList" value="${member.followList }"></c:set>
									<c:set var="flag" value='x'></c:set>
									<c:forEach var="follow" items="${followList }">
										<c:if test="${follow.follow_mem eq blog.mem_id }">
											<!-- follow.follow_mem eq blog.mem_id -->
											<c:set var="flag" value='y'></c:set>
										</c:if>
									</c:forEach>
									<c:if test="${flag eq 'y' }">
										<a
											href="<c:url value='/bloghome/deleteFollow.do'>
											<c:param name='follow_mem' value='${blog.mem_id }' />
											<c:param name='mem_id' value='${mem_id }' />
												</c:url>"><i
											class="fa fa-user-times"></i>언팔로우 </a>
									</c:if>
									<c:if test="${flag eq 'x' }">
										<a
											href="<c:url value='/bloghome/insertFollow.do'>
											<c:param name='follow_mem' value='${blog.mem_id }' />
											<c:param name='mem_id' value='${mem_id }' />
												</c:url>"><i
											class="fa fa-user-plus"></i>팔로우 </a>
									</c:if>
								</h4>
							</c:if>
						</c:if>
					</div>
				</div>
				<div class="card-block text-center">
					<a href="#">
						<h4 class="card-title">${blog.mem_name }</h4>
					</a>
					<c:if test="${member.mem_div eq 'E' }">
						<c:if test="${blog.mem_div eq 'G' }">
							<a data-toggle="modal" data-target="#myModal" id="modalOpen">
								<span class="badge badge-danger">${blog.jobsearch}</span>
							</a>
						</c:if>
					</c:if>
					<c:if test="${member.mem_div eq 'g'}">
					</c:if>
					<%-- 					<c:if test="${member.mem_div eq 'E' }"> --%>
					<%-- 						<c:choose> --%>
					<%-- 							<c:when test="${blog.jobsearch eq '재직 중'}"> --%>
					<%-- 								<span class="badge badge-danger">${blog.jobsearch}</span> --%>
					<%-- 							</c:when> --%>
					<%-- 							<c:otherwise> --%>
					<%-- 								<a data-toggle="modal" data-target="#myModal" id="modalOpen" ><span class="badge badge-danger">${blog.jobsearch}</span></a> --%>
					<%-- 							</c:otherwise> --%>
					<%-- 						</c:choose> --%>
					<%-- 					</c:if> --%>

					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" style="margin: 28rem auto;">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">구직 권유</h4>
								</div>
								<div class="modal-body" style="align-content: center;">
									<table class="table-bordered" style="width: 100%;">
										<thead>
											<tr>
												<th style="width: 20px;">#</th>
												<th>공고명</th>
											</tr>
										</thead>
										<form id="recommend">
											<tbody id="annl_list">




											</tbody>
										</form>
									</table>
									<div id="annl_foot"></div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary" form="recommend">추가</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<h2>지기 소개</h2>
	<p>${blog.blog_introduce }</p>
	
	<c:if test="${blog.mem_div eq 'G'}">
		<h4>보유 자격증 정보</h4>
		
		<ul class="styled_list">
			<c:set var="licList" value="${blog.memberLicList }"></c:set>
			<c:if test="${not empty licList}">
				<c:forEach var="lic" items="${licList }">
					<li class="w-100 media align-items-baseline">
						<div class="">
							<i class="fa fa-chevron-circle-right" aria-hidden="true"></i>
						</div>
						<div class="media-body">${lic.lic_name}</div>
					</li>
				</c:forEach>
			</c:if>
			<c:if test="${empty licList}">
				<li class="w-100 media align-items-baseline">
					<div class="">
						<i class="fa fa-chevron-circle-right" aria-hidden="true"></i>
					</div>
					<div class="media-body">등록된 자격증이 없습니다.</div>
				</li>
			</c:if>
		</ul>
	</c:if>

	<h4>팔로우 중인 사람</h4>
	<br>
	<table class="table" id="followtable">
		<c:set var="followList" value="${blog.followList }" ></c:set>
		<c:if test="${not empty followList}">
			<c:forEach var="follow" items="${followList }">
				<tr class="table-danger">
					<td>
						<a href="<c:url value='' >
							<c:param name='what' value='${follow.follow_mem }' />
						</c:url>
						">
							${follow.follow_mem }
						</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty followList}">
			<tr class="table-info">
				<td>
					팔로우 하는 사람이 없습니다.
				</td>
			</tr>
		</c:if>
		
	</table>
	<br> <br>
	<div class="col-lg-7">
		<div class="rounded border d-flex align-items-center justify-content-center p-4">
			<form method="post" action='
				<c:url value='/bloghome/emailForm.do'>
					<c:param name='mem_id' value='${blog.mem_id }' />
				</c:url>'>
				<c:if test="${empty mem_id}">
					<h4>로그인 후 가능한 서비스 입니다.</h4>
				</c:if>
				<c:if test="${not empty mem_id}">
					<button id="sendEmail" class="btn btn-danger btn-default bold" type="submit">
						이메일 보내기
					</button>
				</c:if>
			</form>
		</div>
	</div>
	<br>
	<div class="col-lg-7">
		<p class="mb-5">
			<br><br><strong class="text-danger mr-2">메일 보낼 시 주의사항 : </strong> 금전 거래 및 도가
			지나치는 내용은 블로그 주인에 의하여 신고당할 수 있습니다.
		</p>
	</div>
</section>

<script type="text/javascript">
	$("#modalOpen").on("click", function() {
		$.ajax({
			url : "${pageContext.request.contextPath }/recommend.do",
			method : "get",
			dataType : "json", 
			success : modifyList,
			error : function(errorResp) {
				console.log(errorResp.status + ", "
						+ errorResp.responseText)
			}
		});
	});
	
	function modifyList(paingVO){
		if(paingVO.dataList){
			let trTags = [];
			$(paingVO.dataList).each(function(index, announceVO){
				let trTag = $("<tr>").append(
								$("<td>").append(
										$("<input name='annl_no' type='checkbox'>").val(announceVO.annl_no)
								),
								$("<td>").append(announceVO.annl_title)
								);
				trTags.push(trTag);
				
			});
			$("#annl_list").html(trTags);
			$("#annl_foot").html(paingVO.pagingHTMLForBS);
		}
	}
	
	$("#recommend").on("submit", function(event){
// 		var queryString = $(this).serialize();
		var aa = [];
		
		$("input[name=annl_no]:checked").each(function(){
			aa.push($(this).val());
		});
		event.preventDefault();
		
		if(aa.length != 0){
			
		
		
		$.ajax({
			url : "${pageContext.request.contextPath }/recommend.do",
			data : {blog_mem_id: '${blog.mem_id}', annl_no: aa},
			method : "post",
			dataType : "json",
			success : function(resp) {
				if(resp.succ = true) alert("해당 유저에게 공고 권유를 보냈습니다.");
				if(resp.succ = false) alert("해당 유저에게 공고 권유를 보내는데 실패하였습니다.");
			},
			error : function(errorResp) {
				console.log(errorResp.status + ", "
						+ errorResp.responseText)
			}
		});
		
		} else {
			alert("권유할 공고를 선택해 주세요.");
		}
	});
</script>