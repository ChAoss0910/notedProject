package notedProject;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;


public class MongoDBJDBC{
   public static void main( String args[] ){
      try{   
    	  
       // 连接到 mongodb 服务
         MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
       
         // 连接到数据库
         MongoDatabase mongoDatabase = mongoClient.getDatabase("Noted");  
       System.out.println("Connect to database successfully");
//       mongoDatabase.createCollection("test");
//       System.out.println("集合创建成功");
       MongoCollection<Document> collection = mongoDatabase.getCollection("test");
       System.out.println("集合 test 选择成功");
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
//       System.out.println("文档插入成功");  
       collection.deleteOne(Filters.eq("username", "user1"));  
       collection.deleteOne(Filters.eq("username", "user2"));  
       FindIterable<Document> findIterable = collection.find();  
       MongoCursor<Document> mongoCursor = findIterable.iterator();  
       while(mongoCursor.hasNext()){  
          System.out.println(mongoCursor.next());  
       }  
//       Document test= new Document("users")
      }catch(Exception e){
        System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
   }
}