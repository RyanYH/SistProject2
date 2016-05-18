<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

<title>Ionic Pill Buttons</title>
<link href="//www.loringdodge.com/files/facebook.ionic.min.css"
	rel="stylesheet">
<script src="//code.ionicframework.com/nightly/js/ionic.bundle.js"></script>

<style type="text/css">
/* Front-end Legos Workshop with Shay Howe
================================================== */

/* HTML5 display definitions
================================================== */

article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
main,
nav,
section,
summary {
  display: block;
 
}

/* Base
================================================== */

html {
  color: #555;
  font: 14px/20px "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
body {
  background: white;
  margin: 0;
  overflow:scroll;

}

================================================== */

*,
*:after,
*:before {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}

/* Clearfix */

.group:before,
.group:after {
  content: "";
  display: table;
}
.group:after {
  clear: both;
}

/* Box offset */

.box-offset {
  background: #fff;
  border: 1px solid #d4d4d4;
  -webkit-border-radius: 5px;
     -moz-border-radius: 5px;
      -ms-border-radius: 5px;
       -o-border-radius: 5px;
          border-radius: 5px;
}

/* Container */

.container {
  margin: 0 auto;
  padding: 20px;
  max-width: 980px;
}

/* Surgical classes */

.pull-left {
  float: left;
}
.pull-right {
  float: right;
}
.col-gutters {
  padding-left: 20px;
  padding-right: 20px;
}
.col-baselines {
  padding-bottom: 20px;
  padding-top: 20px;
}
.col-box {
  padding: 20px;
}

/* Margins and paddings */

.margin-bottom {
  margin-bottom: 20px;
}
.margin-top {
  margin-top: 20px;
}
.pad-bottom {
  padding-bottom: 20px;
}
.pad-top {
  padding-top: 20px;
}

/* Typography
================================================== */

h1,
h2,
h3,
h4,
h5,
h6,
p {
  margin: 0 0 20px 0;
}

h1,
h2,
h3,
h4,
h5,
h6,
strong {
  font-weight: 600;
}

/* Sizes */

h1,
.h-headline {
  font-size: 36px;
}
h2,
.h-subheadline {
  font-size: 21px;
}
h3,
.h-byline {
  font-size: 18px;
}
h4,
.h-standfirst {
  font-size: 16px;
}
h5,
.h-related {
  font-size: 14px;
}
h6,
.h-promo {
  font-size: 12px;
}

/* Colors */

h1,
h2,
h3,
h4 {
  color: #29abe2;
}
h5,
h6 {
  color: #333;
}

/* Offset */

.text-subtle {
  color: #999;
  font-weight: normal;
}

/* Media
================================================== */

img {
  border: 0;
  -webkit-border-radius: 5px;
     -moz-border-radius: 5px;
      -ms-border-radius: 5px;
       -o-border-radius: 5px;
          border-radius: 5px;
}

/* Lists
================================================== */

ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

/* Media object
================================================== */

.media, 
.media-body {
  overflow: hidden;
}
.media-primary .media-object,
.media-secondary .media-object-alt {
  float: right;
  margin: 0 0 20px 20px;
}
.media-primary .media-object-alt,
.media-secondary .media-object {
  float: left;
  margin: 0 20px 20px 0;
}
.media-object img,
.media-object-alt img {
  display: block;
}
.media-count {
  color: #999;
  float: right;
  font-size: 10px;
  line-height: 1;
  padding: 3px 5px;
}

/* Primary */

.media-primary {
  border-bottom: 1px solid #d4d4d4;
}
.media-primary .media {
  border-top: 1px solid #d4d4d4;
}

/* Secondary */

.media-secondary .media-object img{
  width: 40px;
}
.media-secondary .media-object-alt img{
	width : 80px;
}

/* Buttons
================================================== */

.btn {
  border: 1px solid rgba(0, 0, 0, .17);
  -webkit-border-radius: 5px;
     -moz-border-radius: 5px;
      -ms-border-radius: 5px;
       -o-border-radius: 5px;
          border-radius: 5px;
  cursor: pointer;
  display: inline-block;
  font: 600 14px/20px "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  margin: 0;
  padding: 8px 12px;
  text-align: center;
  text-decoration: none;
  vertical-align: middle;
}

/* Types */

.btn-default,
.btn-success,
.btn-warning,
.btn-danger {
  color: #fff;
}
.btn-default {
  background-color: #08c;
}
.btn-success {
  background-color: #62c462;
}
.btn-warning {
  background-color: #fbb450;
}
.btn-danger {
  background-color: #da4f49;
}
.btn-boring {
  background-color: #fff;
  color: #08c;
}

/* Sizes */

.btn-large {
  -webkit-border-radius: 6px;
     -moz-border-radius: 6px;
      -ms-border-radius: 6px;
       -o-border-radius: 6px;
          border-radius: 6px;
  font-size: 18px;
  padding: 11px 19px;
}
.btn-small {
  -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
      -ms-border-radius: 3px;
       -o-border-radius: 3px;
          border-radius: 3px;
  font-size: 12px;
  padding: 4px 10px;
}
.btn-mini {
  -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
      -ms-border-radius: 3px;
       -o-border-radius: 3px;
          border-radius: 3px;
  font-size: 10px;
  padding: 1px 8px;
}

/* Navigation
================================================== */

.nav li {
/*   float: left; */
  margin-right: 2px;
}
.nav a {
  border: 1px solid transparent;
  color: #08c;
  display: block;
  padding: 8px 12px;
  text-decoration: none;
}
.nav a:hover,
.nav a:focus {
  color: #62c462;
}
.nav-active a {
  cursor: default;
  font-weight: 600;
}

/* Tabs */

.nav-tabs li {
  margin-bottom: -1px;
}
.nav-tabs a {
  -webkit-border-radius: 5px 5px 0 0;
     -moz-border-radius: 5px 5px 0 0;
      -ms-border-radius: 5px 5px 0 0;
       -o-border-radius: 5px 5px 0 0;
          border-radius: 5px 5px 0 0;
}
.nav-tabs .nav-active a {
  background-color: #fff;
  border-color: #d4d4d4;
  border-bottom-color: transparent;
  color: #555;
}

/* Pills */

.nav-pills a {
  -webkit-border-radius: 5px;
     -moz-border-radius: 5px;
      -ms-border-radius: 5px;
       -o-border-radius: 5px;
          border-radius: 5px;
}
.nav-pills .nav-active a {
  background-color: #08c;
  border-color: rgba(0, 0, 0, .17);
  color: #fff
}

/* Stacked */

.nav-tabs-stacked li,
.nav-pills-stacked li {
  float: none;
  margin-right: 0;
}

/* Stacked tabs */

.nav-tabs-stacked a {
  border-color: #d4d4d4;
    -webkit-border-radius: 0;
       -moz-border-radius: 0;
        -ms-border-radius: 0;
         -o-border-radius: 0;
            border-radius: 0;
}
.nav-tabs-stacked li:first-child a {
    -webkit-border-radius: 5px 5px 0 0;
       -moz-border-radius: 5px 5px 0 0;
        -ms-border-radius: 5px 5px 0 0;
         -o-border-radius: 5px 5px 0 0;
            border-radius: 5px 5px 0 0;
}
.nav-tabs-stacked li:last-child a {
    -webkit-border-radius: 0 0 5px 5px;
       -moz-border-radius: 0 0 5px 5px;
        -ms-border-radius: 0 0 5px 5px;
         -o-border-radius: 0 0 5px 5px;
            border-radius: 0 0 5px 5px;
}

/* Stacked pills */

.nav-pills-stacked li + li {
  margin-top: 3px;
}

/* Responsive
================================================== */

@media all and (min-width: 680px) {

  /* Columns */

  .col-1-3,
  .col-2-3 {
    float: left;
  }
  .col-1-3 {
    width: 33.33%;
  }
  .col-2-3 {
    width: 66.66%;
  }

}
#item_box2{
	display: none;
}
#item_box3{
	display: none;
}
</style>

