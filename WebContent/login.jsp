<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<title>Noted | Login</title>
</head>
<body>
	<div class="outer-user">
		<div class="container"> <!-- login -->
			<h1>login</h1>
			<form name="login" method="POST" action="ValidateLogin">
				<div class="form-group">
			    		<label for="loginEmail">Email address</label>
			    		<input type="email" class="form-control" id="loginEmail" aria-describedby="emailHelp" placeholder="Enter email">
			  	</div>
			  	<div class="form-group">
			    		<label for="loginPassword">Password</label>
			    		<input type="password" class="form-control" id="loginPassword" placeholder="Password">
			  	</div>
			  	<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>