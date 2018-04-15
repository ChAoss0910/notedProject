<%@page import="notedProject.User"%>
<%@page import="notedProject.LoadDatabase"%>
<%@page import="java.io.InputStream"%>
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
	
	<title>noted | edit profile</title>
	<%
	String username = request.getParameter("username");
	String profilePic = request.getParameter("url");

	LoadDatabase db = (LoadDatabase) session.getAttribute("database");
	User u = db.getUser(username);
	String fName = u.getFirstName();
	String lName = u.getLastName();
	
	int type = -1;
	
	String[] notesLinks = {"#", "#", "#"};
	String[] notesTitles = {"Networking", "Threading", "Synchronization"};
	String[] notesClasses = {"CSCI-201","CSCI-201","CSCI-201"};
	String[] notesDates = {"1/1","2/14","4/2"};
	int numNotes = notesLinks.length;
	String[] questions = {"Who is the professor for CSCI 103?","Who is the professor for CSCI 104?","Who is the professor for CSCI 170?"};
	int numQuestions = questions.length;
	String[] classes = {"CSCI-103","CSCI-104","CSCI-170"};
	String[] answers = {"Professor Goodney","Professor Cote","Professor Schindler"};
	String[] classLinks = {"#", "#"};
	String[] classTitles = {"CSCI-201","CSCI-270"};
	int numClasses = classLinks.length;
	%>
	<script>
	$(document).ready(function() {
		$("#notes-button").click(function() {
			$("#questions").hide();
			$("#classes").hide();
			$("#notes").show();
			$("#notes-button").css("border-bottom"," 2px solid orange");
			$("#questions-button").css("border-bottom","none");
			$("#classes-button").css("border-bottom","none");
		});
	});
	$(document).ready(function() {
		$("#questions-button").click(function() {
			$("#notes").hide();
			$("#classes").hide();
			$("#questions").show();
			$("#questions-button").css("border-bottom"," 2px solid orange");
			$("#notes-button").css("border-bottom","none");
			$("#classes-button").css("border-bottom","none");
		});
	});
	$(document).ready(function() {
		$("#classes-button").click(function() {
			$("#notes").hide();
			$("#questions").hide();
			$("#classes").show();
			$("#classes-button").css("border-bottom"," 2px solid orange");
			$("#notes-button").css("border-bottom","none");
			$("#questions-button").css("border-bottom","none");
		});
	});
	$(document).ready(function() {
		$("#deleteQ").click(function() {
			xhttp.open("GET", "DeleteProfile?username=" + username + 
					"&delete=" + index + 
					"&type=" + type, false);
			xhttp.send();
			$('#questions').load(document.URL +  ' #questions');
		});
	});
	</script>
	<style>
		.navbar-right img {
			margin-top: 5px;
			width: 40px; 
			height: 40px;
			border-radius: 20%; 
		}
		.col-sm-2,.col-sm-3 {
			margin: 0px 2px;
			text-align: left;
		}
		.col-sm-2 h1,.col-sm-3 h1 {
			font-size: 11pt;
			font-weight: bold;
		}
		.col-sm-4 {
			text-align: center;
		}
		#picture img {
			width:80%;
			border-radius: 10%;
		}
		#name {
			text-align: left;
			padding: 0px 0px 0px 40px;
			margin-bottom: 0px;
			font-size: 22pt;
			font-weight: bold;
		}
		#username {
			text-align: left;
			padding: 0px 0px 10px 40px;
			margin-top: 0px;
			font-size: 14pt;
			line-height: 14pt;
		}
		#picture button {
			width: 80%; 
		}
		#content {
			text-align: left;
			padding-left: 10px;
			/* padding-left: 55px; */
		}
		#content-buttons {
			/* border-bottom: 1px solid gray; */
		}
 		#content-buttons button:focus {
			outline: none;
			box-shadow: none;
		}
		#content button {
			height: 50px;
			width: 95px;
			border: none;
			background-color: white;
			font-weight: bold;
		}
		#notes, #questions, #classes {
			padding-top: 20px;
		}
		#questions button {
			width: 100%;
		}
		.card-body {
			border-radius: 10%;
			border: 1px solid #d9d9d9;
			padding: 5px 20px 0px 20px;
			text-align: left;
			margin-bottom: 20px;
		}
		.card-title {
			font-size: 14pt;
			font-weight: bold;
		}
		#notes button{
			background-color: #ffa31a;
			border: none;
			width: 200px;
			margin-bottom: 20px;
		}
		#notes button:hover {
			background-color: #ff9900;
		}
		.light {
			background-color: #f2f2f2;
		}
		.notes-action {
			color: black;
		}
		.notes-action:hover {
			color: black;
			text-decoration: none;
			font-weight: bold;
		}
	</style>
	<script>
	function remove(index, type){
		var xhttp = new XMLHttpRequest(); 
		xhttp.open("GET", "DeleteProfile?username=" + username + 
				"&delete=" + index + 
				"&type=" + type, false);
		xhttp.send();
		window.location.reload(true);
	}
	</script>
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
	      	<% String pass = "userProfile.jsp?username=" + username + "&url=" + profilePic; %>
     		<a id="myProfile" href=<%=pass%>><img src=<%= profilePic %> /></a>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div class="outer-profile">
		<div class="container">
			<div class="row">
				<div class="col-sm-4" id="picture">
					<img src=<%= profilePic %>>
					<h2 id="name"><%=fName%> <%=lName%></h2>
					<h3 id="username"><%=username%></h3>
					<%String done = "userProfile.jsp?username="+username+"&url="+profilePic;%>
					<a href=<%=done%>>
						<button id="submit-button" class="btn btn-primary">Done</button>
					</a>
					<h3>Won: 92%</h3><br>
				</div>
				<div class="col-sm-6" id="content">
					<div id="content-buttons">
						<button id="notes-button" style="border-bottom: 2px solid orange;">Notes</button>
						<button id="questions-button">Questions</button>
						<button id="classes-button">Classes</button>
					</div> 
					<div id="notes">
						<ul class="list-group">
							<% for (int n = 0; n < numNotes; n++){ %>
								<span class="badge badge-primary badge-pill"><%=notesClasses[n]%></span>
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<a href="<%=notesLinks[n]%>" class="notes-action"><%=notesTitles[n]%></a>
									<% type = 0; %>
									<a href="#" class="badge light" style="margin-top:-5px;">
										<button onclick="remove(<%=n%>,<%=type%>);" style="background-color:#f2f2f2; width:5px; height:5px;"> 
										<img src="https://cdn2.iconfinder.com/data/icons/web/512/Trash_Can-512.png" width="20px" style="margin-left:-10px">
										</button>
									</a>
								</li>
							<% } %>
						</ul>
					</div>
					<div id="questions" style=display:none>
						<div id="q-cards">
							<div class="row">
								<%for (int q = 0; q < numQuestions; q++){%>
									<div class="col-sm-6">
										<div class="card-body"> 
									    		<h5 class="card-title"><%=questions[q]%></h5>
									    		<p class="card-text"><%=classes[q]%></p>
									    		<% type = 1; %>
									    		<button onclick="remove(<%=q%>,<%=type%>);">  
									    			<div class="badge light" style="margin-bottom:10px;margin-left:auto;margin-right:auto;">
									    			<img src="https://cdn2.iconfinder.com/data/icons/web/512/Trash_Can-512.png" width="20px"> 
								    				</div>
								    			</button>
									  	</div> 
								  	</div>
								<%}%>
							</div>
						</div>
					</div>
					<div id="classes" style=display:none>
						<ul class="list-group">
							<% for (int n = 0; n < numClasses; n++){ %>
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<a href="<%=classLinks[n]%>" class="notes-action"><%=classTitles[n]%></a>
									<% type = 2; %>
									<a href="#" class="badge light" style="margin-top:-5px; height:30px">
										<button onclick="remove(<%=n%>,<%=type%>);" style="background-color:#f2f2f2; width:5px; height:5px;"> 
										<img src="https://cdn2.iconfinder.com/data/icons/web/512/Trash_Can-512.png" width="20px" style="margin-left:-10px">
										</button>
									</a>
								</li>
							<% } %>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>