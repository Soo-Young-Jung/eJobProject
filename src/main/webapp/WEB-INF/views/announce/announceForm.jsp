<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main-wrapper basic-forms">
<!-- Grid wrapper for ell elements -->

	<div class="grid-wrapper section" style="padding-top: 20px;">
	<div class="container">
		<div class="row">

			<div class="col-12 col-lg-12 element-content">
				


<!-- =============================================
## Forms
=============================================== -->
<div id="forms" class="element_single">
	
	

	<!-- Form Textual inputs start -->
	
	
	<div class="display-single_element text_input">
		<h2 style="margin-bottom: 30px;">
		${not empty announce?"공고 글 수정":"공고 글 작성"}
		</h2>
		<form:form commandName="announce" method="${not empty announce?'put':'post'}">
			<div class="form-group row">
				<label for="example-location" class="col-md-12 col-form-label">지원유형*</label>
					<div class="form-check">
						<c:set var="annl_category" value="${announce.annl_category}" scope="page" />
						<input id="radio-1" ${not empty announce?'disabled':''} ${annl_category eq "N"?"checked":""} ${empty annl_category?"checked":""} value="N" class="radio-custom form-check-input" name="annl_category" type="radio">
						<label for="radio-1" class="radio-custom-label form-check-label default-checked">즉시지원</label>
						<input id="radio-2" ${not empty announce?'disabled':''} ${annl_category eq "Y"?"checked":""} value="Y" class="radio-custom form-check-input" name="annl_category" type="radio">
						<label for="radio-2" class="radio-custom-label form-check-label default-checked">홈페이지 지원</label>
					</div>
			</div>
			
			
			
			<div id="div_homepage"  style="display: ${annl_category eq 'Y'?'':'none'};" class="form-group row">
				<label for="example-text-input" class="col-md-12 col-form-label">홈페이지 주소*</label>
				<div class="col-md-10">
					<input ${annl_category eq "Y"?"":"disabled"} class="form-control" name="annl_homepage" id="annl_homepage" type="text" value="${announce.annl_homepage}" placeholder="홈 페이지 주소">
				</div>
			</div>
		
			<div class="form-group row">
				<label for="example-text-input" class="col-md-12 col-form-label">글 제목*</label>
				<div class="col-md-10">
					<input required class="form-control" name="annl_title" type="text" value="${announce.annl_title}" placeholder="글 제목">
				</div>
			</div>
			
			<div class="form-group custom-form-group-icon row">
				<label for="example-datetime-local-input" class="col-md-12 col-form-label">공고 마감일*</label>
				<div class="col-md-10">
					<i class="fa fa-calendar-o" aria-hidden="true"></i>
<!-- 					<input class="form-control" type="datetime-local" value="2017-06-19T13:45:00" id="example-datetime-local-input"> -->
					<input ${not empty announce?'disabled':''} type="date" class="form-control" id="datepicker" name="annl_closeing" value="${announce.annl_closeing}" placeholder="공고 마감일"/>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="example-location" class="col-md-12 col-form-label">근무형태*</label>
				<div class="col-md-10 selectOptions">
