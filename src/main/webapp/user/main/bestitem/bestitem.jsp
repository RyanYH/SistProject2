<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.medias {
	display: inline-block;
	position: relative;
	float: left;
	margin-top:5%;
}

.medias__image {
	display: block;
	width: 100%;
}

.medias__body {
	width: 100%; background : rgba( 41, 128, 185, 0.7);
	bottom: 0;
	color: white;
	font-size: 1em;
	left: 0;
	opacity: 0;
	overflow: hidden;
	padding: 3.75em 3em;
	position: absolute;
	text-align: center;
	top: 0;
	right: 0;
	-webkit-transition: 0.6s;
	transition: 0.6s;
	background: rgba(41, 128, 185, 0.7);
}

.medias__body:hover {
	opacity: 1;
}

.medias__body:after, .medias__body:before {
	border: 1px solid rgba(255, 255, 255, 0.7);
	bottom: 1em;
	content: '';
	left: 1em;
	opacity: 0;
	position: absolute;
	right: 1em;
	top: 1em;
	-webkit-transform: scale(1.5);
	-ms-transform: scale(1.5);
	transform: scale(1.5);
	-webkit-transition: 0.6s 0.2s;
	transition: 0.6s 0.2s;
}

.medias__body:before {
	border-bottom: none;
	border-top: none;
	left: 2em;
	right: 2em;
}

.medias__body:after {
	border-left: none;
	border-right: none;
	bottom: 2em;
	top: 2em;
}

.medias__body:hover:after, .medias__body:hover:before {
	-webkit-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);
	opacity: 1;
}

.medias__body h2 {
	margin-top: 0;
}

.medias__body p {
	margin-bottom: 1.5em;
}
</style>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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
</script>
</head>
<body>
	<form action="searchitem.do" method="get">
		<div class="container" style="padding: 3%;">
			<div class="row">
				<h2>BEST ITEMS</h2>
				<div id="custom-search-input">
					<div class="input-group col-md-12">
						<input type="text" class="search-query form-control" name="searchText" placeholder="Search"/>
						<span class="input-group-btn">
							<button class="btn btn-danger" type="submit">
								<span class=" glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>
			</div>

		<a href="searchitem.do?searchText=침대"><div class="medias col-md-3">
			<img class="medias__image" alt="BED" src="user/images/bedroom.jpg">
			<div class="medias__body">
				<h2>BED</h2>
				<p>SEARCH "BED"</p>
			</div>
		</div></a>
		<a href="searchitem.do?searchText=주방"><div class="medias col-md-3">
			<img class="medias__image" alt="KITCHEN" src="user/images/kitchen.jpg">
			<div class="medias__body">
				<h2>KITCHEN</h2>
				<p>SEARCH "KITCHEN"</p>
			</div>
		</div></a>
		<a href="searchitem.do?searchText=거실"><div class="medias col-md-3">
			<img class="medias__image" alt="LIVINGROOM" src="user/images/livingroom.jpg">
			<div class="medias__body">
				<h2>LIVINGROOM</h2>
				<p>SEARCH "LIVINGROOM"</p>
			</div>
		</div></a>
		<a href="searchitem.do?searchText=욕실"><div class="medias col-md-3">
			<img class="medias__image" alt="BATHROOM" src="user/images/bath.jpg">
			<div class="medias__body">
				<h2>BATHROOM</h2>
				<p>SEARCH "BATHROOM"</p>
			</div>
		</div></a>
		<a href="searchitem.do?searchText=홈오피스"><div class="medias col-md-3">
			<img class="medias__image" alt="HOMEOFFICE" src="user/images/homeoffice.jpg">
			<div class="medias__body">
				<h2>HOMEOFFICE</h2>
				<p>SEARCH "HOMEOFFICE"</p>
			</div>
		</div></a>
		<a href="searchitem.do?searchText=쿠션"><div class="medias col-md-3">
			<img class="medias__image" alt="CUSHION" src="user/images/cushion.jpg">
			<div class="medias__body">
				<h2>CUSHION</h2>
				<p>SEARCH "CUSHION"</p>
			</div>
		</div></a>
		<a href="searchitem.do?searchText=다이닝용품"><div class="medias col-md-3">
			<img class="medias__image" alt="DINING" src="user/images/dining.jpg">
			<div class="medias__body">
				<h2>DINING</h2>
				<p>SEARCH "DINING"</p>
			</div>
		</div></a>
		<a href="searchitem.do?searchText=어린이가구"><div class="medias col-md-3">
			<img class="medias__image" alt="FORCHILD" src="user/images/forchild.jpg">
			<div class="medias__body">
				<h2>CHILD</h2>
				<p>SEARCH "CHILD"</p>
			</div>
		</div></a>
		
		</div>
	</form>
</body>
</html>