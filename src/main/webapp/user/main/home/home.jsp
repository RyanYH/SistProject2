<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex">
<title></title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.8.3.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/bootswatch/3.1.1-1/css/custom/bootstrap.min.css">
</head>
<body>
	<div class=container id="past" style="border: 1px solid grey;">
		<div class=row>
			<div class=col-md-6 style="height: 300px; border: 1px solid grey;">
				전주 방스타</div>
			<div class=col-md-6 style="height: 300px; border: 1px solid grey;">
				금주 방스타</div>
		</div>
	</div>
	<div class=container id="this" style="border: 1px solid grey;">
			<div class="col-md-12" style="height: 450px;" id="wrappers">
			
			</div>
	</div>
	<div class=container id="this" style="height: 300px;">
		<div  class="col-md-12">
			<div class="col-md-6" id="wrapper">
				<div id="myCarousel1" class="carousel slide" data-ride="carousel"
					style="height: 300px;">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox" >
						<div class="item active">
							<img src="user/images/bg.jpg" alt="Image" style="height: 300px;">
							<div class="carousel-caption">
								<h3>Sell $</h3>
							</div>
						</div>
						<div class="item">
							<img src="user/images/back.jpg" alt="Image" style="height: 300px;">
							<div class="carousel-caption">
								<h3>More Sell $</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6" id="wrapper">
				<div id="myCarousel1" class="carousel slide" data-ride="carousel"
					style="height: 300px;">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox" style="height: 300px;">
						<div class="item active">
							<img src="user/images/bg.jpg" alt="Image" style="height: 300px;">
							<div class="carousel-caption">
								<h3>Sell $</h3>
							</div>
						</div>
						<div class="item" >
							<img src="user/images/back.jpg" alt="Image" style="height: 300px;">
							<div class="carousel-caption">
								<h3>More Sell $</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- <a class="left carousel-control" href="#myCarousel1" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel1" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a> -->
		</div>

	</div>

	<!-- Left and right controls -->

	<!-- js -->
	<script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>
