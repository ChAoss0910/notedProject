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
	<title>noted | about</title>
	<%
	String username = "user1";
	String profilePic = "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
	%>
	<style>
		.navbar-right img {
			margin-top: 5px;
			width: 40px;  
			height: 40px;
			border-radius: 20%; 
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
	        <li class="active"><a href="#">Home</a></li>
	        <li><a href="newGame.jsp">New Game</a></li>
	        <li><a href="about.jsp">About</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right" id="right-nav">
	      	<% String pass = "userProfile.jsp?username=" + username + "&url=" + profilePic; %>
     		<a id="myProfile" href=<%=pass%>><img src=<%= profilePic %> /></a>
	      </ul>
	    </div>
	  </div>
	</nav>
	<!-- NAVBAR -->
	<div class="outer-user">
		<div class="container">
			<h1>About Us:</h1>
		</div>
	</div>
</body>
</html>