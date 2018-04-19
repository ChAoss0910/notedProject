package notedProject;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
	
	private static HashMap<String , QuizRoom> roomQuiz = new HashMap<>();
	private static Vector<Session> sessionVector = new Vector<>();
	private static HashMap<Session, String> sessionRoomNameMap = new HashMap<>();
	private LoadDatabase database;
	
	
	public GameWebSocketServer() {
		
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
	    if (sessionRoomNameMap.containsKey(session)) {
			String rName = sessionRoomNameMap.get(session);
			QuizRoom room = roomQuiz.get(rName);
			if (room.RemoveSession(session)) {
				roomQuiz.remove(rName);
			}
			sessionRoomNameMap.remove(session);
		}
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
		//database = new LoadDatabase();
		return true;
	}
	
	
	private void HandleMessage(Message message, Session session) {
		String type = message.GetType();
		System.out.println("Received message of type: " + type + " from " + session.getId());
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
			break;
			
		case "RoomRequest":
			HandleRoomRequest(message, session);
			break;
			
		default:
			break;
		}
	}
	
	
	
	private void HandleRoomRequest(Message message, Session session) {
		// TODO Auto-generated method stub
		MessageRoomOptions(message, session);
		
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
		
		if (room.HasStarted()) {
			double multi = room.HandleAnswer(session, current, choice, time);
			
			
			if (multi == -1) {
				
			} else {
				MessageAnswerResponse(multi, message, session);
				if (multi == 0.0) {
					
					//Return answer is wrong
				} else {
					//Broadcast
					int unanswered = room.GetRemainingIncorrent(current);
					Message response = new Message();
					response.SetType("Unanswered");
					response.SetContent(unanswered + " hasn't answered");
					response.SetUnanswered(unanswered);
					
					for (Session s : room.GetPlayers()) {
						MessageRemainingUnanswered(response, s);
					}
					
					MessageOtherPlayer(multi, message, session);
					
				}
			}
			
		} else {
			MessageWaiting(room.GetSlots(), session);
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
		String classTitle = message.GetClassTitle();
		
		
		if (CheckRoom(rName)) {
			// TODO: Handle case Room exist
			MessageRoomExist(message, session);
			
		} else {			
			//TODO: Generate Quiz from DB
			
			//Quiz quiz = database.GetCourseByTitle(message.GetClassTitle()).GenerateQuiz("Test Quiz", 3);
			Quiz quiz = dummyQuiz(classTitle);
			
			QuizRoom room = new QuizRoom(classTitle, quiz, rSize);
			if (!room.CheckRoomFull()) {
				room.AddSession(session);
			}
			
			roomQuiz.put(rName, room);
			sessionRoomNameMap.put(session, rName);
			
			MessageInitializeRoom(session);
			
			if (rSize == 1) {
				roomQuiz.get(rName).StartGame();
				MessageStart(rName, session);
			} else {
				MessageWaiting(room.GetRoomLimit() - room.GetPlayerNum(), session);
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
		
		if (roomQuiz.containsKey(message.GetRoomName())) {
			QuizRoom room = roomQuiz.get(message.GetRoomName());
			
			if (room.HasStarted()) {
				if (room.HasNextQues(current)) {
					MessageNext(message, session);
					int unanswered = room.GetRemainingIncorrent(current);
					System.out.println("unanswered: " + unanswered );
					// Send unanswered message
					Message response = new Message();
					response.SetType("Unanswered");
					response.SetContent(unanswered + " hasn't answered"); 
					response.SetUnanswered(unanswered);
					
					MessageRemainingUnanswered(response, session);
				} else {
					MessageEndGame(message, session);
				}
			} else {
				MessageWaiting(room.GetSlots(), session);
			}
		} else {
			MessageRoomNotExist(message, session);
		}
		
		
	}
	 

	

	/**
	 * Handle Join message from the front end
	 * @param message
	 * @param session
	 */
	private synchronized void HandleJoin(Message message, Session session) {
		
		String rName = message.GetRoomName();
		
		if (roomQuiz.containsKey(rName)) {
			
			QuizRoom room = roomQuiz.get(rName);
			
			if (!room.CheckRoomFull()) {
				room.AddSession(session);
				sessionRoomNameMap.put(session, rName);	
				MessageJoinSuccess(message, session);
				if (room.CheckRoomFull()) {
					room.StartGame();
					for (Session s : room.GetPlayers()) {
						MessageStart(rName, s);
					}
				} else {
					for (Session s : room.GetPlayers()) {
						MessageWaiting(room.GetRoomLimit() - room.GetPlayerNum(), s);
					}
				}
			} else {
				MessageRoomFull(session);
			}
		} else {
			MessageRoomNotExist(message, session);
		}
		
	} 
	
	

	/**
	 * Return message: Room requested is full
	 * @param session
	 */
	private void MessageRoomFull(Session session) {
		
		try {
			Message response = new Message();
			response.SetType("Full");
			response.SetContent("Room is full");
			session.getBasicRemote().sendObject(response);
		} catch (EncodeException  e) {
			System.err.println("ee in messageInitializeRoom: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageInitializeRoom: " + e.getMessage());
		}
		
	}
	
	private void MessageRoomExist(Message message, Session session) {
		
		try {
			Message response = new Message();
			response.SetType("RoomExist");
			response.SetContent("Room already exist");
			session.getBasicRemote().sendObject(response);
		} catch (EncodeException  e) {
			System.err.println("ee in messageInitializeRoom: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageInitializeRoom: " + e.getMessage());
		}
	}
	
private void MessageRoomNotExist(Message message, Session session) {
		
		try {
			Message response = new Message();
			response.SetType("RoomNotExist");
			response.SetContent("Room doesn't exist");
			session.getBasicRemote().sendObject(response);
		} catch (EncodeException  e) {
			System.err.println("ee in messageInitializeRoom: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageInitializeRoom: " + e.getMessage());
		}
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
			response.SetContent("Waiting for " + required + " more player(s)...");
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
		//System.out.println("Trying to get room");
		QuizRoom room = roomQuiz.get(message.GetRoomName());
		int unanswered = room.GetPlayerNum();
		//System.out.println("Current player num is: " + room.GetPlayerNum());
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
	
	/**
	 * @param message The message should contain other players information
	 * @param session
	 */
	private void MessageOtherPlayer(double multi, Message message, Session session) {
		String content = "Session " + session.getId();
		switch ((int)multi) {
		case 1:
			//content += " got it.";
			break;
		case 2:
			//content += " got ";
			break;
		default:
			break;
		}
		
		content += " got " + multi + " points.";
		QuizRoom room = roomQuiz.get(message.GetRoomName());
		
		Message response = new Message();
		response.SetType("OtherPlayer");
		response.SetContent(content);
		try {
			for (Session s : room.GetPlayers()) {
				if (session != s) {
					s.getBasicRemote().sendObject(response);
				}
			}
		} catch (EncodeException  e) {
			System.err.println("ee in messageStart: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageStart: " + e.getMessage());
		}
	}
	
	private void MessageAnswerResponse(double multi, Message message, Session session) {
		try {
			String rName = message.GetRoomName();
			int current = message.GetCurrent();
			QuizRoom room = roomQuiz.get(rName);
			Message response = new Message();
			response.SetType("AnswerResponse");
			response.SetMulti(multi);
			response.SetScore(room.GetCurrentScore(session, current));
			
			if (multi == 0.0) {
				response.SetContent("WRONG!");
			} else {
				response.SetContent("CORRECT!");
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
			QuizRoom room = roomQuiz.get(message.GetRoomName());
			int ranking = room.GetRanking(session, room.GetQuizSize());
			response.SetType("EndGame");
			response.SetContent("Game ends...");
			response.SetRanking(ranking);
			session.getBasicRemote().sendObject(response);
		} catch (EncodeException  e) {
			System.err.println("ee in messageStart: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageStart: " + e.getMessage());
		}
		
	}
	
	public void MessageRemainingUnanswered(Message message, Session session) {
		try {
			session.getBasicRemote().sendObject(message);
		} catch (EncodeException  e) {
			System.err.println("ee in messageStart: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("ioe in messageStart: " + e.getMessage());
		}
		
	}
	
	private void MessageRoomOptions(Message message, Session session) {
		try {
			System.out.println("Connecting sessions: " + sessionVector.size());
			System.out.println("There are " + roomQuiz.size() + " games");
			Message response = new Message();
			response.SetType("AvailableRoom");
			if (roomQuiz.size() == 0) {
				response.SetContent("No Available Rooms...");
			} else {
				response.SetContent(roomQuiz.size() + " rooms are available");
				Iterator it = roomQuiz.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry pair = (Map.Entry)it.next();
					String rName = (String) pair.getKey();
					QuizRoom tempQuiz = (QuizRoom)pair.getValue();
					String title = tempQuiz.GetClassTitle();
					int slot = tempQuiz.GetRoomLimit() - tempQuiz.GetPlayerNum();
					response.AddAvailableRoom(title, rName, slot);
				}
			}
			
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
	private Quiz dummyQuiz(String classTitle) {
		List<Question> qPool = new ArrayList<>();
		
		Question q1 = new Question("What is the most important rule of Computer Science?");
		q1.addOption("When in doubt, Stack Overflow");
		q1.addOption("Never forget to flush();");
		q1.addOption("Avoid the business side");
		q1.addOption("Equity is a trap");
		q1.SetAnswer(2);
		
		Question q2 = new Question("What makes a CS student smile?");
		q2.addOption("Segmentation Fault (Core Dumped)");
		q2.addOption("Merge Conflict --Aborted");
		q2.addOption("\"Grade updated on Blackboard...\"");
		q2.addOption("10 points on a final presentation");
		q2.SetAnswer(4);
		
		Question q3 = new Question("Which data structure is most memory efficient?");
		q3.addOption("AVL Trees");
		q3.addOption("Red/Black Trees");
		q3.addOption("Stacks");
		q3.addOption("Is that even a thing?");
		q3.SetAnswer(4);
		
		Question q4 = new Question("What is the Big-O of Facebook¡¯s delete function?");
		q4.addOption("O(n^2)");
		q4.addOption("O(n)");
		q4.addOption("O(Logn)");
		q4.addOption("Facebook never forgets");
		q4.SetAnswer(4);
		
		Question q5 = new Question("What is a Semaphore?");
		q5.addOption("A Pokemon");
		q5.addOption("An extinct Crustacean");
		q5.addOption("A Shepherd for resources");
		q5.addOption("A French delicacy");
		q5.SetAnswer(3);
		
		qPool.add(q1);
		qPool.add(q2);
		qPool.add(q3);
		qPool.add(q4);
		qPool.add(q5);
		
		Quiz quiz = new Quiz(classTitle, qPool, 5);
		return quiz;
	}
	
}
