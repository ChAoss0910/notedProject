/**
 * 
 */

var webSocket = 
	    new WebSocket('ws://localhost:8080/TestGame/actions');

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
    	var numPlayer = 1;
    	var roomName = 'Testing';
    	var classTitle = document.getElementById('classTitle').value;
    	
    	var message = new Message('Start');
    	message.classTitle = classTitle;
    	message.roomName = roomName;
    	message.num = numPlayer.toString();
    	message.soj = 'start';
    	
    	webSocket.send(JSON.stringify(message));
    }
    
    function sendJoinMessage() {
    	var roomName = 'dummyRoom';
    	var classTitle = 'dummytitle';
    	
    	var message = new Message('Join');
    	message.roomName = roomName;
    	message.classTitle = classTitle;
    	message.soj = 'Join';
    	
    	webSocket.send(JSON.stringify(message));
    }
    
    /* 
    	Called whenever the player hasn't get the correct choice and answered again
    */
    function sendAnswerMessage() {
    	var currentQ = 1;
    	var answer = 2;
    	var time = 3
    	
    	var message = new Message('Answer');
    	message.current = currentQ;
    	message.choice = answer;
    	message.time = time;
    	
    	webSocket.send(JSON.stringify(message));
    }
    
    /* 
    	Called whenever the timer is for previous question is out
    */
    function sendNextQuesMessage() {
    	var currentQ = 3;
    	var roomName = 'Testing';
    	
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
		
		for (i = 0; i < options.length; i++) {
			//document.getElementById('').value = options[i];
		}
		
	}
	