<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<meta name="description" content="" />
			<meta name="keywords" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	  <link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<title>noted | sign up</title>
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
        		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<!-- NAVBAR -->
	<!-- SIGNUP -->
	<div class="outer-user">
		<div class="container"> 
			<h1>Sign Up</h1>
			<form name="signup" method="POST" action="ValidateSignup">
				<div class="form-row">
				    	<div class="form-group col-md-6">
				    		<label for="fname">First name</label>
				      	<input type="text" class="form-control" id="fname" name = "firstname" placeholder="First name">
				    </div>
				    <div class="form-group col-md-6">
				    		<label for="lname">Last name</label>
				      	<input type="text" class="form-control" id="lname" name = "lastname" placeholder="Last name">
				    </div>
			  	</div>
				<div class="form-row">
			    		<div class="form-group col-md-4">
				      	<label for="signupEmail">Email</label>
				      	<input type="email" class="form-control" id="signupEmail" name = "email" placeholder="Email">
				    </div>
				  	<div class="form-group col-md-4">
					    <label for="signupUsername">Username</label>
					    <input type="text" class="form-control" id="signupUsername" name = "susername" aria-describedby="usernameHelp" placeholder="Username">
					    <small id="usernameHelp" class="form-text text-muted">This will be public to other players.</small>
				  	</div>
				  	<div class="form-group col-md-4">
				    		<label for="signupPassword">Password</label>
				      	<input type="password" class="form-control" id="signupPassword" name="spassword" placeholder="Password">
				    </div>
			  	</div>
			  	<div class="form-row">
				  	<div class="form-group col-md-12">
				  		<label for="signupURL">URL for Profile Picture</label>
				      	<input type="text" class="form-control" id="signupURL" name="url" placeholder="ex: https://www.pexels.com/search/cat/">
				    </div>
		  		</div>
			  	<div class="form-row">
				  	<div class="form-group col-md-12">
				  		<button type="submit" id="submit-button" class="btn btn-primary">Sign Up</button>
			  		</div>
		  		</div>
			</form>
		</div>
	</div>
	<!-- SIGNUP -->
</body>
</html>