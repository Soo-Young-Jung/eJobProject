<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="main-wrapper page-career-details">


<section class="project-details" style="padding-top: 20px;">
	<div class="container">
		<div class="row justify-content-center" style="padding-bottom: 20px;">
			<div class="col-md-8">
				<div class="sectionTitle text-center">
					<h2>${announceVO.annl_title}</h2>
				</div>
			</div>
		</div>
		
		<p class="announceMidd">기업 요구 사항</p>
		<div class="row">
			<div class="col-lg-5 col-xl-12" style="padding-bottom: 20px;">
				<div class="bg-image" style="background-image: url('${pageContext.request.contextPath }/assets/img/projetcs/bg-projects.jpg');">
					<div class="div_divider_parent">
						<div class="project_specification div_divider_child">
							<div class="row">
								<div class="col-5">경력</div>
								<div class="col-7">
									<c:choose>
										<c:when test="${announceVO.annl_career >= 12}">
											<fmt:parseNumber var="career" value="${announceVO.annl_career / 12}" integerOnly="true" scope="page" />
											${career}년 
											<c:set var="rest" value="${announceVO.annl_career % 12}" scope="page" />
											<c:if test="${rest > 0}">
											${rest}개월
											</c:if>
											이상
										</c:when>
										<c:when test="${announceVO.annl_career > 0}">
											${announceVO.annl_career}개월 이상
										</c:when>
										<c:otherwise>
											신입/경력 제한 없음
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="row">
								<div class="col-5">학력</div>
								<div class="col-7">
									<c:choose>
										<c:when test="${announceVO.annl_feb == 1}">
											초등학교 졸업자 이상
										</c:when>
										<c:when test="${announceVO.annl_feb == 2}">
											중학교 졸업자 이상
										</c:when>
										<c:when test="${announceVO.annl_feb == 3}">
											고등학교 졸업자 이상
										</c:when>
										<c:when test="${announceVO.annl_feb == 4}">
											대학교 졸업자 이상
										</c:when>
										<c:otherwise>
											제한없음
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="row">
								<div class="col-5">성별 제한</div>
								<div class="col-7">
									<c:choose>
										<c:when test="${announceVO.annl_gender == 'M'}">
											남성
										</c:when>
										<c:when test="${announceVO.annl_gender == 'F'}">
											여성
										</c:when>
										<c:otherwise>
											제한없음
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="row">
								<div class="col-5">근무형태</div>
								<div class="col-7">${announceVO.annl_st}</div>
							</div>
						</div>
						<div class="project_specification div_divider_child">
							<div class="row">
								<div class="col-5">급여</div>
								<div class="col-7">${announceVO.annl_sal}</div>
							</div>
	
							<div class="row">
								<div class="col-5">근무지역</div>
