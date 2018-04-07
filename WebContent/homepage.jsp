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
	<!-- NAVBAR -->
		<nav class="navbar navbar-dark bg-dark">
			  <a class="navbar-brand" href="#">Home</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarNavDropdown">
			    <ul class="navbar-nav">
			      <li class="nav-item active">
			        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">Features</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">Pricing</a>
			      </li>
			      <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          Dropdown link
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
			          <a class="dropdown-item" href="#">Action</a>
			          <a class="dropdown-item" href="#">Another action</a>
			          <a class="dropdown-item" href="#">Something else here</a>
			        </div>
			      </li>
			    </ul>
			  </div>
			</nav>
		<!-- NAVBAR -->
		
		<!-- JUMBOTRON -->
		<div class="jumbotron">
		  <h1 class="display-4">Noted</h1>
		  <p class="lead">Join a quiz session and learn by competing!</p>
		  <hr class="my-4">
		  <p class="lead">
		    <a class="btn btn-primary btn-lg" href="#" role="button">Start Game</a>
		  </p>
	    </div>
	
	<div id="signupOrLogin" style="text-align:center;">
			<button onclick="openSignupPage();" type="button" class="btn btn-default">Sign Up</button>
			<button onclick="openLoginPage();" type="button" class="btn btn-default">Login</button>
		</div>
</body>
<script>
	function openSignupPage(){
		 window.open("signup.jsp","_self");
	}
	
	function openLoginPage(){
		window.open("login.jsp","_self");
	}
</script>
</html>