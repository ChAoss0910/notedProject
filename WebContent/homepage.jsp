<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="assets/css/main.css" />
<title>Noted</title>
</head>
<body>
	<h1>Noted Quiz Game</h1>
	
	<div id="signupOrLogin">
			<button onclick="openSignupPage();" type="button" class="btn btn-default">Sign Up</button>
			<button onclick="openLoginPage();" type="button" class="btn btn-default">Login</button>
		</div>
</body>
<script>
	function openSignupPage(){
		 window.open("signupPage.jsp","_self");
	}
	
	function openLoginPage(){
		window.open("loginPage.jsp","_self");
	}
</script>
</html>