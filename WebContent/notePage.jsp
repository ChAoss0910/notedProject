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
	  
	  	<link rel="stylesheet" href="skippr/skippr.css">

	  	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	  	<title>noted | notes</title>
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
		
		String [] courseTitles = {"CSCI 201", "CSCI 360"};
		String [] courseLinks = {"#","#"};
		int numCourses = courseTitles.length;
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
			#container {
				margin-left: auto;
				margin-right: auto;
				width: 800px;
				height: 400px;
				padding: 20px 0px;
			}
			#courses {
				padding: 20px 50px;
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
		  
		<div class="container-fluid bg-3 text-center">    
		  <h3>Courses</h3><br>
		  
		<div id="container">
            <div id="notes">
                <div style="background-image: url(images/note3.png)"></div>
                <div style="background-image: url(images/note4.png)"></div>
                <div style="background-image: url(images/note2.png)"></div>
                <div style="background-image: url(images/note1.png)"></div>
            </div>    
        </div>
		<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
       	<script src="skippr/skippr.js"></script>
       	<script>
       	$(document).ready(function(){
            $("#notes").skippr();
        });    
       	</script>
       	
       	<% String toUploadNotes = "uploadNotes.jsp?username="+username+"&url="+profilePic; %>
	  	<a class="btn btn-primary btn-lg"  id="submit-button" href=<%=toUploadNotes%> role="button">Upload Notes</a>
       	
       	<div class="container-fluid" style="text-align: left;">
		  	<h4>Filter Notes:</h4>
		  	<form class="navbar-form navbar-left" role="search">
			 <div class="form-group">
			   <input type="text" class="form-control" placeholder="Search">
			 </div>
			<button type="submit" class="btn btn-default">Submit</button>
		  </form>
	  	</div>
		   
		  <div class="list-group" id="courses">
		  	<% for (int n = 0; n < numCourses; n++){ %>
				<a href="<%=courseLinks[n]%>" class="list-group-item list-group-item-action"><%=courseTitles[n]%></a>
			<% } %>
		  </div>
	      <br><br>
		
		<footer class="container-fluid text-center">
		  <p>&#0169; 2018 Noted All Rights Reserved.</p>
		</footer>
	</body>
</html>