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
	<title>noted | game session</title>
	<%
	String username = request.getParameter("username");
	String profilePic = request.getParameter("url");
	boolean guest = true;
	
	if (username == null){
	} else {
		if (!username.equalsIgnoreCase("")){
			guest = false;
		}
	}
	%>
	<style>
		/* Remove the navbar's default margin-bottom and rounded borders */ 
	    .navbar {
	      margin-bottom: 0;
	      border-radius: 0;
	    }
		table {
	   	border: 5px solid gold;
	   	
	   	.border-radius(@radius){
	    .border-top-radius(@radius);
	    .border-right-radius(@radius);
	    .border-bottom-radius(@radius);
	    .border-left-radius(@radius);
	}
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
	        <li><a href="newGame.jsp">New Game</a></li>
	        <% String toAbout = "about.jsp?username="+username+"&url="+profilePic; %>
	        <li><a href="about.jsp">About</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<!-- NAVBAR -->
	
	
	<!-- Quiz UX -->
	<div class="quiz-frame">
		<div class="container">
			<h1>Sample Quiz Game 1:</h1>
			
			<table class="table">
			<thead>
				<tr>
          			<th>Question #1: Who's the professor for CS-201?
   			 </thead>
			<tbody>
				<tr><td><button id="choice1" class="btn btn-block btn-default editbtn">Choice #1</button></td></tr>
				<tr><td><button id="choice2" class="btn btn-block btn-default editbtn">Choice #2</button></td></tr>
				<tr><td><button id="choice3" class="btn btn-block btn-default editbtn">Choice #3</button></td></tr>
				<tr><td><button id="choice4" class="btn btn-block btn-default editbtn">Choice #4</button></td></tr>
			</tbody>
			</table>
		</div>
	<!-- Quiz UX -->
		
		
		
<!-- 		COUNTDOWN TIMER -->
		<div class="container">
			<h3>Time Left:</h3>
  			<progress value="0" max="10" id="progressBar"></progress>
		</div>
	</div>
	
	<script>
	//-------------------------TIMER-----------------------------------//
	var timeleft = 10;
	var downloadTimer = setInterval(function(){
	  document.getElementById("progressBar").value = 10 - --timeleft;
	  if(timeleft <= 0)
	    clearInterval(downloadTimer);
	},1000);
	
	
	//-----------------------Quiz UX----------------------------------//
	
	//Timer UI
	$(document).ready(function(){
    	$('.editbtn').click(function(){
        	console.log("Time left: ");
        	console.log(timeleft);
        	alert("Answered in " + timeleft + " seconds.");
        	
    	});
	});
	
	//Choices
	$(document).ready(function(){
    		document.getElementById('choice1').innerText = 'This is option 1';
    		document.getElementById('choice2').innerText = 'This is option 2';
    		document.getElementById('choice3').innerText = 'This is option 3';
    		document.getElementById('choice4').innerText = 'This is option 4';
	});
	
	//-----------------------Helper Functions--------------------------//
	
	
	</script>
</body>
</html>