<%-- 								<div class="col-7">${announceVO.annl_addr1} ${announceVO.annl_addr2} <button class="btn btn-primary btn-sm" id="modalOpen" >지도</button> </div> --%>
								<div class="col-7">${announceVO.annl_addr1} ${announceVO.annl_addr2} <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" id="modalOpen" >지도</button> </div>
							</div>
	
							<div class="row">
								<div class="col-5">필수 자격증</div>
								<div class="col-7">
									<c:set var="licenseList" value="${announceVO.licenseList}"/>
									<c:if test="${not empty licenseList}" >
										<c:forEach var="licence" items="${licenseList}">
											${licence.cer_name} 
										</c:forEach>
									</c:if>
									<c:if test="${empty announceVO.licenseList}">
										제한없음
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<p class="announceMidd">기업 소개</p>
		<div class="row">
			<div class="col-lg-5 col-xl-12" style="padding-bottom: 20px;">
				<div style="text-align: center; border:1px solid #dee2e6; padding-bottom: 30px;">
					<div class="div_divider_parent">
						<div class="project_specification div_divider_child" style="padding-left: 170px;">
							<div class="row">
								<c:choose>
										<c:when test="${announceVO.mem_profileBase64 eq null}">
											<c:set var="Img" value="${pageContext.request.contextPath}/img/noimage.png" scope="page"/>
										</c:when>
										<c:otherwise>
											<c:set var="Img" value="data:image/*;base64,${announceVO.mem_profileBase64}" scope="page"/>
										</c:otherwise>
								</c:choose>
								<img class="img-full" src="${Img}" alt="Card image" style="width: 200px; max-height: 200px; border:1px solid #dee2e6;">
							</div>
						</div>
						<div class="project_specification div_divider_child">
							<div class="row">
								<div class="col-5">업체명</div>
								<div class="col-7">${ent_info.ent_name}</div>
							</div>
							<div class="row">
								<div class="col-5">대표명</div>
								<div class="col-7">${ent_info.ent_ceo}</div>
							</div>
							<div class="row">
								<div class="col-5">기업분류</div>
								<div class="col-7">${ent_info.ent_category}</div>
							</div>
							<div class="row">
								<div class="col-5">기업 주소지</div>
								<div class="col-7">${ent_info.ent_addr2}</div>
							</div>
							<div class="row">
								<div class="col-5">기업 메일</div>
								<div class="col-7">${ent_info.ent_mail}</div>
							</div>
							<div class="row">
								<div class="col-5">기업 전화번호</div>
								<div class="col-7">${ent_info.ent_tel}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<p class="announceMidd">상세 요강</p>
		<div id="content" style="margin-bottom : 20px; padding-bottom: 20px; border: 1px solid #dee2e6;">
		${announceVO.annl_other}
		</div>
		
		
		<c:if test="${announceVO.annl_category eq 'N'}">
		<p class="announceMidd">지원자 현황</p>
		<div class="container show-grid">
		    <div class="row col-md-12" style="padding: 0px; overflow: hidden;">
		      	<div class="col-md-4 border align-items-center justify-content-center" style="padding: 0px;">
					<div class="border align-items-center justify-content-center middle" style="height: 50%;">
				     <div>
					     <h4 style="margin: 0px;text-align: center;">모집인원</h4>
					     <h2 style="margin: 0px;text-align: center;"><span class="counter">${announceVO.annl_num}</span>명</h2>
				     </div>
				    </div>
				    <div class="border align-items-center justify-content-center middle" style="height: 50%; vertical-align: middle;">
				    <div>
				     <h4 style="margin: 0px;text-align: center;">지원자</h4>
				     <h2 style="margin: 0px;text-align: center;"><span class="counter">${chartData.TOTAL}</span>명</h2>
				     </div>
				    </div>
				</div>
		   	<div class="col-md-4 border align-items-center justify-content-center" style="padding: 0px">
				<div class="data-chart" style="margin: 0px;">
					<iframe class="chartjs-hidden-iframe" tabindex="-1" style="display: block; overflow: hidden; border: 0px; margin: 0px; top: 0px; left: 0px; bottom: 0px; right: 0px; height: 100%; width: 100%; position: absolute; pointer-events: none; z-index: -1;">
					</iframe>
					<canvas id="gender" width="510" height="255" style="display: block; width: 510px; height: 255px;"></canvas>
				</div>
			</div>
			<div class="col-md-4 border" style="padding: 0px">
				<div class="data-chart" style="margin: 0px;">
					<iframe class="chartjs-hidden-iframe" tabindex="-1" style="display: block; overflow: hidden; border: 0px; margin: 0px; top: 0px; left: 0px; bottom: 0px; right: 0px; height: 100%; width: 100%; position: absolute; pointer-events: none; z-index: -1;">
					</iframe>
					<canvas id="feb" width="510" height="255" style="display: block; width: 510px; height: 255px;"></canvas>
				</div>
			</div>
		    </div>
		</div>
		</c:if>
		
			<c:if test="${announceVO.dday >= 0}">
	
			<!-- 		타이머 -->
			<p class="announceMidd">공고 마감 시간</p>
			<div class="row justify-content-center" style="margin-bottom: 10px; margin-top:10px; padding: 0px;">
				<div class="col-lg-12" style="align-items: center;">
					<div class="count-down titled" style="text-align: center; border:1px solid #dee2e6;">
						<div id="simple_timer" class="simple_timer" style="margin-bottom: 10px;"></div>
					</div>
				</div>
			</div>
			
			
			<p class="announceMidd">접수방법</p>
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="rounded border d-flex align-items-center justify-content-center p-4">
						<c:if test="${announceVO.annl_category eq 'N'}">
						<button class="btn btn-danger btn-default bold" id="applicant" type="button" style="margin-right: 20px;">지원하기</button>
						</c:if>
						<c:if test="${announceVO.annl_category eq 'Y'}">
						<button class="btn btn-danger btn-default bold" onclick="window.open('${announceVO.annl_homepage}')" type="button" style="margin-right: 20px;">홈페이지로 이동</button>
						</c:if>
						<c:if test="${scrap eq true}">
						<button class="btn btn-danger btn-default bold scrap" id="scrap" type="button">스크랩 하기</button>
						</c:if>
						<c:if test="${scrap eq false}">
						<button class="btn btn-danger btn-default bold scrap" id="scrap" type="button">스크랩 취소하기</button>
						</c:if>
					</div>
				</div>
			</div>
			</c:if>
	
		<div style="float: right; margin-top: 30px;">
			<button id="viewList" class="btn btn-danger btn-default bold" onclick="location.href='${pageContext.request.contextPath }/announce/announceListView.do'" type="button">목록보기</button>
		<c:if test="${announceVO.mem_id eq mem_id}">
			<button form="updateFrom" class="btn btn-danger btn-default bold" >수정하기</button>
			<button form="deleteFrom" class="btn btn-danger btn-default bold">삭제하기</button>
			<form id="updateFrom" method="get" action='<c:url value="/announce/announceForm.do" />'>
				<input type="hidden" name="annl_no" value="${announceVO.annl_no}">
			</form>
			<form id="deleteFrom" method="post" action='<c:url value="/announce/announceForm.do" />'>
				<input type="hidden" name="_method" value="delete">
				<input type="hidden" name="annl_no" value="${announceVO.annl_no}">
			</form>
			
	</c:if>
		</div>
	
	</div>
	<form id="applicantForm" method="post" action="<c:url value='/announce/applicant.do' />" >
		<input type="hidden" name="annl_no" value="${announceVO.annl_no}" >
	</form>
	<form id="scrapForm" method="post" action="<c:url value='/announce/scrap.do' />" >
		<input type="hidden" name="annl_no" value="${announceVO.annl_no}" >
	</form>
