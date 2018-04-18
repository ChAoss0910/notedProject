package notedProject;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.util.JSON;

public class JsonToDatabase {
	
	private List<Course> courses;
	private List<User> users;
	
	private DummyDatabase database;
	
	public Gson gson = new GsonBuilder().setPrettyPrinting().create();
	private DBCollection userColl;
	private DBCollection courseColl;
	
	public JsonToDatabase() {
		courses = new ArrayList<Course>();
		users = new ArrayList<User>();
		
		try {
			MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
		       
	         // connect to database
//	         MongoDatabase mongoDatabase = mongoClient.getDatabase("Noted");  
	         DB db= mongoClient.getDB("Noted");
	        userColl = db.getCollection("Users");
	        courseColl = db.getCollection("Courses");
	    
			InputStream inputStream = new FileInputStream("database.json");
			Reader reader = new InputStreamReader(inputStream);
			
			database = gson.fromJson(reader, DummyDatabase.class);
			users = database.users;
			courses = database.courses;
			for(User each:users) {
				DBObject dbObject = (DBObject) JSON.parse(gson.toJson(each)); 
				userColl.insert(dbObject);
			}
			for(Course each:courses) {
				DBObject dbObject = (DBObject) JSON.parse(gson.toJson(each)); 
				courseColl.insert(dbObject);
			}
			DBCursor findIterable = userColl.find();  
		       Iterator<DBObject> mongoCursor = findIterable.iterator();  
		       while(mongoCursor.hasNext()){  
		    	   
		          System.out.println(mongoCursor.next());  
		     }  
//		       while(mongoCursor.hasNext()){  
//		    	
//		          System.out.println(mongoCursor.next());  
//		     }  
		      
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main( String args[] ){
		 JsonToDatabase jsonToDatabase = new JsonToDatabase();
	}
	 
}
