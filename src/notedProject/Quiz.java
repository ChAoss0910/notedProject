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

	/**
	 * For Server use, to get score for each player
	 * @param choices: List of choices 
	 * @param multiplier: List of multiplier determined by answer time; for single player, use 1
	 * @return
	 */
	public int GetScore(List<Integer> choices, List<Integer> multiplier) {
		int score = 0;
		if (choices.size() != qList.size() || multiplier.size() != qList.size()) {
			System.err.println("Choices and Multiplier not corresponding");
			return -1;
		}
		for (int i = 0; i < choices.size() ; i++) {
			// System.out.println("Choice " + choices.get(i) + ", Answer " + qList.get(i).getAnswer());
			if (choices.get(i) == qList.get(i).getAnswer()) {
				
				score += multiplier.get(i);
			}
		}
		return score;
	}
	
	public boolean HasNextQuestion() {
		return (qPointer < qList.size());
	}
	
	/**
	 * USE HasNextQuestion before calling GetNextQuestion, otherwise might get NULL	
	 */
	public Question GetNextQuestion() {
		if (HasNextQuestion()) {
			qPointer ++;
			return qList.get(qPointer - 1);
		} else {
			return null;
		}
	}
	
	public Question GetQuestionById(int id) {
		if (id <= qList.size()) {
			return qList.get(id - 1);
		} else {
			return null;
		}
	}
	
	public int GetQuizSize() {
		return qList.size();
	}
	
	public void SetTitle(String t) {
		title = t;
	}
	
	public String GetTitle() {
		return title;
	}
}
