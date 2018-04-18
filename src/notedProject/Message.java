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
	  private List<List<String> > availableRooms = new ArrayList<>();
	  private double currentScore;
	  private double currentMulti;
	  
	  public boolean HasRoom() {
		  return (availableRooms.size() > 0);
	  }
	  
	  public List<List<String> > GetAvailableRooms() {
		  return availableRooms;
	  }
	  
	  public void AddAvailableRoom(String classTitle, String rName, int slots) {
		  List<String> temp = new ArrayList<>();
		  temp.add(classTitle);
		  temp.add(rName);
		  temp.add(""+slots);
		  availableRooms.add(temp);
	  }
	  
	  public double GetMulti() {
		  return currentMulti;
	  }
	  
	  public void SetMulti(double multi) {
		  this.currentMulti = multi;
	  }
	  
	  public double GetScore() {
		  return currentScore;
	  }
	  
	  public void SetScore(double score) {
		  this.currentScore = score;
	  }
	  
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