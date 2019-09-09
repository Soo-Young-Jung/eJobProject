<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <style>
    	.form-group col-md-12{
    		width : 100px;
    	}
    </style>
    
<form:form commandName="ent" method="post" action="${pageContext.request.contextPath }/join/entinfo.do" class="register">
	<div class="container">
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">아이디</label>
					<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="ID"
						value="${mem_id }" readonly>
					<span class="token tag" id="msgArea"></span>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">사업자등록증</label>
					<input type="text" class="form-control" id="ent_no" name="ent_no" placeholder="NO" value="${ent.ent_no }">
					<span class="token tag" id="msgArea"></span>
					<button class="btn btn-danger-outlined" id="settext" type="button" >유효성 체크</button>
					<form:errors  path="ent_no" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">기업 이름</label>
				<input type="text" class="form-control" id="ent_name" name="ent_name" placeholder="NAME" value="${ent.ent_name }">
				<form:errors  path="ent_name" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">대표 이름</label>
				<input type="text" class="form-control" id="ent_ceo" name="ent_ceo" placeholder="CEO NAME" value="${ent.ent_ceo }">
				<form:errors  path="ent_name" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">회사 분류</label>
				<input type="text" class="form-control" id="ent_category" name="ent_category" placeholder="CATEGORY" value="${ent.ent_category }">
				<form:errors  path="ent_category" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-4">
				<label class="col-md-12 col-form-label">우편번호</label>
				<input type="text" class="form-control" id="ent_addr1" name="ent_addr1" placeholder="ADDR1" value="${ent.ent_addr1 }">
				<button id="chkBtn" class="btn btn-danger-outlined" type="button" onclick="addrSearch();">검색</button>
				<form:errors  path="ent_addr1" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">상세주소</label>
				<input type="text" class="form-control" id="ent_addr2" name="ent_addr2" placeholder="ADDR2" value="${ent.ent_addr2 }">
				<form:errors  path="ent_addr2" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">대표 번호</label>
				<input type="tel" class="form-control" id="ent_tel" name="ent_tel" placeholder="TEL" value="${ent.ent_tel }">
				<form:errors  path="ent_tel" element="span" cssClass="error" />
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-12 col-form-label">대표 이메일</label>
				<input type="email" class="form-control" id="ent_mail" name="ent_mail" placeholder="MAIL" value="${ent.ent_mail }">
				<form:errors  path="ent_mail" element="span" cssClass="error" />
			</div>
		</div>
		<br><br>
		<button disabled id="joinBtn" type="submit" class="btn btn-default btn-danger btn-block">회원가입</button>
	</div>
	
	<script>
    function addrSearch() {
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
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("ent_addr1").value = extraAddr;
                
                } else {
                    document.getElementById("ent_addr1").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ent_addr1').value = data.zonecode;
                document.getElementById("ent_addr2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("ent_addr2").focus();
            }
        }).open();
    }
    
    
    $("#settext").on("click", function() {
		$.ajax({
	        type : 'get',
	        url : 'https://business.api.friday24.com/closedown/' + $("#ent_no").val(),
	        dataType : 'json',
	        beforeSend : function(xhr){
	            xhr.setRequestHeader("Authorization", "Bearer 506Ym044u48Y2tHdv3VZ");
	        },
	        error: function(xhr, status, error){
	            alert("사업자 번호 10자리 숫자를 입력하여 주세요.");
	        },
	        success : function(xml){
	            if(xml.state == "normal"){
	            	$("#joinBtn").attr('disabled', false);
	            	alert("유효한 사업자 번호입니다.");
	            }
	            else if(xml.state == "down"){
	            	alert("현재 해당 사업장은 휴업중입니다.");
	            }
	            else if(xml.state == "close"){
	            	alert("현재 해당 사업장은 폐업 상태입니다.");
	            }
	            else if(xml.state == "unregistered"){
	            	alert("해당 사업장은 미등록입니다.");
	            }
	        }
	    });
	});
    
    
</script>
	
</form:form>
	
