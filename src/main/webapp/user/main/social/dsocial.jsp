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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
function setlike(no){
	location.href = "addSNSlike.do?no="+no;
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
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class='list-group gallery'>
				<c:forEach var="vo" items="${snslist }" begin="0" end="9">
					<form method="post" action="detailSNS.do" name="listsns">
						<div class=col-md-4>
							<div class="thumbnail">
								<div>
									<input type="hidden" name="no" value="${vo.no }" />
									<input type="hidden" name="memid" value='${sessionScope.vo.id}' />
									<img alt="avatar" src="${vo.member.profile }" style="width: 32px;">
									${vo.id }
								</div>
								<div>
									<input type='hidden' name="no" value="${vo.no }"/>
									<a href="detailSNS.do?no=${vo.no }&res=0">
									<img src="${vo.photo.path }" style="height:350px;"></a>
								</div>
								<div style="margin-top: 5px;">
									<img class="star" alt="star" src="user/images/night.png">
									${vo.sns_like }
								</div>
							</div>
						</div>
					</form>
				</c:forEach>
			</div>
			<div class="pop02"></div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="material-button-anim">
						<button class="material-button material-button-toggle"
							type="button" id="pop01" data-dismiss="modal"
							onclick="javascript:btnOpen()">
							<span class="fa fa-plus" aria-hidden="true"></span>
						</button>
					</div>
				</div>
			</div>
		</div>

	<div class="modal" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="false">
		<jsp:include page="../social/detailSNS.jsp"></jsp:include>
	</div>
	</div>
	<script type="text/javascript">
	$(function() {
		/* BOOTSNIPP FULLSCREEN FIX */
		if (window.location == window.parent.location) {
			$('#back-to-bootsnipp').removeClass('hide');
			$('.alert').addClass('hide');
		}
		$('#fullscreen').on('click', function(event) {
			event.preventDefault();
			window.parent.location = "http://bootsnipp.com/iframe/Q60Oj";
		});
		$('#pop02').on('click', function(event) {
			event.preventDefault();
			var aa = "../main/social/detailSNS.jsp";
 			$('#myModal2').modal('show');  
		})
	});
	</script>

</body>
</html>
