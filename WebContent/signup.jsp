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
	<%
	String name_err = (String) request.getAttribute("name_err");
	String username_err = (String) request.getAttribute("username_err");
	String password_err = (String) request.getAttribute("password_err");
	String email_err = (String) request.getAttribute("email_err");
	String usc_err = (String) request.getAttribute("usc_err");
	String url_err = (String) request.getAttribute("url_err");
	
	String firstName = (String) request.getAttribute("firstName");
	String lastName = (String) request.getAttribute("lastName");
	String username = (String) request.getAttribute("username");
	String password = (String) request.getAttribute("password");
	String email = (String) request.getAttribute("email");
	String url = (String) request.getAttribute("url");
	%>
	<style>
		.error-msg {
			color: red;
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
			    		<% if (firstName == null || firstName.equalsIgnoreCase("")) { %>
			    			<input type="text" class="form-control" id="fname" name="firstname" placeholder="First name">
			    		<% } else { %>
			    			<input type="text" class="form-control" id="fname" name="firstname" value=<%=firstName%>>
			    		<% } %>
				   		<% if (name_err != null) { %>
			    			<div class="error-msg"><%=name_err%></div>
			    		<% } %>
				    </div>
				    <div class="form-group col-md-6">
			    		<label for="lname">Last name</label>
			    		<% if (firstName == null || firstName.equalsIgnoreCase("")) { %>
			    			<input type="text" class="form-control" id="lname" name="lastname" placeholder="Last name">
			    		<% } else { %>
			    			<input type="text" class="form-control" id="lname" name="lastname" value=<%=lastName%>>
			    		<% } %>
				   		<% if (name_err != null) { %>
			    			<br>
			    		<% } %>
				    </div>
			  	</div>
				<div class="form-row">
			    		<div class="form-group col-md-4">
				      	<label for="signupEmail">Email</label>
				      	<% if (email == null || email.equalsIgnoreCase("")) { %>
			    			<input type="email" class="form-control" id="signupEmail" name="email" placeholder="Email">
			    		<% } else { %>
			    			<input type="email" class="form-control" id="signupEmail" name="email" value=<%=email%>>
			    		<% } %>
				    	<% if (email_err != null) { %>
				    		<div class="error-msg"><%=email_err%></div>
				    	<% } %>
				    	<% if (usc_err != null) { %>
				    		<div class="error-msg"><%=usc_err%></div>
				    	<% } %>
				    </div>
				  	<div class="form-group col-md-4">
					    <label for="signupUsername">Username</label>
					    <% if (username == null || username.equalsIgnoreCase("")) { %>
			    			<input type="text" class="form-control" id="signupUsername" name="username" aria-describedby="usernameHelp" placeholder="Username">
			    		<% } else { %>
			    			<input type="text" class="form-control" id="signupUsername" name="username" aria-describedby="usernameHelp" value=<%=username%>>
			    		<% } %>
					    <small id="usernameHelp" class="form-text text-muted">This will be public to other players.</small>
				  		<% if (username_err != null) { %>
				    		<div class="error-msg"><%=username_err%></div>
				    	<% } %>
				  	</div>
				  	<div class="form-group col-md-4">
			    		<label for="signupPassword">Password</label>
				      	<% if (password == null || password.equalsIgnoreCase("")) { %>
			    			<input type="password" class="form-control" id="signupPassword" name="password" placeholder="Password">
			    		<% } else { %>
			    			<input type="password" class="form-control" id="signupPassword" name="password" value=<%=password%>>
			    		<% } %>
				    	<% if (password_err != null) { %>
				    		<div class="error-msg"><%=password_err%></div>
				    	<% } %>
				    </div>
			  	</div>
			  	<div class="form-row">
				  	<div class="form-group col-md-12">
				  		<label for="signupURL">URL for Profile Picture</label>
				      	<% if (url == null || url.equalsIgnoreCase("")) { %>
			    			<input type="text" class="form-control" id="signupURL" name="url" placeholder="ex: https://www.pexels.com/search/cat/">
			    		<% } else { %>
			    			<input type="text" class="form-control" id="signupURL" name="url" value=<%=url%>>
			    		<% } %>
				    	<% if (url_err != null) { %>
				    		<div class="error-msg"><%=url_err%></div>
				    	<% } %>
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