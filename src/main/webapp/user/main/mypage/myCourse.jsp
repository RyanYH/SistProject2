<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY COURSE</title>
<style type="text/css">
.lineline {
	text-align: center;
}
.lineline:HOVER {
	background-color: skyblue;
}
</style>
</head>
<body>
	<h2 align="center">MY COURSE</h2>
	<div class="container">
		<div class="row" style="margin: 1%;">
		<div class="col-md-6">
				<div class="col-md-12">
					<div class="panel panel-default">

						<div class="panel-heading c-list">
							<span class="title">내가 연 강좌</span>
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
							<c:forEach var="clist" items="${clist }">
								<li class="list-group-item">
									<div class="col-xs-12 col-sm-3">
										<img src="${clist.member.profile }" class="img-responsive img-circle" />
									</div>

										<div class="col-xs-12 col-sm-9" style="padding: 2%;">
											<span class="name"> 
											<input type="text" name="courseName" value="${clist.cname }" readonly /><br>
											<input type="text" name="courseDate" value="<fmt:formatDate value="${clist.courseDate}" pattern="yyyy-MM-dd"/>" readonly /><br>
											<font color="blue">인원 : ${clist.fixquoat} / ${clist.quoat }</font>
											</span>
										</div>
									<div class="clearfix"></div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
		</div>
		
			<div class="col-md-6">
				<div class="col-md-12">
					<div class="panel panel-default">

						<div class="panel-heading c-list">
							<span class="title">내가 신청한 강좌</span>
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
							<c:forEach var="rlist" items="${rlist }">
								<li class="list-group-item">
									<div class="col-xs-12 col-sm-3">
										<img src="${sessionScope.vo.profile }" class="img-responsive img-circle" />
									</div>

										<div class="col-xs-12 col-sm-9" style="padding: 2%;">
											<span class="name"> 
											<input type="text" name="courseName" value="${rlist.cname }" readonly /><br>
											<input type="text" name="courseDate" value="<fmt:formatDate value="${rlist.courseDate}" pattern="yyyy-MM-dd"/>" readonly /><br>
											<font color="red">인원 : ${rlist.fixquoat} / ${rlist.quoat }</font>
											</span>
										</div>
									<div class="clearfix"></div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
		</div>
	</div>
</body>
</html>