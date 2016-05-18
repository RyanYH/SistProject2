<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrapper {
	display : table;
	border: 2px solid whitesmoke;
	margin-top: 5px;
}
.inner {
	float: left;
	padding: 10px;
}
.inner h1 {
	text-decoration: none ;
}
</style>
</head>
<body>
<form action="searchitem.do" method="get">
<div class="container" style="padding: 10px;">
	<div class="row">
		<h2>BEST ITEMS</h2>
		<div id="custom-search-input">
			<div class="input-group col-md-12">
				<input type="text" class="  search-query form-control" name="searchText" placeholder="Search" value="${searchText }"/>
				<span class="input-group-btn">
					<button class="btn btn-danger" type="submit">
						<span class=" glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>
	</div>
</form>

<c:forEach items="${itemlist }" var="li" begin="1" end="20">
<div id="wrapper" class="col-md-12">
	<div class="inner">
		<img src="${li.getPath() }" />
	</div>
	<div class="inner">
		<h3>${li.getName() }</h3>
		<p>${li.getPrice() } </p>
		<a href="${li.getLink() }">GET DETAILS</a>
	</div>
</div>
</c:forEach>
</div>
</body>
</html>