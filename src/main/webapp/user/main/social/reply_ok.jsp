<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${res == 0 }">
	<c:redirect url="detailSNS.do?no=${no }&res=${res }"></c:redirect>
</c:if>

<c:if test="${res == 1 }">
	<c:redirect url="detailSNS.do?no=${no }&res=${res }&searchText=${searchText }"></c:redirect>
</c:if>