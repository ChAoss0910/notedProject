<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.io.*"%>
<%@ page import= "notedProject.LoadDatabase" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<meta name="description" content="" />
			<meta name="keywords" content="" />
			<link rel="stylesheet" href="assets/css/main.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
  	<%
  	boolean guest = false;
  	String profilePic = "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  	%>
  	<style>
	    /* Remove the navbar's default margin-bottom and rounded borders */ 
	    .navbar {
	      margin-bottom: 0;
	      border-radius: 0;
	    }
	    /* Add a gray background color and some padding to the footer */
	    footer {
	      background-color: #f2f2f2;
	      padding: 25px;
	    }
	    .navbar-right img {
	    		margin-top: 5px;
	    		width: 40px; 
	    		height: 40px;
	    		border-radius: 20%;
	    } 
  	</style> 
	</head>
	<body>
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
		      <ul class="nav navbar-nav navbar-right">
		      	<% if (guest) { %>
		        		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
		     	<% } else { %>
		     		<a id="myProfile" href="userProfile.jsp">
		     			<img src=<%= profilePic %> />
		     		</a>
		     	<% } %>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		<div class="jumbotron">
		  <div class="container text-center">
		    <h1>noted</h1>      
		    <p>Learn through friendly competition</p>
		    <p class="lead">
	    	<a class="btn btn-primary btn-lg"  id="submit-button" href="joinGame.jsp" role="button">Join a Game</a>
	    	<a class="btn btn-primary btn-lg"  id="submit-button" href="newGame.jsp" role="button">Start a Game</a>
		  </div>
		</div>
		  
		<div class="container-fluid bg-3 text-center">    
		  <h3>Featured Notes</h3><br>
		  <a class="btn btn-primary btn-lg"  id="submit-button" href="notePage.jsp" role="button">Explore</a>
		  <div class="row">
		    <div class="col-sm-3">
		      <p>Note #1</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3"> 
		      <p>Note #2</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3"> 
		      <p>Note #3</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3">
		      <p>Note #4</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		  </div>
		</div><br>
		
		<div class="container-fluid bg-3 text-center">    
		  <div class="row">
		    <div class="col-sm-3">
		      <p>Note #5</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3"> 
		      <p>Note #6</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3"> 
		      <p>Note #7</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		    <div class="col-sm-3">
		      <p>Note #8</p>
		      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
		    </div>
		  </div>
		</div><br><br>
		
		<footer class="container-fluid text-center">
		  <p>&#0169; 2018 Noted All Rights Reserved.</p>
		</footer>
	</body>
</html>