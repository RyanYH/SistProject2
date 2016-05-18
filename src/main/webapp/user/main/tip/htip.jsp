<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/frUtil.js"></script>
<script type="text/javascript"
   src="http://homeideas.ikea.kr/kakao/frKakao.js"></script>
<script type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/frFacebook.js?v=11"></script>
<script type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/index.js"></script>
<script type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/jquery.history.js"></script>
<script type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/EasePack.min.js"></script>
<script type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/TweenLite.min.js"></script>
<script type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/TweenMax.min.js"></script>
<script type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/sub01.js"></script>
<script type="text/javascript">
   $(function() {
      $('#pop03').on('click', function(event) {
         event.preventDefault();
         $('#myModal3').modal('show');
      });
   });
   (function(i, s, o, g, r, a, m) {
      i['GoogleAnalyticsObject'] = r;
      i[r] = i[r] || function() {
         (i[r].q = i[r].q || []).push(arguments)
      }, i[r].l = 1 * new Date();
      a = s.createElement(o), m = s.getElementsByTagName(o)[0];
      a.async = 1;
      a.src = g;
      m.parentNode.insertBefore(a, m)
   })(window, document, 'script', '//www.google-analytics.com/analytics.js',
         'ga');
   ga('create', 'UA-71084192-1', 'auto', {
      'allowLinker' : true
   });
   ga('require', 'linkid', 'linkid.js');
   ga('require', 'displayfeatures');
   ga('require', 'linker');
   ga('linker : autoLink', [ 'homeideas.ikea.kr', 'community.newideas.kr' ]);
   ga('send', 'pageview');
</script>
<style type="text/css">
.glyphicon {
   margin-right: 5px;
}

.thumbnail {
   margin-bottom: 20px;
   padding: 0px;
   -webkit-border-radius: 0px;
   -moz-border-radius: 0px;
   border-radius: 0px;
}

.item.list-group-item {
   float: none;
   width: 100%;
   background-color: #fff;
   margin-bottom: 10px;
}

.item.list-group-item:nth-of-type(odd):hover, .item.list-group-item:hover
   {
   background: #428bca;
}

.item.list-group-item .list-group-image {
   margin-right: 10px;
}

.item.list-group-item .thumbnail {
   margin-bottom: 0px;
}

.item.list-group-item .caption {
   padding: 9px 9px 0px 9px;
}

.item.list-group-item:nth-of-type(odd) {
   background: #eeeeee;
}

.item.list-group-item:before, .item.list-group-item:after {
   display: table;
   content: " ";
}

.item.list-group-item img {
   float: left;
}

.item.list-group-item:after {
   clear: both;
}

.list-group-item-text {
   margin: 0 0 11px;
}
</style>
</head>
<script language="JavaScript" type="text/javascript"
   src="http://homeideas.ikea.kr/include/js/s_code.js"></script>
<script language="JavaScript" type="text/javascript">
   var s_code = s.t();
   if (s_code)
      document.write(s_code)
   $(document).ready(function() {
      $('#list').click(function(event) {
         event.preventDefault();
         $('#products .item').addClass('list-group-item');
      });
   });
</script>

<script type="text/javascript">
   $(window).resize(function() {
      var objDiv = document.getElementById(idMyDiv);
      if ($(window).width <= 800)
         objDiv.style.display = "none";
   }).resize();

   function myFunc() {
		var myElement = document.querySelector("#myModal3");
		myElement.style.display="block";
	}
   
   var dropdown = document.querySelectorAll('.dropdown');
   var dropdownArray = Array.prototype.slice.call(dropdown,0);
   dropdownArray.forEach(function(el){
   	var button = el.querySelector('a[data-toggle="dropdown"]'),
   			menu = el.querySelector('.dropdown-menu'),
   			arrow = button.querySelector('i.icon-arrow');

   	button.onclick = function(event) {
   		if(!menu.hasClass('show')) {
   			menu.classList.add('show');
   			menu.classList.remove('hide');
   			arrow.classList.add('open');
   			arrow.classList.remove('close');
   			event.preventDefault();
   		}
   		else {
   			menu.classList.remove('show');
   			menu.classList.add('hide');
   			arrow.classList.remove('open');
   			arrow.classList.add('close');
   			event.preventDefault();
   		}
   	};
   })

   Element.prototype.hasClass = function(className) {
       return this.className && new RegExp("(^|\\s)" + className + "(\\s|$)").test(this.className);
   };
</script>

<noscript>
   <img
      src="http://ikea.122.2o7.net/b/ss/ikeakrhomefurnishingideascampaign16/1/H.27.5--NS/0"
      height="1" width="1" border="0" alt="" />
</noscript>
<!--/DO NOT REMOVE/-->
<script>
   !function(f, b, e, v, n, t, s) {
      if (f.fbq)
         return;
      n = f.fbq = function() {
         n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
               .push(arguments)
      };
      if (!f._fbq)
         f._fbq = n;
      n.push = n;
      n.loaded = !0;
      n.version = '2.0';
      n.queue = [];
      t = b.createElement(e);
      t.async = !0;
      t.src = v;
      s = b.getElementsByTagName(e)[0];
      s.parentNode.insertBefore(t, s)
   }(window, document, 'script', '//connect.facebook.net/en_US/fbevents.js');

   fbq('init', '875493375826542');
   fbq('track', "PageView");
