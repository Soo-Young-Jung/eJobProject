<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.form-control {
	width: 400px;
}
#er_title{
	width : 800px;
}
button[name=feb]{
	width: 200px;
}
#jobselect{
	width : 400px;
	height : 50px;
	font-size: medium;
}
#fileDiv{
	width : 450px;
}
</style>


	<div class="container">
		<h2>간편 이력서 등록</h2>
		<br>
			<form:form commandName="resume" id="easyForm" action="${pageContext.request.contextPath }/mypage/addResume.do"  enctype="multipart/form-data">
		<div class="row">
			<c:if test="${edit eq 'true' }">
				<input type="hidden" name="er_no" value="${resume.er_no }">
			</c:if>
			<div class="form-group col-md-12">
				<label class="example-text-input">이력서 제목</label>
			</div>
			<input type="text" id="er_title" name="er_title"
					class="form-control" maxlength="40"
					data-only-word="true" placeholder="이력서 제목 입력(30글자 이하)"
					value="${resume.er_title }" ${edit eq true ? "readonly" : "" }>
			<div class="form-group col-md-12">
				<label class="example-text-input">이름</label>
			</div>
			<input type="text" id="er_name" name="er_name"
					class="form-control" maxlength="20"
					data-only-word="true" placeholder="이름입력" value="${resume.er_name }"> 
<!-- 			<div class="form-group col-md-6 selectOptions"> -->
				<select id="jobselect" name="er_jobsearch" class="browser-default custom-select" >
						<option value="" disabled selected>구직상태 선택</option>
						<option ${resume.er_jobsearch eq 1 ? "selected" : "" } value="1">구직준비중(재학생)</option>
						<option ${resume.er_jobsearch eq 2 ? "selected" : "" } value="2">구직중</option>
						<option ${resume.er_jobsearch eq 3 ? "selected" : "" } value="3">재직중</option>
				</select>
<!-- 			</div> -->
			<div class="form-group col-md-12">
				<label class="example-text-input">생년월일</label>
			</div>
			<input type="text" id="er_age" name="er_age"
					class="form-control" maxlength="20"
					data-only-word="true" placeholder="YYYYDDMM" value="${resume.er_age }">&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="checkbox-3" class="checkbox-custom form-check-input" name="er_gender" type="checkbox" value="M"
			       ${resume.er_gender eq "M" ? "checked" : "" }>
			<label for="checkbox-3" class="checkbox-custom-label form-check-label">남자</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="checkbox-2" class="checkbox-custom form-check-input" name="er_gender" type="checkbox" value="W"
			       ${resume.er_gender eq "W" ? "checked" : "" }>
			<label for="checkbox-2" class="checkbox-custom-label form-check-label">여자</label>
			
			<div class="form-group col-md-12">
				<label class="example-text-input">최종학력</label>
			</div>
				<input name="er_feb" id="er_feb" type="hidden" value="${resume.er_feb }"/>
				<button name="feb" id="feb1" type="button" class="btn btn-danger-outlined" value="1">초등학교 졸업</button>&nbsp;&nbsp;
				<button name="feb" id="feb2" type="button" class="btn btn-danger-outlined" value="2">중학교 졸업</button>&nbsp;&nbsp;
				<button name="feb" id="feb3" type="button" class="btn btn-danger-outlined" value="3">고등학교 졸업</button>&nbsp;&nbsp;
				<button name="feb" id="feb4" type="button" class="btn btn-danger-outlined" value="4">대학 대학원이상 졸업</button>
			<br><br>
			<br>
			<div class="form-group col-md-12">
				<label class="example-text-input">관심분야</label>
			</div>
			<input type="text" id="er_interest" name="er_interest"
					class="form-control" maxlength="20"
					data-only-word="true" placeholder="관심분야 입력" value="${resume.er_interest }"> 
			
			
			<div class="form-group col-md-12">
				<label class="example-text-input">경력사항</label>
			</div>
			
			<button name="feb" id="career1" type="button" class="btn btn-danger-outlined" value="신입">신입</button>&nbsp;&nbsp;
			<button name="feb" id="career2" type="button" class="btn btn-danger-outlined" value="경력">경력</button>
			<br>
			<input type="hidden" name="er_career" value="${reume.er_career }"/>			
			<input type="hidden" name="mem_id" value="${mem_id }">
			
			<br><br>
			<div class="form-group col-md-12">
				<label class="example-text-input">공개여부</label>
			</div>
			<input id="open1" class="checkbox-custom form-check-input" name="er_open" type="checkbox" value="Y"
			       ${resume.er_open eq "Y" ? "checked" : "" }>
			<label for="open1" class="checkbox-custom-label form-check-label">공개</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="open2" class="checkbox-custom form-check-input" name="er_open" type="checkbox" value="N"
			       ${resume.er_open eq "N" ? "checked" : "" }>
			<label for="open2" class="checkbox-custom-label form-check-label">비공개</label>
			<br>
			<div class="form-group col-md-12">
				<label class="example-text-input">자기소개서</label>
			</div>
			<br><br>
				<c:choose>
					<c:when test="${not empty att.file_orgn }">
						<input type="text" class="form-control" value="${att.file_orgn }" readonly>
						<br><br>
					</c:when>
					<c:otherwise>
						<input  class="form-control" name="file_file" type="file"/>
						
