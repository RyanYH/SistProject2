<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/index.js"></script>
<head>
<meta name="robots" content="noindex">
<title>Social-network style lightbox - Bootsnipp.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	window.alert = function() {
	};
	var defaultCSS = document.getElementById('bootstrap-css');
	function changeCSS(css) {
		if (css)
			$('head > link')
					.filter(':first')
					.replaceWith(
							'<link rel="stylesheet" href="'+ css +'" type="text/css" />');
		else
			$('head > link').filter(':first').replaceWith(defaultCSS);
	}
	$(document).ready(function() {
		var iframe_height = parseInt($('html').height());
		window.parent.postMessage(iframe_height, 'http://bootsnipp.com');
	});
	$('.fab').hover(function() {
		$(this).toggleClass('active');
	});
	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})
	$(function() {
		// This code is not even almost production ready. It's 2am here, and it's a cheap proof-of-concept if anything.
		$(".img-modal-btn.right").on('click', function(e) {
			e.preventDefault();
			cur = $(this).parent().find('img:visible()');
			next = cur.next('img');
			par = cur.parent();
			if (!next.length) {
				next = $(cur.parent().find("img").get(0))
			}
			cur.addClass('hidden');
			next.removeClass('hidden');

			return false;
		})
		$(".img-modal-btn.left").on('click', function(e) {
			e.preventDefault();
			cur = $(this).parent().find('img:visible()');
			next = cur.prev('img');
			par = cur.parent();
			children = cur.parent().find("img");
			if (!next.length) {
				next = $(children.get(children.length - 1))
			}
			cur.addClass('hidden');
			next.removeClass('hidden');
			return false;
		})
	});
</script>
</head>
</head>
<body>
	<div class="modal img-modal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-8 modal-image">
							<img class="img-responsive " src="images/back.png"> <img
								class="img-responsive hidden" src="images/avatar.jpg" /> <img
								class="img-responsive hidden" src="images/back.jpg" /> <a
								href="" class="img-modal-btn left"> <i
								class="glyphicon glyphicon-chevron-left"></i></a> <a href=""
								class="img-modal-btn right"> <i
								class="glyphicon glyphicon-chevron-right"></i></a>
						</div>
						<div class="col-md-4 modal-meta" style="background-color: white;">
							<div class="modal-meta-top">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">X</span><span class="sr-only">Close</span>
								</button>
								<div class="img-poster clearfix">
									<a href=""><img class="img-circle" src="images/avatar.jpg" />
									</a> <strong> <a href="">COURSES</a></strong> <span>14
										minutes ago</span><br> contents<br> contents<br>
									contests <br> <br> <input type="text"
										class="form-control"
										placeholder="#Hash TAG, #Hash TAG2, #Hash TAG3, #Hash TAG4"
										readonly="readonly" /><br>
								</div>
								<ul class="img-comment-list">
									<li>
										<div class="comment-text">
											<strong><a href="">Jane Doe</a></strong>
											<p>
												Hello this is a test comment <span class="date sub-text">on
													March 5th, 2014</span>
											</p>
										</div>
									</li>
									<li>
										<div class="comment-text">
											<strong><a href="">Jane Doe</a></strong>
											<p>
												Hello this is a test comment <span class="date sub-text">on
													March 5th, 2014</span>
											</p>
										</div>
									</li>
									<li>
										<div class="comment-text">
											<strong><a href="">Jane Doe</a></strong>
											<p>
												Hello this is a test comment <span class="date sub-text">on
													March 5th, 2014</span>
											</p>
										</div>
									</li>
									<li>
										<div class="comment-text">
											<strong><a href="">Jane Doe</a></strong>
											<p>
												Hello this is a test comment <span class="date sub-text">on
													March 5th, 2014</span>
											</p>
										</div>
									</li>
									<li>
										<div class="comment-text">
											<strong><a href="">Jane Doe</a></strong>
											<p>
												Hello this is a test comment <span class="date sub-text">on
													March 5th, 2014</span>
											</p>
										</div>
									</li>
								</ul>
								<br> <input type="text" class="form-control"
									placeholder="Leave a commment.." />
							</div>
						</div>
						<!-- <div class="modal-meta-bottom"></div> -->
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
		<!-- small icon -->
		<!-- small icon -->
	</div>
</body>
</html>