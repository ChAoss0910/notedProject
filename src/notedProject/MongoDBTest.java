package notedProject;

import java.util.ArrayList;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;

public class MongoDBTest {
	 public static void main( String args[] ){
	      try{   
	    	  
	    	  	// start driver
	         MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	         // connect to database
//	         MongoDatabase mongoDatabase= mongoClient.getDatabase("Noted");
	         DB db= mongoClient.getDB("Noted");  
//	         DB db= ((Mongo) mongoDatabase).getDB("mycol");
	       
	         DBCollection collection= db.getCollection("users");
	       System.out.println("Connect to database successfully");
//	       mongoDatabase.createCollection("test");
//	       System.out.println("test created");
//	       MongoCollection<Document> collection = mongoDatabase.getCollection("test");
	       System.out.println("users choosed");
	       BasicDBObject user1 = new BasicDBObject("email", "email@usc.edu").append("name", new BasicDBObject("firstname", "dummyFirst").
	    		   append("lastname", "dummyLast")).append("password", 111111).append("username", "user1").append("picURL", 
	    				   "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg");
	       
	       BasicDBObject user2 = new BasicDBObject("email", "email@usc.edu").append("name", new BasicDBObject("firstname", "dummyFirst2").
	    		   append("lastname", "dummyLast2")).append("password", 111111).append("username", "user2").append("picURL", 
	    				   "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
	       ArrayList<BasicDBObject> users= new ArrayList<BasicDBObject>();
//	       Document query = new Document("username", "user1");
//	       collection.deleteOne(Filters.eq("username", "user1"));  
//	       collection.deleteOne(query);
//	       BasicDBObject query2 = new BasicDBObject("username", "user2");
//	       collection.remove(query2);
	       
	       users.add(user1);
	       users.add(user2);
	       
	       collection.insert(users);
//	       System.out.println("document inserted");  
//	         
	       DBCursor cursor = collection.find();  
//	       Iterator<DBObject> mongoCursor = findIterable.iterator();  
	       while(cursor.hasNext()){ 
	    	   	System.out.println("users");
	          System.out.println(cursor.next());  
	       }  
//	       Document test= new Document("users")
	      }catch(Exception e){
	        System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	     }
	   }
}
