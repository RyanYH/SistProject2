<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light",
		"Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
	font-size: 12px;
}

#dialog {
	width: 360px;
	height: 210px;
	background-color: rgba(0, 0, 0, 0.30);
	padding: 8px;
	margin-top: 140px;
	margin-left: auto;
	margin-right: auto;
	position: absolute;
	z-index: 1;
	left: 0;
	right: 0;
	-webkit-border-radius: 9px; /* Saf3-4, iOS 1-3.2, Android <1.6 */
	-moz-border-radius: 9px; /* FF1-3.6 */
	border-radius: 9px;
	/* Opera 10.5, IE9, Saf5, Chrome, FF4, iOS 4, Android 2.1+ */
}

#dialog-bg {
	background-color: #FBFBFB;
	width: 360px;
	height: 220px;
	margin-left: auto;
	margin-right: auto;
	-webkit-border-radius: 7px; /* Saf3-4, iOS 1-3.2, Android <1.6 */
	-moz-border-radius: 7px; /* FF1-3.6 */
	border-radius: 7px;
	/* Opera 10.5, IE9, Saf5, Chrome, FF4, iOS 4, Android 2.1+ */
}

#dialog-title {
	width: 360px;
	height: 30px;
	padding-top: 12px;
	background-color: #FFFFFF;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF),
		to(#E9E9E9)); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient(top, #FFFFFF, #E9E9E9);
	/* Chrome 10+, Saf5.1+, iOS 5+ */
	background-image: -moz-linear-gradient(top, #FFFFFF, #E9E9E9);
	/* FF3.6 */
	background-image: -ms-linear-gradient(top, #FFFFFF, #E9E9E9);
	/* IE10 */
	background-image: -o-linear-gradient(top, #FFFFFF, #E9E9E9);
	/* Opera 11.10+ */
	background-image: linear-gradient(top, #FFFFFF, #E9E9E9);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#FFFFFF',
		EndColorStr='#E9E9E9'); /* IE6-IE9 */
	border-top-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom: 1px solid #FFFFFF;
	color: #434343;
	text-shadow: 1px 1px 1px #ffffff;
	filter: dropshadow(color = #ffffff, offx = 1, offy = 1);
	text-align: center;
	font-weight: bold;
	font-size: 14px;
	cursor: default;
}

#dialog-description {
	width: 320px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 18px;
	font-color: red;
	font-size: 18px;
	text-align: center;
	line-height: 24px;
	border-top: 1px solid #B9B9B9;
	cursor: default;
}

#dialog-buttons {
	width: 350px;
	height: 280px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 20px;
	text-align: center;
}

.button, .button:visited {
	background-color: #222;
	/* margin-left: 2px; */
	display: inline-block;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
	border-bottom: 1px solid rgba(0, 0, 0, 0.25);
	position: relative;
	padding-top: 6px;
	padding-right: 10px;
	padding-bottom: 5px;
	padding-left: 10px;
	color: #fff;
	text-decoration: none;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.45);
	filter: dropshadow(color = rgba(0, 0, 0, 0.45), offx=1, offy=1);
	cursor: pointer;
}

.button:hover {
	backgroud-color: #111;
	color: #fff;
}

.button:active {
	top: 1px;
	color: #fff;
}

.button, .button:visited, .medium.button, .medium.button:visited {
	font-size: 11px;
	font-weight: bold;
	line-height: 1;
}

.large.button, .large.button:visited {
	width: 135px;
	font-size: 25px;
	padding: 8px 14px 9px;
	text-align: center;
	margin-left: 0px;
}

.green.button, .green.button:visited {
	background-color: #72B930;
	color: #fff;
	border: 1px solid #5D8C22;
	/*     padding-left: 35px; */
	background-image:
		url(http://css-creations.com/uploads/media/items/8/8y15B9d.png);
	background-repeat: repeat-x;
}

.green.button:hover {
	background-color: #7DCA34;
	color: #fff;
	border: 1px solid #5D8C22;
	/*     padding-left: 35px; */
}

.red.button, .red.button:visited {
	background-color: #E64444;
	color: #fff;
	border: 1px solid #B63440;
	/*     padding-left: 35px; */
	background-image:
		url(http://css-creations.com/uploads/media/items/7/7XUCqDE.png);
	background-repeat: repeat-x;
}

.red.button:hover {
	background-color: #FF4B5A;
	color: #fff;
	border: 1px solid #B63440;
	/*     padding-left: 35px; */
}
</style>
</head>
<body>
	<div id="dialog">
	<a href="tip.do" style="float:right;">back</a>
		<div id="dialog-bg">
			<div id="dialog-description">Share your ideas!</div>
			<!-- Buttons, both options close the window in this demo -->
			<div id="dialog-buttons">
				<div class="row">
				<a href="writeCourse.do?theme=욕실" class="large green button" id="pop07" data-dismiss="modal" aria-label="Close">BATH<br>ROOM</a>
				<a href="writeCourse.do?theme=거실" class="large red button" id="pop08" data-dismiss="modal" aria-label="Close">LIVING<br>ROOM</a>
				</div>
				<div class="row" style="margin-top:1%;">
				<a href="writeCourse.do?theme=침실" class="large red button" id="pop09" data-dismiss="modal" aria-label="Close">BED<br>ROOM</a> 
				<a href="writeCourse.do?theme=주방" class="large green button" id="pop10" data-dismiss="modal" aria-label="Close">KIT-<br>CHEN</a>
				</div>	
			</div>
			
		</div>
	</div>
</body>
</html>