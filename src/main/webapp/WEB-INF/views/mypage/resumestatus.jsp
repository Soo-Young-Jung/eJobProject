<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	#th1{
		width : 100px;
	}
	.Btndiv{
		text-align : right;
	}
</style>

<div class="container">
	<h2>이력서 현황</h2>
	<br>
	<h6><em>· 이력서는 최대 10개까지 작성하여 등록 가능합니다.</em></h6>
	<h6><em>· 이력서공개는 1개만 가능합니다.</em></h6>
	<h6><em>· "등록" 버튼을 클릭하여, 필수 항목을 모두 입력 후 등록을 완료해야 입사지원 및 이력서 공개가 가능합니다.</em></h6>
	<br><br><br>
	
	<div class="heading">
		<h2 class="heading-v1-title"><i class="fa fa-file-text-o"></i> 이력서 리스트</h2>
	</div>
	<div class="Btndiv">
		<button id="addResumeBtn" class="btn btn-danger-outlined">등록</button>
	</div>
	<br>
	<table class="table table-hover">
		<thead>
			<th id="th1">이력서 번호</th>
			<th>이력서 제목</th>
			<th>이력서 공개 설정</th>
		</thead>
		<tbody id="listBody">
		<c:if test="${not empty list }">
			<c:forEach var="list" items="${list }">
				<tr id="${list.er_no }">
					<td>${list.er_no }</td>
					<td>${list.er_title }</td>
					<td>${list.er_open eq "Y" ? "O" : "X"} </td>
			</c:forEach>
		</c:if>
		</tbody>
	</table>
	<br><br><br><br><br>
	<div class="heading ">
		<h2 class="heading-v1-title"><i class="fa fa-archive"></i> 자소서 리스트</h2>
	</div>
	<br>
	<table class="table table-hover">
		<thead>
			<th id="th1">이력서 번호</th>
			<th>첨부파일</th>
		</thead>
		<tbody id="listBody">
			<c:forEach var="attList1" items="${attList }">
				<c:if test="${not empty attList1 }">
				<tr>
					<td>${attList1.er_no }</td>
					<td>${attList1.file_orgn }</td>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>

<div>
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
</div>






<script>
$('#listBody').on("click", "tr", function(){
	var what = $(this).prop('id');
	location.href = "${pageContext.request.contextPath}/mypage/resumeView.do?what=" + what;
}).css({cursor:"pointer"});

$('#addResumeBtn').on('click', function(){
	if('${resumecnt}' == 10){
			alert("이력서는 10개까지 등록이 가능합니다");
	}
	location.href = "${pageContext.request.contextPath}/mypage/addresume.do?mem_id=${mem_id}";
})

$('#addAttatch').on('click', function(){
	$('#attatchForm').submit();
})


</script>