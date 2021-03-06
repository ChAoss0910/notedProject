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
	  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
	  <link rel="stylesheet" type="text/css" href="topLayer.css" />
	<title>noted | game session</title>
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
	        <% if (guest) { %>
	        		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
	     	<% } else { %>
	     		<% String pass = "userProfile.jsp?username=" + username + "&url=" + profilePic; %>
					<div class="dropdown show">
					  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="profileButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    <img src=<%= profilePic %> width="100%" style="border-radius: 10%; width: 50px; height: 50px;"/>
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
	
	
	<!-- Quiz UX -->
	<div class="quiz-frame">
		<div class="container">
			<h1 id="gameTitle">Sample Quiz Game 1:</h1>
			
			<button id="startButton" onclick="gameStartFunc();" class="btn">Start Game</button>
			
			<table class="table" style="padding: 30px 10px;">
			<thead>
				<tr>
          			<th><div id="questionDisplay">Initializing Quiz...</div>
   			 </thead>
			<tbody>
				<tr><td><button onclick="updateChoice(1);" id="choice1" class="btn btn-block btn-default editbtn">Choice #1</button></td></tr>
				<tr><td><button onclick="updateChoice(2);" id="choice2" class="btn btn-block btn-default editbtn">Choice #2</button></td></tr>
				<tr><td><button onclick="updateChoice(3);" id="choice3" class="btn btn-block btn-default editbtn">Choice #3</button></td></tr>
				<tr><td><button onclick="updateChoice(4);" id="choice4" class="btn btn-block btn-default editbtn">Choice #4</button></td></tr>
			</tbody>
			</table>
			<div id = "endContainer" style = "display : inline-block;" class="container">
				<div class="container">
					<h3>Time Left:</h3>
  						<progress value="0" max="10" id="progressBar"></progress>
  					<div class="container">
						<h3>Score:</h3>
						<div id="score"></div>
					</div>
				</div>
			</div>
		</div>
	<!-- Quiz UX -->
	<!-- 		COUNTDOWN TIMER -->
		
		
	
	<!-- Testing -->
	<div id = "unanswered"></div>
	<div id = "timer" class="topLayer"></div>
	
	<div id = "right" class="topLayer response">CORRECT!</div>
	<div id = "wrong" class="topLayer response">WRONG!</div>
	<div id = "late" class="topLayer response">YOU'RE LAST</div>
	<div id = "waiting" class="topLayer response"></div>
	<div id = "messages"></div>
	</div>
</body>
	<script>
	//-------------------------TIMER-----------------------------------//
	var timerId;
	var answered = false;
	var correct = false;
	
	function showRightOrWrong(response) {
		var part;
		if (response == "WRONG!") {
			part = document.getElementById('wrong');
		} else if (response == "CORRECT!"){
			correct = true;
			part = document.getElementById('right');
		} else if (response == "LATE") {
			part = document.getElementById('late');
			disableChoice();
		}
		
		if (answered == true) {
			if (response == "LATE") {
				console.log('answered');
				return;
			}
		}
		part.style.display = "block";
		var timeCount = setInterval(function() {
			part.style.display = "none";
			clearInterval(timeCount);
		}, 5000);
		
		
	}

	function startGameCountDown() {
		document.getElementById('waiting').style.display = "none";
		var count = 3;
		var timerDiv = document.getElementById('timer');
		var font = 150;
		
		var fontCount = setInterval(function() {
			font -= 0.2;
			if (font <= 140) {
				font = 150;
			}
			timerDiv.style.fontSize = font.toString() + "px";
		}, 20);
		
		var timeCount = setInterval(function() {
			if (count == 0) {
				timerDiv.style.display = "none";
				clearInterval(timeCount);
				
				clearInterval(fontCount);
				
				countdown();
				sendNextQuesMessage();
				
			}
			timerDiv.innerText = count;
			count--;
			
		}, 1000);
	}
	
	function countdown() {

		document.getElementById('choice1').disabled = false;
    	document.getElementById('choice2').disabled = false;
    	document.getElementById('choice3').disabled = false;
    	document.getElementById('choice4').disabled = false;
    	
	    var count = 10;
	    timerId = setInterval(function() {
	        count--;
	        document.getElementById("progressBar").value = 10 - count;

	        if(count == 0) {
	        	 //Enable buttons
	        	correct = false;
	        	answered = false;
	    	    document.getElementById('choice1').disabled = false;
    			document.getElementById('choice2').disabled = false;
    			document.getElementById('choice3').disabled = false;
    			document.getElementById('choice4').disabled = false;
    			document.getElementById('wrong').style.display = "none";
    			document.getElementById('right').style.display = "none";
    			document.getElementById('late').style.display = "none";
	        	
	            currQ++;
	            sendNextQuesMessage();
	            
	            count = 10;
	            document.getElementById("progressBar").value = 0;
	        }
	    }, 1000);
	}
	
	function stopTimer() {
		console.log('Stop timer called') ;
		clearInterval(timerId);
	}
	
	
	//-----------------------Quiz UX----------------------------------//
	//After losing 3 hours
	
	//Global Variables
	var roomName = "Sample Quiz 1";
	var classTitle = "CS-201";
	var currQ = 1;
	var numPlayer = 1;
	
	
	var choice = 0; //always initialized to 0; changes based on the user's answer
	var option1 = "Choice A";
	var option2 = "Choice B";
	var option3 = "Choice C";
	var option4 = "Choice D";
	
	//buttons start off as disabled
	disableChoice();

	
	//-----------------------Helper Functions (Quiz UI) --------------------------//
	
	
	//When an option is clicked, the choice is updated and stored
	function updateChoice(choiceVal){
		choice = choiceVal;
		var timeleft = document.getElementById("progressBar").value;
		console.log("Time left: ");
    	console.log(timeleft);
    	answered = true;
    	//alert("Answered: " + choice + " in " + timeleft + " seconds.");
    	
    	//sends answer to Game Server
    	sendAnswerMessage(choice, 15 - timeleft);
    	
    	//currQ++;
    	console.log("CurrentQuestion ID is: "  +currQ);
    	
    	//Disable all buttons
    	disableChoice();
	}
	
	function disableChoice() {
		document.getElementById('choice1').disabled = true;
    	document.getElementById('choice2').disabled = true;
    	document.getElementById('choice3').disabled = true;
    	document.getElementById('choice4').disabled = true;
	}
	
	function enableChoice() {
		document.getElementById('choice1').disabled = false;
    	document.getElementById('choice2').disabled = false;
    	document.getElementById('choice3').disabled = false;
    	document.getElementById('choice4').disabled = false;
	}
	
	//Choices
	$(document).ready(function(){
    		document.getElementById('choice1').innerText = option1;
    		document.getElementById('choice2').innerText = option2;
    		document.getElementById('choice3').innerText = option3;
    		document.getElementById('choice4').innerText = option4;
	});
	
	//-----------------------Helper Functions (Networking) --------------------------//
	
	function gameStartFunc(){
		document.getElementById('messages').style.display = 'none';
		document.getElementById('startButton').disabled = true;
		var theCommand = sessionStorage.getItem("command");
		if (theCommand == null) {
			sendInitialMessage();
		} else {
			console.log("Read from local storage: " + theCommand);
			
			if (theCommand == 'start') {
				
				var num = sessionStorage.getItem("num");
				var rName = sessionStorage.getItem("roomName");
				var title = sessionStorage.getItem("classTitle");
				console.log("num is " + num);
				console.log("room is " + rName);
				console.log("title is " + title);
				
				roomName = rName;
				classTitle = title;
				numPlayer = num;
				sendInitialMessage();
				
			} else if (theCommand == 'join') {
				var rName = get('rName');
				var cTitle = get('classTitle');
				classTitle = cTitle;
				roomName = rName;
				numPlayer = 2;
				console.log("room is" + rName);
				sendJoinMessage(roomName);
				
			}
			document.getElementById('gameTitle').innerHTML = classTitle + ' ' + roomName;
			
		}
	}

	var webSocket = 
	    new WebSocket('ws://localhost:8080/notedProject/actions');

	    webSocket.onerror = function(event) { 
	      onError(event);
	    };

	    webSocket.onopen = function(event) {
	      onOpen(event);
	    };

	    webSocket.onmessage = function(event) {
	      onMessage(event);
	    };
	    
	    webSocket.onclose = function(event) {
	    	console.log('Closed connection');
	    }
	
	function onOpen(event) {
	      console.log('Connection established');
	}

	function onError(event) {
	      console.log('Error');
	}
	
    function onMessage(event) {
        var json = JSON.parse(event.data); 
        var type = json.type; 
        
        switch (type) {
        case ('Initialize') :
        	HandleInitialize(json);
        	break;
        case ('Waiting') :
        	HandleWaiting(json);
        	break;
        case ('StartGame') :
        	HandleStartGame(json);
        	break;
        case ('NextQues') :
        	HandleNextQues(json);
        	break;
        case ('EndGame') :
        	HandleEndGame(json);
        	break;
        case ('AvailableRoom') :
        	HandleAvailableRoom(json);
        	break;
        case ('Full') :
        	HandleRoomFull(json);
        	break;
        case ('AnswerResponse') :
        	HandleAnswerResponse(json);
        	break;
        case ('Unanswered') :
        	HandleUnanswered(json);
        	break;
        }
        
        /*  
        	Testing purpose display
        */
        document.getElementById('messages').innerHTML 
        += '<br />Received server response!'
        + '<br />Type: ' + json.type
        + '<br />Content: ' + json.content;
        
        if (type == 'StartResponse') {
        	document.getElementById('messages').innerHTML
        	+= '<br />Starting game';
        }
        document.getElementById('messages').innerHTML
        += '<br />';
       
    }
    
    
    
    function Message(type) {
    	this.type = type;
    	this.content = '';
    }
    
    
    function sendInitialMessage() {
    	
    	var message = new Message('Start');
    	message.classTitle = classTitle;
    	message.roomName = roomName;
    	message.num = numPlayer.toString();
    	message.soj = 'start';
    	
    	webSocket.send(JSON.stringify(message));
    }
    
    function sendJoinMessage(rName) {
    	
    	var message = new Message('Join');
    	message.roomName = rName;
    	message.soj = 'Join';
    	
    	webSocket.send(JSON.stringify(message));
    }
    
    /* 
    	Called whenever the player hasn't got the correct choice and answered again
    */
    function sendAnswerMessage(answer, time) {
    	var currentQ = currQ;
    	
    	var message = new Message('Answer');
    	message.roomName = roomName;
    	message.classTitle = classTitle;
    	message.current = currentQ;
    	message.choice = answer;
    	message.time = time;
    	
    	webSocket.send(JSON.stringify(message));
    }
    
    /* 
    	Called whenever the timer is for previous question is out
    */
    function sendNextQuesMessage() {
    	var currentQ = currQ;
    	
    	var message = new Message('Next');
    	message.current = currentQ;
    	message.roomName = roomName;
    	
    	webSocket.send(JSON.stringify(message));
    }
    
    /*
    	Handle Functions
    */
    
	function HandleInitialize(json) {
		
	}
	
	function HandleWaiting(json) {
		var content = json.content;
		console.log('Waiting message: ' + content);
		document.getElementById('waiting').innerText = content;
		document.getElementById('waiting').style.display = "block";
	}
	
	function HandleEndGame(json) {
		var ranking = json.ranking;
		disableChoice();
		stopTimer();
		alert("You finishd in the " + ranking + " place");
	}
	
	function HandleStartGame(json) {
		startGameCountDown();
	}
	
	function HandleRoomFull(json) {
		
	}
	
	function HandleUnanswered(json) {
		if (numPlayer == 1) {
			return;
		}
		var unanswered = json.unanswered;
		if (unanswered == 1) {
			showRightOrWrong("LATE");
		}
	}

	
	function HandleNextQues(json) {
		/*
			question is String; options is String array
		*/
		var question = json.content;
		var options = json.options;
		
		document.getElementById('questionDisplay').innerText = question;
		
		//updates four options
		document.getElementById('choice1').innerText = options[0];
		document.getElementById('choice2').innerText = options[1];
		document.getElementById('choice3').innerText = options[2];
		document.getElementById('choice4').innerText = options[3];
		
	}
	
	function HandleAnswerResponse(json) {
		var multi = json.multi;
		var response = json.content;
		var score = json.score;
		document.getElementById('score').innerText = score;
		showRightOrWrong(response);
		
		if (multi == 0.0) {
			
		}
	}
	
	// Get function from url
	function get(name){
		   if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
		      return decodeURIComponent(name[1]);
		}
	</script>
</html>