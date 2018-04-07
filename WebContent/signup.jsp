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
	<div class="outer-user">
		<div class="container"> <!-- signup -->
			<h1>Sign Up</h1>
			<form name="signup" method="POST" action="ValidateSignup">
				<div class="form-row">
				    	<div class="col">
				      	<input type="text" class="form-control" id="fname" placeholder="First name">
				    </div>
				    <div class="col">
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
</body>
</html>