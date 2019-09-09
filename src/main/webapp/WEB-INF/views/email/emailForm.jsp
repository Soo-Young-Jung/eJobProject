<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">
	<form id="mailForm" method="post" action="${pageContext.request.contextPath }/bloghome/sendEmail.do">
			<input type="hidden" name="mail" value="${member.mem_mail }" >
			<input type="hidden" name="mem_id" value="${member.mem_id }" >
		<div class="row">
			<div class="form-group col-md-12">
				<input type="text" class="form-control" placeholder="제목" 
						name="subject" id="subject">
			</div>
			<div class="form-group col-md-12">
				<textarea class="form-control" id="mailContent" rows="5"
					placeholder="내용" name="content"></textarea>
			</div>
			<button type="submit" class="btn btn-default btn-primary"
				value="Transmission">보내기</button>
		</div>
	</form>
</div>
<script>
</script>