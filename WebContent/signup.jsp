<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Noted | Sign Up</title>
</head>
<body>
	<div id="outer">
		<div class="container"> <!-- signup -->
			<h1>Sign Up</h1>
			<form name="signup" method="POST" action="ValidateSignup">
				<div class="form-group">
			    		<label for="signupEmail">Email address</label>
			    		<input type="email" class="form-control" id="loginEmail" aria-describedby="emailHelp" placeholder="Enter email">
			  	</div>
			  	<div class="form-group">
			    		<label for="signupPassword">Password</label>
			    		<input type="password" class="form-control" id="signupPassword" placeholder="Password">
			  	</div>
			  	<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>