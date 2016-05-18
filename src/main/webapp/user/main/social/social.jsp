<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex">
<title>SOCIAL HOUSE</title>
<meta name="viewport" content="`=device-width, initial-scale=1">
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
function setlike(no){
	location.href = "addSNSlike.do?no="+no;
}

function sortnew(){
	location.href="social.do";	
}

function sortlike(){
	location.href="sociallike.do";
}

function clickTheme(ss){
	location.href="snswirteform.do?theme="+ss;
	
	var myElement = document.querySelector("#myModal");
	myElement.style.display="none";
}
function btnOpen(){
	var myElement = document.querySelector("#myModal");
	myElement.style.display="block";
}
function resize(image) { 
    var x = 800, // max width
         y = 600, // max height
         imageWidth = image.width,
         imageHeight = image.height;
    if (imageWidth > x) {
      imageHeight = imageHeight * (x / imageWidth);
      imageWidth = x;
      if (imageHeight > y) {
        imageWidth = imageWidth * (y / imageHeight);
        imageHeight = y;
      }
    } else if (imageHeight > y) {
      imageWidth = imageWidth * (y / imageHeight);
      imageHeight = y;
      if (imageWidth > x) {
        imageHeight = imageHeight * (x / imageWidth);
        imageWidth = x;
      }
    }
    image.width = imageWidth;
    image.height = imageHeight;
  }
function close(){
	var myElement = document.querySelector("#myModal");
	myElement.style.display="none";
}

