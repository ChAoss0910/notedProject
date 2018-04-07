package notedProject;

import java.io.Serializable;

public class User implements Serializable {
	
	private Name name;
	private String username;
	private String email;
	private String password;
	
	public User(String username, String lName, String fName, String password, String email) {
		this.username = username;
		this.email = email;
		this.name = new Name(fName, lName);
		this.password = password;
	}
	
	public boolean CheckPassword(String password) {
		if (this.password.equals(password)) {
			return true;
		} else {
			return false;
		}
	}
	
	public class Name implements Serializable{
		private String firstname;
		private String lastname;
	
		public Name (String fname, String lname) {
			this.firstname = fname;
			this.lastname = lname;
		}
		
		public String getFirst() {
			return this.firstname;
		}
		public String getLast() {
			return this.lastname;
		}
	}
	
	
	public String getFirstName() {
		return this.name.getFirst();
	}
	public String getLastName() {
		return this.name.getLast();
	}	
	public String getUsername() {
		return this.username;
	}
	public String getEmail() {
		return this.email;
	}
	public String getPassword() {
		return this.password;
	}

}
