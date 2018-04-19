package notedProject;

import java.io.Serializable;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;

//Serializable needed

public class User implements Serializable {
	
	public static final long serialVersionUID = 1;
	
	private Name name;
	private String username;
	private String email;
	private String password;
	private String picURL;
	private ArrayList<Note> savedNotes;
	private ArrayList<Question> savedQuestions;
	private ArrayList<Course> savedCourses;
//	LoadDatabase database = new LoadDatabase();
//	Gson gson = new Gson();
	public User(String username, String lName, String fName, String password, String email, String url) {
		this.username = username;
		this.email = email;
		this.name = new Name(fName, lName);
		this.password = password;
		this.picURL = url;
//		System.out.println("url:"+picURL);
		this.savedNotes = new ArrayList<Note>();
		this.savedQuestions = new ArrayList<Question>();
		this.savedCourses = new ArrayList<Course>();
	}
	
	public boolean CheckPassword(String password) {
		if (this.password.equals(password)) {
			return true;
		} else {
			return false;
		}
	}
	
	public class Name implements Serializable{
		
		public static final long serialVersionUID = 2;
		
		private String firstname;
		private String lastname;
	
		public Name (String fname, String lname) {
			this.firstname = fname;
			this.lastname = lname;
		}
		
		public String getFirst() {
			return this.firstname;
		}
		public String getLast() {
			return this.lastname;
		}
	}
	
	
	public String getFirstName() {
		return this.name.getFirst();
	}
	public String getLastName() {
		return this.name.getLast();
	}	
	public String getUsername() {
		return this.username;
	}
	public String getEmail() {
		return this.email;
	}
	public String getPassword() {
		return this.password;
	}
	public String getPicURL() {
		return this.picURL;
	}
	public ArrayList<Note> getNotes() {
		return this.savedNotes;
	}
	public ArrayList<Question> getQuestions() {
		return this.savedQuestions;
	}
	public ArrayList<Course> getCourses() {
		return this.savedCourses;
	}
	
	/* REMOVE */
	public void removeNote(int i) {
//		DBObject preObj = (DBObject) JSON.parse(gson.toJson(this));
		if (i != -1) savedNotes.remove(i);
//		DBObject newObj = (DBObject) JSON.parse(gson.toJson(this));
//		database.userColl.update(preObj, newObj);
	}
	public void removeQuestion(int i) {
//		DBObject preObj = (DBObject) JSON.parse(gson.toJson(this));
		if (i != -1) savedQuestions.remove(i);
//		DBObject newObj = (DBObject) JSON.parse(gson.toJson(this));
//		database.userColl.update(preObj, newObj);
	}
	public void removeCourse(int i) {
//		DBObject preObj = (DBObject) JSON.parse(gson.toJson(this));
		if (i != -1) savedCourses.get(i);
//		DBObject newObj = (DBObject) JSON.parse(gson.toJson(this));
//		database.userColl.update(preObj, newObj);
	}
	@SuppressWarnings("deprecation")
	public void addNote(Note n) {
		
//		DBObject preObj = (DBObject) JSON.parse(gson.toJson(this));
		boolean exist=false;
		for(Note i:this.getNotes()) {
			if(i.getTitle().equals(n.getTitle()))
				exist=true;
		}
		if(exist) {
			this.getNotes().add(n);
//			DBObject newObj = (DBObject) JSON.parse(gson.toJson(this));
//			database.courseColl.update(preObj, newObj);
		}
		
	}
	public void addQuestio(Question q) {
//		DBObject preObj = (DBObject) JSON.parse(gson.toJson(this));
		boolean exist=false;
		for(Question i:this.getQuestions()) {
			if(i.getTitle().equals(q.getTitle()))
				exist=true;
		}
		if(exist) {
			this.getQuestions().add(q);
//			DBObject newObj = (DBObject) JSON.parse(gson.toJson(this));
//			database.userColl.update(preObj, newObj);
		}
			
		
	}
	public void addCourse(Course c) {
//		DBObject preObj = (DBObject) JSON.parse(gson.toJson(this));
		boolean exist=false;
		for(Course i:this.getCourses()) {
			if(i.GetTitle().equals(c.GetTitle()))
				exist=true;
		}
		if(exist) {
			this.getCourses().add(c);
//			DBObject newObj = (DBObject) JSON.parse(gson.toJson(this));
//			database.userColl.update(preObj, newObj);
		}
			
		
	}
}

