<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${pageContext.request.contextPath }/assets/plugins/syotimer/jquery.syotimer.min.js"></script>
<script type="text/javascript"
	src="<c:url value='/assets/js/ckeditor/ckeditor.js' />"></script>
	
<style>
div.radio-wrap {
  display: inline-flex;
  align-items: center;
}


input[type='radio']:checked {
  appearance: none;
  width: 0.9rem;
  height: 0.9rem;
  border-radius: 100%;
  margin-right: 0.1rem;
}

input[type='radio'] {
  background-color: $white-color;
  border: 2px solid $font-color-3;
}
input[type='radio']:checked {
  background-color: pink;
}
</style>	
	
	<div class="container">
	<div>
	<form action="${pageContext.request.contextPath}/event/update" method="post" enctype="multipart/form-data">
<!-- 이벤트제목<input name="evt_title" type="text" /><br> -->
<label>< 이벤트 제목 > </label><input class="form-control" type="text" name="evt_title" id="searchWord" value="${event.evt_title}" /><br>

<label>< 이벤트 내용 > </label><textarea name="evt_content"  >${event.evt_content}</textarea><br>
<!-- 이벤트내용<input name="evt_content" type="text" /><br> -->


<div class="form-group row">
			<label for="example-datetime-local-input" class="col-md-2 col-form-label">시작일</label>
			<div class="col-md-10">
				<input name="evt_date"  class="form-control" type="date" value="${event.evt_date}" id="example-datetime-local-input">
			</div>
		</div>

<div class="form-group row">
			<label for="example-datetime-local-input" class="col-md-2 col-form-label">마감일</label>
			<div class="col-md-10">
				<input name="evt_closeing" class="form-control" type="date" value="2011-08-19T13:45:00" id="example-datetime-local-input">
			</div>
		</div>





<!-- 이벤트날짜<input name="evt_date" type="date" /><br> -->
<!-- 마감날짜<input name="evt_closeing" type="date" /><br> -->

<div class="form-check ">
 <label for = "evt_qualification">참가자격 : </label>
		<input id="radio-3" class="radio-custom form-check-input" name="evt_qualification" value = "고졸" type="radio" >
		<label for="radio-3" class="radio-custom-label form-check-label">고졸</label>
		<input id="radio-3" class="radio-custom form-check-input" name="evt_qualification" value = "대재" type="radio" checked>
		<label for="radio-3" class="radio-custom-label form-check-label">대재</label>
		<input id="radio-3" class="radio-custom form-check-input" name="evt_qualification" value = "대졸" type="radio" >
		<label for="radio-3" class="radio-custom-label form-check-label">대졸</label>
</div>
	
	
	
<div class="form-check ">
 <label for = "evt_qualification1">주최기관별 : </label>

		<input id="radio-3" class="radio-custom form-check-input" name="evt_organizer" value = "공기업" type="radio" >
		<label for="radio-3" class="radio-custom-label form-check-label">공기업</label>
		<input id="radio-3" class="radio-custom form-check-input" name="evt_organizer" value = "대기업" type="radio" checked >
		<label for="radio-3" class="radio-custom-label form-check-label">대기업</label>
		<input id="radio-3" class="radio-custom form-check-input" name="evt_organizer" value = "중앙정부/기관" type="radio" >
		<label for="radio-3" class="radio-custom-label form-check-label">중앙정부/기관</label>
		<input id="radio-3" class="radio-custom form-check-input" name="evt_organizer" value = "해외" type="radio" >
		<label for="radio-3" class="radio-custom-label form-check-label">해외</label>
</div>	
	

<!-- 1등시상금<input name="evt_money" type="text" /><br> -->


<label>1등시상금 : </label><div class="form-group row">
			<label for="example-location" class="col-md-2 col-form-label">Country</label>
			<div class="col-md-10 selectOptions ">
				<select name="evt_money" class="form-control select-drop">
					<option>400</option>
					<option>300</option>
					<option>200</option>
					<option>100</option>
				</select>
			</div>
		</div>
<input type="hidden" name="mem_id" value="${event.mem_id }"/>
<input type="hidden" name="evt_no" value="${event.evt_no }"/>

이미지<input type="file" class="form-control" name="evt_image" /><br>

<input id="createBtn" type="submit" class="btn btn-primary" value="작성">
</form>

	</div>
	</div>



<script type="text/javascript">
	CKEDITOR.replace(
			'evt_content',
			{
				extraPlugins : 'image',
				filebrowserImageUploadUrl : "${uploadImageUrl}"
			});
	

	
</script>