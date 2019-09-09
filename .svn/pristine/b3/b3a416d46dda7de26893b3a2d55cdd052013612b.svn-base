<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#main{
		width: 100%;
 		text-align: center;
	}
	#aa{
		display: inline-block;
	}
	#a{
		width : 200px;
		height : 150px;
		text-align: center;
	}
	em{
		font-size : 15px;
	}
</style>    
    
<div class="container">
	<h2>적성검사</h2>
	<div id="main" class="container">
		
		
		<div id="aa">
			<div class="row">
				<button name="careerNet" id="a" class="btn btn-danger btn-rounded btn-lg"><em>진로개발 준비도 검사</em></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button name="ann" id="a" class="btn btn-danger btn-rounded btn-lg"><em>이공계전공 적합도 검사</em></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="a" class="btn btn-danger btn-rounded btn-lg"><em>주요능력 효능감 검사</em></button>
			</div>
		</div>
	</div>
	
		<form id="ca" accept="application/json">
		<table>
		<thead>
			<tr>
				<td></td>
				<td></td>
				<td>전혀 그렇지 않다</td>
				<td>그렇지 않다</td>
				<td>보통이다</td>
			</tr>
		</thead>
		<tbody id="listBody">
		</tbody>
	</table>
	<button id="okBtn" type="submit">확인</button>
<!-- 	<input type="hidden" name="qestrnSeq" value="8"> -->
<!-- 	<input type="hidden" name="trgetSe" value="100208"> -->
<!-- 	<input type="hidden" name="name" value="박상엽"> -->
<!-- 	<input type="hidden" name="school" value="한남대학교"> -->
<!-- 	<input type="hidden" name="grade" value="4"> -->
<!-- 	<input type="hidden" name="email" value="qnco23@naver.com"> -->
<!-- 	<input type="hidden" name="gender" value="100323"> -->
		</form>
	
</div>
<a id="result" ></a>

<script>
$('button[name="careerNet"]').on('click', function(){
	$.ajax({
		url : "//inspct.career.go.kr/openapi/test/questions?apikey=8195b7807e26967c2b6f4ac281b9f3c3&q=8",
		method : "get",
		dataType : "json",
		success : function(resp){
			let result = resp.RESULT;
			var trTags = [];
			$(result).each(function(idx, result){
				var tr = $("<tr>").prop("id", "re_"+ idx);
				tr.append(
						$('<td>').html(idx + 1),
						$('<td>').html(result.question),
						$('<td>').append(
							$('<input type="checkbox" >')
							.prop('value', result.answerScore01)
// 							.attr('name', result.answerScore01)
							.html(result.answer01)		
						),
						$('<td>').append(
							$('<input type="checkbox">')
							.prop('value', result.answerScore02)
// 							.attr('name', result.answerScore02)
							.html(result.answer02)
						),
						$('<td>').append(
								$('<input type="checkbox">')
								.prop('value', result.answerScore03)
// 								.attr('name', result.answerScore03)
								.html(result.answer03)
							)
				);
				trTags.push(tr);
			});
			
			$('#listBody').html(trTags);
		}
	})
})

$('#ca').on('submit', function(event){
	event.preventDefault();
	data = $(this).serialize();
	ans = "";
	$("tr","#listBody").each(function(i,v){
		no = $("td", this).first().text();
		
		chkans = $(":checkbox:checked", this).val();
		
		if(typeof chkans == "undefined"){
			return;
		}
		
// 		if(ans!="") ans += " ";
		if(i < 35){
			ans += chkans + ",";
		}else{
			ans += chkans;
		}
	});
	alert(ans);
	
	
	
	$.ajax({
		url : "http://inspct.career.go.kr/openapi/test/report",
		data : {
			"answers" : ans,
			"apikey": "8195b7807e26967c2b6f4ac281b9f3c3",
			  "qestrnSeq": "8",
			  "trgetSe": "100206",
			  "name": "홍길동",
			  "gender": "100323",
			  "school": "율도중학교",
			  "grade": "2",
			  "email": "",
			  "startDtm": 1550466291034,
		},
		dataType : "json",
		method : "post",
		headers : {
		    "Accept" : "application/json",
		    "Content-Type" : "application/json;charset=UTF-8"
		},
		success : function(resp){
			alert(resp.RESULT.url)
		}
	})
	
	
	return false;
})

</script>