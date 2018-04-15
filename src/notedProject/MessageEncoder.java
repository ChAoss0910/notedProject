package TestGame;

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
    
    if (message.HasOptions()) {
    	List<String> options = message.GetOptions(); 
    	JsonArrayBuilder optionArrayBuilder = Json.createArrayBuilder();
    	for (String option : options) {
    		optionArrayBuilder.add(option);
    	}
    	jsonObjectBuilder.add("options", optionArrayBuilder);
    }
    JsonObject jsonObject = jsonObjectBuilder.build();
    
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