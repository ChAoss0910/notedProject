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
	<title>noted | login</title>
	<%
	String name_err = (String) request.getAttribute("name_err");
	String password_err = (String) request.getAttribute("password_err");
	String login_err = (String) request.getAttribute("login_err");
	String username = (String) request.getAttribute("username");
	String password = (String) request.getAttribute("password");
	%>
	<style>
		/* Remove the navbar's default margin-bottom and rounded borders */ 
	    .navbar {
	      margin-bottom: 0;
	      border-radius: 0;
	    }
		#signup {
			text-align: center;
		}
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
	<!-- LOGIN -->
	<div class="outer-user">
		<div class="container">
			<h1>Login</h1>
			<form name="login" method="POST" action="ValidateLogin">
				<div class="form-row">
					<div class="form-group col-md-6">
			    		<label for="loginUsername">Username</label>
			    		<% 
			    		String u_placeholder = "";
			    		if (username == null || username.equalsIgnoreCase("")) { %>
			    			<input type="text" class="form-control" id="loginUsername" name ="username" placeholder="Username">
			    		<% } else { %>
			    			<input type="text" class="form-control" id="loginUsername" name ="username" value=<%=username%>>
			    		<% } %>
			    		<% if (name_err != null) { %>
			    			<div class="error-msg">Please enter a username</div>
			    		<% } else { %>
			    			<br>
			    		<% } %>
				  	</div>
				  	<div class="form-group col-md-6">
			    		<label for="loginPassword">Password</label>
			    		<% if (password == null || password.equalsIgnoreCase("")) { %>
			    			<input type="password" class="form-control" id="loginPassword" name="password" placeholder="Password">
			  			<% } else { %>
			  				<input type="password" class="form-control" id="loginPassword" name="password" value=<%=password%>>
			  			<% } %>
			  			<% if (password_err != null) { %>
			  				<div class="error-msg">Please enter a password</div>
			  			<% } %>
			  			<% if (login_err != null) { %>
			  				<div class="error-msg">Incorrect password</div>
			  			<% } %>
				  	</div>
			  	 </div>
				<div class="form-row">
				  	<div class="form-group col-md-12">
				  		<button type="submit" id="submit-button" class="btn btn-primary">Log In</button>
			  		</div>
		  		</div>
	  		</form>
	  		<div class="row"  id="signup">
	  			<div class="col-md-12">
	  				No account? <a href="signup.jsp" style="color: #ffa31a;">Sign up</a> here.
	  			</div>
	  		</div>
		</div>
	</div>
	<!-- LOGIN -->
</body>
</html>