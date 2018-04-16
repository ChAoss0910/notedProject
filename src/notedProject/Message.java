package notedProject;

import java.util.ArrayList;
import java.util.List;

public class Message {

	  private String type;
	  private String content;
	  private String roomName;
	  private String num;
	  private String classTitle;
	  private String soj;
	  private int currentQues;
	  private int choice;
	  private int time;
	  private List<String> options = new ArrayList<>(); 
	  
	  public boolean HasOptions() {
		  return (options.size() > 0 );
	  }
	  
	  public List<String> GetOptions() {
		  return options;
	  }
	  
	  public void AddOption(String option) {
		  options.add(option);
	  }
	  
	  public int GetTime() {
		  return time;
	  }
	  
	  public void SetTime(int time) {
		  this.time = time;
	  }
	  
	  public int GetChoice() {
		  return choice;
	  }
	  
	  public void SetChoice(int choice) {
		  this.choice = choice;
	  }
	  
	  public void SetCurrent(int num) {
		  this.currentQues = num;
	  }
	  
	  public int GetCurrent() {
		  return currentQues;
	  }
	  
	  public String GetClassTitle() {
		  return classTitle;
	  }
	  
	  public void SetClassTitle(String title) {
		  this.classTitle = title;
	  }
	  
	  public String GetSOJ() {
		  return soj;
	  }
	  
	  public void SetSOJ(String soj) {
		  this.soj = soj;
	  }

	  public String GetType() {
	    return type;
	  }
	  
	  public String GetNum() {
		  return num;
	  }

	  public void SetNum(String num) {
		  this.num = num;
	  }
	  
	  public void SetType(String type) {
	    this.type = type;
	  }
	  
	  public void SetRoomName(String name) {
		  this.roomName = name;
	  }
	  
	  public String GetRoomName() {
		  return roomName;
	  }

	  public String GetContent() {
	    return content;
	  }

	  public void SetContent(String content) {
	    this.content = content;
	  }

	}