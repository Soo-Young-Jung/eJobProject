<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- BLOG RIGHT SIDEBAR -->
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="heading heading-v1 mb-3 bg-white bg-gray">
						<h2 class="heading-v1-title">이번주 인기 블로그</h2>
					</div>
					<div class="image_carousel">
						<div id="slickimage" class="element_row">
							<div class="image_single">
								<div class="card_img">
									<a href="bloghome"> <img class="img-full"
										src="${pageContext.request.contextPath }/assets/img/blog/iu.jpg"
										alt="Card image">
									</a>
								</div>
							</div>
							<div class="image_single">
								<div class="card_img">
									<img class="img-full"
										src="${pageContext.request.contextPath }/assets/img/blog/p1.jpg"
										alt="Card image">
								</div>
							</div>
							<div class="image_single">
								<div class="card_img">
									<img class="img-full"
										src="${pageContext.request.contextPath }/assets/img/blog/p2.jpg"
										alt="Card image">
								</div>
							</div>
							<div class="image_single">
								<div class="card_img">
									<img class="img-full"
										src="${pageContext.request.contextPath }/assets/img/blog/p3.jpg"
										alt="Card image">
								</div>
							</div>
							<div class="image_single">
								<div class="card_img">
									<img class="img-full"
										src="${pageContext.request.contextPath }/assets/img/blog/g1.jpg"
										alt="Card image">
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<div>
							<div class="heading heading-v1 mb-3 bg-white bg-gray">
								<h2 class="heading-v1-title">
									<a href="#">이번주 인기 주제별 글</a>
								</h2>
							</div>
						<div>
							<table class="table table-striped">
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>Larry</td>
										<td>the Bird</td>
										<td>@twitter</td>
									</tr>
								</tbody>
							</table>
						</div>
						<br> <br>
						<div>
								<div class="heading heading-v1 mb-3 bg-white bg-gray">
									<h2 class="heading-v1-title">
										<a href="#">이번주 인기 해시태그별 글</a>
									</h2>
								</div>
							<div>
								<table class="table table-striped">
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<script>
	$('#slickimage').slick({
	  slidesToShow: 3,		// Number of slides to show
	  slidesToScroll: 1,	// Number of slides to scroll
	  arrows: true			// set navigation arrows to show
	});
	</script>