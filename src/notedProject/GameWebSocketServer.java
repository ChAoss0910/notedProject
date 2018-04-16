package notedProject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;
import java.util.function.Predicate;

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
	
	private HashMap<String, List<Session> > gameRoom;
	private HashMap<String, Integer> roomSize;
	private HashMap<String , Quiz> roomQuiz;
	private Vector<Session> sessionVector; 
	private LoadDatabase database;
	private HashMap<Session, PlayerQuizChoice> sessionQuizInfo;
	private String path;
	
	public GameWebSocketServer() {
		gameRoom = new HashMap<>();
		roomSize = new HashMap<>();
		sessionVector = new Vector<Session>(); 
		roomQuiz = new HashMap<>();
		sessionQuizInfo = new HashMap<>();
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
		return gameRoom.containsKey(rName);
	}
	
	/**Loads DB every time a new game is created
	 * @return
	 */
	private boolean LoadDB() {
		//TODO: Connect to Mongo DB
		//String path = "ws://localhost:8080/notedProject/database.json";
		//database = new LoadDatabase(path);
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
		
		PlayerQuizChoice temp = sessionQuizInfo.get(session);
		temp.StoreChoice(current, choice, time);
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
		
		// TODO: Handle case Room dosen't exist
		if (CheckRoom(rName)) {
			
		} else {
			List<Session> temp = new ArrayList<>();
			temp.add(session);
			gameRoom.put(rName, temp);
			roomSize.put(rName, rSize);
			
			//TODO: create Quiz from DB
			Quiz quiz = dummyQuiz();
			roomQuiz.put(rName, quiz);
			
			PlayerQuizChoice newInfo = new PlayerQuizChoice(session, quiz);
			sessionQuizInfo.put(session, newInfo);
			
			MessageInitializeRoom(session);
			if (rSize == 1) {
				MessageStart(rName, session);
			} else {
				MessageWaiting(1, session);
			}
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
		q1.SetAnswer(2);
		
		Question q2 = new Question("DummyQuestion2");
		q2.addOption("Option5");
		q2.addOption("Option6");
		q2.addOption("Option7");
		q2.addOption("Option8");
		q2.SetAnswer(3);
		
		qPool.add(q1);
		qPool.add(q2);
		Quiz quiz = new Quiz("DummyQuiz", qPool, 2);
		return quiz;
	}
	
	
	
	/**
	 * Handle Next question message from front-end; 
	 * Send Next Question message if there are still question
	 * @param message
	 * @param session
	 */
	private void HandlNext(Message message, Session session) {
		int current = message.GetCurrent();
		if (current <= roomQuiz.get(message.GetRoomName()).GetQuizSize()) {
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
		int rSize = roomSize.get(rName);
		int existingPlayer = gameRoom.get(rName).size();
		if (existingPlayer < rSize) {
			gameRoom.get(rName).add(session);
			existingPlayer = gameRoom.get(rName).size();
			if (existingPlayer == rSize) {
				for (Session s : gameRoom.get(rName)) {
					MessageStart(rName, s);
				}
			} else {
				for (Session s : gameRoom.get(rName)) {
					MessageWaiting(rSize - existingPlayer, s);
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
		int current = message.GetChoice();
		Quiz quiz = roomQuiz.get(message.GetRoomName());
		try {
			Message response = new Message();
			if (true) {
				// Still has questions left in quiz
				response.SetType("NextQues");
				Question question = quiz.GetQuestionById(current);
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
		// TODO Auto-generated method stub
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
}
