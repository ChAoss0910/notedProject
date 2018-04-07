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