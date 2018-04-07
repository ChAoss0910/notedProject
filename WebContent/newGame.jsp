<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<title>noted | Start Game</title>
	<style>
		.outer-game {
			margin-top: 100px;
		}
		#title {
			padding: 5px 0px;
		}
		#classOption {
			background-color: #ffa31a;
		}
	</style>
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
	<div class="outer-game">
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
				    <div class="form-group col-md-3">
				    		<label for="numPlayers">Number of Players</label>
				    		<select class="form-control" id="numPlayers">
					      	<option>2</option>
					      	<option>3</option>
					      	<option>4</option>
			    			</select>
			  		</div>
			  		<div class="form-group col-md-3">
			  		
			  			<div class="dropdown">
					  		<button class="btn btn-secondary dropdown-toggle" type="button" id="numPlayers" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    		Number of Players
					  		</button>
						  	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    		<a class="dropdown-item">2</a>
						    		<a class="dropdown-item">3</a>
						    		<a class="dropdown-item">4</a>
						  	</div>
						</div>
			  		</div>
			  	</div>
		  	</form>
		</div>
	</div>
</body>
</html>