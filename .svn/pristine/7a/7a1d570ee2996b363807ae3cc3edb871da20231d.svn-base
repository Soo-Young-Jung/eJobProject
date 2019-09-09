<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${pageContext.request.contextPath }/assets/plugins/syotimer/jquery.syotimer.min.js"></script>
	<style>
		button{
			text-align : center;
		}			
		#t1{
			width : 200px;
		}
	</style>
<div class="container">



	
<!-- <div class="display-single_element"> -->
<!-- <div class="col-md-4"> -->
<!-- 				<div class="card" style="width: 300px; height:390px; margin-right: 10px; margin-left: 10px;"> -->
<!-- 					<div class="card_img"> -->
<%-- 						<a href="${Img }" data-fancybox="images"> --%>
<%-- 						    <img class="img-full" src="${Img }" style="width: 300px; height:390px; margin-right: 10px; margin-left: 10px;"/> --%>
<!-- 						    <div class="hover-overlay effect-transformY"> -->
<!-- 						    	<h4 class="">Image Title Here</h4> -->
						    		    	
<!-- 						    </div> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			</div> -->



	<h2>개인정보 수정</h2>
	<br><br>
	<form id="editForm" action="${pageContext.request.contextPath }/mypage/edit.do" method="post" enctype="multipart/form-data">
	<table class="table table-bordered">
		<input type="hidden" name="mem_pass" value="${member.mem_pass }"/>
		<tbody>
			<tr>
				<td id="t1" align="center" >
					<label class="col-md-12 col-form-label">아이디</label>
				</td>
				<td><input class="form-control" type="text" name="mem_id" placeholder="ID" value="${member.mem_id}" readonly/></td>
			</tr>
			<tr>
				<td id="t1" align="center" >
					<label class="col-md-12 col-form-label">이름</label>
				</td>
				<td><input class="form-control" type="text" name="mem_name" placeholder="NAME" value="${member.mem_name}"/></td>
			</tr>
			<tr>
				<td id="t1" align="center" ><label class="col-md-12 col-form-label">메일</label></td>
				<td><input class="form-control" type="text" name="mem_mail" placeholder="MAIL" value="${member.mem_mail}"/></td>
			</tr>
			<tr>
				<td id="t1" align="center" ><label class="col-md-12 col-form-label">전화번호</label></td>
				<td><input class="form-control" type="text" name="mem_tel" placeholder="TEL" value="${member.mem_tel}"/></td>
			</tr>
			<tr>
				<td id="t1" align="center" ><label class="col-md-12 col-form-label">우편번호</label>
				</td>
				<td><input type="text" class="form-control" id="mem_add1" name="mem_add1" placeholder="ADDR1" value="${member.mem_add1 }">
				<button id="chkBtn" class="btn btn-danger-outlined" type="button" onclick="addrSearch();">검색</button></td>
			</tr>
			<tr>
				<td id="t1" align="center" ><label class="col-md-12 col-form-label">상세주소</label>
				<td><input type="text" class="form-control" id="mem_add2" name="mem_add2" placeholder="ADDR2" value="${member.mem_add2 }"/></td>
			</tr>
			<tr>
				<td id="t1" align="center" ><label class="col-md-12 col-form-label">프로필 사진</label></td>
				<td>
					<c:choose>
						<c:when test="${member.mem_profileBase64 eq null}">
							<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="application"/>
						</c:when>
					<c:otherwise>
						<c:set var="Img" value="data:image/*;base64,${member.mem_profileBase64 }" scope="application"/>
					</c:otherwise>
					</c:choose>
					
 					<img  src="${Img }" style="width: 300px; height:390px; margin-right: 10px; margin-left: 10px;"/>	
					<input type="file" class="form-control" name="mem_image"  />
				</td>
			</tr>
		</tbody>
	</table>
	
	</form>
			<button id="editBtn" class="btn btn-danger-outlined" type="button">수정완료</button>
</div>
<div>
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
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
                    document.getElementById("mem_add1").value = extraAddr;
                
                } else {
                    document.getElementById("mem_add1").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mem_add1').value = data.zonecode;
                document.getElementById("mem_add2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("mem_add2").focus();
            }
        }).open();
    }
    
    $('#editBtn').on('click', function(){
    	$('#editForm').submit();
	   	if(${success}){
	   		alert("수정에 실패하였습니다");
	   	}else{
	   		alert("수정에 성공하였습니다");
	   	}
    })
    
</script>