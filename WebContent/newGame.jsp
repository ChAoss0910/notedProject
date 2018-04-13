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
	<script>
		function submit(){
			
			ducument.getElementById("newGame").submit();
		}
		
	</script>
	<title>noted | Start Game</title>
	<%
		String username = "user1";
		String profilePic = "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
	%>
	<style>
		.navbar-right img {
			margin-top: 5px;
			width: 40px;  
			height: 40px;
			border-radius: 20%; 
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
	        <li class="active"><a href="newGame.jsp">New Game</a></li>
	        <li><a href="about.jsp">About</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right" id="right-nav">
	      	<% String pass = "userProfile.jsp?username=" + username + "&url=" + profilePic; %>
     		<a id="myProfile" href=<%=pass%>><img src=<%= profilePic %> /></a>
	      </ul>
	    </div>
	  </div>
	</nav>
	<!-- NAVBAR -->
	<!-- START GAME -->
	<div class="new-game">
		<div class="container"> 
			<div id="title">
				<h1>Start a Game</h1>
			</div>
			<form name="newGame" method="POST" action="ValidateNewGame">
				<div class="form-row">
				    	<div class="form-group col-md-6"">
				    		<label for="gameName">Game Name</label>
				      	<input type="text" class="form-control" id="gameName" name="gameName" aria-describedby="gameNameHelp" placeholder="ex: Best Quiz">
				    		<small id="gameNameHelp" class="form-text text-muted">Please only use letters and numbers.</small>
				    </div>
				    <div class="form-group col-md-3">
				    		<label for="numPlayers">Num Players</label>			    			
					  	<select id="numPlayers" name="numPlayers">
						    <option val="">Players</option>
						    <option val="2">2</option>
						    <option val="3">3</option>
						    <option val="4">4</option>
						</select>
						
			  		</div>
			  		<div class="form-group col-md-3">
			  			<label for="selectClass">Select Class</label>
						<select id="selectClass" name="selectClass">
						    <option val="">Class</option>
						    <option val="csci109">CSCI 109</option>
						    <option val="csci103">CSCI 103</option>
						    <option val="csci104">CSCI 104</option>
						    <option val="csci170">CSCI 170</option>
						    <option val="csci201">CSCI 201</option>
						    <option val="csci270">CSCI 270</option>
						</select>
			  		</div>
			  	</div>
			  	<div class="form-row"> 
			  		<div class="form-group col-md-12">
			  			<a class="btn btn-primary btn-lg"  id="submit-button"  role="button" onclick="submit();">Create Game</a>
			  			
		  			</div>
		  		</div>
		  	</form>
		</div>
	</div>
</body>
</html>
