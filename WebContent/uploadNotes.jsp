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
		if (!username.equalsIgnoreCase("")){
			guest = false;
		}
	}
  	%>
  	<script>
  		function submit(){
  			document.getElementById("newNotes").submit();
  		}
  		function validate(){
			var xhttp =new XMLHttpRequest();
			xhttp.open("GET", "ValidateNotes?notesTitle="+document.newNotes.notesTitle.value +
					"&selectClass=" + document.newNotes.selectClass.value+"&date="+document.newNotes.date.value+
					"&uploadfile="+ document.newNotes.uploadfile+"&tags="+document.newNotes.tags, false);
			xhttp.send();
			console.log(xhttp.responseText.trim());
			if(xhttp.responseText.trim().length > 0){
				alert("Please complete the form!");
				return false;
			}
			return true;
			
		}
  		
  	</script>
	<title>noted | upload notes</title>
	<style>
		.navbar-right img {
			margin-top: 5px;
			width: 40px; 
			height: 40px;
			border-radius: 20%; 
		}
		select {
			height: 35px;
			width: 100%;
		    background: white;
		    color:black;
		    border-color: #d9d9d9;
		}
		select:focus {
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
	      <a class="navbar-brand" href="homepage.jsp">noted</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="newGame.jsp">New Game</a></li>
	        <li><a href="about.jsp">About</a></li>
	      </ul>
	       <ul class="nav navbar-nav navbar-right" id="right-nav">
      			<% if (guest) { %>
		        		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
		     	<% } else { %>
		     		<% String pass = "userProfile.jsp?username=" + username + "&url=" + profilePic; %>
		     		<a id="myProfile" href=<%=pass%>>
		     			<img src=<%= profilePic %> />
		     		</a>
		     	<% } %>
	      </ul>
	    </div>
	  </div>
	</nav>
	<!-- NAVBAR -->
	<!-- START GAME -->
	<div class="new-notes">
		<div class="container"> 
			<div id="title">
				<h1>Upload Notes</h1>
			</div>
			<form name="newNotes" id ="newNotes"method="GET" action="homepage.jsp" onSubmit="return validate();">
				<div class="form-row">
				    	<div class="form-group col-md-6"">
				    		<label for="notesTitle">Title</label>
				      	<input type="text" class="form-control" id="notesTitle" name ="notesTitle"aria-describedby="titleHelp" placeholder="ex: Networking">
				    		<small id="titleHelp" class="form-text text-muted">Please only use letters and numbers.</small>
				    </div>
			  		<div class="form-group col-md-3">
			  			<label for="selectClass">Select Class</label>
						<select id="selectClass" name="selectClass">
						    <option val="">Class</option>
						    <option val="csci109">CSCI 109</option>
						    <option val="csci103">CSCI 103</option>
						    <option val="csci104">CSCI 104</option>
						    <option val="csci170">CSCI 170</option>
						    <option val="csci201">CSCI 201</option>
						    <option val="csci270">CSCI 270</option>
						</select>
			  		</div>
			  		<div class="form-group col-md-3">
			  			<label for="dateClass">Date of Lecture</label>
						<input type="date" class="form-control" id="date" name="date">
			  		</div>
			  	</div>
			  	<div class="form-row">
			  		<div class="form-group col-md-12">
					  	<div class="custom-file">
						    <input type="file" class="custom-file-input" id="inputGroupFile02" name="uploadfile">
					  	</div>
					</div>
			  	</div>
			  	<div class="form-row">
			  		<div class="form-group col-md-12">
					  	<label for="classTags">Tags</label>
    						<input type="text" class="form-control" id="tags" name="tags" rows="1" aria-describedby="tagsHelp" ></textarea>
    						<small id="tagsHelp" class="form-text text-muted">ex: #networking, #threads, #synchronization</small>
					</div>
			  	</div>
			  	<div class="form-row"> 
			  		<div class="form-group col-md-12">
			  			<a role="button" "><button class="btn btn-primary btn-lg"  id="submit-button">Upload Notes</button></a>
		  			</div>
		  		</div>
		  	</form>
		</div>
	</div>
</body>
</html>