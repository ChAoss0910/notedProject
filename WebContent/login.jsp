<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<title>noted | login</title>
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
		      <a class="navbar-brand" href="#">noted</a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="#">Home</a></li>
		        <li><a href="login.jsp">Login</a></li>
		        <li><a href="signup.jsp">Signup</a></li>
		        <li><a href="#">About</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
	<!-- NAVBAR -->
	<!-- LOGIN -->
	<div class="outer-user">
		<div class="container">
			<h1>Login</h1>
			<form name="login" method="POST" action="ValidateLogin">
				<div class="form-row">
					<div class="form-group col-md-6">
				    		<label for="loginUsername">Username</label>
				    		<input type="text" class="form-control" id="loginEmail" placeholder="Username">
				  	</div>
				  	<div class="form-group col-md-6">
				    		<label for="loginPassword">Password</label>
				    		<input type="password" class="form-control" id="loginPassword" placeholder="Password">
				  	</div>
			  	 </div>
			  	 <button type="submit" id="submit-button" class="btn btn-primary">submit</button>
			</form>
		</div>
	</div>
	<!-- LOGIN -->
</body>
</html>