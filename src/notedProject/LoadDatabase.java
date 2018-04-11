package notedProject;

import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonParseException;

public class LoadDatabase {
	private List<Course> courses;
	private List<User> users;
	
	private String path;
	private DummyDatabase database;
	
	public LoadDatabase(String filePath) {
		path = filePath;
		courses = new ArrayList<Course>();
		users = new ArrayList<User>();
		try {
			InputStream inputStream = new FileInputStream(path);
			Reader reader = new InputStreamReader(inputStream);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			database = gson.fromJson(reader, DummyDatabase.class);
			users = database.users;
			courses = database.courses;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public LoadDatabase(InputStream content, String filePath) {
		
		this.path = filePath;
		InputStream inputStream = content;
		
		courses = new ArrayList<Course>();
		users = new ArrayList<User>();
		
		Reader reader = new InputStreamReader(inputStream);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		database = gson.fromJson(reader, DummyDatabase.class);
		users = database.users;
	}
	
	public void writeData() {
		try (Writer writer = new FileWriter(path)) {
		    Gson gson = new GsonBuilder().setPrettyPrinting().create();
		    gson.toJson(database, writer);
//		    System.out.println("");
		    System.out.println("File has been saved ");
		    
		} catch (IOException e) {
			System.out.println("");
	    	System.out.println(e.getMessage());
		}
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
	
	public boolean AddUser(String username, String fname, String lname, String password, String email, String url) {
		User temp = new User(username, lname, fname, password, email, url);
		users.add(temp);
		writeData();
		return true;
	}
	
	public void Remove(String username, int delete, int type) {
		User u = GetUser(username);
		if (type == 0) {
			u.removeNote(delete);
		} else if (type == 1) {
			u.removeQuestion(delete);
		} else if (type == 2) {
			u.removeCourse(delete);
		}
	}
	
	public User getUser(String username) {
		return GetUser(username);
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
	
	public boolean CheckCourseByTitle(String title) {
		boolean check = false;
		for (Course course : courses) {
			if (course.GetTitle().equals(title)) {
				check = true;
			}
		}
		return check;
	}
	
	public Course GetCourseByTitle(String title) {
		Course temp = null;
		if (CheckCourseByTitle(title)) {
			for (Course course : courses) {
				if (course.GetTitle().equals(title)) {
					temp = course;
				}
			}
		}
		return temp;
	}

}
