<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
$(function(){
    // This code is not even almost production ready. It's 2am here, and it's a cheap proof-of-concept if anything.
    $(".img-modal-btn.right").on('click', function(e){
        e.preventDefault();
        cur = $(this).parent().find('img:visible()');
        next = cur.next('img');
        par = cur.parent();
        if (!next.length) { next = $(cur.parent().find("img").get(0)) }
        cur.addClass('hidden');
        next.removeClass('hidden');
        
        return false;
    })
    
    $(".img-modal-btn.left").on('click', function(e){
        e.preventDefault();
        cur = $(this).parent().find('img:visible()');
        next = cur.prev('img');
        par = cur.parent();
        children = cur.parent().find("img");
        if (!next.length) { next = $(children.get(children.length-1)) }
        cur.addClass('hidden');
        next.removeClass('hidden');
        
        return false;
    })
    
    $("#followBtn").on('click', function () {
    	if (document.getElementById("followBtn").value == "FOLLOW") {
    		document.getElementById("followBtn").value = "UNFOLLOW"
    	} else {
    		document.getElementById("followBtn").value = "FOLLOW"
    	}
    })
});
</script>
<style type="text/css">
/* CSS used here will be applied after bootstrap.css */

html, body { height: 100%;}

/* So that the modal is displayed in the preview.. You can probably remove this and the above rule */
.img-modal {
  display: block;
}

.img-modal .modal-dialog {
    /* An arbitrary minimum height. Feel free to modify this one as well */
    min-height: 350px;
    height: 80%;
}

.img-modal .modal-content, .img-modal .modal-body, .img-modal .row, .img-modal .modal-image {
    height: 100%;
}

.modal-content {
    border-radius: 0;
}

.modal-body {
    padding-top: 0;
    padding-bottom: 0;
}

.modal-image {
    background: #000;
    padding :0;
}

.modal-image img {
    margin: 0 auto;
    max-height: 100%;
    max-width: 100%;
    
    position: relative;
    top: 50%;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    transform: translateY(-50%);
}

.img-modal .img-modal-btn {
    display: block;
    position: absolute;
    top: 0;
    bottom: 0;
    background: black;
    opacity: 0;
    font-size: 1.5em;
    width: 45px;
    color: #fff;
    transition: opacity .2s ease-in;
}

.img-modal .modal-image:hover .img-modal-btn {
    opacity: 0.4;  
}

.img-modal .modal-image:hover .img-modal-btn:hover {
   opacity: 0.75;   
}

.img-modal .img-modal-btn.right {
    right: 0;
}

.img-modal .img-modal-btn i {
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    text-align: center;
    margin-top: -.75em;
}

.img-modal .modal-meta {
    position: relative;   
    height: 100%;
}

.img-modal .modal-meta-top {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 45px;
    padding: 5px 10px;
    overflow-y: auto;
}

.img-modal .modal-meta-top .img-poster img {
    height: 70px;
    width: 70px;
    float: left;
    margin-right: 15px;
}

.img-modal .modal-meta-top .img-poster strong {
    display: block; 
    padding-top: 15px;
}

.img-modal .modal-meta-top .img-poster span {
    display: block;   
    color: #aaa;
    font-size:.9em;
}

.img-modal .modal-meta-bottom {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 5px;
    border-top: solid 1px #ccc;
}

.img-modal .img-comment-list {
    list-style: none;  
    padding: 0;
}
.img-modal .img-comment-list li {
    margin:0;
    margin-top:10px;
}

.img-modal .img-comment-list li > div {
    display:table-cell;
}

.img-modal .img-comment-list img {
    border-radius:50%;
    width: 42px;
    height: 42px;
    margin-right: 10px;
    margin-top: 20px;
}

.img-modal .img-comment-list p {
    margin: 0;
}

.img-modal .img-comment-list span {
    font-size: .8em; 
    color: #aaa;
}
</style>
<script type="text/javascript">
function Repop(){
	location.href="social.do";
}
</script>
</head>
<body>
	<div class="modal img-modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-body">
        <div class="row">
            <div class="col-md-8 modal-image">
                <img class="img-responsive " src="images/portfolio/course.png">
                   <img class="img-responsive hidden" src="images/portfolio/tip.png" />   
                <img class="img-responsive hidden" src="images/portfolio/roomstar.png" />
                <img class="img-responsive hidden" src="images/portfolio/sns.png" />
                        
                <a href="" class="img-modal-btn left"><i class="glyphicon glyphicon-chevron-left"></i></a>
                <a href="" class="img-modal-btn right"><i class="glyphicon glyphicon-chevron-right"></i></a>
          	</div>
        	<div class="col-md-4 modal-meta">
              <div class="modal-meta-top">
                  <button type="button" class="close" data-dismiss="modal" value="X">
                  </button>
                  <div class="img-poster clearfix">
                      <img class="img-circle" src="images/avatar.jpg"/>
                      <strong>
                          <a href="">John Doe</a>
                      </strong>
                      <span>12 minutes ago</span>
                      <input type="button" value="FOLLOW" class="btn btn-primary btn-xs" id="followBtn">
                  </div>
                  
                  <ul class="img-comment-list">
                    <li>
                        <div class="comment-img">
                          <img src="http://lorempixel.com/50/50/people/6">
                        </div>
                        <div class="comment-text">
                            <strong><a href="">Jane Doe</a></strong>
                            <p>Hello this is a test comment.</p> <span class="date sub-text">on March 5th, 2014</span>
                        </div>
                    </li>
                    <li>
                        <div class="comment-img">
                          <img src="http://lorempixel.com/50/50/people/7">
                        </div>
                        <div class="comment-text">
                            <strong><a href="">Jane Doe</a></strong>
                            <p>Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p> <span>on March 5th, 2014</span>
                        </div>
                    </li>
                    <li>
                        <div class="comment-img">
                          <img src="http://lorempixel.com/50/50/people/9">
                        </div>
                        <div class="comment-text">
                            <strong><a href="">Jane Doe</a></strong>
                            <p class="">Hello this is a test comment.</p> <span class="date sub-text">on March 5th, 2014</span>
                        </div>
                    </li>
                </ul>
              </div>
              <div class="modal-meta-bottom">
                  <input type="text" class="form-control" placeholder="Leave a commment.."/>
              </div>
          	</div>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
</body>
</html>