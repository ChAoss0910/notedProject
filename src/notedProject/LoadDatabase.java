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
	
	public boolean CheckUserExist(String uName) {
		boolean check = false;
		for (User u: users) {
			if (u.getUsername().equals(uName)) {
				check = true;
			}
		}
		return check;
	}
	
	public boolean AddUser(String username, String fname, String lname, String password, String email) {
		User temp = new User(username, lname, fname, password, email);
		return true;
	}
	
	/**
	 * @param username
	 * @return User by username; null if user not exist
	 */
	private User GetUser(String uName) {
		
		User temp = null;
		for (User u: users) {
			if (u.getUsername().equals(uName)) {
				temp = u;
			}
		}
		return temp;
	}

	
	/**
	 * @param uName
	 * @param password
	 * @return True only if combination works; False otherwise
	 */
	public boolean CheckLogin(String uName, String password) {
		
		if (CheckUserExist(uName)) {
			if (GetUser(uName).CheckPassword(password)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
}
