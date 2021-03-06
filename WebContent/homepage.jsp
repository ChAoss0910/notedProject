<%@page import="notedProject.User"%>
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
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
  	<%
  	String username = request.getParameter("username");
	String profilePic = request.getParameter("url");
	boolean guest = true;
	
	if (username == null){ 
	} else {
		if (!username.equalsIgnoreCase("") && !username.equalsIgnoreCase("null")){
			guest = false;
		}
	}
  	%>
  	<script>
	  	var myVideo =  iframe.getElementById('myVideo'); 
	  	myVideo.mute();
  	</script>
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
		#profileButton {
			background-color: #262626;
			height: 50px;
			width: 50px;
			padding: 0px;
			outline: 0;
		}
		#profileButton:focus, #profileButton:active {
		   outline: none;
		   border: orange; 
		   box-shadow: none;
		}
		.dropdown-menu, .dropdown-item {
			width: 70px;
			color: orange;
			text-align: center; 
			width: 10px;
		}
		.dropdown-item:hover {
			text-decoration: none; 
			font-weight: bold;
			color: orange;
		}
		.space {
			height: 500px;
		}
		#top {
			background-image: url("images/notebook.jpg");
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
	      	<% String toHome = "homepage.jsp?username="+username+"&url="+profilePic; %>
	      	<a class="navbar-brand" href=<%= toHome %>>noted</a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		      	<% String toNewGame = "newGame.jsp?username="+username+"&url="+profilePic; %>
		        <li><a href=<%= toNewGame %>>New Game</a></li>
		        <% String toAbout = "about.jsp?username="+username+"&url="+profilePic; %>
		        <li><a href=<%= toAbout %>>About</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right" id="right-nav">
		      	<% if (guest) { %>
		        		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
		     	<% } else { %>
		     		<% String pass = "userProfile.jsp?username=" + username + "&url=" + profilePic; %>
					<div class="dropdown show">
					  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="profileButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    <img src=<%= profilePic %> width="100%"/>
					  </a>
					  <div class="dropdown-menu" aria-labelledby="profileButton">
					    <a class="dropdown-item" href=<%=pass%>>My Profile</a><br>
					    <a class="dropdown-item" href="homepage.jsp">Log Out</a>
					  </div>
					</div>
		     	<% } %>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		
		<div class="jumbotron" id="top">
		  <div class="container text-center">
		    <h1>noted</h1>      
		    <p>Learn through friendly competition</p>
		    <p class="lead">
		    <% String toJoinGame = "joinGame.jsp?username="+username+"&url="+profilePic; %>
	    	<a class="btn btn-primary btn-lg"  id="submit-button" href=<%=toJoinGame%> role="button">Join a Game</a>
	    	<% if (!guest) { %>
		    	<a class="btn btn-primary btn-lg"  id="submit-button" href=<%=toNewGame%> role="button">Start a Game</a>
		  	<% } %>		  	
		  </div>
		</div>
		  
		<div class="container-fluid bg-3 text-center">    
		  <h3>Featured Notes</h3><br>
		  <% if (!guest) { %>
			  <% String toNoteExplore = "notePage.jsp?username="+username+"&url="+profilePic; %>
			  <a class="btn btn-primary btn-lg"  id="submit-button" href=<%=toNoteExplore%> role="button">Explore</a>
		  <% } %>
		  <div class="row" style="padding-top:20px;">
			  <div class="col-sm-3"> 
				  <div class="thumbnail">
				  	<p>CSCI 360- Statistical Learning</p>
			      	<a href="images/note1.png">
			        	<img src="images/note1.png"style="width:100%">
		      		</a>
			      </div>
		      </div>
		      <div class="col-sm-3"> 
				  <div class="thumbnail">
				  	<p>CSCI 360- EM Algorithm</p>
			      	<a href="images/note2.png">
			        	<img src="images/note2.png"style="width:100%">
		      		</a>
			      </div>
		      </div>
		      <div class="col-sm-3"> 
				  <div class="thumbnail">
				  	<p>CSCI 360- Making Simple Decisions</p>
			      	<a href="images/note4.png">
			        	<img src="images/note4.png"style="width:100%">
		      		</a>
			      </div>
		      </div>
		      <div class="col-sm-3"> 
				  <div class="thumbnail">
				  	<p>CSCI 360- Perception</p>
			      	<a href="images/note3.png">
			        	<img src="images/note3.png"style="width:100%">
		      		</a>
			      </div>
		      </div>
	      </div>
	      <div class="row">
	      	<div class="col-sm-3"> 
				  <div class="thumbnail">
				  	<p>CSCI 201- Inheritance</p>
			      	<a href="images/note5.png">
			        	<img src="images/note5.png"style="width:100%">
		      		</a>
			      </div>
		      </div>
		      <div class="col-sm-3"> 
				  <div class="thumbnail">
				  	<p>CSCI 201- Exception Handling</p>
			      	<a href="images/note6.png">
			        	<img src="images/note6.png"style="width:100%">
		      		</a>
			      </div>
		      </div>
		      <div class="col-sm-3"> 
				  <div class="thumbnail">
				  	<p>CSCI 201- Threading</p>
			      	<a href="images/note7.png">
			        	<img src="images/note7.png"style="width:100%">
		      		</a>
			      </div>
		      </div>
		      <div class="col-sm-3"> 
				  <div class="thumbnail">
				  	<p>CSCI 201- Java Servlets</p>
			      	<a href="images/note8.png">
			        	<img src="images/note8.png"style="width:100%">
		      		</a>
			      </div>
		      </div>
	      </div>
		<br><br>
		<footer class="container-fluid text-center">
		  <p>&#0169; 2018 Noted All Rights Reserved.</p>
		</footer>
	</body>
</html>