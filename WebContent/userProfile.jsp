<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<meta name="description" content="" />
			<meta name="keywords" content="" />
			<link rel="stylesheet" href="assets/css/main.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	
	<title>noted | profile</title>
	<%
	String[] questions = {"hello","world","computer science"};
	int numQuestions = questions.length;
	String[] answers = {"goodbye","space","english"};
	int numAnswers = answers.length;
	%>
	
	<style>
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
		#q-cards {
			display:	 inline;
		}
		.card {
			display: inline;
		}
	</style>
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
	/* $(document).ready(function() {
		$(".question-button").click(function() {
			$(".question-button").hide();
			alert("Answer: " + $(".question-button").val());
			$(".answer-button").show();
		});
	});
	$(document).ready(function() {
		$(".answer-button").click(function() {
			$(".answer-button").hide();
			$(".question-button").show();
		});
	}); */
		
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
	      <a class="navbar-brand" href="homepage.jsp">noted</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#">Home</a></li>
	        <li><a href="login.jsp">Login</a></li>
	        <li><a href="signup.jsp">Signup</a></li>
	        <li><a href="about.jsp">About</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div class="outer-profile">
		<div class="container">
			<div class="row">
				<div class="col-sm-4" id="picture">
					<img src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260">
					<h2 id="name">MY NAME</h2>
					<h3 id="username">MY USERNAME</h3>
					<button id="submit-button" class="btn btn-primary">Edit Info</button>
					<h3>Won: 92%</h3><br>
				</div>
				<div class="col-sm-6" id="content">
					<div id="content-buttons">
						<button id="notes-button" style="border-bottom: 2px solid orange;">Notes</button>
						<button id="questions-button">Questions</button>
						<button id="classes-button">Classes</button>
					</div>
					<div id="notes">
						<div class="list-group">
						  	<a href="#" class="list-group-item list-group-item-action">Cras justo odio</a>
						  	<a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
						  	<a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
						 	<a href="#" class="list-group-item list-group-item-action">Porta ac consectetur ac</a>
						</div>
					</div>
					<div id="questions" style=display:none>
						<%-- <div id="q-cards">
							<% int i = 0; %>
							<% while (i < numQuestions) { %>
								<div class="row">
								<% for (int q = 0; q < 2; i++) { %> 
									<div class="col-sm-6">
									<% if (i < numQuestions) { %> 
					 					<div class="card" style="width: 20rem;">
										  	<div class="card-body">
										    		<h5 class="card-title">class name</h5>
										    		<p class="card-text"><%=questions[i]%></p>
										    		<a href="#" class="card-link">Answer</a>
										  	</div>
										</div>
										<% i++; %>
									<% } %>
									</div>
								<% } %>
								</div>
							<% } %>
						</div> --%>
					<script>
					/* $(document).ready(function() {
						$(".question-button").click(function() {
							$(".question-button").toggle();
							$(".answer-button").toggle();
						});
					});
					$(document).ready(function() {
						$(".answer-button").click(function() {
							$(".answer-button").toggle();
							$(".question-button").toggle();
						});
					}); */
					</script	>
					<div id="classes" style=display:none>
						<ul class="list-group">
							<li class="list-group-item d-flex justify-content-between align-items-center">
						    		Cras justo odio
						    		<span class="badge badge-primary badge-pill">14</span>
						  	</li>
						  	<li class="list-group-item d-flex justify-content-between align-items-center">
						   		Dapibus ac facilisis in
						    		<span class="badge badge-primary badge-pill">2</span>
					  		</li>
						  	<li class="list-group-item d-flex justify-content-between align-items-center">
						    		Morbi leo risus
						    		<span class="badge badge-primary badge-pill">1</span>
						  	</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	
	</div>
</body>
</html>