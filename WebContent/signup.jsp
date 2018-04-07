<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<title>noted | sign up</title>
</head>
<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-dark bg-dark">
		  <a class="navbar-brand" href="homepage.jsp">noted</a>
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
	<!-- SIGNUP -->
	<div class="outer-user">
		<div class="container"> 
			<h1>Sign Up</h1>
			<form name="signup" method="POST" action="ValidateSignup">
				<div class="form-row">
				    	<div class="col">
				    		<label for="fname">First name</label>
				      	<input type="text" class="form-control" id="fname" placeholder="First name">
				    </div>
				    <div class="col">
				    		<label for="lname">Last name</label>
				      	<input type="text" class="form-control" id="lname" placeholder="Last name">
				    </div>
			  	</div>
				<div class="form-row">
			    		<div class="form-group col-md-6">
				      	<label for="signupEmail">Email</label>
				      	<input type="email" class="form-control" id="signupEmail" placeholder="Email">
				    </div>
				    
			  	</div>
			  	<div class="form-row" >
				  	<div class="form-group col-md-6">
					    <label for="signupUsername">Username</label>
					    <input type="text" class="form-control" id="signupUsername" aria-describedby="usernameHelp" placeholder="Username">
					    <small id="usernameHelp" class="form-text text-muted">This will be public to other players.</small>
				  	</div>
				  	<div class="form-group col-md-6">
				      	<label for="signupPassword">Password</label>
				      <input type="password" class="form-control" id="signupPassword" placeholder="Password">
				    </div>
			  	</div>
			  	<button type="submit" id="submit-button" class="btn btn-primary">submit</button>
			</form>
		</div>
	</div>
	<!-- SIGNUP -->
</body>
</html>