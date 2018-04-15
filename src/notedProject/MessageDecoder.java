package TestGame;


import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class MessageDecoder implements Decoder.Text<Message> {

  @Override
  public Message decode(String jsonMessage) throws DecodeException {

	System.out.println(jsonMessage);
    JsonObject jsonObject = Json
        .createReader(new StringReader(jsonMessage)).readObject();
    Message message = new Message();
    
    message.SetType(jsonObject.getString("type"));
    message.SetContent(jsonObject.getString("content"));
   
    
    if (jsonObject.containsKey("roomName")) {
    	message.SetRoomName(jsonObject.getString("roomName"));
    }
    if (jsonObject.containsKey("num")) {
    	message.SetNum(jsonObject.getString("num"));
    }
    if (jsonObject.containsKey("soj")) {
    	message.SetSOJ(jsonObject.getString("soj"));
    }
    if (jsonObject.containsKey("classTitle")) {
    	message.SetClassTitle(jsonObject.getString("classTitle"));
    }
    if (jsonObject.containsKey("current")) {
    	message.SetCurrent(jsonObject.getInt("current"));
    }
    if (jsonObject.containsKey("choice")) {
    	message.SetChoice(jsonObject.getInt("choice"));
    }
    if (jsonObject.containsKey("time")) {
    	message.SetTime(jsonObject.getInt("time"));
    }
    
    
    return message;

  }

  @Override
  public boolean willDecode(String jsonMessage) {
    try {
      // Check if incoming message is valid JSON
      Json.createReader(new StringReader(jsonMessage)).readObject();
      return true;
    } catch (Exception e) {
    	System.out.println("Decoder: json cannot decode " + e.getMessage());
      return false;
    }
  }

  @Override
  public void init(EndpointConfig ec) {
    System.out.println("MessageDecoder -init method called");
  }

  @Override
  public void destroy() {
    System.out.println("MessageDecoder - destroy method called");
  }

}