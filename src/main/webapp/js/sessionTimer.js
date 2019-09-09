if(jQuery){
	jQuery.timeFormat=function(seconds){
		var min = Math.trunc(seconds / 60);
		var sec = seconds % 60;
		return min +":"+sec;
	}
	
	jQuery.fn.sessionTimer=function(session){
		var timerArea = $("<div>").prop("id", "timerArea");
		var msgArea = $("<div>").prop("id", "msgArea")
							    .append(
							    		$("<p>").text("세션 만료시간이 1분 남았음. 연장할텨?"), 
							    		$("<button>").prop({
							    			"id":"yesBtn",
							    			"class":"btn"
							    		}).text("연장"), 
							    		$("<button>").prop({
							    			"id":"noBtn",
							    			"class":"btn"
							    		}).text("취소")
							    );
		
		$(this).append(timerArea, msgArea);
		
 		var timeout = session.timeout;
 		var sessionId = session.sessionId;
 		var sessionIdCheckUrl = session.checkUrl;
 		var realTime = timeout - 1;
 		var msgJob = null;
 		function init(){
	 		msgArea.hide();
	 		if(msgJob){
	 			clearTimeout(msgJob);
	 		}
 			msgJob = setTimeout(() => {
				msgArea.show();
			}, (timeout-60)*1000);
	 		realTime = timeout - 1;
 		}
 		init();
 		
 		$(this).on("click", ".btn", function(){
 			var btnId = $(this).prop("id");
 			if(btnId == "yesBtn"){
 				$.ajax({
					url : sessionIdCheckUrl,
					method : "get",
					dataType:"text",
					success : function(resp) {
						if(sessionId==resp.trim()){
							init();
						}else{
							alert("서버의 세션은 만료됐음");
							location.reload();
						}
					},
					error : function(errorResp) {
						console.log(errorResp.status + ", "
								+ errorResp.responseText)
					}
				});
 			}
 			msgArea.hide();
 		});
 		
 		var timerJob = setInterval(() => {
 			if(realTime<=0){
 				clearInterval(timerJob);
 			}else{
		 		timerArea.html($.timeFormat(realTime -- ));
 			}
		}, 1000);
	}
}




