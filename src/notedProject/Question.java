package notedProject;

import java.util.ArrayList;

//Serializable needed

public class Question {
	private String title;
	
	private ArrayList<String> options = new ArrayList<String>();
	
	private int answer;
	
	public Question(String title) {
		 this.title = title;
	 }
	public String getTitle() {
		return this.title;
	}
	public ArrayList<String> getOptions() {
		return this.options;
	}
	public int getAnswer() {
		return this.answer;
	}
	public void addOption(String m) {
		options.add(m);
	}
	public void remove(int pos) {
		options.remove(pos-1);
	}
}
