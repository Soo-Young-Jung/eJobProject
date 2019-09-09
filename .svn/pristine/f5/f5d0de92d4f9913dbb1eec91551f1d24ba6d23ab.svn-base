<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.form-control {
	width: 400px;
}

button[name=feb] {
	width: 200px;
}
</style>


<form>
	<div class="container">
		<h2>간편 이력서 등록</h2>
		<br>
			<form:form id="aaForm" commandName="resume" name="resume"
				action="${pageContext.request.contextPath }/mypage/addResume.do">
		<div class="row">
				<div class="form-group col-md-12">
					<label class="example-text-input">이름</label>
				</div>
				<input type="text" id="er_name" name="er_name" class="form-control"
					maxlength="20" data-only-word="true" placeholder="이름입력"
					value="${member.mem_name }">
							<div class="form-group col-md-6 selectOptions">
								<select name="er_jobsearch" class="form-control select-drop" sb="10185081" style="display: none;">
										<option>구직상태 선택</option>
										<option>구직준비중(재학생)</option>
										<option>구직중</option>
										<option>재직중</option>
								</select>
							</div>
				<div class="form-group col-md-12">
					<label class="example-text-input">생년월일</label>
				</div>
				<input type="text" id="er_age" name="er_age" class="form-control"
					maxlength="20" data-only-word="true" placeholder="YYYYDDMM">&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="checkbox-3" class="checkbox-custom form-check-input"
					name="er_gender" type="checkbox">
				<label for="checkbox-3"
					class="checkbox-custom-label form-check-label">남자</label>
				<input id="checkbox-2" class="checkbox-custom form-check-input"
					name="er_gender" type="checkbox">
				<label for="checkbox-2"
					class="checkbox-custom-label form-check-label">여자</label>

				<div class="form-group col-md-12">
					<label class="example-text-input">최종학력</label>
				</div>
				<input name="er_feb" id="er_feb" type="hidden" />
				<button name="feb" id="feb1" type="button"
					class="btn btn-danger-outlined" value="초등학교 졸업">초등학교 졸업</button>&nbsp;&nbsp;
				<button name="feb" id="feb2" type="button"
					class="btn btn-danger-outlined" value="중학교 졸업">중학교 졸업</button>&nbsp;&nbsp;
				<button name="feb" id="feb3" type="button"
					class="btn btn-danger-outlined" value="고등학교 졸업">고등학교 졸업</button>&nbsp;&nbsp;
				<button name="feb" id="feb4" type="button"
					class="btn btn-danger-outlined" value="대학 대학원이상 졸업">대학
					대학원이상 졸업</button>
				<br>
				<br>
				<br>
				<div class="form-group col-md-12">
					<label class="example-text-input">관심분야</label>
				</div>
				<input type="text" id="er_interest" name="er_interest"
					class="form-control" maxlength="20" data-only-word="true"
					placeholder="관심분야 입력">


				<div class="form-group col-md-12">
					<label class="example-text-input">경력사항</label>
				</div>

				<button name="feb" id="career1" type="button"
					class="btn btn-danger-outlined" value="신입">신입</button>&nbsp;&nbsp;
			<button name="feb" id="career2" type="button"
					class="btn btn-danger-outlined" value="경력">경력</button>&nbsp;&nbsp;
			<input type="hidden" name="er_career" />

		</div>
		<button id="addBtn" type="submit" class="btn btn-danger-outlined">등록</button>
			</form:form>
		<br>
		<br>
		<div class="row">
			<div id="careerForm">
<%-- 				<form:form id="careerForm2" name="career" commandName="career" --%>
<%-- 					action="${pageContext.request.contextPath }/mypage/addResume.do"> --%>
<!-- 					<div class="form-group col-md-12"> -->
<!-- 						<label class="example-text-input">회사명</label> -->
<!-- 					</div> -->
<!-- 					<input type="text" id="ca_name" name="ca_name" class="form-control" -->
<!-- 						maxlength="20" data-only-word="true" placeholder="회사명 입력"> -->