<!-- 	여기까지 -->
</section>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" style="margin: 28rem auto;">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">근무지 위치</h4>
								</div>
								<div class="modal-body" style="text-align: center;">
									<div id="map" style="width:100%;height:350px;"></div>
								</div>
							</div>
						</div>
					</div>



</div>


	<!-- JAVASCRIPTS -->
	<script src="${pageContext.request.contextPath }/assets/plugins/chartjs/chart.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/syotimer/jquery.syotimer.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/counterUp/waypoint.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/counterUp/jquery.counterup.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=082814ede4ee1312ff0e244f016b0d5c&libraries=services"></script>
	<script type="text/javascript">
		simple_timer = $("#simple_timer") 
	
	
			$("#applicant").on("click", function() {
				$("#applicantForm").submit();
			});
			
			simple_timer.syotimer({
				year: ${date.year},		
				month: ${date.month},
				day: ${date.day}
			});
	
			var ctx = $("#gender");
			
			$(".scrap").on("click", function() {
				$("#scrapForm").submit();
			});
			
			
			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ['여성', '남성'],
			        datasets: [{
			            label: '지원자 남여비율',
			            data: [${chartData.F}, ${chartData.M}],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true
			                }
			            }]
			        }
			    }
			});
			var ctx = $("#feb");
			
			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ['초졸', '중졸', '고졸', '대졸'],
			        datasets: [{
			            label: '지원자 학력',
			            data: [${chartData.PRI}, ${chartData.MIDDLE}, ${chartData.HIGH}, ${chartData.COLLEGE}],
			            backgroundColor: [
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(54, 162, 235, 0.2)'
			            ],
			            borderColor: [
			                'rgba(54, 162, 235, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(54, 162, 235, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true
			                }
			            }]
			        }
			    }
			});
			
		<c:if test="${not empty message }">
			alert('${message}');
			<c:remove var="message" scope="session" />
		</c:if>
			
		function makeImgTag(announceVO){
			return announce.mem_profileBase64?"data:image/*;base64,"+announce.mem_profileBase64
								:"<c:url value='/img/noimage.png'/>";
		};
			
		$("#modalOpen").on("click", function() {
// 		$("#myModal").on("shown.bs.modal", function() {
// 			data-toggle="modal" data-target="#myModal"
			console.log("asdasd");
// 			$("#myModal").modal('show')
			
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };  
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
		
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
		
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${announceVO.annl_addr1}', function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
		
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
		
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					
					setTimeout(() => {
					map.relayout(); 
					}, 500);
			        map.setCenter(coords);
			    } 
			}); 
		});
		$('.counter').counterUp({
            delay : 10,
            time : 3000
        });
		
	</script>
	