</head>
<body>
	
<div class="container group">

  <section class="box-offset col-2-3 pad-top">

    <h2 class="col-gutters">MHD 선정 이달의 에디터! 축하드립니다.</h2>
    
    <ul class="media-primary">
   <c:forEach var="svo" items="${slist }" varStatus="status">
    
      <li class="media col-gutters pad-top">
      
     <c:if test="${status.count%2==0}">
        <a class="media-object" href="#">
          <img src="${svo.member.profile }"  alt="프로필오류" style="width:40px; height:40px">
        </a>
        <div class="media-body">
         <!--  <strong class="media-count box-offset">13</strong> -->
          <h5>${svo.id } <span class="text-subtle h-promo">5월 1주차 에디터</span></h5>
          <p>${svo.sns_like }0명의 추천, ${svo.theme }테마 전문가</p>
        </div>   
    </c:if>
      <c:if test="${status.count%2==1}">     
 		 <div class="media pad-top">
            <a class="media-object-alt" href="#">
              <img src="${svo.member.profile }" alt="프로필오류" style="width:40px; height:40px">
            </a>           
           <div class="media-body">
              <h5>${svo.id } <span class="text-subtle h-promo">5월 1주차 에디터</span></h5>
              <p>${svo.sns_like }0명의 추천, ${svo.theme }테마 전문가</p>
            </div> 
          </div>  
      </c:if>
   
      </li>
   
   </c:forEach>
    </ul>
  </section>
  <aside class="col-1-3 col-gutters pad-top">

    <h4>금주의 추천 강좌!</h4>

    <ul class="media-secondary">

	 <c:forEach var="cvo" items="${clist }">
      <li class="media">
        <a class="media-object" href="#">
          <img src="${cvo.member.profile}" alt="프로필 오류">
        </a>
        <div class="media-body">
          <h5>${cvo.id }님<span class="text-subtle h-promo" style="float:right;">
          <fmt:formatDate value="${cvo.courseDate}" pattern="yyyy-MM-dd"/></span></h5>
          <p>${cvo.cname }</p>
        </div>
      </li>
    </c:forEach> 
      
       <li class="media box-offset col-box margin-bottom" id="item_box1" style="display:block;">
        <a class="media-object-alt" href="#">
          <img src="http://shopping.phinf.naver.net/main_9577985/9577985962.jpg?type=f140" alt="Erica">
        </a>
        <div class="media-body">
          <h5>광고  <span class="text-subtle h-promo">5월 첫째주</span></h5>
          <p>이번 달의  It아이템!</p>
            <p>거실에는 양모 러그!</p>
          <a class="btn btn-danger btn-small" href="javascript:itemOpen()">다른 아이템 보기</a>
        </div>
      </li>
       <li class="media box-offset col-box margin-bottom" id="item_box2">
        <a class="media-object-alt" href="#">
          <img src="http://shopping.phinf.naver.net/main_8702894/8702894628.jpg?type=f140" alt="Erica">
        </a>
        <div class="media-body">
          <h5>광고  <span class="text-subtle h-promo">5월 첫째주</span></h5>
          <p>이번 달의  It아이템!</p>
            <p>거실에는 이런 TV수납장 어떠세요?!</p>
          <a class="btn btn-danger btn-small" href="javascript:itemOpen2()">다른 아이템 보기</a>
        </div>
      </li>
      <li class="media box-offset col-box margin-bottom"  id="item_box3">
        <a class="media-object-alt" href="#">
          <img src="http://shopping.phinf.naver.net/main_9268548/9268548408.1.jpg?type=f140" alt="Erica">
        </a>
        <div class="media-body">
          <h5>광고  <span class="text-subtle h-promo">5월 첫째주</span></h5>
          <p>이번 달의  It아이템!</p>
            <p>거실에는 가죽 쇼파!</p>
          <a class="btn btn-danger btn-small"  href="javascript:itemOpen3()">다른 아이템 보기</a>
        </div>
      </li>  
        
          
    </ul> 
 	<div class="col-box col-md-12">
     <a class="btn btn-default pull-right" href="social.do">포스팅 시작하기!</a>
     </div>
  </aside>
</div>
<script type="text/javascript">
function itemOpen(){
	var foElement = document.querySelector("#item_box1");
	foElement.style.display="none";
	
	var myElement = document.querySelector("#item_box2");
	myElement.style.display="block";
}
function itemOpen2(){
	var foElement = document.querySelector("#item_box2");
	foElement.style.display="none";
	
	var myElement = document.querySelector("#item_box3");
	myElement.style.display="block";
}
function itemOpen3(){
	var foElement = document.querySelector("#item_box3");
	foElement.style.display="none";
	
	var myElement = document.querySelector("#item_box1");
	myElement.style.display="block";
}
</script>
</body>
</html>