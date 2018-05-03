package com.conn.dao;

import java.util.List;

import com.conn.pojo.SignUp;

public interface SignUpInt {
	public boolean addUser(SignUp signUp);
	public int	login(String loginuserName,String loginPassword);
	public int getCandidateId(String loginuserName);
	public String getUserType(int userId);
	public String getUsername(int userId);
	
	public String getUserStatus(int userId);
	
	public List userList(String status);
	
	public boolean changeStatus(int userId,String status);
	
	public boolean deleteUserData(int userId,String usertype);

}
