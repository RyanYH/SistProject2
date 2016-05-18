<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- #428bca -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>My House's Level</title>

<!-- Google fonts -->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lobster'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Josefin+Sans:600'
	rel='stylesheet' type='text/css'>

<!-- font awesome -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- bootstrap -->
<link rel="stylesheet" href="user/bootstrap/css/bootstrap.min.css" />

<!-- animate.css -->
<link rel="stylesheet" href="user/assets/animate/animate.css" />
<link rel="stylesheet" href="user/assets/animate/set.css" />

<!-- gallery -->
<link rel="stylesheet" href="user/assets/gallery/blueimp-gallery.min.css">

<!-- favicon -->
<link rel="shortcut icon" href="user/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="user/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js">
</script>

<link rel="stylesheet" href="user/assets/style.css">
<link rel="stylesheet" href="user/login/css/reset.css">
<link rel="stylesheet" href="user/login/css/style.css">
<link rel="stylesheet" type="text/css" href="user/pageTrans/css/style.css" />

<link href="user/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/"></script>
<script type="text/javascript">
	$(function() {
		/* BOOTSNIPP FULLSCREEN FIX */
		if (window.location == window.parent.location) {
			$('#back-to-bootsnipp').removeClass('hide');
			$('.alert').addClass('hide');
		}
		$('#pop01').on('click', function(event) {
			event.preventDefault();
			$('#myModal').modal('show');
		})
		$('#pop02').on('click', function(event) {
			event.preventDefault();
			$('#myModal2').modal('show');
		})
		$('.toggle').click(function() {
			// Switches the forms
			$('.form').animate({
				height : "toggle",
				'padding-top' : 'toggle',
				'padding-bottom' : 'toggle',
				opacity : "toggle"
			}, "slow");
		});
	});
</script>
</head>