<!-- 						<div id="fileDiv" class="input-group mb-3"> -->
<!--   							<div class="input-group-prepend"> -->
<!-- 		    					<span class="input-group-text" id="inputGroupFileAddon01">Upload</span> -->
<!-- 		  				  </div> -->
<!-- 						  <div class="custom-file"> -->
<!-- 							    <input type="file" class="custom-file-input" id="inputGroupFile" name="file_file" aria-describedby="inputGroupFileAddon01"> -->
<!-- 							    <label class="custom-file-label" for="inputGroupFile">Choose file</label> -->
<!-- 						  </div> -->
<!-- 						</div>	 -->
						<br><br>
					</c:otherwise>
				</c:choose>
			</div>
				<div class="row">
					<div id="careerForm">
						
						<div class="form-group col-md-12">
							<label class="example-text-input">회사명</label>
						</div>
						<input type="text" id="ca_name" name="ca_name"
								class="form-control" maxlength="20"
								data-only-word="true" placeholder="회사명 입력" value="${career.ca_name }">
								
						<div class="form-group col-md-12">
							<label class="example-text-input">직책</label>
						</div>
						<input type="text" id="ca_position" name="ca_position"
								class="form-control" maxlength="20"
								data-only-word="true" placeholder="직책 입력" value="${career.ca_position }">
					
						<div class="form-group col-md-12">
							<label class="example-text-input">경력</label>
						</div>
						<input type="text" id="er_career"
								class="form-control" maxlength="20"
								data-only-word="true" value="${career.er_career }" readonly>
						
						<div class="form-group col-md-12">
							<label class="example-text-input">입사일</label>
						</div>
						<input type="date" id="ca_join" name="ca_join"
								class="form-control" maxlength="20"
								data-only-word="true" placeholder="입사일" value="${career.ca_join }">
						
						<div class="form-group col-md-12">
							<label class="example-text-input">퇴사일</label>
						</div>
						<input type="date" id="ca_retire" name="ca_retire"
								class="form-control" maxlength="20"
								data-only-word="true" placeholder="퇴사일" value="${career.ca_retire }">
				</div>
				</div>
			</form:form>
		
		
<!-- 			<div class="row"> -->
<!-- 				<div id="careerForm"> -->
<%-- 					<form:form id="careerForm2" commandName="career" action="${pageContext.request.contextPath }/mypage/addResume.do"> --%>
<!-- 						<div class="form-group col-md-12"> -->
<!-- 							<label class="example-text-input">회사명</label> -->
<!-- 						</div> -->
<!-- 						<input type="text" id="ca_name" name="ca_name" -->
<!-- 								class="form-control" maxlength="20" -->
<!-- 								data-only-word="true" placeholder="회사명 입력"> -->
								
