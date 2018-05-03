package com.conn.pojo;

public class SignUp {
	private String email_id,username,password,usertype,status,can_skill;
	private int id;
	
	
	public String getCan_skill() {
		return can_skill;
	}
	public void setCan_skill(String can_skill) {
		this.can_skill = can_skill;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String emailId) {
		email_id = emailId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	

}
