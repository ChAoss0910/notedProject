<%@page import="notedProject.User"%>
<%@page import="notedProject.LoadDatabase"%>
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
	  	boolean guest = true;
  		String username = (String) request.getAttribute("username");
	  	String profilePic = ""; 
	  			
	  	try {
			LoadDatabase database = new LoadDatabase();
			User u = database.getUser(username);
			profilePic = u.getPicURL();
			guest = false;
	  	} catch (NullPointerException npe){
	  		if (username == null){
		  		username = request.getParameter("username");
				profilePic = request.getParameter("url");
				
				if (username == null){
				} else {
					if (!username.equalsIgnoreCase("") && !username.equalsIgnoreCase("null")){
						guest = false;
					}
				}
		  	} else {
		  		guest = false;
		  	}
	  	} finally { }
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
		
		a {
			color: orange;
		}
		a:hover {
			text-decoration: none;
			color: #ff9900;
			font-weight: bold;
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
		
		<div class="jumbotron">
		  <div class="container text-center">
		    <h1>Select a Game</h1> 
		    
		    <button onclick="sendGetRoomsMessage();" style="margin: 10px 10px 10px -40px;" class="btn btn-primary btn-lg">Load Available Games</button>
		    
		    <div id="messages">
		    </div>
		         
		    <p class="lead">
		    	<ul id="listDisplay" class="list-group">
				  <li class="list-group-item d-flex justify-content-between align-items-center quiz-listitem">
				    <a id="anchor1" href="#">No Current Sessions</a>
				    <span id="span1" class="badge badge-primary badge-pill"></span>
				  </li>
				  
				  
				  <!-- <li class="list-group-item d-flex justify-content-between align-items-center quiz-listitem">
				    <a href="#">CSCI-104 Quiz 2</a>
				    <span class="badge badge-primary badge-pill">slots: 3</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center quiz-listitem">
				   	<a href="#">PYSC-442 Quiz 8</a>
				    <span class="badge badge-primary badge-pill">slots: 2</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center quiz-listitem">
				   	<a href="#">CSCI-104 Quiz 2</a>
				    <span class="badge badge-primary badge-pill">slots: 3</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center quiz-listitem">
				  	<a href="#">MATH-224 Quiz 1</a>
				    <span class="badge badge-primary badge-pill">slots: 2</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center quiz-listitem">
				   	<a href="#">CSCI-102 Quiz 3</a>
				    <span class="badge badge-primary badge-pill">slots: 2</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center quiz-listitem">
				   	<a href="#">PYSC-442 Quiz 5</a>
				    <span class="badge badge-primary badge-pill">slots: 1</span>
				  </li> -->
				</ul>
			</p>
			
			<div>
	    		<a style="margin: 10px 10px 10px -40px;" class="btn btn-primary btn-lg"  id="submit-button" href=<%=toNewGame%> role="button">New Game</a>
			</div>
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
	<script>
	
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
	    	alert('Closed connection');
	    }

	function onOpen(event) {
	      alert('Connection established');
	}

	function onError(event) {
	      alert('Error');
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
	
	function sendGetRoomsMessage() {
		var message = new Message('RoomRequest');
		
		webSocket.send(JSON.stringify(message));
	}


	function HandleAvailableRoom(json) {
		sessionStorage.setItem("command", "join");
		var rooms = json.availableRooms;
		
		if (rooms.length == 0) {
			document.getElementById('messages').innerHTML = 'No room available';
		} else {
			var inner = '';
			for (i = 0; i < rooms.length; i++) {
				document.getElementById('messages').innerHTML
			    += '<br /> ClassName: ' + rooms[i][0]
				+ ' RoomName: ' + rooms[i][1] 
			    + ' Slots: ' + rooms[i][2];
				
				//update DOM
				inner += 
				'<li class="list-group-item d-flex justify-content-between align-items-center quiz-listitem">'
			    + '<a href="gameSession.jsp?rName='
			    + rooms[i][1] + '">'
			    + rooms[i][0] + '  '
			    + rooms[i][1]
			    + '</a>'
			    + '<span class="badge badge-primary badge-pill">slots:'
			    + rooms[i][2]
			    + '</span></li>';
				
				
			}
			
			document.getElementById('listDisplay').innerHTML = inner;
		}
		
	}
	</script>
</html>