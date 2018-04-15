package TestGame;

import java.util.HashMap;

import javax.websocket.Session;
public class PlayerQuizChoice {
	private Session session;
	private Quiz quiz;
	private HashMap<Integer, Integer> choices;
	private HashMap<Integer, Double> times;
	private HashMap<Integer, Double> multipliers;
	private int current;
	
	public PlayerQuizChoice(Session session, Quiz quiz) {
		this.session = session;
		this.quiz = quiz;
		choices = new HashMap<>();
		times = new HashMap<>();
		multipliers = new HashMap<>();
		current = 1;
	}
	
	public int GetCurrent() {
		return current;
	}
	
	public boolean StoreChoice(int currentIndex, int choice, double time) {
		if (currentIndex == current) {
			//Same question
			choices.replace(currentIndex, choice);
			times.replace(currentIndex, time);
			return false;
		} else {
			//Next question
			current ++;
			choices.put(currentIndex, choice);
			times.put(currentIndex, time);
			return true;
		}
	}
	
	public void SetMultiplier(int currentIndex, double multiplier) {
		multipliers.put(currentIndex, multiplier);
	}
	
}
