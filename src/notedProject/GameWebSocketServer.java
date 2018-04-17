package notedProject;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


/**
 * @author Burt1
 *
 */
@ServerEndpoint(
		value = "/actions",
		encoders = {MessageEncoder.class },
		decoders = {MessageDecoder.class }
	)
public class GameWebSocketServer {
	
	private HashMap<String , QuizRoom> roomQuiz;
	private Vector<Session> sessionVector; 
	private LoadDatabase database;
	
	
	public GameWebSocketServer() {
		sessionVector = new Vector<Session>(); 
		roomQuiz = new HashMap<>();
	}
	
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("Client connected");
		sessionVector.add(session);
	}

	@OnClose
	public void onClose(Session session) {
	    System.out.println("Connection closed");
	    sessionVector.remove(session);
	}
	  
	@OnError
	public void onError(Throwable error) {
		System.out.println(error.getMessage());
	}

	@OnMessage
	public void onMessage(Message message, Session session){
		//LoadDB();
	    // Echo the received message back to the client
		HandleMessage(message, session);
	}
	
	private boolean CheckRoom(String rName) {
		return roomQuiz.containsKey(rName);
	}
	
	/**Loads DB every time a new game is created
	 * @return
	 */
	private boolean LoadDB() {
		//TODO: Connect to Mongo DB
		//String path = "ws://localhost:8080/notedProject/database.json";
		database = new LoadDatabase();
		return true;
	}
	
	
	private void HandleMessage(Message message, Session session) {
		String type = message.GetType();
		System.out.println("Received message of type: " + type);
		switch (type) {
		case "Start":
			HandleStart(message, session);
			break;
			
		case "Join":
			HandleJoin(message, session);
			break;
			
		case "Next":
			HandlNext(message, session);
			break;
			
		case "Answer":
			HandleAnswer(message, session);
			//TODO: Handle nothing for now
			break;

		default:
			break;
		}
	}
	
	
	
	/**
	 * Handle Answer message, add answer if empty, update answer if exist
	 * @param message
	 * @param session
	 */
	private void HandleAnswer(Message message, Session session) {
		//TODO: Further implementation needed
		int current = message.GetCurrent();
		int choice = message.GetChoice();
		int time = message.GetTime();
		
		QuizRoom room = roomQuiz.get(message.GetRoomName());
		double multi = room.HandleAnswer(session, current, choice, time);
		
		if (multi == 0.0) {
			//Return answer is wrong
		} else {
			//Broadcast
		}
	}

	/**
	 * Handle Start message from front end
	 * @param message
	 * @param session
	 */
	private void HandleStart(Message message, Session session) {
		// Load Database to generate quiz 
		LoadDB();
		
		int rSize = Integer.parseInt(message.GetNum());
		String rName = message.GetRoomName();
		
		
		if (CheckRoom(rName)) {
			// TODO: Handle case Room exist
			
		} else {			
			//TODO: Generate Quiz from DB
			Quiz quiz = dummyQuiz();
			
			
			QuizRoom room = new QuizRoom(rName, quiz, rSize);
			if (!room.CheckRoomFull()) {
				room.AddSession(session);
			}
			
			roomQuiz.put(rName, room);
			
			MessageInitializeRoom(session);
			
			if (rSize == 1) {
				MessageStart(rName, session);
			} else {
				MessageWaiting(1, session);
			}
		}
	}
	
	
	/**
	 * Handle Next question message from front-end; 
	 * Send Next Question message if there are still question
	 * @param message
	 * @param session
	 */
	private void HandlNext(Message message, Session session) {
		int current = message.GetCurrent();
		if (roomQuiz.get(message.GetRoomName()).HasNextQues(current)) {
			MessageNext(message, session);
		} else {
			MessageEndGame(message, session);
		}
		
	}
	 

	/**
	 * Handle Join message from the front end
	 * @param message
	 * @param session
	 */
	private synchronized void HandleJoin(Message message, Session session) {
		
		String rName = message.GetRoomName();
		QuizRoom room = roomQuiz.get(rName);
		
		if (!room.CheckRoomFull()) {
			room.AddSession(session);
			MessageJoinSuccess(message, session);
			if (room.CheckRoomFull()) {
				for (Session s : room.GetPlayers()) {
					MessageStart(rName, s);
				}
			} else {
				for (Session s : room.GetPlayers()) {
					if (s != session) {
						MessageWaiting(room.GetRoomLimit() - room.GetPlayerNum(), s);
					}
				}
			}
		} else {
			MessageRoomFull(session);
		}
	} 
	
	

	/**
	 * Return message: Room requested is full
	 * @param session
	 */
	private void MessageRoomFull(Session session) {
		Message response = new Message();
		response.SetType("Full");
		response.SetContent("Room is full");
	}
	
	
	/**
	 * Return message: Room Initialized type == Initialize
	 * @param session
	 */
	public void MessageInitializeRoom(Session session) {
		try {
			Message response = new Message();
			response.SetType("Initialize");
			response.SetContent("Room initialized");
			session.getBasicRemote().sendObject(response);
		} catch (EncodeException  e) {
			System.err.println("ee in messageInitializeRoom: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageInitializeRoom: " + e.getMessage());
		}
		
	}
	
	
	private void MessageJoinSuccess(Message message, Session session) {
		try {
			Message response = new Message();
			response.SetType("JoinSuccess");
			response.SetContent("Joined room successfully");
			session.getBasicRemote().sendObject(response);
		} catch (EncodeException  e) {
			System.err.println("ee in messageInitializeRoom: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageInitializeRoom: " + e.getMessage());
		}
	}
	
	/**
	 * Message to signal waiting, type == Waiting
	 * @param required
	 * @param session
	 */
	public void MessageWaiting(int required, Session session) {
		try {
			Message response = new Message();
			response.SetType("Waiting");
			response.SetContent("Waiting for " + required + " more player...");
			session.getBasicRemote().sendObject(response);
		} catch (EncodeException  e) {
			System.err.println("ee in messageInitializeRoom: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageInitializeRoom: " + e.getMessage());
		}
	}
	
	/**
	 * Message to notify start of game, type == StartGame
	 * @param rName
	 * @param session
	 */
	public void MessageStart(String rName, Session session) {
		try {
			Message response = new Message();
			response.SetType("StartGame");
			response.SetContent("Game starts...");
			session.getBasicRemote().sendObject(response);
		} catch (EncodeException  e) {
			System.err.println("ee in messageStart: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageStart: " + e.getMessage());
		}
	}
	
	/**
	 * Message including next question, type == NextQues
	 * @param session
	 */
	public void MessageNext(Message message, Session session) {
		int current = message.GetCurrent();
		System.out.println("Trying to get room");
		QuizRoom room = roomQuiz.get(message.GetRoomName());
		System.out.println("Current player num is: " + room.GetPlayerNum());
		try {
			Message response = new Message();
			if (room.HasNextQues(current)) {
				// Still has questions left in quiz
				response.SetType("NextQues");
				Question question = room.GetQuestionByID(current);
				response.SetContent(question.getTitle());
				List<String> options = question.getOptions();
				for (String option : options) {
					response.AddOption(option);
				}
			}
			session.getBasicRemote().sendObject(response);
		} catch (EncodeException  e) {
			System.err.println("ee in messageStart: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageStart: " + e.getMessage());
		}
	}
	
	public void MessageEndGame(Message message, Session session) {
		try {
			Message response = new Message();
			response.SetType("EndGame");
			response.SetContent("Game ends...");
			session.getBasicRemote().sendObject(response);
		} catch (EncodeException  e) {
			System.err.println("ee in messageStart: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageStart: " + e.getMessage());
		}
		
	}
	

	/**Only for testing purpose 
	 * @return Dummy Quiz
	 */
	private Quiz dummyQuiz() {
		List<Question> qPool = new ArrayList<>();
		
		Question q1 = new Question("DummyQuestion1");
		q1.addOption("Option1");
		q1.addOption("Option2");
		q1.addOption("Option3");
		q1.addOption("Option4");
		
		Question q2 = new Question("DummyQuestion2");
		q2.addOption("Option5");
		q2.addOption("Option6");
		q2.addOption("Option7");
		q2.addOption("Option8");
		
		Question q3 = new Question("DummyQuestion3");
		q3.addOption("Option9");
		q3.addOption("Option10");
		q3.addOption("Option11");
		q3.addOption("Option12");
		
		Question q4 = new Question("DummyQuestion4");
		q3.addOption("Option13");
		q3.addOption("Option14");
		q3.addOption("Option15");
		q3.addOption("Option16");
		
		Question q5 = new Question("DummyQuestion5");
		q3.addOption("Option17");
		q3.addOption("Option18");
		q3.addOption("Option19");
		q3.addOption("Option20");
		
		
		
		qPool.add(q1);
		qPool.add(q2);
		qPool.add(q3);
		qPool.add(q4);
		qPool.add(q5);
		Quiz quiz = new Quiz("DummyQuiz", qPool, 5);
		return quiz;
	}
	
}
