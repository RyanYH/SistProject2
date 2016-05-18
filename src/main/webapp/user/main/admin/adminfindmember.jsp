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
						<span class="title">검색한 회원 리스트</span>
					</div>

					<div class="panel-heading c-list">
						<!-- ***SEARCH BAR*** -->
						<div class="col-md-12 col-xs-12" style="margin: 1%;">
							<form action="adminmember.do" method="post">
							<div class="col-md-12 col-xs-12">
								<input type="submit" value="LIST" style="width: 100%;" class="btn btn-primary btn-lg">
							</div>
							</form>
						</div>
						<!-- ***SEARCH BAR*** -->
					</div>

					<ul class="list-group" id="contact-list">
						<c:forEach var="flist" items="${flist }">
							<li class="list-group-item">
								<div class="col-xs-12 col-sm-3">
									<img src=${flist.profile } class="img-responsive img-circle" width="40%"/>
								</div>

									<div class="col-xs-12 col-sm-7" style="padding: 2%; float: left">
										<span class="name"> 
											<input type="text" name="id" value="${flist.id }" /> 
											<input type="text" name="email" value="${flist.email}" readonly />
										</span>
									</div>
					
									<div class="col-xs-12 col-sm-2" style="padding: 2%; float: left">
										<a href="deleteByAdmin.do?id=${flist.id}">
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