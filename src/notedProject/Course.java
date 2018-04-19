package notedProject;

import java.util.List;

import com.mongodb.DBObject;
import com.mongodb.util.JSON;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonParseException;

// By Burt

// Serializable needed

public class Course {
	
	private String title;
	private List<Question> questions;
	private List<Note> notes;
//	LoadDatabase database = new LoadDatabase();
	
//	Gson gson = new Gson();
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
//		
		notes.add(newNote);
//		 DBObject newObj = (DBObject) JSON.parse(gson.toJson(this));
//		database.courseColl.update(preObj, newObj);
	}
	
	public void RemoveNote(Note dNote) {
		if (notes.contains(dNote)) {
//			DBObject preObj = (DBObject) JSON.parse(gson.toJson(this));
			notes.remove(dNote);
//			DBObject newObj = (DBObject) JSON.parse(gson.toJson(this));
//			database.courseColl.update(preObj, newObj);
		}
	}
	
	public boolean AddQuestion(Question q) {
		// returns false if Question already exists; true if add successfully
		if (questions.contains(q)) {
			return false;
		}
		else {
//			DBObject preObj = (DBObject) JSON.parse(gson.toJson(this));
			questions.add(q);
//			DBObject newObj = (DBObject) JSON.parse(gson.toJson(this));
//			database.courseColl.update(preObj, newObj);
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
//			DBObject preObj = (DBObject) JSON.parse(gson.toJson(this));
			questions.remove(q);
//			DBObject newObj = (DBObject) JSON.parse(gson.toJson(this));
//			database.courseColl.update(preObj, newObj);
			return true;
		} else {
			return false;
		}
	}
	
	public Quiz GenerateQuiz(String title, int size) {
		return new Quiz(title, questions, size);
	}
}

