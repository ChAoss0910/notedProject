package notedProject;

import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import com.google.gson.JsonArray;

public class MessageEncoder implements Encoder.Text<Message> {

  @Override
  public String encode(Message message) throws EncodeException {

    JsonObjectBuilder jsonObjectBuilder = Json.createObjectBuilder()
        .add("type", message.GetType())
        .add("content", message.GetContent());
        
    if (message.GetRanking() != -1) {
    	jsonObjectBuilder.add("ranking", message.GetRanking());
    }
    
    if (message.GetScore() != -1) {
    	jsonObjectBuilder.add("score", message.GetScore());
    }
    if (message.GetMulti() != -1) {
    	jsonObjectBuilder.add("multi", message.GetMulti());
    }
    if (message.GetUnanswered() != -1) {
    	jsonObjectBuilder.add("unanswered", message.GetUnanswered());
    }
    
    if (message.HasOptions()) {
    	List<String> options = message.GetOptions(); 
    	JsonArrayBuilder optionArrayBuilder = Json.createArrayBuilder();
    	for (String option : options) {
    		optionArrayBuilder.add(option);
    	}
    	jsonObjectBuilder.add("options", optionArrayBuilder);
    }
    
    if (message.HasRoom()) {
    	List<List<String> > rooms = message.GetAvailableRooms();
    	JsonArrayBuilder optionArrayBuilder = Json.createArrayBuilder();
    	for (List<String> roomInfo : rooms) {
    		JsonArrayBuilder optionArrayBuilderMinor = Json.createArrayBuilder();
    		for (String info : roomInfo) {
    			optionArrayBuilderMinor.add(info);
    		}
    		optionArrayBuilder.add(optionArrayBuilderMinor);
    	}
    	jsonObjectBuilder.add("availableRooms", optionArrayBuilder);
    }
    
    JsonObject jsonObject = jsonObjectBuilder.build();
    
    System.out.println("Send out message: " + jsonObject.toString());
    
    return jsonObject.toString();

  }

  @Override
  public void init(EndpointConfig ec) {
    System.out.println("MessageEncoder - init method called");
  }

  @Override
  public void destroy() {
    System.out.println("MessageEncoder - destroy method called");
  }

}