<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">

</script>
</head>
<body>
	<h1 align="center">ADMINISTRATOR'S PAGE</h1>
	<div class="container">
		<div class="row">
		
			<div class="col-md-12">
			
				<div class="panel panel-default">

					<div class="panel-heading c-list" align="center">
						<span class="title">회원 리스트</span>
					</div>

					<div class="panel-heading c-list">
						<!-- ***SEARCH BAR*** -->
						<div class="col-md-12 col-xs-12" style="margin: 1%;">
							<form action="adminfindmember.do" method="post">
							<div class="col-md-3 col-xs-3">
								<select name="fs" style="border: 1px solid gray; width: 100%;">
									<option value="id">ID</option>
									<option value="email">EMAIL</option>
								</select>
							</div>
							<div class="col-md-6 col-xs-6">
								<input type="text" name="ss" style="border: 1px solid gray; width: 100%;">
							</div>
							<div class="col-md-3 col-xs-3">
								<input type="submit" value="SEARCH" style="width: 100%;">
							</div>
							</form>
						</div>
						<!-- ***SEARCH BAR*** -->
					</div>

					<ul class="list-group" id="contact-list">
						<c:forEach var="mlist" items="${mlist }">
							<li class="list-group-item">
								<div class="col-xs-12 col-sm-3">
									<img src=${mlist.profile } class="img-responsive img-circle" width="40%"/>
								</div>

									<div class="col-xs-12 col-sm-7" style="padding: 2%; float: left">
										<span class="name"> 
											<input type="text" name="id" value="${mlist.id }" /> 
											<input type="text" name="email" value="${mlist.email}" readonly />
										</span>
									</div>
					
									<div class="col-xs-12 col-sm-2" style="padding: 2%; float: left">
										<a href="deleteByAdmin.do?id=${mlist.id}">
											<input type="button" value="delete" class="btn btn-primary btn-lg" />
										</a>
									</div>
								<div class="clearfix"></div>
							</li>
						</c:forEach>
					</ul>

				</div>
			
			</div>
				
				<div class="col-md-12 col-xs-12" style="margin: 3%;">
					<div class="col-md-12"></div>
				</div>
			<div class="col-md-12 col-xs-12" style="margin: 3%;">
				<div class="col-md-12"></div>
			</div>
				
				<div class="col-md-12 col-xs-12" style="margin: 3%;">
					<div class="col-md-12"></div>
				</div>
				
		</div>
	</div>
</body>
</html>