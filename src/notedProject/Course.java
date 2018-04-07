package notedProject;

import java.util.List;


// By Burt

public class Course {
	
	private String title;
	
	private List<Note> notes;
	
	public Course(String title) {
		this.title = title;
	}
	
	public String GetTitle() {
		return title;
	}
	
	public void SetTitle(String title) {
		this.title = title;
	}
	
	public List<Note> GetNotes() {
		return notes;
	}
	
	public void AddNote(Note newNote) {
		notes.add(newNote);
	}
	
	public void RemoveNote(Note dNote) {
		if (notes.contains(dNote)) {
			notes.remove(dNote);
		}
	}
}
