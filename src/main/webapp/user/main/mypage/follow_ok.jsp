<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${a == 0}">
	<c:redirect url="detailSNS.do?no=${no }&res=${res }"></c:redirect>
</c:if>

<c:if test="${a == 1}">
	<c:redirect url="detailCourse.do?no=${no }&searchText=${searchText }"></c:redirect>
</c:if>

</body>
</html>