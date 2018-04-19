package notedProject;

import java.awt.Image;
import java.util.ArrayList;
import java.util.Date;

import apple.laf.JRSUIUtils.Images;

//Serializable needed

public class Note {
	private String title;
	private String time;
	private String classTitle;
	private String tags;
	private ArrayList<String> images = new ArrayList<String>();
	
	
	public Note(String title,String time,String classTitle,String tags) {
		this.title = title;
		this.time = time;
		this.classTitle = classTitle;
		this.tags=tags;
		
//		time = new Date();
	}
	public String getTitle() {
		return this.title;
	}
	public String getTime(){
		return this.time;
	}
	public String getClassTitle() {
		return this.classTitle;
	}
	public String getTags() {
		return this.tags;
		
	}
	public ArrayList<String> getImages() {
		return images;
	}
	public void addPath(String path) {
		this.getImages().add(path);
	}
}
