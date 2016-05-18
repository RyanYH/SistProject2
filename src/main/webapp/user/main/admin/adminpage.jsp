<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/bootswatch/3.1.1-1/css/custom/bootstrap.min.css">
<script type="text/javascript">
	function adminMember () {
		window.location.href = "adminmember.do";
	}
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	// Load Charts and the corechart and barchart packages.
	google.charts.load('current', {'packages':['corechart']});
	
	// Draw the pie chart and bar chart when Charts is loaded.
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var data = new google.visualization.arrayToDataTable([
			['themeName', 'themeCount'],
			<c:forEach var="list" items="${tlist}">
			['<c:out value="${list.theme}"/>', <c:out value="${list.count}"/>],
			</c:forEach>
		]);
		var datas = new google.visualization.arrayToDataTable([
			['snsNo', 'snsLikeCount'],
			<c:forEach var="list" items="${slist}">
			['<c:out value="${list.no}"/>', <c:out value="${list.sns_like}"/>],
			</c:forEach>
		]);
		
		var piechart_options = {title:'테마별 게시글수', width:500, height:375};
		var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
		piechart.draw(data, piechart_options);
		var barchart_options = {title:'인기 게시글(좋아요 순)', width:500, height:375, legend: 'none'};
		var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
		barchart.draw(datas, barchart_options);
	}
</script>
</head>
<body>
	<h1 align="center">관리자의 품격</h1>
	<div class="container">
		<div class="row">
			
			<!-- ***ADMIN PAGE GRAPH*** -->
			<div class="col-md-12 col-xs-12">
				<h3 align="center">그래프</h3>
				<div class="col-md-12 col-xs-12">
					<div id="piechart_div" class="col-md-6" style="border: 1px solid #ccc"></div>
					<div id="barchart_div" class="col-md-6" style="border: 1px solid #ccc"></div>
				</div>
			</div>
			<!-- ***ADMIN PAGE GRAPH*** -->
			
			<div class="col-md-12 col-xs-12" style="margin: 3%;">
				<div class="col-md-12" style="border: 1px solid black;"></div>
			</div>
			
			<!-- ***ADMIN PAGE LIST*** -->
			<div class="col-md-12 col-xs-12">
			
				<!-- ***SEARCH BAR*** -->

					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="row">
							<div class="panel-heading c-list" style="align: center">
								<div class="col-xs-6 col-sm-2"><span class="title">신청자</span></div>
								<div class="col-xs-6 col-sm-6" style="left:20px;"><span class="title">강좌 이름</span></div>
								<div class="col-xs-6 col-sm-2"><span class="title">개설자</span></div>
								<div class="col-xs-6 col-sm-2" style="left:20px;"><span class="title">입금 현황</span></div>
							</div>
							</div>
							<form method="post" action="checkDeposit.do">
								<ul class="list-group" id="contact-list">
									<c:forEach var="clist" items="${clist }">
										<li class="list-group-item" style="font-size: 18px ">
											<div class="col-xs-6 col-sm-2" style="padding: 2%; left:20px;">
													${clist.member_id }
												</div>
		
												<div class="col-xs-6 col-sm-6" style="padding: 2%; left:50px;">
													${clist.course.cname }
												</div>
								
												<div class="col-xs-6 col-sm-2" style="padding: 2%;left:20px; ">
													${clist.course.id }
												</div>
												<input type="hidden" value="${clist.course_no }" name="no">
												<input type="hidden" value="${clist.member_id }" name="id">
												<div class="col-xs-6 col-sm-2" style="padding: 2%; left:50px;">
													<a href="checkDeposit.do?id=${clist.member_id}&no=${clist.course_no}"><input type="button"><img src="user/images/check.png" style="width:30px"></a>
												</div>
											<div class="clearfix"></div>
										</li>
									</c:forEach>
								</ul>
							</form>
						</div>
					</div>
					
				</div>
				<!-- ***PAYMENT CONFIRMATION LIST*** -->
				
			</div>
			<!-- ***ADMIN PAGE LIST*** -->
			
			<div class="col-md-12 col-xs-12" style="margin: 3%;">
				<div class="col-md-12"></div>
			</div>
			
		</div>
	</div>
</body>
</html>