<!-- 					<div class="form-group col-md-12"> -->
<!-- 						<label class="example-text-input">직책</label> -->
<!-- 					</div> -->
<!-- 					<input type="text" id="ca_position" name="ca_position" -->
<!-- 						class="form-control" maxlength="20" data-only-word="true" -->
<!-- 						placeholder="직책 입력"> -->

<!-- 					<div class="form-group col-md-12"> -->
<!-- 						<label class="example-text-input">경력</label> -->
<!-- 					</div> -->
<!-- 					<input type="text" id="er_career" name="er_career" -->
<!-- 						class="form-control" maxlength="20" data-only-word="true" -->
<!-- 						placeholder="경력 입력"> -->

<!-- 					<div class="form-group col-md-12"> -->
<!-- 						<label class="example-text-input">입사일</label> -->
<!-- 					</div> -->
<!-- 					<input type="date" id="ca_join" name="ca_join" class="form-control" -->
<!-- 						maxlength="20" data-only-word="true" placeholder="입사일"> -->

<!-- 					<div class="form-group col-md-12"> -->
<!-- 						<label class="example-text-input">퇴사일</label> -->
<!-- 					</div> -->
<!-- 					<input type="date" id="ca_retire" name="ca_retire" -->
<!-- 						class="form-control" maxlength="20" data-only-word="true" -->
<!-- 						placeholder="퇴사일"> -->
<%-- 				</form:form> --%>
			</div>
		</div>
		
		<br>
	</div>
</form>

<script>
	$(function() {
		$('input[type="checkbox"][name="er_gender"]').on(
				'click',
				function() {
					if ($(this).prop('checked')) {
						//체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
						$('input[type="checkbox"][name="er_gender"]').prop(
								'checked', false);
						$(this).prop('checked', true);
					}
				})

		$('#careerForm').hide();
	})

	$('#feb1').on('click', function() {
		$('#er_feb').val(this.value);
		$('#feb1').attr('class', 'btn btn-danger btn-rounded');
		$('#feb2').attr('class', 'btn btn-danger-outlined');
		$('#feb3').attr('class', 'btn btn-danger-outlined');
		$('#feb4').attr('class', 'btn btn-danger-outlined');
	})
	$('#feb2').on('click', function() {
		$('#er_feb').val(this.value);
		$('#feb1').attr('class', 'btn btn-danger-outlined');
		$('#feb2').attr('class', 'btn btn-danger btn-rounded');
		$('#feb3').attr('class', 'btn btn-danger-outlined');
		$('#feb4').attr('class', 'btn btn-danger-outlined');
	})
	$('#feb3').on('click', function() {
		$('#er_feb').val(this.value);
		$('#feb1').attr('class', 'btn btn-danger-outlined');
		$('#feb2').attr('class', 'btn btn-danger-outlined');
		$('#feb3').attr('class', 'btn btn-danger btn-rounded');
		$('#feb4').attr('class', 'btn btn-danger-outlined');
	})
	$('#feb4').on('click', function() {
		$('#er_feb').val(this.value);
		$('#feb1').attr('class', 'btn btn-danger-outlined');
		$('#feb2').attr('class', 'btn btn-danger-outlined');
		$('#feb3').attr('class', 'btn btn-danger-outlined');
		$('#feb4').attr('class', 'btn btn-danger btn-rounded');
	})

	$('#career1').on('click', function() {
		$('input[name="er_career"]').val(this.value);
		$('#careerForm').hide();
		$('#career1').attr('class', 'btn btn-danger btn-rounded');
		$('#career2').attr('class', 'btn btn-danger-outlined');
	})

	$('#career2').on('click', function() {
		$('input[name="er_career"]').val(this.value);
		$('#careerForm').show();
		$('#career1').attr('class', 'btn btn-danger-outlined');
		$('#career2').attr('class', 'btn btn-danger btn-rounded');
	})

// 	$('#addBtn').on('click', function() {
// 		var resume = $('#easyForm').serialize();
// 		var career = $('#careerForm2').serialize();
// 		$('#easyForm').submit();
// 				$('#careerForm2').submit();
// 				console.log($('#careerForm2').serialize());
// 				alert(career);
// 		alert(resume);
// 	})
</script>