<body>
	<div class="topbar animated fadeInLeftBig"></div>
	<!-- Header Starts -->
	<div class="navbar-wrapper">
		<div class="container">
			<div class="navbar navbar-inverse navbar-fixed-top" role="navigation"
				id="top-nav">
				<div class="container">
					<div class="navbar-header">
						<!-- Logo Starts -->
						<!-- #Logo Ends -->
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<!-- Nav Starts -->
					<div class="navbar-collapse  collapse">
						<ul class="nav navbar-nav navbar-right scroll">
							<li class="active"><a href="#home">Home</a></li>
							<li><a href="#foods">OurSite</a></li>
							<li><a href="#partners">OurTeam</a></li>
							<li><a href="#map">Contact</a></li>
						</ul>
					</div>
					<!-- #Nav Ends -->
				</div>
			</div>

		</div>
	</div>
	<!-- #Header Starts -->
	<div id="home">
		<!-- Slider Starts -->
		<div class="banner">
			<img src="user/images/indexback.png" alt="banner" class="img-responsive"
				style="width: 100%">
			<div class="caption">
				<div class="caption-wrapper">
					<div class="caption-info">
						<!-- <i class="fa fa-coffee fa-5x animated bounceInDown"></i> -->
						<img src="user/images/house.png">
						<h1 class="animated bounceInUp">My House Design</h1>
						<p class="animated bounceInLeft">Upgrade your house's level ,
							with Us!!</p>
						<br>
						<p>
							<input id="pop01" type="button" class="btn" value="get Start">
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- #Slider Ends -->
	</div>
	<!-- works -->
	<div id="foods" class=" clearfix grid">
		<div class="row" style="width: 100%;">
			<figure class="effect-oscar  wowload fadeInUp" style="width: 50%;">
				<img src="user/images/bedroom.jpg" alt="img01" />
				<figcaption>
					<h2 id="pop02">SNS</h2>
					<p>
						SHOW YOUR HOUSE TO YOUR FRIENDS<br> <a
							href="user/images/bedroom.jpg" title="1" data-gallery>View
							more</a>
					</p>
				</figcaption>
			</figure>
			<figure class="effect-oscar  wowload fadeInUp" style="width: 50%;">
				<img src="user/images/dining.jpg" alt="img01" />
				<figcaption>
					<h2>Tip</h2>
					<p>
						SHARE YOUR INTERIOR TIPS<br> <a
							href="user/images/dining.jpg" title="1" data-gallery>View
							more</a>
					</p>
				</figcaption>
			</figure>
		</div>
		<div class="row" style="width: 100%;">
			<figure class="effect-oscar  wowload fadeInUp" style="width: 50%;">
				<img src="user/images/homeoffice.jpg" alt="img01" />
				<figcaption>
					<h2>Course</h2>
					<p>
						JOIN A COURSE FOR LEARNING<br> <a
							href="user/images/homeoffice.jpg" title="1" data-gallery>View
							more</a>
					</p>
				</figcaption>
			</figure>
			<figure class="effect-oscar  wowload fadeInUp" style="width: 50%;">
				<img src="user/images/livingroom.jpg" alt="img01" />
				<figcaption>
					<h2>RoomStar</h2>
					<p>
						GET LIKE BY YOUR FRIENDS<br> <a
							href="user/images/livingroom.jpg" title="1" data-gallery>View
							more</a>
					</p>
				</figcaption>
			</figure>
		</div>
	</div>
	
	<!-- works -->
	<div id="partners" class="container spacer ">
		<br><br><br><br><br><br>
		<div class="clearfix">
			<div class="col-sm-6 col-sm-offset-3">
				<div id="carousel-testimonials"
					class="carousel slide testimonails  wowload fadeInRight"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="item active animated bounceInRight row">
							<div class="animated slideInLeft col-xs-2">
								<img alt="portfolio" src="user/images/p3.png" width="100"
									class="img-circle img-responsive">
							</div>
							<div class="col-xs-10">
								<p>‘디자이너 책상이기 때문에 달라야 한다.’
									디자인 작업할 때 최대한 많은 요소들을 참고해서
									 작업하기 때문에 책상의 크기는 최대한 넓게 하고
									 원목 상판의 내구성도 좋아야 한다.
									방향은 출입구가 보이면서
									 사무실에 전반적인 배경이 시야에 들어와야 하고
									 클라이언트가 찾아와서 보았을 때 고풍스러우면서도
									 무게감과 세련됨이 있어야 한다.</p>
							</div>
						</div>
						<div class="item  animated bounceInRight row">
							<div class="animated slideInLeft col-xs-2">
								<img alt="portfolio" src="user/images/p1.jpg" width="100"
									class="img-circle img-responsive">
							</div>
							<div class="col-xs-10">
								<p>나의 작업실 그리고 그 안에 존재하는 것들은 나 그리고 Lab404와 시작을 함께 하였다. 지금까지 혼자 일해 온 나에 게 작업실에 존재하는 것들은 사물 이상의 의미로 다가온다. 
								가끔은 혼자 남은 식물에게 물을 주면서 그것이 가지고 있는 외로움을 나의 외로움과 동일시하기도 하고 친구를 맺어준 싸이클롭스를 보면서 내 주변의 사람들을 연상시키기도 한다. 
								내가 머무르는 공간에 존재하는 것들은 그렇게 나와 관계 를 맺고 각각의 대상들은 다른 모든 대상들의 거울로 존재한다.</p>
							</div>
						</div>
						<div class="item  animated bounceInRight row">
							<div class="animated slideInLeft  col-xs-2">
								<img alt="portfolio" src="user/images/p2.png" width="100"
									class="img-circle img-responsive">
							</div>
							<div class="col-xs-10">
								<p>나의 책상은 깔끔하게 정돈된 적이 거의 없다. 깔끔하게 정리 하지 못하는 성격 탓도 있겠지만 다양한 아이디어를 내려는 욕심 때문에도 그러한 것 같다. 그러나 정돈되지 않은 곳에 서도 나만의 규칙이 존재한다. 그 규칙들은 공간을 디자인 할 때의 생각을 정리하는 방법과 비슷한 점이 많다. 하나의 공간 을 디자인할 때 수없이 많은 것을 생각하고 지우고, 
								다시 소 통하고 생각하고 지우고 하는 성격이다. 이렇게 생각들을 끄 집어 내 완성할 때쯤 책상을 둘러보면 어느 순간 나의 책상은 복잡한 모습을 하고 있다. 그 모습이 나의 모습과 참 닮았다.</p>
							</div>
						</div>
					</div>
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-testimonials" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-testimonials" data-slide-to="1"></li>
						<li data-target="#carousel-testimonials" data-slide-to="2"></li>
					</ol>
					<!-- Indicators -->
				</div>
			</div>
		</div>
		<!-- team -->
		<!-- <h3 class="text-center  wowload fadeInUp">Our Chefs</h3>
		<p class="text-center  wowload fadeInLeft">Our chefs that is
			making everything possible</p>
		<div class="row grid team  wowload fadeInUpBig">
			<div class=" col-sm-3 col-xs-6" id="pop02">
				<figure class="effect-chico">
					<img src="images/team/4.png" alt="img01" class="img-responsive" />
					<figcaption>
						<p>Social Section</p>
					</figcaption>
				</figure>
			</div>
			<div class=" col-sm-3 col-xs-6" id="pop03">
				<figure class="effect-chico">
					<img src="images/team/1.png" alt="img01" />
					<figcaption>
						<p>Room Selection</p>
					</figcaption>
				</figure>
			</div>
			<div class=" col-sm-3 col-xs-6" id="pop04">
				<figure class="effect-chico">
					<img src="images/team/2.png" alt="img01" />
					<figcaption>
						<p>
							<b>Barbara Husto</b><br>Asst Chef
						</p>
					</figcaption>
				</figure>
			</div>
			<div class=" col-sm-3 col-xs-6">
				<figure class="effect-chico">
					<img src="images/team/3.png" alt="img01" />
					<figcaption>
						<p>
							<b>Barbara Husto</b><br>Asst Chef
						</p>
					</figcaption>
				</figure>
			</div>
		</div> -->
	</div>
	<!-- About Starts -->
	<div class="highlight-info">
		<div class="overlay spacer">
			<div class="container">
				<div class="row text-center  wowload fadeInDownBig">
					<div class="col-sm-3 col-xs-6">
						<i class="fa fa-smile-o  fa-5x"></i>
						<h4>${abc[0] } Members</h4>
					</div>
					<div class="col-sm-3 col-xs-6">
						<i class="fa fa-thumbs-up  fa-5x"></i>
						<h4>${abc[1] } Likes</h4>
					</div>
					<div class="col-sm-3 col-xs-6">
						<i class="fa fa-history  fa-5x"></i>
						<h4>2 month old</h4>
					</div>
					<div class="col-sm-3 col-xs-6">
						<i class="fa fa-map-marker fa-5x"></i>
						<h4>1 Locations</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- About Ends -->
	<div id="map"></div>
	<!--Contact Ends-->
	<!-- Footer Starts -->
	<div class="footer text-center spacer">
		<p class="wowload flipInX">
			<a href="https://www.facebook.com/">
				<i class="fa fa-facebook fa-2x"></i>
			</a> 
			<a href="https://www.instagram.com/">
				<i class="fa fa-instagram fa-2x"></i>
			</a> 
			<a href="https://twitter.com/">
				<i class="fa fa-twitter fa-2x"></i>
			</a> 
		</p>
		Copyright 2016 Sist-A-3team. All rights reserved.
	</div>
	<!-- # 
	Footer Ends -->
	<!-- pop up -->
	<div class="modal" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="false"
		style="margin-top: 20%">
		<jsp:include page="../member/login.jsp" />
	</div>

	<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
	<div id="blueimp-gallery"
		class="blueimp-gallery blueimp-gallery-controls">
		<!-- The container for the modal slides -->
		<div class="slides"></div>
		<!-- Controls for the borderless lightbox -->
		<a class="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
		<a class="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
		<a class="close"><span class="glyphicon glyphicon-remove"></span></a>
		<!-- The modal dialog, which will be used to wrap the lightbox content -->
	</div>
	
	<c:if test="${lcheck ==0}">
		<script>
			alert("로그인 실패");
		</script>
	<c:remove var="lcheck" scope="session" />
	</c:if>
	
	<!-- jquery -->
	<script src="user/assets/jquery.js"></script>
	<!-- wow script -->
	<script src="user/assets/wow/wow.min.js"></script>
	<!-- boostrap -->
	<script src="user/bootstrap/js/bootstrap.js" type="text/javascript"></script>
	<!-- jquery mobile -->
	<script src="user/assets/mobile/touchSwipe.min.js"></script>
	<script src="user/assets/respond/respond.js"></script>
	<!-- gallery -->
	<script src="user/assets/gallery/jquery.blueimp-gallery.min.js"></script>
	<script src='https://maps.googleapis.com/maps/api/js?key=&sensor=false&extension=.js'></script>
	<!-- custom script -->
	<script src="user/assets/script.js"></script>

	<script>
		$(document).ready(function() {
			$('body').scrollspy({
				target : ".navbar",
				offset : 50
			});
		});
	</script>
</body>
</html>