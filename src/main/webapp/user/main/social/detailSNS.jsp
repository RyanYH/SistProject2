<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		// This code is not even almost production ready. It's 2am here, and it's a cheap proof-of-concept if anything.
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
	function Repop(){
		var res = ${res};
		
		if (res == 0){
			location.href="social.do";
		} else {
			location.href="stip.do?searchText=${searchText}";
		}
	}
</script>
</head>
</head>
<body>
	<div class="modal img-modal">
		<div class="modal-dialog modal-lg">
		<input type="hidden" name="res" value="${res }" />
		<input type="hidden" name="searchText" value="${param.searchText} " />
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-8 modal-image">
							<img class="img-responsive" src="${fimg }"> 
							<c:forEach var="img" items="${imgArr }">
								<img class="img-responsive hidden" src="${img }"> 
							</c:forEach>
							
							<a href="" class="img-modal-btn left"> 
								<i class="glyphicon glyphicon-chevron-left"></i>
							</a> 
							
							<a href="" class="img-modal-btn right"> 
								<i class="glyphicon glyphicon-chevron-right"></i>
							</a>
						</div>
						<div class="col-md-4 modal-meta" style="background-color: white;">
							<div class="modal-meta-top">
								<button type="button" class="close" data-dismiss="modal" onclick="javascript:Repop()">
									<span aria-hidden="true">X</span><span class="sr-only"></span>
								</button>
								
								<div class="img-poster clearfix">

									<img class="img-circle" src="${detailSNS.member.profile }" style="width: 70px;height:70px;"/>
									<strong>${detailSNS.member.id }</strong>

									<c:if test="${flist.size() == 0 }" >
										<c:if test="${detailSNS.member.id ==  sessionScope.vo.id}">
											<a href="deleteSNS.do?no=${detailSNS.no }&res=${res}""><button type="button" class="btn btn-primary btn-xs">Delete</button></a>
										</c:if>
										
										<c:if test="${detailSNS.member.id !=  sessionScope.vo.id}">
											<a href="addfollow.do?id=${sessionScope.vo.id }&followid=${detailSNS.member.id }&no=${no}&res=${res}"><input type="submit" class="btn btn-primary btn-xs" value="follow"></a>
										</c:if>
									</c:if>
									
									<c:set var="isDoing" value="true"/> 
									<c:if test="${flist.size() != 0 }" >
										<c:if test="${detailSNS.member.id !=  sessionScope.vo.id}">
											<c:forEach var="flist" items="${flist }">
												<c:if test="${isDoing}"> 
													<c:if test="${flist.follow_id ==  detailSNS.member.id}">
														<button type="button" class="btn btn-primary btn-xs">followed</button>
 														<c:set var="isDoing" value="false"/>
													</c:if>
												</c:if>
											</c:forEach>
											<c:forEach var="flist" items="${flist }">
												<c:if test="${isDoing }">
													<c:if test="${flist.follow_id !=  detailSNS.member.id}">
													<a href="addfollow.do?id=${sessionScope.vo.id }&followid=${detailSNS.member.id }&no=${no}&res=0"><input type="submit" class="btn btn-primary btn-xs" value="follow"></a>
														<c:set var="isDoing" value="false"/>
													</c:if>
													
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${detailSNS.member.id ==  sessionScope.vo.id}">
											<a href="deleteSNS.do?no=${detailSNS.no }"><button type="button" class="btn btn-primary btn-xs">Delete</button></a>
										</c:if>

										</c:if>
										
									<%-- </c:if> --%>									
									<br><br><br>
									${detailSNS.text.text }
									<br><br><br> 
									<input type="text"
										class="form-control"
										placeholder="#Hash TAG"
										readonly="readonly" 
										value="${detailSNS.tag.tag }"/><br>
								</div>
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
								
								<form method="post" action="snsReplyinsert.do">
								<input type="hidden" value=${no } name="no" />
								<input type="hidden" value=${sessionScope.vo.id } name="id" />
								<input type="hidden" value=${res } name="res" />
								<input type="hidden" value=${searchText } name="searchText" />
								<br> 
								<div style="float:left; width:70%"><input type="text" id="inputbox" placeholder="leave reply" name="text"/></div>
								<div style="float:left; margin-left: 10px"><input type="submit" class="btn btn-primary btn-md" value="enter"/></div>
								</form>
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