<!-- 					<select required name="annl_st" class="browser-default custom-select announceselecter"> -->
					<select required name="annl_st" class="announceselecter" style="width: 100%;">
						<c:set var="annl_st" value="${announce.annl_st}" scope="page" />
						<option value="" >근무형태 선택</option>
						<option value="임금근로자" ${annl_st eq "임금근로자"?"selected":""} >임금근로자</option>
						<option value="정규직" ${annl_st eq "정규직"?"selected":""} >정규직</option>
						<option value="비정규직근로자" ${annl_st eq "비정규직근로자"?"selected":""} >비정규직근로자</option>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="example-postal-code" class="col-md-12 col-form-label">급여*</label>
				<div class="col-md-10">
					<input required class="form-control" type="text" name="annl_sal" value="${announce.annl_sal}" placeholder="급여">
				</div>
			</div>
			
			
			<!-- 카카오 우편번호 서비스 -->
			<div class="form-group row">
				<label for="example-postal-code" class="col-md-12 col-form-label">근무지*</label>
				<div class="col-md-6">
					<input required readonly class="form-control" name="annl_addr1" type="text" value="${announce.annl_addr1}" id="sample6_address" placeholder="주소">
				</div>
				<div class="col-md-2">
					<button class="btn btn-primary btn-danger card-btn" type="button" onclick="sample6_execDaumPostcode()" >주소 찾기</button>
				</div>
				<div class="col-md-6">
					<input class="form-control" type="text" name="annl_addr2" id="sample6_detailAddress" value="${announce.annl_addr2}" placeholder="상세주소">
				</div>
			</div>
			<!-- 카카오 우편번호 서비스 -->
			
			
			<div class="form-group row">
				<label for="example-postal-code" class="col-md-12 col-form-label">모집인원</label>
				<div class="col-md-10">
					<input class="form-control" min="0" type="number" name="annl_num" value="${announce.annl_num}" placeholder="모집인원">
				</div>
			</div>
			
			<div class="form-group row">
				<label for="example-location" class="col-md-12 col-form-label">최종학력 제한</label>
				<div class="col-md-10 selectOptions">
<!-- 					<select name="annl_feb" class="browser-default custom-select announceselecter"> -->
					<select name="annl_feb" class="announceselecter" style="width: 100%;">
					<c:set var="annl_feb" value="${announce.annl_feb}" scope="page" />
						<option value="0">최종학력 선택(선택사항 없을 시 제한없음)</option>
						<option value="1" ${annl_feb eq "1"?"selected":""} >초등학교 졸업 이상</option>
						<option value="2" ${annl_feb eq "2"?"selected":""} >중학교 졸업 이상</option>
						<option value="3" ${annl_feb eq "3"?"selected":""} >고등학교 졸업 이상</option>
						<option value="4" ${annl_feb eq "4"?"selected":""} >대학교 졸업 이상</option>
					</select>
				</div>
			</div>
			
			<div class="form-group custom-form-group-icon row">
				<label for="example-location" class="col-md-12 col-form-label">경력 제한</label>
				<div class="col-md-10">
					<i class="fa fa-calendar-o" aria-hidden="true"></i>
					<input type="number" class="form-control" min="0" name="annl_career" value="${announce.annl_career}" placeholder="경력(개월수 - 선택사항 없을 시 제한없음)"/>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="example-location" class="col-md-12 col-form-label">성별 제한</label>
				<div class="col-md-10 selectOptions ">
					<c:set var="annl_gender" value="${announce.annl_gender}" scope="page" />
