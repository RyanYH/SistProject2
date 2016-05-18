<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/index.js"></script>
<head>
<meta name="robots" content="noindex">
<title>Social-network style lightbox - Bootsnipp.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
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
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	window.alert = function() {
	};
	var defaultCSS = document.getElementById('bootstrap-css');
	function changeCSS(css) {
		if (css)
			$('head > link')
					.filter(':first')
					.replaceWith(
							'<link rel="stylesheet" href="'+ css +'" type="text/css" />');
		else
			$('head > link').filter(':first').replaceWith(defaultCSS);
	}
	$(document).ready(function() {
		var iframe_height = parseInt($('html').height());
		window.parent.postMessage(iframe_height, 'http://bootsnipp.com');
	});
	$('.fab').hover(function() {
		$(this).toggleClass('active');
	});
	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})
	$(function() {
		$(".img-modal-btn.right").on('click', function(e) {
			e.preventDefault();
			cur = $(this).parent().find('img:visible()');
			next = cur.next('img');
			par = cur.parent();
			if (!next.length) {
				next = $(cur.parent().find("img").get(0))
			}
			cur.addClass('hidden');
			next.removeClass('hidden');

			return false;
		})
		$(".img-modal-btn.left").on('click', function(e) {
			e.preventDefault();
			cur = $(this).parent().find('img:visible()');
			next = cur.prev('img');
			par = cur.parent();
			children = cur.parent().find("img");
			if (!next.length) {
				next = $(children.get(children.length - 1))
			}
			cur.addClass('hidden');
			next.removeClass('hidden');
			return false;
		})
	});
	function Repop(res){
		location.href = "stip.do?searchText=${cvo.theme}";
	}
	
	function detailReply() {
		var param="no="+${cvo.no};
		sendMessage("POST", "courseReply.do", param, courseReply)
	}

	function courseReply() {
		if(httpRequest.readyState==4) {
			$('#replySet').html(httpRequest.responseText);
		}
	}
</script>
</head>
</head>
<body>
	<div class="modal img-modal">
		<div class="modal-dialog modal-lg">
		<input type="hidden" name="res" value="${res }" />
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-8 modal-image col-xs-12 col-ms-12">
							<img class="img-responsive" src="${fimg }" style="width:100%"> 
							<c:forEach var="img" items="${path }">
								<img class="img-responsive hidden" src="${img }" style="width:100%"> 
							</c:forEach>
							
							<a href="" class="img-modal-btn left"> 
								<i class="glyphicon glyphicon-chevron-left"></i>
							</a> 
							
							<a href="" class="img-modal-btn right"> 
								<i class="glyphicon glyphicon-chevron-right"></i>
							</a>
						</div>
						<div class="col-md-4 modal-meta col-xs-12 col-ms-12">
							<div class="modal-meta-top">
								<button type="button" class="close" data-dismiss="modal" onclick="javascript:Repop(${res})">
									<span aria-hidden="true">X</span><span class="sr-only"></span>
								</button>								
								<div class="img-poster clearfix">
									<img class="img-circle" src="${cvo.member.profile }" style="width: 70px; height:70px;"/>
									<strong>${cvo.member.id }</strong> 
									
									<c:if test="${flist.size() == 0 }" >
										<c:if test="${cvo.member.id ==  sessionScope.vo.id}">
											<button type="button" class="btn btn-primary btn-xs">ME :)</button>
										</c:if>
										
										<c:if test="${cvo.member.id !=  sessionScope.vo.id}">
											<a href="addcourse.do?id=${sessionScope.vo.id }&followid=${cvo.member.id }&no=${cvo.no}&searchText=${cvo.theme}"><input type="button" class="btn btn-primary btn-xs" value="follow"></a>
										</c:if>
									</c:if>
									
									<c:set var="isDoing" value="true"/> 
									<c:if test="${flist.size() != 0 }" >
										<c:if test="${cvo.member.id !=  sessionScope.vo.id}">
											<c:forEach var="flist" items="${flist }">
												<c:if test="${isDoing}"> 
													<c:if test="${flist.follow_id ==  cvo.member.id}">
														<button type="button" class="btn btn-primary btn-xs">followed</button>
 														<c:set var="isDoing" value="false"/>
													</c:if>
												</c:if>
											</c:forEach>
											<c:forEach var="flist" items="${flist }">
												<c:if test="${isDoing }">
													<c:if test="${flist.follow_id !=  cvo.member.id}">
													<a href="addcourse.do?id=${sessionScope.vo.id }&followid=${cvo.member.id }&no=${cvo.no}&searchText=${cvo.theme}"><input type="button" class="btn btn-primary btn-xs" value="follow"></a>
														<c:set var="isDoing" value="false"/>
													</c:if>
													
												</c:if>
												
											</c:forEach>
										</c:if>
										<c:if test="${cvo.member.id ==  sessionScope.vo.id}">
											<button type="button" class="btn btn-primary btn-xs">ME :)</button>
										</c:if>

										</c:if>

									
									<br><br><br>
									${cvo.text.text }
									<div id="replySet">
									<br><br> 
									<input type="text"
										class="form-control"
										placeholder="강좌 이름"
										readonly="readonly" 
										value="강좌이름: ${cvo.cname }"/><br>
									 <input type="text"
										class="form-control"
										placeholder="카테고리"
										readonly="readonly" 
										value="카테고리 : ${cvo.theme }"/><br> 
									<input type="text"
										class="form-control"
										placeholder="정원수"
										readonly="readonly" 
										value="정원수: ${cvo.quoat } / 신청 : ${cvo.fixquoat}"/><br>
									<input type="text" class="form-control" 
									    value='<fmt:formatDate value="${cvo.courseDate}" pattern="일시 : yyyy년 MM월 dd일 HH시 MM분"/>' 
									    readonly 
									    placeholder="시간"/><br>				
									<input type="text"
										class="form-control"
										placeholder="#태그"
										readonly="readonly" 
										value="${cvo.tag.tag }"/><br>
									<input type="text"
										class="form-control"
										placeholder="장소"
										readonly="readonly" 
										value="장소: ${cvo.addr }"/><br>
									
									<center>
										<c:if test="${sessionScope.vo.id != cvo.id }">
										<a href="courseReserve.do?no=${cvo.no }">
											<input type="button" class="btn btn-primary btn-ls" value="강좌 신청하기">
										</a>
										</c:if>
										
										<c:if test="${sessionScope.vo.id == cvo.id }">
										<a href="myCourse.do?id=${cvo.id }">
											<input type="button" class="btn btn-primary btn-ls" value="내 강좌 조회">
										</a>
										</c:if>
										
										<br><br>
										<a href="javascript:detailReply()">
											<button style="background-color: white; border: 0px;"><img src="user/images/signs.png" style="width: 50px; height: 50px;"></button>
										</a>
									</center>
													
									</div>
												
								<form method="post" action="snsReplyinsert.do">
								<input type="hidden" value=${no } name="no" />
								<input type="hidden" value=${sessionScope.vo.id } name="id" />
								<br> 
								</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:set var="jsp" value="../main/social/social.jsp"></c:set>
</body>
</html>