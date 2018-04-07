package notedProject;

import java.io.Serializable;

public class User implements Serializable{
	private Name name;
	public class Name implements Serializable{
		private String firstname;
		private String lastname;
	
		public String getFirst() {
			return this.firstname;
		}
		public String getLast() {
			return this.lastname;
		}
	}
	private String username;
	private String email;
	private String password;
	
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