<!-- 						<div class="form-group col-md-12"> -->
<!-- 							<label class="example-text-input">직책</label> -->
<!-- 						</div> -->
<!-- 						<input type="text" id="ca_position" name="ca_position" -->
<!-- 								class="form-control" maxlength="20" -->
<!-- 								data-only-word="true" placeholder="직책 입력"> -->
					
<!-- 						<div class="form-group col-md-12"> -->
<!-- 							<label class="example-text-input">경력</label> -->
<!-- 						</div> -->
<!-- 						<input type="text" id="er_career" name="er_career" -->
<!-- 								class="form-control" maxlength="20" -->
<!-- 								data-only-word="true" placeholder="경력 입력"> -->
						
<!-- 						<div class="form-group col-md-12"> -->
<!-- 							<label class="example-text-input">입사일</label> -->
<!-- 						</div> -->
<!-- 						<input type="date" id="ca_join" name="ca_join" -->
<!-- 								class="form-control" maxlength="20" -->
<!-- 								data-only-word="true" placeholder="입사일"> -->
						
<!-- 						<div class="form-group col-md-12"> -->
<!-- 							<label class="example-text-input">퇴사일</label> -->
<!-- 						</div> -->
<!-- 						<input type="date" id="ca_retire" name="ca_retire" -->
<!-- 								class="form-control" maxlength="20" -->
<!-- 								data-only-word="true" placeholder="퇴사일"> -->
<%-- 					</form:form>  --%>
<!-- 				</div> -->
<!-- 			</div> -->
<br>
				<button id="addBtn" type="button" class="btn btn-danger-outlined">${edit eq 'true' ? "수정" : "등록" }</button>
				<c:choose>
					<c:when test="${edit eq 'true' }">
						<button id="cancelBtn" type="button" class="btn btn-danger-outlined">취소</button>
					</c:when>
					<c:otherwise>
						<button id="cancelBtn2" type="button" class="btn btn-danger-outlined">취소</button>
					</c:otherwise>
				</c:choose>
	</div>
	<br><br><br><br>
	<br><br><br>

