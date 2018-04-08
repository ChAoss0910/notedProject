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
	<title>noted | game session</title>
	
	<style>
		body{ 
			font: normal 13px/20px Arial, Helvetica, sans-serif; word-wrap:break-word;
			color: #eee;
			background: #353535;
		}
		#countdown{
			width: 465px;
			height: 112px;
			text-align: center;
			background: #222;
			background-image: -webkit-linear-gradient(top, #222, #333, #333, #222); 
			background-image:    -moz-linear-gradient(top, #222, #333, #333, #222);
			background-image:     -ms-linear-gradient(top, #222, #333, #333, #222);
			background-image:      -o-linear-gradient(top, #222, #333, #333, #222);
			border: 1px solid #111;
			border-radius: 5px;
			box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.6);
			margin: auto;
			padding: 24px 0;
			position: absolute;
		  top: 0; bottom: 0; left: 0; right: 0;
		}
		
		#countdown:before{
			content:"";
			width: 8px;
			height: 65px;
			background: #444;
			background-image: -webkit-linear-gradient(top, #555, #444, #444, #555); 
			background-image:    -moz-linear-gradient(top, #555, #444, #444, #555);
			background-image:     -ms-linear-gradient(top, #555, #444, #444, #555);
			background-image:      -o-linear-gradient(top, #555, #444, #444, #555);
			border: 1px solid #111;
			border-top-left-radius: 6px;
			border-bottom-left-radius: 6px;
			display: block;
			position: absolute;
			top: 48px; left: -10px;
		}
		
		#countdown:after{
			content:"";
			width: 8px;
			height: 65px;
			background: #444;
			background-image: -webkit-linear-gradient(top, #555, #444, #444, #555); 
			background-image:    -moz-linear-gradient(top, #555, #444, #444, #555);
			background-image:     -ms-linear-gradient(top, #555, #444, #444, #555);
			background-image:      -o-linear-gradient(top, #555, #444, #444, #555);
			border: 1px solid #111;
			border-top-right-radius: 6px;
			border-bottom-right-radius: 6px;
			display: block;
			position: absolute;
			top: 48px; right: -10px;
		}
		
		#countdown #tiles{
			position: relative;
			z-index: 1;
		}
		
		#countdown #tiles > span{
			width: 92px;
			max-width: 92px;
			font: bold 48px 'Droid Sans', Arial, sans-serif;
			text-align: center;
			color: #111;
			background-color: #ddd;
			background-image: -webkit-linear-gradient(top, #bbb, #eee); 
			background-image:    -moz-linear-gradient(top, #bbb, #eee);
			background-image:     -ms-linear-gradient(top, #bbb, #eee);
			background-image:      -o-linear-gradient(top, #bbb, #eee);
			border-top: 1px solid #fff;
			border-radius: 3px;
			box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.7);
			margin: 0 7px;
			padding: 18px 0;
			display: inline-block;
			position: relative;
		}
		
		#countdown #tiles > span:before{
			content:"";
			width: 100%;
			height: 13px;
			background: #111;
			display: block;
			padding: 0 3px;
			position: absolute;
			top: 41%; left: -3px;
			z-index: -1;
		}
		
		#countdown #tiles > span:after{
			content:"";
			width: 100%;
			height: 1px;
			background: #eee;
			border-top: 1px solid #333;
			display: block;
			position: absolute;
			top: 48%; left: 0;
		}
		
		#countdown .labels{
			width: 100%;
			height: 25px;
			text-align: center;
			position: absolute;
			bottom: 8px;
		}
		
		#countdown .labels li{
			width: 102px;
			font: bold 15px 'Droid Sans', Arial, sans-serif;
			color: #f47321;
			text-shadow: 1px 1px 0px #000;
			text-align: center;
			text-transform: uppercase;
			display: inline-block;
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
		        <li class="active"><a href="homepage.jsp">Home</a></li>
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
	<!-- NAVBAR -->
		<div class="container">
			<h1>Game Session:</h1>
		</div>
		
		<!-- COUNTDOWN TIMER -->
		<div class="container">
  			<div id="countdown">
				<div id='tiles'></div>
				  <div class="labels">
				    <li>Days</li>
				    <li>Hours</li>
				    <li>Mins</li>
				    <li>Secs</li>
				</div>
			</div>
		</div>
	
	<script>
	var target_date = new Date().getTime() + (1000*3600*48); // set the countdown date
	var days, hours, minutes, seconds; // variables for time units

	var countdown = document.getElementById("tiles"); // get tag element

	getCountdown();

	setInterval(function () { getCountdown(); }, 1000);

	function getCountdown(){

		// find the amount of "seconds" between now and target
		var current_date = new Date().getTime();
		var seconds_left = (target_date - current_date) / 1000;

		days = pad( parseInt(seconds_left / 86400) );
		seconds_left = seconds_left % 86400;
			 
		hours = pad( parseInt(seconds_left / 3600) );
		seconds_left = seconds_left % 3600;
			  
		minutes = pad( parseInt(seconds_left / 60) );
		seconds = pad( parseInt( seconds_left % 60 ) );

		// format countdown string + set tag value
		countdown.innerHTML = "<span>" + days + "</span><span>" + hours + "</span><span>" + minutes + "</span><span>" + seconds + "</span>"; 
	}

	function pad(n) {
		return (n < 10 ? '0' : '') + n;
	}


	
	</script>
</body>
</html>