<!-- 					<select name="annl_gender" class="browser-default custom-select announceselecter"> -->
					<select name="annl_gender" class="announceselecter" style="width: 100%;">
						<option value="">성별 선택(선택사항 없을 시 제한없음)</option>
						<option value="M" ${annl_gender eq "M"?"selected":""}>남성</option>
						<option value="F" ${annl_gender eq "F"?"selected":""}>여성</option>
					</select>
				</div>
			</div>
			
			<div class="col-md-2">
				<div class="form-group row">
					<button type="button" class="btn btn-danger" data-toggle="modal" id="clear_modal" data-target="#myModal">
					  자격증 추가
					</button>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-md-6" id="license_add_area">
					
					
					<c:choose>
						<c:when test="${not empty announce.licenseList}">
							<c:forEach items="${announce.licenseList}" var="license">
								<input readonly class="form-control" name="licenseNameList" type="text" value="${license.cer_name}" >
							</c:forEach>
						</c:when>
						<c:otherwise>
							<input readonly class="form-control" type="text" value="" placeholder="필수 자격증 추가(없을시 제한 없음)">
						</c:otherwise>
					</c:choose>
					
					
					
					
				<!-- Button trigger modal -->
				</div>
				<div class="col-md-1" id="licenseButton">
					<c:choose>
						<c:when test="${not empty announce.licenseList}">
							<c:forEach items="${announce.licenseList}" var="license">
								<button class="form-control btn btn-danger-outlined btn-default licenseDel" type="button" id="${license.cer_name}">X</button>
							</c:forEach>
						</c:when>
					</c:choose>
		        </div>
				<div hidden="true" id="licenseDelete">
		        </div>
			</div>
			
			<div class="form-group row">
				<label for="example-postal-code" class="col-md-12 col-form-label">공고 세부사항</label>
				<div class="col-md-10">
					<textarea class="form-control" name="annl_other" id="exampleTextarea" rows="5" style="resize: none">${announce.annl_other}</textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-2">
					<button class="btn btn-danger card-btn" type="submit">공고 작성</button>
				</div>
				<div class="col-md-2">
					<button onclick="location.href='${pageContext.request.contextPath }/announce/announceListView.do'" class="btn btn-danger card-btn" type="button">취소</button>
				</div>
			</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		  <div class="modal-dialog" style="margin: 28rem auto;">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">자격증 추가</h4>
		      </div>
		      <div class="modal-body container">
		      <div class="form-group row">
		        <div class="col-md-4">
		        	<input class="form-control" type="text" name="licensesearch" id="licensesearch">
		        </div>
		        <div class="col-md-2 row">
					<button class="btn btn-primary btn-default card-btn" id="license_btn" type="button" onclick="search_inputnm()" >검색</button>
				</div>
		      </div>
		      <div class="form-group row">
		        <div class="col-md-4" id="licenseArea">
		        	<select class="browser-default custom-select announceselecter" id="licenseList">
		        		<option value="" selected="selected">필수 자격증 추가(검색 후 추가)</option>
		        	</select>
		        </div>
		       </div>
		</div>
		
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="add_license">추가</button>
		      </div>
		    </div>
		  </div>
		</div>
			
			<input type="hidden" name="annl_no" value="${announce.annl_no}" >
			
			
		</form:form>
		
		
	</div>
		<!-- Forms Textual inputs ends -->

</div>
					</div> <!-- element-content ends -->
				</div>
			</div> <!-- element main container ends -->
		</div> <!-- Grid wrapper ends -->

	</div>

	<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="">
					<input type="text" autofocus name="licensesearch" placeholder="Search...">
				</form>
			</div>
		</div>
	</div>

	<!-- JAVASCRIPTS -->
	<script type="text/javascript"	src="<c:url value='/assets/js/ckeditor/ckeditor.js' />"></script>
	
<!-- 	다음 우편번호 서비스 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script>
		/////////////////////////////////////////////////////////////////////
		// Animation on scroll
		/////////////////////////////////////////////////////////////////////
		var $animation_elements = $('.animated');
		var $window = $(window);

		function check_if_in_view() {
			'use strict';
			var window_height = $window.height();
			var window_top_position = $window.scrollTop();
			var window_bottom_position = (window_top_position + window_height);

			$.each($animation_elements, function() {
				var $element = $(this);
				var element_height = $element.outerHeight();
				var element_top_position = $element.offset().top;
				var element_bottom_position = (element_top_position + element_height);
				var animationType = $(this).attr("data-animation");

				//check to see if this current container is within viewport
				if ((element_bottom_position >= window_top_position) && (element_top_position <= window_bottom_position)) {
					$element.addClass(animationType);
				} else {
					$element.removeClass(animationType);
				}
			});
		}

		$window.on('scroll resize', check_if_in_view);
		$window.trigger('scroll');
		
// 		즉시지원 라디오 버튼 이벤트
		
		$("input[name='annl_category']").change(function() {
			if($(this).val() == "Y"){
				$("#div_homepage").show();
				$("#annl_homepage").attr("disabled", false);
			}else{
				$("#div_homepage").hide();
				$("#annl_homepage").attr("disabled", true);
			};
		});
		
		var licenseList = $("#licenseList");
		
