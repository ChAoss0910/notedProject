package notedProject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


// By Burt

// Quiz synchronize method needed

public class Quiz {
	private int id;
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
	
	public Question GetNextQuestion() {
		Question question = qList.get(qPointer);
		qPointer ++;
		if (qPointer >= qList.size()) {
			qPointer = 0;
		}
		return question;
	}
	
	public void SetID(int id) {
		this.id = id;
	}
	
	public int GetID() {
		return id;
	}
	
	public void SetTitle(String t) {
		title = t;
	}
	
	public String GetTitle() {
		return title;
	}
}
