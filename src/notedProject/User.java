package notedProject;

import java.io.Serializable;
import java.util.ArrayList;

//Serializable needed

public class User implements Serializable {
	
	public static final long serialVersionUID = 1;
	
	private Name name;
	private String username;
	private String email;
	private String password;
	private ArrayList<Note> savedNotes;
	private ArrayList<Question> savedQuestions;
	private ArrayList<Course> savedCourses;
	
	public User(String username, String lName, String fName, String password, String email) {
		this.username = username;
		this.email = email;
		this.name = new Name(fName, lName);
		this.password = password;
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
	public Note getNote(int i) {
		return this.savedNotes.get(i);
	}
	public Question getQuestion(int i) {
		return this.savedQuestions.get(i);
	}
	public Course getCourses(int i) {
		return this.savedCourses.get(i);
	}
}
