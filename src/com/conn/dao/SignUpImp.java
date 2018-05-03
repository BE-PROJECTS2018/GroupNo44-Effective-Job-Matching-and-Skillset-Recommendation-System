package com.conn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.conn.connection.MyConnection;
import com.conn.pojo.SignUp;

public class SignUpImp implements SignUpInt
{

	public boolean addUser(SignUp signUp) 
	{
		Connection conn=null;
		try{
		conn=MyConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement("insert into signup_tb(email_id,username,password,usertype) values(?,?,?,?)");
		ps.setString(1, signUp.getEmail_id());
		ps.setString(2, signUp.getUsername());
		ps.setString(3, signUp.getPassword());
		ps.setString(4, signUp.getUsertype());
		ps.executeUpdate();
		
		PreparedStatement ps1=conn.prepareStatement("select * from signup_tb where username=?");
		ps1.setString(1, signUp.getUsername());
		ResultSet rs=ps1.executeQuery();
		while(rs.next())
		{
			
			int id=rs.getInt("user_id");
			String usertype=rs.getString("usertype");
			if(usertype.equalsIgnoreCase("Candidate"))
			{
			PreparedStatement ps2=conn.prepareStatement("insert into candidatepersonal_tb (can_id) values(?)");
			ps2.setInt(1, id);
			ps2.executeUpdate();
			PreparedStatement ps3=conn.prepareStatement("insert into candidateeducation_tb (can_id) values(?)");
			ps3.setInt(1, id);
			ps3.executeUpdate();
			PreparedStatement ps4=conn.prepareStatement("insert into candidateexperience_tb (can_id) values(?)");
			ps4.setInt(1, id);
			ps4.executeUpdate();
			PreparedStatement ps5=conn.prepareStatement("insert into candidate_project_tb (can_id) values(?)");
			ps5.setInt(1, id);
			ps5.executeUpdate();
			PreparedStatement ps6=conn.prepareStatement("insert into can_image_tb (user_id) values(?)");
			ps6.setInt(1, id);
			ps6.executeUpdate();
			}
			
			if(usertype.equalsIgnoreCase("Client"))
			{
				PreparedStatement ps2=conn.prepareStatement("insert into recruiterprofile_tb (user_id) values(?)");
				ps2.setInt(1, id);
				ps2.executeUpdate();
				PreparedStatement ps3=conn.prepareStatement("insert into client_profile_tb (user_id) values(?)");
				ps3.setInt(1, id);
				ps3.executeUpdate();
				PreparedStatement ps4=conn.prepareStatement("insert into client_contact_tb (user_id) values(?)");
				ps4.setInt(1, id);
				ps4.executeUpdate();
				PreparedStatement ps6=conn.prepareStatement("insert into can_image_tb (user_id) values(?)");
				ps6.setInt(1, id);
				ps6.executeUpdate();
			}
		}
		
		return true;
		} 
		
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return false;
	}

