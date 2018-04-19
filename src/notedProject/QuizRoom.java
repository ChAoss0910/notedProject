package notedProject;

import java.util.ArrayList;
import java.util.Collections;
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
	HashMap<Integer , List<Session> > bingoQueue;
	HashMap<Integer , List<Session> > answeredQueue;
	HashMap<Session, AnswerSet> playerAnswerSet;
	private boolean started;
	
	public QuizRoom(String roomName, Quiz quiz, int size) {
		
		// Initialize
		this.roomName = roomName;
		this.classTitle = quiz.GetTitle();
		this.quiz = quiz;
		this.roomSize = size;
		players = new ArrayList<>();
		bingoQueue = new HashMap<>();
		answeredQueue = new HashMap<>();
		playerAnswerSet = new HashMap<>();
		started = false;
		
		for (int i = 1 ; i <= quiz.GetQuizSize(); i++) {
			bingoQueue.put(i, new ArrayList<Session>());
			answeredQueue.put(i, new ArrayList<Session>());
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
			if (players.contains(session)) {
				
			} else {
				players.add(session);
				playerAnswerSet.put(session, new AnswerSet(quiz.GetQuizSize()));
			}
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * @param session
	 * @return if sessions container is empty
	 */
	public boolean HasSession(Session session) {
		return players.contains(session);
	}
	
	public synchronized boolean RemoveSession(Session session) {
		players.remove(session);
		return players.isEmpty();
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
		System.out.println(qID + " " + choice + " " + time);
		
		//Check if answer is correct
		if (qID > quiz.GetQuizSize() || qID < 1) {
			return -1;
		}
		playerAnswerSet.get(session).StoreAnswer(qID, choice, time);
		answeredQueue.get(qID).add(session);
		List<Session> currentQueue = bingoQueue.get(qID); 
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
	
	public int GetRemainingUnanswered(int qID) {
		return this.GetRoomLimit() - answeredQueue.get(qID).size();
	}
	
	public int GetRemainingIncorrent(int qID) {
		return this.GetRoomLimit() - bingoQueue.get(qID).size();
	}
	
	public String GetClassTitle() {
		return classTitle;
	}
	
	public boolean HasNextQues(int qID) {
		return (qID <= quiz.GetQuizSize());
	}
	
	public int GetQuizSize() {
		return quiz.GetQuizSize();
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
	
	public int GetSlots() {
		return GetRoomLimit() - GetPlayerNum();
	}
	
	public boolean HasStarted() {
		return started;
	}
	
	public boolean StartGame() {
		if (CheckRoomFull()) {
			started = true;
		}
		return started;
	}
	
	public double GetCurrentScore(Session session, int qID) {
		return playerAnswerSet.get(session).GetCurrentScore(qID);
	}
	
	public int GetRanking(Session session, int qID) {
		int current = qID;
		if (qID > quiz.GetQuizSize()) {
			current = quiz.GetQuizSize();
		}
		
		int ranking = 1;
		double myScore = GetCurrentScore(session, qID);
		
		List<Double> scores = new ArrayList<>(); 
		for (Session s : GetPlayers()) {
			scores.add(GetCurrentScore(s, current));
		}
		Collections.sort(scores, Collections.reverseOrder());
		
		for (Double score : scores) {
			if (score > myScore) {
				ranking ++;
			}
		}
		return ranking;	
	}
	
}
