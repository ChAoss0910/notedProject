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
	<title>noted | note page</title>
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
		
		String noteTitle = "Perception";
		String classTitle = "CSCI 360";
		String author = "user1";
		int numPages = 2;
		int numTags = 2;
		String[] notePages = {"images/note-perception1.png","images/note-perception2.png"};
		String[] tags = {"#computer vision","#vision"};
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
		.note-image {
			width: 900px;
		}
		#save-button {
			background-color: #ffa31a;
			color: white; 
			margin-bottom: 10px;
			margin-top: 10px; 
		}
		#save-button:hover {
			background-color: #ff9900;
		}
		#save-button:focus {
			outline: none;
		    border-color: #ffa31a;
		    box-shadow: 0 0 10px #ffa31a;
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
	<div class="container-fluid bg-3 text-center">    
  		<h3><%=noteTitle %> <span style="font-size: 12pt"> by <%=author%></span></h3>
  		<h5><%=classTitle%></h5> 
  		<% for (int i = 0; i < numTags; i++){ %>
  			<%=tags[i]%>
  		<% } %>
  		<br>
  		<button class="btn" onclick="add(<%=noteTitle%>,<%=classTitle%>);" id="save-button">Save</button><br> 
  		<% for (int i = 0; i < numPages; i++){ %>
  			<img src=<%=notePages[i]%> class="note-image">
  		<% } %>
  		<br><br><br>
  	</div>
  	<script>
	function add(title, type){
		var xhttp = new XMLHttpRequest(); 
		xhttp.open("GET", "AddProfileInfo?username=" + username + 
				"&title=" + title + 
				"&type=" + type, false);
		xhttp.send();
		window.location.reload(true);
	}
	</script>
</body>
</html>