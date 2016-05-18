<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>LOGIN&SIGNUP</title>

<link rel="stylesheet" href="user/member/css/reset.css">
<link rel="stylesheet" href="user/member/css/style.css">
<link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
	
<script src="user/member/js/facebook.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

</head>
<body>

<c:if test="${lcheck == 1 }">
	<c:set value="${name }" var="id" scope="session"/>
	<c:set value="${pwd }" var="pwd" scope="session"/>
	<c:set value="${email }" var="email" scope="session"/>
	<c:set value="${profile }" var="profile" scope="session"/>
	<c:redirect url="main.do"/>
</c:if>

<c:if test="${lcheck == 0 }">
	<c:set value="${lcheck }" var="lcheck" scope="session"/>
	<c:redirect url="index.do"/>
</c:if>
</body>
</html>