var i = 0;
function moreList(){
	if (i == 0){
	document.getElementById("snslist").innerHTML = 
		"<c:forEach var='vo' items='${snslist }' begin='12' end='23'>"
		+"<form method='post' action='detailSNS.do' name='listsns'>"
		+"<div class='col-md-4 thumbnail'>"
		+"<div>"
		+"<div>"
		+"<input type='hidden' name='no' value='${vo.no }'' />"
		+"<input type='hidden' name='memid' value='${sessionScope.vo.id}' />"
		+"<img alt='avatar' src='${vo.member.profile }' style='width: 35px; height: 35px;'>"
		+"${vo.id }"
		+"</div>"
		+"<div>"
		+"<input type='hidden' name='no' value='${vo.no }'/>"
		+"<a href='detailSNS.do?no=${vo.no }''>"
		+"<img src='${vo.photo.path }' style='width:380px; height:350px;'></a>"
		+"</div>"
		+"<div style='margin-top: 5px;'>	"
		+"<div style='float: left;'>"
		+"<c:if  test='${ klist.size() == 0}'>"
		+"<img src='user/images/night.png' style='margin-left: 5px; ' onclick='javascript:setlike(${vo.no })'>"
		+"</c:if>"								
		+"<c:if test='${ klist.size() != 0}'>"
		+"<c:set var='isDoing' value='true'/>" 
		+"<c:forEach var='star' items='${klist }'>"
		+"<c:if test='${isDoing}'>" 
		+"<c:if test='${star == vo.no}'>"
		+"<img src='user/images/shape.png' style='margin-left: 5px;'>"
		+"<c:set var='isDoing' value='false'/>" 
		+"</c:if>"
		+"</c:if>"
		+"</c:forEach>"
		+"<c:forEach var='star' items='${klist }'>"
		+"<c:if test='${isDoing}'> "
		+"<c:if test='${star != vo.no}'>"
		+"<img src='user/images/night.png' style='margin-left: 5px; ' onclick='javascript:setlike(${vo.no })'>"
		+"<c:set var='isDoing' value='false'/>" 
		+"</c:if>"
		+"</c:if>"
		+"</c:forEach>"
		+"</c:if>"
		+"</div>"
		+"<div style='float: left; margin-left: 5px;'>${vo.sns_like }</div>"
		+"</div>"
		+"</div>"
		+"</div>"
		+"</form>"
		+"</c:forEach>";
		i = 1;
	}
	
	if (i == 1){
		document.getElementById("snslist1").innerHTML = 
			"<c:forEach var='vo' items='${snslist }' begin='24' end='35'>"
			+"<form method='post' action='detailSNS.do' name='listsns'>"
			+"<div class='col-md-4 thumbnail'>"
			+"<div>"
			+"<div>"
			+"<input type='hidden' name='no' value='${vo.no }'' />"
			+"<input type='hidden' name='memid' value='${sessionScope.vo.id}' />"
			+"<img alt='avatar' src='${vo.member.profile }' style='width: 35px; height: 35px;'>"
			+"${vo.id }"
			+"</div>"
			+"<div>"
			+"<input type='hidden' name='no' value='${vo.no }'/>"
			+"<a href='detailSNS.do?no=${vo.no }''>"
			+"<img src='${vo.photo.path }' style='width:380px; height:350px;'></a>"
			+"</div>"
			+"<div style='margin-top: 5px;'>	"
			+"<div style='float: left;'>"
			+"<c:if  test='${ klist.size() == 0}'>"
			+"<img src='user/images/night.png' style='margin-left: 5px; ' onclick='javascript:setlike(${vo.no })'>"
			+"</c:if>"								
			+"<c:if test='${ klist.size() != 0}'>"
			+"<c:set var='isDoing' value='true'/>" 
			+"<c:forEach var='star' items='${klist }'>"
			+"<c:if test='${isDoing}'>" 
			+"<c:if test='${star == vo.no}'>"
			+"<img src='user/images/shape.png' style='margin-left: 5px;'>"
			+"<c:set var='isDoing' value='false'/>" 
			+"</c:if>"
			+"</c:if>"
			+"</c:forEach>"
			+"<c:forEach var='star' items='${klist }'>"
			+"<c:if test='${isDoing}'> "
			+"<c:if test='${star != vo.no}'>"
			+"<img src='user/images/night.png' style='margin-left: 5px; ' onclick='javascript:setlike(${vo.no })'>"
			+"<c:set var='isDoing' value='false'/>" 
			+"</c:if>"
			+"</c:if>"
			+"</c:forEach>"
			+"</c:if>"
			+"</div>"
			+"<div style='float: left; margin-left: 5px;'>${vo.sns_like }</div>"
			+"</div>"
			+"</div>"
			+"</div>"
			+"</form>"
			+"</c:forEach>";
	}
}
</script>
<style type="text/css">
.col-md-4{
	height:450px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row" >
			<div class='list-group gallery'>
				<c:forEach var="vo" items="${snslist }" begin="0" end="11">
					<form method="post" action="detailSNS.do" name="listsns">
						<div class="col-md-4 thumbnail">
							<div style="height:400px;">
								<div>
									<input type="hidden" name="no" value="${vo.no }" />
									<input type="hidden" name="memid" value='${sessionScope.vo.id}' />
									<img alt="avatar" src="${vo.member.profile }" style="width: 35px; height: 35px;">
									${vo.id }
								</div><br>
								<div>
									<input type='hidden' name="no" value="${vo.no }"/>
									<a href="detailSNS.do?no=${vo.no }&res=0">
									<img src="${vo.photo.path }" style="width:380px; height:350px;"></a>
								</div>
								<div style="margin-top: 5px;">	
										<div style="float: left;">
										<c:if  test="${ klist.size() == 0}">
												<img src="user/images/night.png"  style="margin-left: 5px;" onclick="javascript:setlike(${vo.no })">
										</c:if>	
										
										<c:if test="${ klist.size() != 0}">
											<c:set var="isDoing" value="true"/> 
											<c:forEach var="star" items="${klist }">
													<c:if test="${isDoing}"> 
														<c:if test="${star == vo.no}">
															<img src="user/images/shape.png" style="margin-left: 5px;">
															<c:set var="isDoing" value="false"/> 
														</c:if>
													</c:if>
											</c:forEach>
											
											<c:forEach var="star" items="${klist }">
													<c:if test="${isDoing}"> 
														<c:if test="${star != vo.no}">
																<img src="user/images/night.png" style="margin-left: 5px;" onclick="javascript:setlike(${vo.no })">
															<c:set var="isDoing" value="false"/> 
														</c:if>
													</c:if>
											</c:forEach>
										</c:if>
										</div>
										<div style="float: left; ">${vo.sns_like }</div>
								</div>
							</div>
						</div>
					</form>
				</c:forEach>
			</div>
	<div id="snslist"></div>		
	<div id="snslist1"></div>
			<div class="row" id="cls1">	
				<div class='list-group gallery' id="snslist"> </div>
				<div class="col-md-12 col-xs-12"><button class="col-md-12 btn btn-primary btn-md" onclick="javascript:moreList()">더보기</button></div>
			</div>
		</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="material-button-anim">
					<button class="material-button material-button-toggle"
						type="button" id="pop01" data-dismiss="modal" onclick="javascript:btnOpen()">
						<span class="fa fa-plus" aria-hidden="true"></span>
					</button>
					</div>
				</div>
			</div>
		</div>
			
	<div class="modal" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="false"
		style="display: none;">
		<jsp:include page="../pops/4SelectPop.jsp"></jsp:include>
	</div>
		</div>
</body>
</html>
