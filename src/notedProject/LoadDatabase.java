package notedProject;

import java.io.Reader;

import java.io.Writer;
import java.util.ArrayList;
import java.util.Iterator;
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
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.util.JSON;

public class LoadDatabase {
	private List<Course> courses;
	private List<User> users;
	
	private String path;
	private DummyDatabase database;
	public Gson gson = new GsonBuilder().setPrettyPrinting().create();
	 private DBCollection userColl;
	 private DBCollection courseColl;
	 
	public LoadDatabase() {
		
		MongoClient mongoClient = new MongoClient( "localhost" , 27017 ); 
	    DB db= mongoClient.getDB("Noted");
	    userColl = db.getCollection("Users");
	    courseColl = db.getCollection("Courses");
	    
		DBCursor findIterable = userColl.find();  
		Iterator<DBObject> mongoCursor = findIterable.iterator();  
		while(mongoCursor.hasNext()){  
			System.out.println(mongoCursor.next());  
		}
	}

	public void writeData() {
		try (Writer writer = new FileWriter(path)) {
		    Gson gson = new GsonBuilder().setPrettyPrinting().create();
		    gson.toJson(database, writer);
		    System.out.println("File has been saved ");
		    
		} catch (IOException e) {
			System.out.println("");
	    	System.out.println(e.getMessage());
		}
	}

	
	public boolean CheckUserExist(String uName) {
		boolean check = false;
		DBCursor cursor= userColl.find();  
		while(cursor.hasNext()) {
			DBObject obj=cursor.next();
        	
			User u=gson.fromJson(obj.toString(), User.class);
			System.out.println(u.getUsername());
			if (u.getUsername().equals(uName)) {
				check = true;
			}
			
		}
//		for (User u: users) {
//			DBObject dbObject = (DBObject) JSON.parse(gson.toJson(u));
//			if (u.getUsername().equals(uName)) {
//				check = true;
//			}
//		}
		return check;
	}
	
	public boolean AddUser(String username, String fname, String lname, String password, String email, String url) {
		User temp = new User(username, lname, fname, password, email, url);
		 DBObject dbObject = (DBObject) JSON.parse(gson.toJson(temp));
		 userColl.insert(dbObject);

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
	public void printUsers() {
		DBCursor findIterable = userColl.find();  
	    Iterator<DBObject> mongoCursor = findIterable.iterator();  
	    while(mongoCursor.hasNext()){  
	    		User u=gson.fromJson(mongoCursor.next().toString(), User.class);
	        System.out.println(u.getUsername()+" "+u.getEmail());  
	    }  
	}
	
	/**
	 * @param username
	 * @return User by username; null if user not exist
	 */
	private User GetUser(String uName) {
		User temp = null;
		DBCursor cursor= userColl.find();  
		while(cursor.hasNext()) {
			DBObject obj=cursor.next();
        	//Deserialization
			User u=gson.fromJson(obj.toString(), User.class);
			if (u.getUsername().equalsIgnoreCase(uName)) {
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
		DBCursor cursor= courseColl.find();  
		
		while(cursor.hasNext()) {
			DBObject obj=cursor.next();
			Course c=gson.fromJson(obj.toString(), Course.class);
			if (c.GetTitle().equals(title)) {
				check = true;
			}
		}
		return check;
	}
	
	public Course GetCourseByTitle(String title) {
		Course temp = null;
		DBCursor cursor= courseColl.find();  
		if(CheckCourseByTitle(title)) {  
			while(cursor.hasNext()) {
				DBObject obj=cursor.next();
				Course c=gson.fromJson(obj.toString(), Course.class);
				if (c.GetTitle().equals(title)) {
					temp = c;
				}
			}
		}
		return temp;
	}

}
