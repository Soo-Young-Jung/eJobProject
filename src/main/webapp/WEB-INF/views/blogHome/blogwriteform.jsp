<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="<c:url value='/assets/js/ckeditor/ckeditor.js' />"></script>
<style>
	#title{
		width : 800px;
	}
	#form1{
		width: 800px;
	}
	.del-btn{
		cursor:pointer;
	}
</style>
<div id="form1" class="col-lg-12">
<div id="title" class="heading">
	<h2 class="heading-v1-title"><i class="fa fa-pencil-square-o"></i>새 글 작성</h2>
</div>
<br>
<br>
<form id="blogboardForm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bc_no" value="${bc_no}" />
	<input type="hidden" name="bb_no" value="${blogBoard.bb_no}" />
	<div class="row">
		<div class="form-group col-md-12">
			<label for="example-text-input" class="col-md-2 col-form-label">제목 : </label>
			<input type="text" class="form-control" name="bc_title"
		  	id="exampleInputName" aria-describedby="userName" value="${blogBoard.bc_title}">
		</div>
		<div class="form-group col-md-12">
			<label for="example-text-input" class="col-md-2 col-form-label">내용 : </label>
			<br>
			<br>
			<textarea class="form-control" name="bc_content"
		    id="exampleTextarea" rows="5" value="${blogBoard.bc_content}"></textarea>
		</div>
		<div class="form-group col-md-12">
			<label for="example-text-input" class="col-md-2 col-form-label">동영상 : </label>
			<input type="text" class="form-control" name="bc_video"
		  	id="bc_video" aria-describedby="videoName" value="${blogBoard.bc_video}">
		</div>
		<br>
		<br>
		<c:if test="${not empty blogBoard.attatchList }">
			<tr>
				<th>기존 파일</th>
				<td>
					<c:forEach var="attatch" items="${blogBoard.attatchList }">
						<c:url value='/bloghome/download.do' var="downloadURL">
							<c:param name="what" value="${attatch.ba_no }"/>
						</c:url>
						<span>
							${attatch.ba_filename }
							<input class="delFileBtn" type="image" src="<c:url value='/images/Spiderman.jpg'/>"
								data-attno="${attatch.ba_no }" 
								style="width:20px;height:20px;"
							/>
						</span>
					</c:forEach>
				</td>
			</tr>
		</c:if>
		<br>
		<br>
		<div class="form-group col-md-12">
			<label for="example-text-input" class="col-md-2 col-form-label">첨부파일</label>
			<br>
			<input type="file" class="form-control" name="bc_files" />
		</div>
		<div class="form-group col-md-12">
			<label for="example-text-input" class="col-md-10 col-form-label">태그</label>
            <input type="hidden" class="form-control" name="hash_name" id="rdTag" />
	        <ul id="tag-list">
	        	
	        </ul>
	        <div>
	            <input type="text" class="form-control" id="tag" size="7" placeholder="태그입력" />
	        </div>
		</div>
	</div>
	<br>
	<br>
	<button type="submit" onclick="<c:url value='/bloghome/blogWriteForm.do' />"
			class="btn btn-success-outlined">저장</button>
	<button type="button" class="btn btn-danger-outlined"
			onclick="<c:url value='/bloghome/blogboardlist.do'/>"
			>취소</button>
</form>
</div>
<c:url var='uploadImageUrl' value='/bloghome/uploadImage.do'>
	<c:param name="type" value="Images"></c:param>
</c:url>
<script>
	CKEDITOR.replace('bc_content', {
		extraPlugins: 'image',
		filebrowserImageUploadUrl: "${uploadImageUrl }"
	})
		
	var blogboardForm = $("#blogboardForm");
	// 삭제할 첨부파일들에 대한 정보를 서버로 전송하기 위해 동적 UI 추가
	var delFileInput = "<input type='text' name='delFiles' value='%V' />";
	$(".delFileBtn").on("click", function(){
		var att_no =  $(this).data("attno");
		blogboardForm.prepend(delFileInput.replace("%V", att_no));
		console.log(att_no);
		$(this).closest("span").remove();
	});
	
	$(function(){
		var tag = {};
	    var counter = 0;

	    // 태그를 추가한다.
	    function addTag (value) {
	        tag[counter] = value; // 태그를 Object 안에 추가
	        counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	    }

	    // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
	    function marginTag () {
	        return Object.values(tag).filter(function (word) {
	            return word !== "";
	        });
	    }

	    // 서버에 넘기기
	    $("#blogboardForm").on("submit", function (e) {
	        var value = marginTag(); // return array
	        $("#rdTag").val(value); 
			
	        $(this).submit();
	    });

	    $("#tag").on("keypress", function (e) {
	        var self = $(this);

	        // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
	        if (e.key === "Enter" || e.keyCode == 32) {
			
	            var tagValue = self.val(); // 값 가져오기
	            $('#rdtag').val(tagValue);
	            // 값이 없으면 동작 ㄴㄴ
	            if (tagValue !== "") {

	                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
	                var result = Object.values(tag).filter(function (word) {
	                    return word === tagValue;
	                })
	            
	                // 태그 중복 검사
	                if (result.length == 0) { 
	                    $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
	                    addTag(tagValue);
	                    self.val("");
	                } else {
	                    alert("태그값이 중복됩니다.");
	                }
	            }
	            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
	        }
	    });

	    // 삭제 버튼 
	    // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
	    $(document).on("click", ".del-btn", function (e) {
	        var index = $(this).attr("idx");
	        tag[index] = "";
	        $(this).parent().remove();
	    });
	})
</script>