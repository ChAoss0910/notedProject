<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<meta name="description" content="" />
			<meta name="keywords" content="" />
			<link rel="stylesheet" href="assets/css/main.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	  <link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<title>noted | game session</title>
	
	<style>
	
	body{ 
		font: normal 13px/20px Arial, Helvetica, sans-serif; word-wrap:break-word;
		color: #eee;
		background: #353535;
	}
	</style>
</head>
<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
		      <a class="navbar-brand" href="homepage.jsp">noted</a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="homepage.jsp">Home</a></li>
		        <li><a href="login.jsp">Login</a></li>
		        <li><a href="signup.jsp">Signup</a></li>
		        <li><a href="about.jsp">About</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
	<!-- NAVBAR -->
	<div class="outer-user">
		<div class="container">
			<h1>Sample Quiz Game 1:</h1>
		</div>
		
<!-- 		COUNTDOWN TIMER -->
		<div class="container">
			<h3>15 Second Timer:</h3>
  			<progress value="0" max="15" id="progressBar"></progress>
		</div>
	</div>
	
	<script>
	var timeleft = 10;
	var downloadTimer = setInterval(function(){
	  document.getElementById("progressBar").value = 10 - --timeleft;
	  if(timeleft <= 0)
	    clearInterval(downloadTimer);
	},1000);
	
	</script>
</body>
</html>