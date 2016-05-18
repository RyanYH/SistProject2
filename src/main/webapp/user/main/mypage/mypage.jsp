<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function fdel(id, fid){
		location.href = "deletefollow.do";
		//location.href = "deletefollow.do?id="+id+"&followid="+fid;
	}
</script>

<script type="text/javascript">
	function openOutlook(){
		window.location.href = "mailto:yulim12@naver.com?subject=send to my house's level manager from user";
	}
	
	function deleteMember(){
		window.location.href="delete.do?id=${sessionScope.vo.id}";
	}	
	function myCourse(){
		window.location.href = "myCourse.do?id=${sessionScope.vo.id}";
	}
</script>
<script type="text/javascript">
function is_touch_device() {
	  return !!('ontouchstart' in window) 
	      || !!('onmsgesturechange' in window); 
	};

	$(document).ready(function() {
	  if (is_touch_device()) {
	    $('span').unbind('mousenter mouseleave touchend touchstart');
	    $('span').bind('touchstart', function() {
	      $('span').removeClass('hover');
	      $(this).addClass('hover');
	    });
	  }
	});
</script>
<style type="text/css">
img:hover {
	opacity: 0.4;
	background-color: rgba(0, 0, 0, 0.8);
	transition: all 0.5s ease-in-out;
}

#wrapper p {
	position: relative;
	display: none;
}
</style>
</head>
<body>
	<div class="container" style="margin-top: 1%;">
		<div class="row">
			<div class="col-md-6">
				<div class="well well-sm">
					<form name="pForm" method="post" action="updateprofile.do" enctype="multipart/form-data">
						<div class="form-group" id="wrapper" align="center">	
							<img class="img-circle" style="width: 200px; height: 200px; " alt="PROFILE" src="${sessionScope.vo.profile}"><br>
        					<input type="file" class="text-center center-block well well-sm" name="profile" >
							<input type="hidden" value="${sessionScope.vo.profile }" name="bpro">
						</div>
						<div class="form-group">
							<label for="name"> ID</label> <input type="text"
								class="form-control" name="name" placeholder="your name"
								required="required" value="${sessionScope.vo.id}" readonly />
						</div>
						<div class="form-group">
							<label for="email"> Email Address</label>
							<div class="input-group">
								<span class="input-group-addon"> <span
									class="glyphicon glyphicon-envelope"></span>
								</span> <input type="text" class="form-control" name="email"
									placeholder="your email" required="required"
									value="${sessionScope.vo.email}" />
							</div>
						</div>
						<div class="form-group">
							<label for="name"> Password</label> <input type="password"
								class="form-control" id="pwd" name="pwd"
								placeholder="enter password" required="required"
								value="${sessionScope.vo.pwd}" />
						</div>
						<div class="form-group">
							<label for="name"> Password</label> <input type="password"
								class="form-control" id="pwd1" name="pwd1"
								placeholder="enter password again" required="required"
								value="${sessionScope.vo.pwd}" />
								
								<button type="submit" class="btn btn-primary pull-right"
								id="btnContactUs" style="margin-top: 20px">수정하기</button>
						</div>
						<br><br>
						<!-- <div class="form-group">
							<button type="submit" class="btn btn-primary pull-right"
								id="btnContactUs" style="margin-top: 20px">수정하기</button>
						</div> -->
					</form>
				</div>
			</div>

			<div class="col-md-6">
				<div class="col-md-12">
					<div class="panel panel-default">

						<div class="panel-heading c-list">
							<span class="title">팔로우 리스트</span>
						</div>

						<div class="row" style="display: none;">
							<div class="col-xs-12">
								<div class="input-group c-search">
									<input type="text" class="form-control"
										id="contact-list-search"> <span
										class="input-group-btn">
										<button class="btn btn-default" type="button">
											<span class="glyphicon glyphicon-search text-muted"></span>
										</button>
									</span>
								</div>
							</div>
						</div>

						<ul class="list-group" id="contact-list">


							<c:forEach var="vo" items="${sessionScope.flist}">
								<li class="list-group-item">
									<div class="col-xs-4 col-sm-3">
										<img src=${vo.profile } class="img-responsive img-circle" style="height:80px; width:80px;" />
									</div>

									<form method="post" action="deletefollow.do" name=delform>
										<div class="col-xs-4 col-sm-6" style="padding: 2%;">
											<span class="name"> <input type="hidden" name="id"
												value="${sessionScope.vo.id }" /> <input type="text"
												name="followid" value="${vo.id}" readonly />
											</span>
										</div>

										<div class="col-xs-4 col-sm-3" style="padding: 2%;">
											<button
												onclick="javascript:fdel(${sessionScope.vo.id },${vo.id} )"
												style="background-color: white; border: 0px">
												<img src="user/images/unfollow.png" alt="FOLLOW"
													class="img-responsive" />
											</button>
										</div>
									</form>
									<div class="clearfix"></div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>