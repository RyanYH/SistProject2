<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<title>LOGIN&SIGNUP</title>

<link rel="stylesheet" href="user/member/css/reset.css">
<link rel="stylesheet" href="user/member/css/style.css">
<link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript" src="http://code.jquery.com/"></script>
</head>
<body>
<div class="module form-module" style="height: auto; , width: auto;">
		<div class="form">
			<h2>Create an account</h2>
			<form method="post" action="join.do">
				<input type="text" placeholder="Username" name="Username"/> 
				<input type="password" placeholder="Password" name="Password"/> 
				<input type="password" placeholder="Check Password" /> 
				<input type="email" placeholder="Email Address" name="Email"/> 
				<button class="toggle" id=join>Register</button>
				<div class="cta">
					If you have an account,<a class="toggle">CLICK</a>
				</div>
			</form>
		</div>


		<div class="form">
			<h2>Login to your account</h2>
			<form method="post" action="login.do">
				<input type="text" placeholder="Username" name="Username"/>
				<input type="password" placeholder="Password" name="Password"/>	
				<button>LOGIN</button>
			</form>
			<a id="custom-login-btn" href="javascript:loginWithKakao()" style="text-decoration: none">
				<input type="button" value="KAKAO" style="background-color: RGB(255, 180, 0); border:0px; color: white;"/>
			</a>
			
			<div class="cta">
				If you want to sign up,<a class="toggle">CLICK</a>
			</div>
		</div>
	</div>

<script type='text/javascript'>
    Kakao.init('7da59a112e3ffac48f158cb342f2b15e');
    function loginWithKakao() {
      Kakao.Auth.login({
        success: function(authObj) {
          Kakao.API.request({
              url: '/v1/user/me',
              success: function(res) {
               /*  alert(JSON.stringify(res)); */
                var nickname = res.properties.nickname;
                var profile = res.properties.profile_image;
                
				location.href="kakao.do?id="+nickname+"&profile="+profile;

              },
              fail: function(error) {
                alert(JSON.stringify(error));
              }
            });
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
</script>
	
	<script type="text/javascript">
		$('.toggle').click(function() {
			// Switches the forms
			$('.form').animate({
				height : "toggle",
				'padding-top' : 'toggle',
				'padding-bottom' : 'toggle',
				opacity : "toggle"
			}, "slow");
		});
		(function() {
			var  buttonStyles, materialIcons;
			materialIcons = '<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">';
			buttonStyles = '<link href="http://codepen.io/andytran/pen/vLmRVp.css" rel="stylesheet">';
			document.body.innerHTML += materialIcons + buttonStyles;
		}).call(this);
	</script>

</body>
</html>