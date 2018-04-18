package notedProject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.websocket.Session;

import org.apache.catalina.Store;

public class QuizRoom {
	private Quiz quiz;
	private String roomName;
	private String classTitle;
	private int roomSize;
	private List<Session> players;
	HashMap<Integer , List<Session> > answerQueue;
	HashMap<Session, AnswerSet> playerAnswerSet;
	
	public QuizRoom(String roomName, Quiz quiz, int size) {
		
		// Initialize
		this.roomName = roomName;
		this.classTitle = quiz.GetTitle();
		this.quiz = quiz;
		this.roomSize = size;
		players = new ArrayList<>();
		answerQueue = new HashMap<>();
		playerAnswerSet = new HashMap<>();
		
		for (int i = 1 ; i <= quiz.GetQuizSize(); i++) {
			answerQueue.put(i, new ArrayList<Session>());
		}
	}
	
	/**
	 * @param session
	 * @return true if added successfully; false if room is full
	 * 
	 */
	public synchronized boolean AddSession(Session session) {
		//TODO: Can implement throw roomFull Exception
		if (players.size() < roomSize) {
			players.add(session);
			playerAnswerSet.put(session, new AnswerSet(quiz.GetQuizSize()));
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * @param session
	 * @param qID
	 * @param choice
	 * @param time
	 * @return 3.0 if 1st; 2.0 if 2nd; 1.0 if correct; 0.0 if uncorrect
	 */
	public synchronized double HandleAnswer(Session session, int qID, int choice, int time) {
		//Store answer info in answerSet
		double newMulti = 0.0;
		playerAnswerSet.get(session).StoreAnswer(qID, choice, time);
		
		//Check if answer is correct
		List<Session> currentQueue = answerQueue.get(qID); 
		if (choice == GetQuestionByID(qID).getAnswer()) {
			//If correct put in queue
			newMulti = 1.0;
			currentQueue.add(session);
			int size = currentQueue.size();
			switch (size) {
			case 1:
				newMulti = 3.0;
				break;
				
			case 2:
				newMulti = 2.0;
				break;

			default:
				break;
			}
			//SetMultipier
			playerAnswerSet.get(session).SetQuestionMultiplier(qID, newMulti);
		}
		
		
		
		
		// return if correct choice
		return newMulti;
	}
	
	
	public String GetClassTitle() {
		return classTitle;
	}
	
	public boolean HasNextQues(int qID) {
		return (qID <= quiz.GetQuizSize());
	}
	
	
	public Question GetQuestionByID(int id) {
		if (id <= quiz.GetQuizSize()) {
			return quiz.GetQuestionById(id);
		} else {
			return null;
		}
	}
	
	public boolean CheckRoomFull() {
		return (players.size() >= roomSize);
	}
	
	public String GetRoomName() {
		return roomName;
	}
	
	public List<Session> GetPlayers() {
		return players;
	}
	
	public int GetPlayerNum() {
		return players.size();
	}
	
	public int GetRoomLimit() {
		return roomSize;
	}
}
