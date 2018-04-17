package notedProject;

import java.util.Vector;

public class AnswerSet {
	private Vector<Answer> answers;
	private int quizSize;
	
	public AnswerSet(int quizSize) {
		this.quizSize = quizSize;
		
		answers = new Vector<>();
		for (int i = 0; i < quizSize; i++) {
			answers.add(new Answer());
		}
	}
	
	/**
	 * @param qID, index start from 1
	 * @return
	 */
	private Answer GetAnswerById(int qID) {
		return answers.get(qID - 1);
	}
	
	/**
	 * @param qID
	 * @param choice
	 * @param time
	 * @return false if answer was stored before; true if answer is stored the first time
	 */
	public boolean StoreAnswer(int qID, int choice, int time) {
		boolean hasStored = GetAnswerById(qID).HasAnswer();
		Answer temp = GetAnswerById(qID);
		temp.SetAnswer(choice);
		temp.SetTime(time);
		return hasStored;
	}
	
	public void SetQuestionMultiplier(int qID, double multi) {
		GetAnswerById(qID).SetMultiplier(multi);
	}
	
	public double GetCurrentScore(int qID) {
		double score = 0.0;
		for (int i = 1; i <= qID; i++) {
			score += GetAnswerById(i).GetMultiplier();
		}
		return score;
	}
	
	
	private class Answer {
		private int answer;
		private int time;
		private double multiplier;
		
		public Answer() {
			this.answer = -1;
			this.time = -1;
			this.multiplier = 0.0;
		}
		
		public boolean HasAnswer() {
			return (answer != -1);
		}
		
		public void SetAnswer(int answer) {
			this.answer = answer;
		}
		
		public int GetAnswer() {
			return answer;
		}
		
		public void SetTime(int time) {
			this.time = time;
		}
		
		public int GetTime() {
			return time;
		}
		
		public double GetMultiplier() {
			return multiplier;
		}
		
		public void SetMultiplier(double multi) {
			this.multiplier = multi;
		}
	}
}