// 		자격증 추가 버튼 클릭 이벤트
		
		function search_inputnm() {
			var licensesearch = $("#licensesearch").val();
			console.log(licensesearch);
			if(licensesearch.trim()==null || licensesearch.trim()=="") return false;
			
			$.ajax({
				url : "${pageContext.request.contextPath }/license/license.do",
				data : {
					inputnm:licensesearch
				},
				method : "post",
				dataType : "json", 
				success : function(resp) {
					$("select#licenseList option[value!='']").remove();
					if(resp==null || resp.length == 0){
						console.log("검색결과 없음");
						alert("검색결과 없음");
						return false;
					}
					$(resp).each(function(idx, license){
						licenseList.append($('<option>', { 
						        value: license.jmfldnm,
						        text : license.jmfldnm 
						 }));
					});
					
				},
				error : function(errorResp) {
					console.log(errorResp.status + ", "
							+ errorResp.responseText)
				}
			});
			
		}
		
// 		모달창이 열릴시 초기화 이벤트
		
		$("#clear_modal").on("click", function() {
			$("#licensesearch").val("");
			$("select#licenseList option[value!='']").remove();
		});
		
// 		모달창 내 추가 버튼 클릭시 이벤트
		var license_add_area = $("#license_add_area");
		var licenseButton = $("#licenseButton");
		
		var licenseDelete = $("#licenseDelete")
		
		$("#add_license").on("click", function() {
			if(licenseList.val().trim()==null || licenseList.val().trim()=='') return false;
			console.log(licenseList.val());
			
			
// 			비어있는 선택사항을 제거
			if($("div#license_add_area input[value='']")!=null)
			$("div#license_add_area input[value='']").remove();
// 			기존에 있는 중복되는 값 제거
			if($("div#license_add_area input[value='" + licenseList.val() +"']")!=null)
			$("div#license_add_area input[value='" + licenseList.val() +"']").remove();
// 			기존에 있는 중복되는 버튼 제거
			if($("div#license_add_area input[value='" + licenseList.val() +"']")!=null)
			$("div#licenseButton button[id='" + licenseList.val() + "']").remove();
// 			삭제했다가 다시 추가할 시 삭제목록에서 제거
			if($("div#licenseDelete input[value='" + licenseList.val() +"']")!=null)
			$("div#licenseDelete input[value='" + licenseList.val() +"']").remove();
			
			license_add_area.append($('<input>', { 
				type:"text",
				readonly:true,
				class:"form-control",
				name:"licenseNameList",
		        value: licenseList.val()
		 	}));
			
			
			licenseButton.append($('<button>', { 
				type:"button",
				class:"form-control btn btn-danger-outlined btn-default licenseDel",
		        id:licenseList.val(),
		        text:"X"
		 	}));
			
		});
		
		
// 		자격증 삭제 버튼 클릭 이벤트
		
		licenseButton.on("click", ".licenseDel", function() {
			var val = $(this).attr("id");
			
			
			licenseDelete.append($('<input>', { 
				type:"hidden",
				readonly:true,
				name:"licenseDelList",
		        value: val
		 	}));
			
			$("div#license_add_area input[value='" + val +"']").remove();
			$("div#licenseButton button[id='" + val + "']").remove();
			
			if($("input[name='licenseNameList']").length==0){
				license_add_area.append($('<input>', { 
					type:"text",
					readonly:true,
					class:"form-control",
			        value: "",
			        placeholder:"필수 자격증 추가(없을시 제한 없음)"
			 	}));
			};
			
		});
		
		<c:url var="uploadImageUrl" value='/announce/uploadImage.do'>
			<c:param name="type" value="Images"></c:param>
		</c:url>
		
		
		CKEDITOR.replace(
				'annl_other',
				{
					extraPlugins : 'image',
					filebrowserImageUploadUrl : "${uploadImageUrl}"
				});
		
		<c:if test="${not empty message }">
			alert('${message}');
			<c:remove var="message" scope="session" />
		</c:if>
		
// 		카카오 우편번호 서비스
		function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                }

                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	</script>
