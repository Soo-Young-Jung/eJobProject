<%@page import="kr.or.ddit.blog.service.BCategoryServiceImpl"%>
<%@page import="kr.or.ddit.blog.service.IBCategoryService"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.blog.dao.IBCategoryDAO"%>
<%@page import="kr.or.ddit.vo.BlogCategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.min.3.4.1.js"></script>
<style>
	#form{
		width: 800px;
	}
	#menuBox{
	   width : 400px;
	   height : 50px;
	   font-size: medium;
	}
</style>
  <div id="form">
  	<div id="title" class="heading heading-v1 mb-3 bg-white bg-gray">
		<h2 class="heading-v1-title">블로그 설정</h2>
	</div>
	<br>
	<br>
	<form id="blogOptionForm" method="post" action="<c:url value='/bloghome/blogUpdate.do' />">
		<input type="hidden" value=${blog.mem_id } name="mem_id" />
		<div class="form-group row">
			<label for="example-text-input" class="col-md-2 col-form-label">블로그 이름</label>
			<div class="col-md-10">
				<input class="form-control" type="text" name="blog_name" value=${blog.blog_name }>
			</div>
		</div>
		<div class="form-group row">
			<label for="example-search-input" class="col-md-2 col-form-label">블로그 소개글</label>
			<div class="col-md-10">
				<input class="form-control" type="text" name="blog_introduce" value=${blog.blog_introduce }>
			</div>
		</div>
		<div class="form-group row">
			<label for="example-location" class="col-md-2 col-form-label">메뉴 추가/삭제</label>
			<div class="col-md-10 selectOptions ">
				<select id="menuBox" class="browser-default custom-select" name="menu">
					<option>메뉴를 선택하세요</option>
					<c:forEach var="category" items="${blog.categoryList }">
						<option id="option" value=${category.bc_no }>${category.bc_name }</option>
					</c:forEach>
				</select>
				<button class="btn btn-success-outlined" type="button" data-toggle="modal" data-target="#addModal">추가<i class="fa fa-plus-square-o"></i></button>
				<button id="aa" class="btn btn-danger-outlined" type="button" data-toggle="modal" data-target="#delModal">삭제<i class="fa fa-trash"></i></button>
			</div>
		</div>
		<br>
		<br>
		<div class="form-group row">
			<label for="example-text-input" class="col-md-2 col-form-label">블로그 비활성화 여부</label>
			<div class="col-md-10">
				<div class="form-check ">
					<input id="status" type="hidden" name="blog_status" value=${blog.blog_status } />
					<input id="blog_status1" class="radio-custom form-check-input"
						name="bl_status" value="Y" type="radio"
						 onClick="document.getElementById('status').value=this.value"> 
					<label for="radio-2" class="radio-custom-label form-check-label">
					활성화
					</label>
					<br>
					<input id="blog_status2" class="radio-custom form-check-input"
						name="bl_status" value="N" type="radio"
						 onClick="document.getElementById('status').value=this.value"> 
					<label for="radio-3" class="radio-custom-label form-check-label">
					비활성화
					</label>
				</div>
				<br><br><br>
				<br><br><br>
				<button class="btn btn-primary-outlined btn-default card-btn" type="submit">저장</button>
				<button class="btn btn-inverse-outlined btn-default card-btn" type="reset">취소</button>
			</div>
		</div>
	</form>
	  </div>
	
	<div class="modal fade " id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close push-xs-right"
						data-dismiss="modal" aria-label="Close">
						<i class="fa fa-close"></i>
					</button>
					<form method="post" action='<c:url value='/bloghome/insertCategory.do' />'>
						<div class="container-fluid modal-item">
							<div class="row">
								<div class="col-lg-12">
									<div class="single_item-details">
										<input type="hidden" name="mem_id" value=${blog.mem_id } />
										<h2>추가할 메뉴의 제목을 입력해주세요</h2>
										<br>
										<h6>제목 : </h6>
										<h6>(한글 10자, 영어 20자 이내로 입력해주세요.)</h6>
										<br>
										<textarea class="form-control" rows="1" cols="10" name="bc_name"></textarea>
										<button type="submit" class="btn btn-success-outlined" id="addBtn"
												onclick="<c:url value='/bloghome/insertCategory.do'>
													<c:param name='what' value='mem_id' />
												</c:url>">
											추가<i class="fa fa-plus-square-o"></i>
										</button>
										<button type="reset" class="btn btn-danger-outlined" 
												data-dismiss="modal" aria-label="Close">
											취소<i class="fa fa-minus-square-o"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade " id="delModal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close push-xs-right"
						data-dismiss="modal" aria-label="Close">
						<i class="fa fa-close"></i>
					</button>
					<form method="get" action='<c:url value='/bloghome/deleteCategory.do'>
						<c:param name='what' value='mem_id' />
					</c:url>'>
						<div class="container-fluid modal-item">
							<div class="row">
								<div class="col-lg-12">
									<div class="single_item-details">
										<input type="hidden" id="delNo" name="bc_no" />
										<input type="hidden" value=${blog.mem_id } name="mem_id" />
										<h2>정말로 삭제하실건가요?</h2>
										<br>
										<h6>정말로....?</h6>
										<br>
										<button type="submit" class="btn btn-danger-outlined" id="delBtn" >
											삭제<i class="fa fa-trash-o"></i>
										</button>
										<button type="reset" class="btn btn-danger-outlined" 
												data-dismiss="modal" aria-label="Close">
											취소<i class="fa fa-minus-square-o"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script>
$(function(){
	var delNumber = $("#menuBox").val();
	$("#aa").click(function(){
		$("#delNo").prop("value", delNumber);
	})
	
	var status = $("#status").val();
	
	if(status == "Y"){
		$("#blog_status1").prop("checked", "checked");
	}
	
	if(status == "N"){
		$("#blog_status2").prop("checked", "checked");
	}
	
})
</script>