<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>my house's level</title>

<!-- 부트스트랩 -->
<link href="user/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- style sheet -->
<link href="user/main/main.css" rel="stylesheet">
<link href='user/main/home/css/home.css' rel='stylesheet'
   type='text/css'>
<link href='user/main/tip/css/tip.css' rel='stylesheet' type='text/css'>
<link href='user/main/social/css/social.css' rel='stylesheet'
   type='text/css'>
<link href='user/main/pops/css/pops.css' rel="stylesheet"
   type='text/css'>
<link href="user/main/mypage/css/mypage.css" rel="stylesheet">

<style>
#myModal {
   display: none;
   background: rgba(0, 0, 0, .6);
}

#myModal2 {
   background: rgba(0, 0, 0, .6);
}
#myModal3 {
   display: none;
   background: rgba(0, 0, 0, .6);
}
.modal {
   background: rgba(0, 0, 0, .6);
}
.modal-content{
      overflow:auto;
 }
 .thumbnail2 {
   display: block;
   padding: 4px;
   margin-bottom: 20px;
   margin-top:20px;
   line-height: 1.42857143;
   background-color: #fff;
   border: 3px solid #fff;
   border-radius: 4px;
   -webkit-transition: all .2s ease-in-out;
   -o-transition: all .2s ease-in-out;
   transition: all .2s ease-in-out;
   font-size:15px;
}
</style>
</head>
<body>
   <nav class="navbar navbar-default navbar-static-top">
      <div class="container-fluid" id="header-bar">
         <!-- menu button -->
         <div class="navbar-header">
            <button type="button"
               class="navbar-toggle navbar-toggle-sidebar collapsed">MENU</button>
            <button type="button" class="navbar-toggle collapsed"
               data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
               <span class="sr-only">Toggle navigation</span> <span
                  class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
         </div>
         <!-- tab -->
         <div class="collapse navbar-collapse"
            id="bs-example-navbar-collapse-1">
            <ul class="nav nav-tabs nav-tabs-sticky nav-justified"
               role="tablist" id="tab_menu">
               <li role="presentation" id="home_tab" class="${home }"
                  onclick="homeTab()"><a href="#home" aria-controls="home"
                  data-toggle="tab">Home</a></li>
               <li role="presentation" id="social_tab" class="${social }"
                  onclick="socialTab()"><a href="#social"
                  aria-controls="social" data-toggle="tab">Social</a></li>
               <li role="presentation" id="tip_tab" class="${tip }"
                  onclick="tipTab()"><a href="#tip" aria-controls="tip"
                  data-toggle="tab">Course</a></li>
               <li role="presentation" id="item_tab" class="${bestitem}"
                  onclick="itemTab()"><a href="#bestitem"
                  aria-controls="bestitem" data-toggle="tab">Best Items</a></li>
               <c:if test="${sessionScope.vo.id == 'admin' }">
                  <li role="presentation" id="mypage_tab" class="${admin }"
                     onclick="adminTab()"><a href="#admin"
                     aria-controls="myPage" data-toggle="tab">Admin Page</a></li>
               </c:if>
               <c:if test="${sessionScope.vo.id != 'admin' }">
                  <li role="presentation" id="mypage_tab" class="${mypage }"
                     onclick="mypageTab()"><a href="#myPage"
                     aria-controls="myPage" data-toggle="tab">My Page</a></li>
               </c:if>
               <li role="presentation" id="write_tab" style="display: none"><a href="#write"
                  aria-controls="myPage" data-toggle="tab">write</a></li>
            </ul>
         </div>
      </div>
   </nav>

   <div class="container-fluid main-container">
      <div class="col-md-2 sidebar">
         <div class="row">
            <div class="absolute-wrapper"></div>
            <!-- slide menu -->
            <div class="side-menu" style="height: 1000px;">
               <nav class="navbar navbar-default" role="navigation">
                  <div class="side-menu-container">
                     <ul class="nav navbar-nav">
                        <li class="profile-sidebar">
                           <div class="profile-userpic">
                              <img src='${sessionScope.vo.profile}' class="img-responsive"
                                 alt="" style="height:130px;">
                           </div>
                           <div class="profile-usertitle">
                              <div class="profile-usertitle-name">
                                 <input type="text" value='${sessionScope.vo.id}' id="idbox"
                                    readonly="readonly"
                                    style
                                     ="text-align: center; 
                                       background-color: rgb(243, 243, 243);
                                       color: #5a7391;
                                       font-size: 16px;
                                       font-weight: 600;" size="17"/>
                              </div>
                           </div>
                           <div class="profile-userbuttons">
                              <input type="button" value="로그아웃" onclick="clickBtn()"
                                 class="btn btn-primary btn-xs" />
                           </div>
                        </li>
                        <li>
                           <ul class="nav navbar-nav" id="side-menu">
                              <c:forEach var="vo" items="${nav }">
                                 ${vo }
                               </c:forEach>
                           </ul>
                        </li>
                     </ul>
                  </div>
               </nav>
            </div>
         </div>
      </div>

      <div class="col-md-10 content">
         <div class="panel panel-default tab-content" id="tab-content">
            <div class="tab-content">
               <div role="tabpanel" class="tab-pane fade active in">
                  <jsp:include page="${jsp }"></jsp:include>
               </div>
            </div>
         </div>
      </div>

      <div class="modal" id="myModal3" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="false">
         <jsp:include page="../main/pops/SelectPop.jsp"></jsp:include>
      </div>
</div>
      <!-- jQuery for bootstrap -->
      <script
         src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
      <!-- javascript -->
      <script src="user/bootstrap/js/bootstrap.min.js"></script>
      <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
      <script src="user/main/jquery.stickytabs.js"></script>
      <script src="user/assets/script.js"></script>
      <script src="user/main/main.js"></script>
      <script src="user/main/social/js/social.js"></script>
      <script src="user/main/pops/js/pops.js"></script>
      <script type="text/javascript" src="user/main/home/js/home.js"></script>
      <script type="text/javascript" src="user/main/mypage/js/mypage.js"></script>
      <script type="text/javascript">
         function clickBtn() {
            <c:remove var="id" scope="session" />
            location.href = "index.do";
         }
      </script>
</body>
</html>