<script>
	$(function(){
		$('#careerForm').hide();
		$('input[type="checkbox"][name="er_gender"]').on('click', function(){
			if ($(this).prop('checked')) {
	            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
	            $('input[type="checkbox"][name="er_gender"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
		})
		
		$('input[type="checkbox"][name="er_open"]').on('click', function(){
			if ($(this).prop('checked')) {
	            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
	            $('input[type="checkbox"][name="er_open"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
		})
		
		
		if(${resume.er_feb eq 1}){
			$('#er_feb').val('1');
			$('#feb1').attr('class', 'btn btn-danger btn-rounded');
			$('#feb2').attr('class', 'btn btn-danger-outlined');
			$('#feb3').attr('class', 'btn btn-danger-outlined');
			$('#feb4').attr('class', 'btn btn-danger-outlined');
		}
		
		if(${resume.er_feb eq 2}){
			$('#er_feb').val('2');
			$('#feb1').attr('class', 'btn btn-danger-outlined');
			$('#feb2').attr('class', 'btn btn-danger btn-rounded');
			$('#feb3').attr('class', 'btn btn-danger-outlined');
			$('#feb4').attr('class', 'btn btn-danger-outlined');
		}
		
		if(${resume.er_feb eq 3}){
			$('#er_feb').val('3');
			$('#feb1').attr('class', 'btn btn-danger-outlined');
			$('#feb2').attr('class', 'btn btn-danger-outlined');
			$('#feb3').attr('class', 'btn btn-danger btn-rounded');
			$('#feb4').attr('class', 'btn btn-danger-outlined');
		}
		
		if(${resume.er_feb eq 4}){
			$('#er_feb').val('4');
			$('#feb1').attr('class', 'btn btn-danger-outlined');
			$('#feb2').attr('class', 'btn btn-danger-outlined');
			$('#feb3').attr('class', 'btn btn-danger-outlined');
			$('#feb4').attr('class', 'btn btn-danger btn-rounded');
		}
		
		if(${resume.er_career eq '신입'}){
			$('#careerForm').hide();
			$('input[name="er_career"]').val('신입');
			$('#career1').attr('class', 'btn btn-danger btn-rounded');
			$('#career2').attr('class', 'btn btn-danger-outlined');
		}
		
		if(${resume.er_career eq '경력'}){
			$('#careerForm').show();
			$('input[name="er_career"]').val('경력');
			$('#career1').attr('class', 'btn btn-danger-outlined');
			$('#career2').attr('class', 'btn btn-danger btn-rounded');
		}
		
		
	})
	
	$('#feb1').on('click', function(){
		$('#er_feb').val(this.value);
		$('#feb1').attr('class', 'btn btn-danger btn-rounded');
		$('#feb2').attr('class', 'btn btn-danger-outlined');
		$('#feb3').attr('class', 'btn btn-danger-outlined');
		$('#feb4').attr('class', 'btn btn-danger-outlined');
	})
	$('#feb2').on('click', function(){
		$('#er_feb').val(this.value);
		$('#feb1').attr('class', 'btn btn-danger-outlined');
		$('#feb2').attr('class', 'btn btn-danger btn-rounded');
		$('#feb3').attr('class', 'btn btn-danger-outlined');
		$('#feb4').attr('class', 'btn btn-danger-outlined');
	})
	$('#feb3').on('click', function(){
		$('#er_feb').val(this.value);
		$('#feb1').attr('class', 'btn btn-danger-outlined');
		$('#feb2').attr('class', 'btn btn-danger-outlined');
		$('#feb3').attr('class', 'btn btn-danger btn-rounded');
		$('#feb4').attr('class', 'btn btn-danger-outlined');
	})
	$('#feb4').on('click', function(){
		$('#er_feb').val(this.value);
		$('#feb1').attr('class', 'btn btn-danger-outlined');
		$('#feb2').attr('class', 'btn btn-danger-outlined');
		$('#feb3').attr('class', 'btn btn-danger-outlined');
		$('#feb4').attr('class', 'btn btn-danger btn-rounded');
	})
// 	신입버튼
	$('#career1').on('click', function(){
		$('input[name="er_career"]').val(this.value);
		$('#ca_name').val('');
		$('#ca_position').val('');
		$('#ca_join').val('');
		$('#ca_retire').val('');
		$('#careerForm').hide();
		$('#career1').attr('class', 'btn btn-danger btn-rounded');
		$('#career2').attr('class', 'btn btn-danger-outlined');
	})
// 	경력버튼
	$('#career2').on('click', function(){
		$('input[name="er_career"]').val(this.value);
		$('#careerForm').show();
		$('#career1').attr('class', 'btn btn-danger-outlined');
		$('#career2').attr('class', 'btn btn-danger btn-rounded');
	})
	
	
	$('#addBtn').on('click', function(){
		if('${edit}' == 'true'){
			$('#easyForm').attr('action', '${pageContext.request.contextPath}/mypage/editResume');
			$('#easyForm').submit();
		}
		$('#easyForm').submit();
// 		$('#careerForm2').submit();
	});
	
	$('#cancelBtn').on('click', function(){
		location.href = "${pageContext.request.contextPath}/mypage/resumeView.do?what=${resume.er_no}";
	})
	
	$('#cancelBtn2').on('click', function(){
		location.href = "${pageContext.request.contextPath}/mypage/resumeStatus.do?mem_id=${mem_id}";
	})
	
	$('#deleteBtn').on('click', function(){
		$('#easyForm').attr('action', "${pageContext.request.contextPath}/mypage/deleteResume.do");
		$('#easyForm').submit();
	});
	
	
	if('${cnt}' == 1){
		alert("이력서는 1개만 공개 가능합니다");
	}
	
	if('${chk}' == 1){
		alert("이력서제목은 중복이 허용되지 않습니다");
	}
	
</script>