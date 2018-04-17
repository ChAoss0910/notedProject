package notedProject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Iterator;

import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.util.JSON;


public class MongoDBJDBC{
   public static void main( String args[] ){
      try{   
    	  
       // start driver
         MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
       
         // connect to database
//         MongoDatabase mongoDatabase = mongoClient.getDatabase("NotedProject");  
         DB db= mongoClient.getDB("NotedProject");
       System.out.println("Connect to database successfully");
//       mongoDatabase.createCollection("test");
//       System.out.println("test created");
       DBCollection coll = db.getCollection("users");
       System.out.println("users choosed");
//       Document user1 = new Document("email", "email@usc.edu").append("name", new Document("firstname", "dummyFirst").
//    		   append("lastname", "dummyLast")).append("password", 111111).append("username", "user1").append("picURL", 
//    				   "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg");
//       
//       Document user2 = new Document("email", "email@usc.edu").append("name", new Document("firstname", "dummyFirst2").
//    		   append("lastname", "dummyLast2")).append("password", 111111).append("username", "user2").append("picURL", 
//    				   "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
//       ArrayList<Document> users= new ArrayList<Document>();
//       users.add(user1);
//       users.add(user2);
//       collection.insertMany(users);
//       System.out.println("document inserted");  
//        
//       DBObject object = coll.findOne("user3");  
//       User user5 = new User("user5","dummy","dummy","12345","email@usc.edu","https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg");
//       
//       Gson gson=new Gson();
//       //转换成json字符串，再转换成DBObject对象
//       DBObject dbObject = (DBObject) JSON.parse(gson.toJson(user5));
//       //插入数据库
//       coll.insert(dbObject);
       
       User user3 = new User("user3","dummy","dummy","123123","email@usc.edu","https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg");
       //BasicDBObject query = new BasicDBObject("user3",user3);
//       coll.remove(query);
//       DBCursor findIterable = coll.find();  
//       Iterator<DBObject> mongoCursor = findIterable.iterator();  
//       while(mongoCursor.hasNext()){  
//          System.out.println(mongoCursor.next());  
//       }  
       LoadDatabase database = new LoadDatabase("database.json");
       if(database.CheckCourseByTitle("csci201"))
    	   	System.out.println("lalala");
    	   
//       if(database.CheckUserExist("user1"))
//    	   		System.out.println("lalala");
//    	   	database.printUsers();
//    	   	if(database.CheckLogin("user1","111111"))
//    	   		System.out.println("wanle");
//       Document test= new Document("users")
      }catch(Exception e){
        System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
   }
}