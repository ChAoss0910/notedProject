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
	private ArrayList<Image> images = new ArrayList<Image>();
	
	
	public Note(String title) {
		this.title = title;
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
	public ArrayList<Image> getImages() {
		return images;
	}
}
