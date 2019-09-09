function paging(page){
	if(page<=0) return;
	searchForm.find("input[name='page']").val(page);
	searchForm.submit();
	searchForm.find("input[name='page']").val("");
}

$(function(){
	searchForm = $("#searchForm"); // 댓글 페이징 폼
	var listBody = $("tbody#listBody");
	var pagingArea = $("#pagingArea");
	
	searchForm.on("submit", function(event){
		event.preventDefault();
		var action = $(this).attr("action");
		var queryString = $(this).serialize();
		$.ajax({
			url : action,
			data : queryString,
			dataType : "json",
			success : function(resp) {
				let replyList = resp.dataList;
				var trTags = [];
				if(replyList && replyList.length > 0){
					$(replyList).each(function(idx, reply){
						var tr = $("<tr>");
						trTags.push(tr);
						var td = $("<td>");
						tr.html(td);
						var table = $("<table class='table'>");
						td.html(table);
						var innerTrs = [];
						innerTrs.push(
							$("<tr>").append(
								$("<td class='col-md-3'>").text(reply.br_no)	
								, $("<td class='col-md-3'>").text(reply.br_writer)	
								, $("<td class='col-md-3'>").text(reply.br_date)	
							)
							, $("<tr>").append(
								$("<td>").prop("colspan", 3)
										 .text(reply.br_content)
								, $("<td class='text-right'>").append(
									$("<button>").prop({
										"class":"delReplyBtn btn btn-primary"
									})
									.data({brNo:reply.br_no})
									.text("삭제")		
								  )
							)
						);
						table.html(innerTrs);
					});
				}else{
					trTags.push(
						$("<tr>").append($("<td>")
								 .text("댓글 없음.")
						)		 
					);
				}
				listBody.html(trTags);
				pagingArea.html(resp.pagingHTMLForBS);
			},
			error : function(errorResp) {
				console.log(errorResp.status + ", "
						+ errorResp.responseText)
			}
		}); // ajax end
		return false;
	}); // submit handler end
	
	var viewReply = $("#viewReply"); // 삭제 버튼
	var replyForm = $("#replyForm"); // 댓글 등록 폼
	var deleteForm = $("#deleteForm"); // 댓글 삭제 폼
	
	viewReply.on("click", function(){
		paging(1);
	});
	
	// 댓글 등록과 삭제에서 공통 사용할 핸들러
	var commonHandler = function(event){
		event.preventDefault();
		var action = $(this).attr("action");
		var method = $(this).attr("method");
		var queryString = $(this).serialize();
		$.ajax({
			url:action,
			data : queryString,
			method : method,
			dataType : "json",
			success : function(resp) {
				if(resp.success){
					viewReply.trigger("click");
					replyForm[0].reset();
					delReplyModal.modal("hide");
				}else{
					alert(resp.message);
				}
			},
			error : function(errorResp) {
				console.log(errorResp.status + ", "
						+ errorResp.responseText)
			}
		});
		return false;
	} // commonHandler end
	
	// 비동기 댓글 등록
	replyForm.on("submit", commonHandler); 
	// 비동기 댓글 삭제
	deleteForm.on("submit", commonHandler);
	
	// 모달창 초기화
	var delReplyModal = $("#delReplyModal").modal({show:false});
	// 모달창이 닫힌 후 댓글삭제 폼 리셋.
	delReplyModal.on("hidden.bs.modal", function(){
		deleteForm[0].reset();
	});
	// "삭제" 버튼 클릭시 모달창 열기
	listBody.on("click", ".delReplyBtn", function(){
		var br_no = $(this).data("brNo");
		deleteForm.find("input[name='br_no']").val(br_no);
		delReplyModal.modal("show");
	});
}); 	