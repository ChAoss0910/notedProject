<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	
	<title>noted | Start Game</title>
</head>
<body>	
	<!-- NAVBAR -->
	<nav class="navbar navbar-dark bg-dark">
		  <a class="navbar-brand" href="homepage.jsp">noted</a>
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
				      	<input type="text" class="form-control" id="gameName" aria-describedby="gameNameHelp" placeholder="ex: Best Quiz">
				    		<small id="gameNameHelp" class="form-text text-muted">Please only use letters and numbers.</small>
				    </div>
				    <div class="form-group col-md-2">
				    		<label for="numPlayers">Num Players</label>			    			
					  	<select id="numPlayers">
						    <option val="">Players</option>
						    <option val="2">2</option>
						    <option val="3">3</option>
						    <option val="4">4</option>
						</select>
						
			  		</div>
			  		<div class="form-group col-md-2">
			  			<label for="selectClass">Select Class</label>
						<select id="selectClass">
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
			  	<button type="submit" id="submit-button" class="btn btn-primary">Create Game</button>
		  	</form>
		</div>
	</div>
</body>
</html>