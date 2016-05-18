<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
<script type="text/javascript">
var httpRequest=null;
function createHttpRequest()
{
	if(window.ActiveXObject)
	{
		return new ActiveXObject("Msxml2.XMLHTTP");
	}
	else if(window.XMLHttpRequest)
	{
		return new XMLHttpRequest();
	}
}
function sendMessage(method,url,param,callback)
{
	httpRequest=createHttpRequest();
	var httpParam=param;
	var httpUrl=url;
	if(method=='GET'|| method==null)
	{
		httpUrl=httpUrl+"?"+httpParam;
	}
	
	httpRequest.open(method,httpUrl,true);
	httpRequest.onreadystatechange=callback;
	httpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	httpRequest.send(method==null||method=="GET"?null:param);
}

</script>
</head>
<body>
<br><br>
	<c:if test="${rlist.size() != 0 }">
		<c:forEach var="rl" items="${rlist }" begin="0" end="4">
			<ul class="img-comment-list">
				<li>
					<div class="comment-text">
						<strong><a href="">${rl.id }</a></strong>
						<p>${rl.text }
						<span class="date sub-text">${rl.date.toString() }</span>
						</p>
					</div>
				</li>
			</ul>
		</c:forEach>
	</c:if>
	
	<form action="courseReplyinsert.do" method="post">
		<input type="hidden" name="no" value="${no }" />
		<input type="hidden" name="searchText" value="${searchText }" />
		<div style="float:left; width:70%"><input type="text" id="inputbox" placeholder="leave reply" name="text"/></div>
		<div style="float:left; margin-left: 10px"><input type="submit" class="btn btn-primary btn-md" value="enter" /></div>
	</form>
</body>
</html>