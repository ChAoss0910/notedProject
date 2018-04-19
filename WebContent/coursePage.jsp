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
  	<title>noted | course page</title>
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
	
	String courseTitle = "CSCI 360";
	String courseName = "Introduction to Artificial Intelligence";
	int numNotes = 5;
	String[] noteTitles = {"Making Simple Decisions","Making Complex Decisions","Decision Trees","Learning Probabilistic Models","Perception"};
 	String[] noteSrcs = {"images/notes/simple-decisions1.png","images/notes/complex-decisions1.png","images/notes/decision-trees.png","images/notes/probabilistic-models1.png","images/notes/perception1.png"};
	
	String[] questions = {"Who is the professor for CSCI 103?","Who is the professor for CSCI 104?","Who is the professor for CSCI 170?"};
	int numQuestions = questions.length;
	String[] classes = {"CSCI-103","CSCI-104","CSCI-170"};
	String[] answers = {"Professor Goodney","Professor Cote","Professor Schindler"};
	
	String toNote = "note.jsp?username="+username+"&url="+profilePic+"&noteTitle=";
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
		h1 {
			line-height: 20pt;
		}
		h2 {
			text-align: left;
			padding-bottom: 0px;
			margin-bottom: 0px;
		}
		#notes, #questions { 
			padding: 20px 40px;
			/* position: relative; 
			z-index: -1; */
		}
		.thumbnail {
			margin-top: 10px;
		}
		#questions button {
			width: 100%;
		}
		.nav-link {
			height: 50px;
			width: 95px;
			color: orange;
			font-size: 15pt;
		}
		.nav-link:hover {
			text-decoration: none;
			font-weight:bold; 
			color:orange;
		}
		.card-title {
			font-size: 14pt;
			font-weight: bold; 
			padding-top: 10px;
		}
		.q-item {
			padding-bottom: 20px;
			border-bottom: 1px solid gray;
			width: 80%; 
			margin-left: auto;
			margin-right: auto;
		}
		#questions button {
			width: 200px;
			border: none;
			background-color: #ffa31a;
			color:white;
			margin-bottom: 10px;
		}
		#questions button:hover {
			background-color: #ff9900;
		}
		#to-top {
			position: fixed;
			bottom: 0px;
			right: 20px; 
			width: 120px; 
			height: 40px;
			background-color: white;
			text-align: right;
		}
	  </style>
</head>
<body>
	<nav class="navbar navbar-inverse" id="top">
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
				    <img src=<%= profilePic %> width="100%" style="border-radius: 10%;"/>
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
	<div class="to-top">
		<a href="#top" class="nav-link" id="to-top">Back to Top</a>
	</div>
	<div class="container-fluid bg-3 text-center">
		<h1><%=courseTitle%></h1>
		<h4><%=courseName%></h4>
		
		<a href="#notes" class="nav-link">Notes</a> / <a href="#questions" class="nav-link">Questions</a>
		
		<hr>
		<div id="notes">
		<h2>Notes</h2>
			<%
			int c = 0;
			boolean done = false;
			while (c < numNotes) { %>
				<div class="row" style="padding-top:20px;">
					<% for (int j = 0; j <= 3; j++) { %>
						<% if (c < numNotes) { %>
							<div class="col-sm-3"> 
								<div class="thumbnail">
								  	<p><%=courseTitle+"- "+noteTitles[c].trim()%></p>
								  	<a href="<%=toNote+"&noteTitle="+noteTitles[c].trim()%>">
							        	<img src="<%=noteSrcs[c]%>"style="width:100%">
							        </a>
							     </div>
			      			</div>
			      			<% c++; %>
			      		<% } else {
			      			done = true;
			      			break;
			      		} %>
					<% } %>
			<% } %>
	      	</div>
		</div> 
		<hr>
		<h2>Questions</h2>
		<div id="questions">
			<div class="list-group">
				<%for (int q = 0; q < numQuestions; q++){%>
					<div class="q-item">
						<h5 class="card-title"><%=questions[q]%></h5>
						<button onclick="showAns();">Show Answer</button><br>
						<button id="saveQues" onclick="saveQues();">Save</button>
						<h5 id="answer" style="display:none;"><%=answers[q]%></h5>
					</div>
				<%}%>
			</div> 
			<br><br><br><br>
		</div>
  	</div>

</body>
</html>