	public int login(String loginuserName, String loginPassword) {
		Connection conn=null;
		try{
		conn=MyConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement("select * from signup_tb where email_id=? and password=?");
		ps.setString(1, loginuserName);
		ps.setString(2, loginPassword);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
	int userId=rs.getInt("user_id");
			
			System.out.print("excution true");
			 return userId;
		}
				
		} 
		
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			System.out.print("excution false");
		return 0;
	}

	public int getCandidateId(String loginuserName)
	{
	    Connection conn=null;
		try{
		conn=MyConnection.getConnection();
		PreparedStatement ps1=conn.prepareStatement("select * from signup_tb where email_id=?");
		ps1.setString(1, loginuserName);
		ResultSet rs=ps1.executeQuery();
		
		while(rs.next())
		{
			System.out.println("Impl UserId"+rs.getInt("user_id"));
			int id=rs.getInt("user_id");
		return id;
				
		} 
		
		}
		 catch (SQLException e) 
		 {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return 0;
	
	
	}

	public String getUserType(int userId) {
		Connection conn=null;
		try{
		conn=MyConnection.getConnection();
		PreparedStatement ps1=conn.prepareStatement("select * from signup_tb where user_id=?");
		ps1.setInt(1, userId);
		ResultSet rs=ps1.executeQuery();
		
		while(rs.next())
		{
			String userType=rs.getString("usertype");
		return userType;
				
		} 
		
		}
		 catch (SQLException e) 
		 {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	return null;
	}

	public String getUsername(int userId) {
		Connection conn=null;
		try{
		conn=MyConnection.getConnection();
		PreparedStatement ps1=conn.prepareStatement("select * from signup_tb where user_id=?");
		ps1.setInt(1, userId);
		ResultSet rs=ps1.executeQuery();
		
		while(rs.next())
		{
			String userName=rs.getString("username");
			System.out.println("userName"+userName);
		
		return userName;
				
		} 
		
		}
		 catch (SQLException e) 
		 {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}return null;
	}

	public String getUserStatus(int userId) {
		Connection conn=null;
		try{
		conn=MyConnection.getConnection();
		PreparedStatement ps1=conn.prepareStatement("select * from signup_tb where user_id=?");
		ps1.setInt(1, userId);
		ResultSet rs=ps1.executeQuery();
		
		while(rs.next())
		{
			String status=rs.getString("status");
		return status;
				
		} 
		
		}
		 catch (SQLException e) 
		 {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return null;
	}

	public List userList(String status) {
		  Connection conn=null;
			try{
			conn=MyConnection.getConnection();
			PreparedStatement ps1=conn.prepareStatement("select * from signup_tb where status=?");
		ps1.setString(1, status);
			ResultSet rs=ps1.executeQuery();
			List list=new ArrayList();
			while(rs.next())
			{
				SignUp sp=new SignUp();
				sp.setId(rs.getInt("user_id"));
				sp.setEmail_id(rs.getString("email_id"));
				sp.setUsername(rs.getString("username"));
				sp.setUsertype(rs.getString("usertype"));
				sp.setStatus(rs.getString("status"));
				list.add(sp);
				
					
			} 
			return list;
			
			}
			 catch (SQLException e) 
			 {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		return null;
	}

	public boolean changeStatus(int userId,String status) {
		Connection conn=null;
		try{
		conn=MyConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement("update signup_tb set status=? where user_id=?");
		ps.setString(1, status);
		ps.setInt(2, userId);
		ps.executeUpdate();
		return true;
		
		}
		 catch (SQLException e) 
		 {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return false;
	}

	public boolean deleteUserData(int userId,String usertype) {
		Connection conn=null;
		try{
		conn=MyConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement("delete from signup_tb  where user_id=?");
		ps.setInt(1, userId);
		ps.executeUpdate();
		if(usertype.equalsIgnoreCase("Candidate"))
		{
		PreparedStatement ps2=conn.prepareStatement("delete from candidatepersonal_tb where can_id=?");
		ps2.setInt(1, userId);
		ps2.executeUpdate();
		PreparedStatement ps3=conn.prepareStatement("delete from candidateeducation_tb where can_id=?");
		ps3.setInt(1, userId);
		ps3.executeUpdate();
		PreparedStatement ps4=conn.prepareStatement("delete from candidateexperience_tb where can_id=?");
		ps4.setInt(1, userId);
		ps4.executeUpdate();
		PreparedStatement ps5=conn.prepareStatement("delete from candidate_project_tb where can_id=?");
		ps5.setInt(1, userId);
		ps5.executeUpdate();
		PreparedStatement ps6=conn.prepareStatement("delete from can_image_tb where user_id=?");
		ps6.setInt(1, userId);
		ps6.executeUpdate();
		}
		
		if(usertype.equalsIgnoreCase("Client"))
		{
			PreparedStatement ps2=conn.prepareStatement("delete from recruiterprofile_tb where user_id=?");
			ps2.setInt(1, userId);
			ps2.executeUpdate();
			PreparedStatement ps3=conn.prepareStatement("delete from client_profile_tb where user_id=?");
			ps3.setInt(1, userId);
			ps3.executeUpdate();
			PreparedStatement ps4=conn.prepareStatement("delete from client_contact_tb where user_id=?");
			ps4.setInt(1, userId);
			ps4.executeUpdate();
			PreparedStatement ps6=conn.prepareStatement("delete from can_image_tb where user_id=?");
			ps6.setInt(1, userId);
			ps6.executeUpdate();
		}
		
		
		return true;
		
		}
		 catch (SQLException e) 
		 {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return false;
	}
}