</script>
<noscript>
   <img height="1" width="1" style="display: none"
      src="https://www.facebook.com/tr?id=875493375826542&ev=PageView&noscript=1" />
</noscript>
<div class="container">
   <div class="row">
      <div class="Sub01PArea" id="idMyDiv">
         <div class="sb1ContArea">
            <div id="CBox1" class="CBox1 col-md-12 hidden-xs">
             <form action="searchtip.do" method="get">
               <div id="conb3" class="SContBt03" onmouseover="conO(1, 3, 'over');"
                  onmouseout="conO(1, 3, 'out');">
                  <img class="conbSmall"
                     src="http://homeideas.ikea.kr/images/img_sb1box3_off.png" /> <img
                     class="conbBig"
                     src="http://homeideas.ikea.kr/images/img_sb1box3_on.png"
                     style="display: none;"
                     onclick="location.href='stip.do?searchText=거실'" />
               </div>
               <div id="conb4" class="SContBt04" onmouseover="conO(1, 4, 'over');"
                  onmouseout="conO(1, 4, 'out');">
                  <img class="conbSmall"
                     src="http://homeideas.ikea.kr/images/img_sb1box4_off.png" /> <img
                     class="conbBig"
                     src="http://homeideas.ikea.kr/images/img_sb1box4_on.png"
                     style="display: none;"
                     onclick="location.href='stip.do?searchText=주방'" />
               </div>
               <div id="conb5" class="SContBt05" onmouseover="conO(1, 5, 'over');"
                  onmouseout="conO(1, 5, 'out');">
                  <img class="conbSmall"
                     src="http://homeideas.ikea.kr/images/img_sb1box5_off.png" /> <img
                     class="conbBig"
                     src="http://homeideas.ikea.kr/images/img_sb1box5_on.png"
                     style="display: none;"
                     onclick="location.href='stip.do?searchText=욕실'" />
               </div>
               <div id="conb6" class="SContBt06" onmouseover="conO(1, 6, 'over');"
                  onmouseout="conO(1, 6, 'out');">
                  <img class="conbSmall"
                     src="http://homeideas.ikea.kr/images/img_sb1box1_off.png" /> <img
                     class="conbBig"
                     src="http://homeideas.ikea.kr/images/img_sb1box1_on.png"
                     style="display: none;"
                     onclick="location.href='stip.do?searchText=침실'" />
                </div>
               </form>
            </div>
         </div>
      </div>
   </div>
   
   <div class="row col-md-12" style="margin-top:60%;" id="abcde">
      <div id="products" class="row list-group">
      <c:if test="${searchText != null }">
      	<c:forEach var="snslist" items="${snslist }">
      		<div class="item col-md-4" style="margin-bottom: 20px;">
            	<div class="thumbnail" style="height:400px;">
                	<img class="group list-group-image" src="${snslist.photo.path }" alt="" style="width:90%; height:280px"/>
                  	<div class="caption">
                    	<h4 class="group inner list-group-item-heading">[ ${searchText } ]</h4>
                    	<c:if test="${snslist.tag.tag != null}">
                     		<p class="group inner list-group-item-text">${snslist.tag.tag }</p>
                     	</c:if>
                     	<c:if test="${snslist.tag.tag == ' ' || snslist.tag.tag.length() < 1}">
                     		<p class="group inner list-group-item-text">There is no tag for this sns</p>
                     	</c:if>
                     	<div class="row">
                        	<div class="col-xs-12 col-md-6" style="margin-left: 5px;">
                           		<a class="btn btn-primary btn-md" href="detailSNS2.do?no=${snslist.no }&res=1&searchText=${searchText}">DETAIL</a>
                        	</div>
                     	</div>
                	</div>
            	</div>
			</div>
		</c:forEach>
              
        <c:forEach var="courselist" items="${courselist }">
	        <div class="item col-md-4" style="margin-bottom: 20px;">
	           	<div class="thumbnail" style="border: 2px solid rgb(50,118,177);height:400px;">
	               	<img class="group list-group-image" src="${courselist.photo.path }" alt="" style="width:90%; height:280px"/>
	                 	<div class="caption">
	                   		<h4 class="group inner list-group-item-heading">[ ${searchText } ]</h4>
	                    	<c:if test="${courselist.tag.tag != ''}">
	                     		<p class="group inner list-group-item-text">${courselist.tag.tag }</p>
	                     	</c:if>
	                     	<c:if test="${courselist.tag.tag == ' '}">
	                     		<p class="group inner list-group-item-text">There is no tag for this course</p>
	                     	</c:if>
	                    	<div class="row">
	                       		<div class="col-xs-12 col-md-6" style="margin-left: 5px;">
	                          		<a class="btn btn-primary btn-md" href="detailCourse.do?no=${courselist.no }&searchText=${searchText}">DETAIL</a>
	                       		</div>
	                    	</div>
	               	</div>
	           	</div>
			</div>
        </c:forEach>
	</c:if>
         
         <!-- toggle button -->
         
            <div class="row">
               <div class="col-md-4 col-md-offset-4">
                  <div class="material-button-anim">
                     <button class="material-button material-button-toggle"
                        type="button" id="pop03" data-dismiss="modal" onclick="myFunc()">
                        <span class="fa fa-plus" aria-hidden="true"></span>
                     </button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>