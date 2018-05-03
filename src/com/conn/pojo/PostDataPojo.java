package com.conn.pojo;

public class PostDataPojo {
private String work_required,project_name,project_desciption,skills,client_name,time_span;
private int post_id,user_id,experience;
double costing;
public String getClient_name() {
	return client_name;
}
public void setClient_name(String client_name) {
	this.client_name = client_name;
}

public String getWork_required() {
	return work_required;
}
public void setWork_required(String workRequired) {
	work_required = workRequired;
}
public String getProject_name() {
	return project_name;
}
public void setProject_name(String projectName) {
	project_name = projectName;
}
public String getProject_desciption() {
	return project_desciption;
}
public void setProject_desciption(String projectDesciption) {
	project_desciption = projectDesciption;
}
public String getSkills() {
	return skills;
}
public void setSkills(String skills) {
	this.skills = skills;
}
public int getPost_id() {
	return post_id;
}
public void setPost_id(int postId) {
	post_id = postId;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int userId) {
	user_id = userId;
}
public int getExperience() {
	return experience;
}
public void setExperience(int experience) {
	this.experience = experience;
}
public String getTime_span() {
	return time_span;
}
public void setTime_span(String timeSpan) {
	time_span = timeSpan;
}
public double getCosting() {
	return costing;
}
public void setCosting(double costing) {
	this.costing = costing;
}

}
