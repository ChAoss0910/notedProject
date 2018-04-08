package notedProject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


// By Burt

// Quiz synchronize method needed

public class Quiz {
	private String title;
	private List<Question> qPool;
	private List<Question> qList;
	
	private int qPointer;
	private int quizSize;
	
	public Quiz(String t, List<Question> qPool, int size) {
		this.qPool = qPool;
		quizSize = size;
		title = t;
		GenerateQuiz();
		qPointer = 0;
	}
	
	private void GenerateQuiz() {
		Collections.shuffle(qPool);
		if (quizSize >= qPool.size()) {
			qList = new ArrayList<Question>(qPool);
		} else {
			for (int i = 0; i < quizSize; i++) {
				qList.add(qPool.get(i));
			}
		}
	}
	
	public Question GetCurrentQuestion() {
		Question temp = null;
		if (qPointer < qList.size()) {
			temp = qList.get(qPointer);
		}
		return temp;
	}
	
	public boolean CheckAnswerCurrent(int questionID, int choice) {
		Question temp = qList.get(questionID);
		if (temp!=null) {
			if (choice == temp.getAnswer()) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
	
	public int GetScore(List<Integer> choices, List<Integer> multiplier) {
		int score = 0;
		if (choices.size() != qList.size() || multiplier.size() != qList.size()) {
			System.err.println("Choices and Multiplier not corresponding");
			return -1;
		}
		for (int i = 0; i < choices.size() ; i++) {
			if (choices.get(i) == qList.get(i).getAnswer()) {
				score += multiplier.get(i);
			}
		}
		return score;
	}
	
	public boolean HasNextQuestion() {
		return (qPointer < qList.size());
	}
	
	public Question GetNextQuestion() {
		if (HasNextQuestion()) {
			qPointer ++;
			return qList.get(qPointer - 1);
		} else {
			return null;
		}
	}
	
	
	
	public void SetTitle(String t) {
		title = t;
	}
	
	public String GetTitle() {
		return title;
	}
}
