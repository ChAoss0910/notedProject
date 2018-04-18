<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
var classTitle = 'CSCI 201';
var roomName = 'New Game1';
var currQ = 1;

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
	var numPlayer = 4;
	
	var message = new Message('Start');
	message.classTitle = classTitle;
	message.roomName = roomName;
	message.num = numPlayer.toString();
	message.soj = 'start';
	
	webSocket.send(JSON.stringify(message));
}

function sendJoinMessage() {
	
	var message = new Message('Join');
	message.roomName = roomName;
	message.classTitle = classTitle;
	message.soj = 'Join';
	
	webSocket.send(JSON.stringify(message));
}

/* 
	Called whenever the player made a choice
*/
function sendAnswerMessage(answer, time) {
	
	var message = new Message('Answer');
	message.roomName = roomName;
	message.classTitle = classTitle;
	message.current = currQ;
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



function HandleInitialize(json) {
	
}

function HandleWaiting(json) {
	
}

function HandleEndGame(json) {
	
}

function HandleStartGame(json) {
	sendNextQuesMessage();
}

function HandleNextQues(json) {
	/*
		question is String; options is String array
	*/
	var question = json.content;
	var options = json.options;
	var score = json.score;
	
	document.getElementById('questionDisplay').innerText = question;
	
	//updates four options
	document.getElementById('choice1').innerText = options[0];
	document.getElementById('choice2').innerText = options[1];
	document.getElementById('choice3').innerText = options[2];
	document.getElementById('choice4').innerText = options[3];
	
}


/* 
	Join room functions	
*/

function sendGetRoomsMessage() {
	var message = new Message('RoomRequest');
	
	webSocket.send(JSON.stringify(message));
}


function HandleAvailableRoom(json) {
	var rooms = json.availableRooms;
	
	if (rooms.length == 0) {
		document.getElementById('messages').innerHTML = 'No room available';
	} else {
		for (i = 0; i < rooms.length; i++) {
			document.getElementById('messages').innerHTML
		    += '<br /> ClassName: ' + rooms[i][0]
			+ ' RoomName: ' + rooms[i][1] 
		    + ' Slots: ' + rooms[i][2];
		}
	}
}

</script>
<body>
	<div>
    	<span>Type:</span>
    	<input id="type" type="text" />
    	<br />
    	<span>Content:</span>
    	<input id="content" type="text" />
    	<br />
    	<span>Room Name:</span>
    	<input id="roomName" type="text" />
    	<br />
    	<span>Class Title:</span>
    	<input id="classTitle" type="text" />
    	<br />
    	<span>Num of Player:</span>
    	<input id="num" type="text" />
  	</div>
  	<div>
    	<input type="submit" value="Start Game Room" onclick="sendInitialMessage()" />
  	</div>
  	<div>
    	<input type="submit" value="Show Game Room" onclick="sendGetRoomsMessage()" />
  	</div>
  	<div>
    	<input type="submit" value="Join" onclick="sendJoinMessage()" />
  	</div>
  	<div>
    	<input type="submit" value="Answer" onclick="sendAnswerMessage(1, 5)" />
  	</div>
  	<div>
    	<input type="submit" value="GetNext" onclick="sendNextQuesMessage()" />
  	</div>
  	<div id="messages"></div>
  	<div id="rooms"></div>
</body>
</html>