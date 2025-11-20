package com.user.model;

public class User {
	
		private int ID;
	    private String Username;
	    private String Email;
	    private String Password;
		public User(String Username, String Email, String Password) {
			super();
			this.Username = Username;
			this.Email = Email;
			this.Password = Password;
		}
		public int getId() {
			return ID;
		}
		public void setID(int ID) {
			this.ID = ID;
		}
		public String getUsername() {
			return Username;
		}
		public void setUsername(String Username) {
			this.Username = Username;
		}
		public String getEmail() {
			return Email;
		}
		public void setEmail(String Email) {
			this.Email = Email;
		}
		public String getPassword() {
			return Password;
		}
		public void setPassword(String Password) {
			this.Password = Password;
		}
		public User() {
			super();
			// TODO Auto-generated constructor stub
		}
	    
	    
	    
	    

}
