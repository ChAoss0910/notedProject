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
		function submit (){
			document.getElementById("newGame").submit();
		}
		function validate(){
			var xhttp =new XMLHttpRequest();
			xhttp.open("GET", "ValidateNewGame?gameName="+document.newGame.gameName.value +
					"&numPlayers=" + document.newGame.numPlayers.value+"&selectClass="+document.newGame.selectClass.value, false);
			xhttp.send();
			console.log(xhttp.responseText.trim());
			if(xhttp.responseText.trim().length > 0){
				alert("Please complete the form!");
				return false;
			}
			return true;
			/* else{
				
				return false;
			} */
			
			/* ducument.getElementById("newGame").submit(); */
			
			
		}
		
	</script>
	<title>noted | Start Game</title>
	<style>
		/* Remove the navbar's default margin-bottom and rounded borders */ 
	    .navbar {
	      margin-bottom: 0;
	      border-radius: 0;
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
	<!-- NAVBAR -->
	<!-- START GAME -->
	<div class="new-game">
		<% if (guest) { %>
			<div id="guest" style="text-align:center;">
				<h1>You must be logged in to start a game.</h1>
				<a class="btn btn-primary btn-lg"  id="submit-button" href="login.jsp" role="button">Log In</a>
			</div>
		<% } else { %>
		<div id="user">
			<div class="container"> 
				<div id="title">
					<h1>Start a Game</h1>
				</div>
				<form name="newGame" id = "newGame" method="GET" action = "gameSession.jsp" onSubmit = "return validate();">
					<div class="form-row">
					    	<div class="form-group col-md-6">
					    		<label for="gameName">Game Name</label>
					      	<input type="text" class="form-control" id="gameName" name="gameName" aria-describedby="gameNameHelp" placeholder="ex: Best Quiz">
					    		<small id="gameNameHelp" class="form-text text-muted">Please only use letters and numbers.</small>
					    </div>
					    <div class="form-group col-md-3">
					    		<label for="numPlayers">Num Players</label>			    			
						  	<select id="numPlayers" name="numPlayers">
							    <option val="">Players</option>
							    <option val="1">1</option>
							    <option val="2">2</option>
							    <option val="3">3</option>
							    <option val="4">4</option>
							</select>
							
				  		</div>
				  		<div class="form-group col-md-3">
				  			<label for="selectClass">Select Class</label>
							<select id="selectClass" name="selectClass">
							    <option val="">Class</option>
							    <option val="csci109">CSCI 201</option>
							    <option val="csci103">CSCI 360</option>
							</select>
				  		</div>
				  	</div>
				  	<div class="form-row"> 
				  		<div class="form-group col-md-12">
				  			<a  href = "newGame.jsp" id="submit-button"  role="button"><button class="btn btn-primary btn-lg"  id="submit-button" onclick=store()>Create Game</button></a>
				  			
			  			</div>
			  		</div>
			  	</form>
			</div>
		</div>
		<% } %>
	</div>
</body>
<script type="text/javascript">
	function store() {
		var e = document.getElementById("selectClass");
		var classTitle = e.options[e.selectedIndex].text;
		var c = document.getElementById("numPlayers");
		var num = c.options[c.selectedIndex].text;
		var roomName = document.getElementById("gameName");
		
		localStorage.setItem("num", num);
		localStorage.setItem("roomName", roomName);
		localStorage.setItem("classTitle", classTitle);
		localStorage.setItem("command", "start");
		console.log(num);
		console.log(roomName);
		console.log(classTitle);
	} 
</script>
</html>
