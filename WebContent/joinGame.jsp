<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		        <li><a href="login.jsp">Login</a></li>
		        <li><a href="signup.jsp">Signup</a></li>
		        <li><a href="about.jsp">About</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		<div class="jumbotron">
		  <div class="container text-center">
		    <h1>Select a Game</h1>      
		    <p class="lead">
		    	<ul class="list-group">
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				    CSCI-201 Midterm
				    <span class="badge badge-primary badge-pill">Players: 1</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				    CSCI-104 Quiz 2
				    <span class="badge badge-primary badge-pill">Players: 3</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				   PYSC-442 Quiz 8
				    <span class="badge badge-primary badge-pill">Players: 2</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				   CSCI-104 Quiz 2
				    <span class="badge badge-primary badge-pill">Players: 3</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				   MATH-224 Quiz 1
				    <span class="badge badge-primary badge-pill">Players: 2</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				   CSCI-102 Quiz 3
				    <span class="badge badge-primary badge-pill">Players: 2</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				   PYSC-442 Quiz 5
				    <span class="badge badge-primary badge-pill">Players: 1</span>
				  </li>
				</ul>
	    	<a class="btn btn-primary btn-lg"  id="submit-button" href="#" role="button">Join Game</a>
	  </p>
		  </div>
		</div>
		  
		<div class="container-fluid bg-3 text-center">    
		  <h3>Featured Notes</h3><br>
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
		
		
		<footer class="container-fluid text-center">
		  <p>Footer Text</p>
		</footer>
	</body>
</html>