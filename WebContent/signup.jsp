<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<title>Noted | Sign Up</title>
</head>
<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-dark bg-dark">
		  <a class="navbar-brand" href="#">noted</a>
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
				    		<label for="inputEmail4">Email</label>
				      	<input type="text" class="form-control" id="lname" placeholder="Last name">
				    </div>
			  	</div>
				<div class="form-row">
			    		<div class="form-group col-md-6">
				      	<label for="inputEmail4">Email</label>
				      	<input type="email" class="form-control" id="inputEmail4" placeholder="Email">
				    </div>
				    <div class="form-group col-md-6">
				      	<label for="inputPassword4">Password</label>
				      <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
				    </div>
			  	</div>
			  	<div class="form-group">
				    	<label for="inputAddress">Address</label>
				    	<input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
			  	</div>
			  	<div class="form-group">
				    	<label for="inputAddress2">Address 2</label>
				    	<input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
			  	</div>
			  	<div class="form-row">
			    		<div class="form-group col-md-6">
				      	<label for="inputCity">City</label>
				      	<input type="text" class="form-control" id="inputCity">
				    </div>
				    <div class="form-group col-md-4">
				      	<label for="inputState">State</label>
				      	<select id="inputState" class="form-control">
				        			<option selected>Choose...</option>
				        		<option>...</option>
				      	</select>
			    		</div>
				    <div class="form-group col-md-2">
				      <label for="inputZip">Zip</label>
				      <input type="text" class="form-control" id="inputZip">
				    </div>
			  	</div>
			  	<div class="form-group">
			    		<div class="form-check">
				      	<input class="form-check-input" type="checkbox" id="gridCheck">
			      		<label class="form-check-label" for="gridCheck">
				        		Check me out
				      	</label>
				    </div>
			  	</div>
			  	<button type="submit" class="btn btn-primary">Sign in</button>
			</form>
		</div>
	</div>
	<!-- SIGNUP -->
</body>
</html>