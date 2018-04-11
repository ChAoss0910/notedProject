package notedProject;

import java.util.List;


// By Burt

// Serializable needed

public class Course {
	
	private String title;
	private List<Question> questions;
	private List<Note> notes;
	
	public Course(String title) {
		this.title = title;
	}
	
	public String GetTitle() {
		return title;
	}
	
	public void SetTitle(String title) {
		this.title = title;
	}
	
	public List<Note> GetNotes() {
		return notes;
	}
	
	public void AddNote(Note newNote) {
		notes.add(newNote);
	}
	
	public void RemoveNote(Note dNote) {
		if (notes.contains(dNote)) {
			notes.remove(dNote);
		}
	}
	
	public boolean AddQuestion(Question q) {
		// returns false if Question already exists; true if add successfully
		if (questions.contains(q)) {
			return false;
		}
		else {
			questions.add(q);
			return true;
		}
	}
	
	public List<Question> GetQuestions() {
		return questions;
	}
	
	public int GetQuestionSize() {
		return questions.size();
	}
	
	public boolean RemoveQuestion(Question q) {
		if (questions.contains(q)) {
			questions.remove(q);
			return true;
		} else {
			return false;
		}
	}
	
	public Quiz GenerateQuiz(String title, int size) {
		return new Quiz(title, questions, size);
	}
}

