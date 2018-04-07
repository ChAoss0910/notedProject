package notedProject;

import java.util.Date;

//Serializable needed

public class Note {
	private String title;
	private Date time;
	private String classTitle;
	private String tags;
	
	public Note(String title) {
		this.title = title;
		time = new Date();
	}
	public String getTitle() {
		return this.title;
	}
	public Date getTime(){
		return this.time;
	}
	public String getClassTitle() {
		return this.classTitle;
	}
	public String getTags() {
		return this.tags;
		
	}
}
