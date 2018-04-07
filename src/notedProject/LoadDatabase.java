package notedProject;

import java.util.ArrayList;
import java.util.List;

public class LoadDatabase {
	private List<Course> courses;
	private List<User> users;
	
	public LoadDatabase() {
		courses = new ArrayList<Course>();
		users = new ArrayList<User>();
	}
	
	public boolean loadData() {
		return true;
	}
	
	public boolean CheckUserExist(String userID) {
		return true;
	}
	
	public boolean AddUser(String username, String fname, String lname, String password, String email) {
		User temp = new User(username, lname, fname, password, email);
		return true;
	}
	
}
