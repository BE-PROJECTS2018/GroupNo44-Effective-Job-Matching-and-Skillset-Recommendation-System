package com.conn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conn.connection.MyConnection;
import com.conn.pojo.CandidateProfile;
import com.conn.pojo.ClientProfilePojo;
import com.conn.pojo.SignUp;

public class ClientProfileImpDao implements ClientProfileIntDao {

	public boolean addClientContact(ClientProfilePojo cp) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps1=conn.prepareStatement("select * from client_contact_tb where user_id=?");
			 ps1.setInt(1, cp.getUser_id());
			 ResultSet rs=ps1.executeQuery();
			 while(rs.next())
			 {
				 PreparedStatement ps=conn.prepareStatement("update client_contact_tb set client_contact_no=?,client_email_id=?,client_website=?,client_about=? where user_id=?");
					ps.setLong(1, cp.getClient_contact_no());
					ps.setString(2, cp.getClient_email_id());
					ps.setString(3, cp.getClient_website());
					ps.setString(4, cp.getClient_about());
					 ps.setInt(5, cp.getUser_id());
						
					ps.executeUpdate();
				return true;
			 
			 }
			
				
			 PreparedStatement ps=conn.prepareStatement("insert into client_contact_tb (user_id,client_contact_no,client_email_id,client_website,client_about) values(?,?,?,?,?)");
				ps.setInt(1, cp.getUser_id());
				ps.setLong(2, cp.getClient_contact_no());
				ps.setString(3, cp.getClient_email_id());
				ps.setString(4, cp.getClient_website());
				ps.setString(5, cp.getClient_about());
			
				ps.executeUpdate();
			return true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }return false;
	}

	public boolean addClientDetails(ClientProfilePojo cp) {Connection conn=null;
	 try{
		 conn=MyConnection.getConnection();
		 PreparedStatement ps1=conn.prepareStatement("select * from client_profile_tb where user_id=?");
		 ps1.setInt(1, cp.getUser_id());
		 ResultSet rs=ps1.executeQuery();
		 while(rs.next())
		 {
			 PreparedStatement ps=conn.prepareStatement("update client_profile_tb set client_name=?,client_founded=?,client_location=?,client_city=?,client_pincode=?,client_state=?,client_country=?,client_project=?,project_technology=? where user_id=?");
			 
				ps.setString(1, cp.getClient_name());
				ps.setString(2, cp.getClient_founded());
				ps.setString(3, cp.getClient_location());
				ps.setString(4, cp.getClient_city());
				ps.setInt(5, cp.getClient_pincode());
				ps.setString(6, cp.getClient_state());
				ps.setString(7, cp.getClient_country());
				ps.setString(8, cp.getProject());
				ps.setString(9, cp.getTechnology());
				ps.setInt(10, cp.getUser_id());	
				
				ps.executeUpdate();
			return true;
		 
		 }
			
		 
		 PreparedStatement ps=conn.prepareStatement("insert into client_profile_tb (user_id,client_name,client_founded,client_location,client_city,client_pincode,client_state,client_country,client_project,project_technology) values(?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, cp.getUser_id());
			ps.setString(2, cp.getClient_name());
			ps.setString(3, cp.getClient_founded());
			ps.setString(4, cp.getClient_location());
			ps.setString(5, cp.getClient_city());
			ps.setInt(6, cp.getClient_pincode());
			ps.setString(7, cp.getClient_state());
			ps.setString(8, cp.getClient_country());
			ps.setString(9, cp.getProject());
			ps.setString(10, cp.getTechnology());
		
			ps.executeUpdate();
		return true;
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return false;
	}

	public boolean addRecruiterDetails(ClientProfilePojo cp) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps1=conn.prepareStatement("select * from recruiterprofile_tb where user_id=?");
			 ps1.setInt(1, cp.getUser_id());
			 ResultSet rs=ps1.executeQuery();
			 while(rs.next())
			 {
				 PreparedStatement ps=conn.prepareStatement("update recruiterprofile_tb set rec_full_name=?,rec_gender=?,rec_mobileno=? where user_id=?");
				 
					ps.setString(1, cp.getRec_full_name());
					ps.setString(2, cp.getRec_gender());
					ps.setLong(3, cp.getRec_mobileno());
					ps.setInt(4, cp.getUser_id());
					ps.executeUpdate();
				return true;
			 
			 }
				
			 
			 PreparedStatement ps=conn.prepareStatement("insert into recruiterprofile_tb (user_id,rec_full_name,rec_gender,rec_mobileno) values(?,?,?,?)");
				ps.setInt(1, cp.getUser_id());
				ps.setString(2, cp.getRec_full_name());
				ps.setString(3, cp.getRec_gender());
				ps.setLong(4, cp.getRec_mobileno());
			
				ps.executeUpdate();
			return true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }
	
		return false;
	}

	public List getClientProfile(int userId) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT T1.*,T2.*,T3.*,T4.* FROM recruiterprofile_tb AS T1 INNER JOIN client_profile_tb as T2 ON T1.user_id=T2.user_id INNER JOIN client_contact_tb AS T3 ON T2.user_id=T3.user_id INNER JOIN can_image_tb AS T4 ON T3.user_id = T4.user_id WHERE T1.user_id=?");
			  	ps.setInt(1,userId);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		ClientProfilePojo profile=new ClientProfilePojo();
			  		profile.setClient_about(rs.getString("client_about"));
			  		profile.setClient_city(rs.getString("client_city"));
			  		profile.setClient_contact_no(rs.getLong("client_contact_no"));
			  		profile.setClient_country(rs.getString("client_country"));
			  		profile.setClient_email_id(rs.getString("client_email_id"));
			  		profile.setClient_founded(rs.getString("client_founded"));
			  		profile.setClient_id(rs.getInt("client_profile_id"));
			  		profile.setClient_location(rs.getString("client_location"));
			  		profile.setClient_name(rs.getString("client_name"));
			  		profile.setClient_pincode(rs.getInt("client_pincode"));
			  		profile.setClient_state(rs.getString("client_state"));
			  		profile.setClient_website(rs.getString("client_website"));
			  		profile.setContact_id(rs.getInt("contact_id"));
			  		profile.setRec_full_name(rs.getString("rec_full_name"));
			  		profile.setRec_gender(rs.getString("rec_gender"));
			  		profile.setRec_mobileno(rs.getLong("rec_mobileno"));
			  		profile.setRecuiter_id(rs.getInt("recuiter_id"));
			  		profile.setUser_id(rs.getInt("user_id"));
			  		profile.setProfile_image(rs.getString("profile_image"));
			  	
			  		list.add(profile);
			  return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return null;
	}

	public String getClientName(int user_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM client_profile_tb WHERE user_id=?");
			  	ps.setInt(1,user_id);
			  	ResultSet rs=ps.executeQuery();
			  	while(rs.next())
			  	{
			  		String clientname=rs.getString("client_name");
			  	return clientname;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
return null;
	}

	public String getClientEmail(int user_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM signup_tb WHERE user_id=?");
			  	ps.setInt(1,user_id);
			  	ResultSet rs=ps.executeQuery();
			  	while(rs.next())
			  	{
			  		String clientEmail=rs.getString("email_id");
			  	return clientEmail;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		 return null;
	}
	
	
	public List getRecruiterDetails(int user_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM recruiterprofile_tb WHERE user_id=?");
			  	ps.setInt(1,user_id);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		ClientProfilePojo profile=new ClientProfilePojo();
			  		
			  		profile.setRec_full_name(rs.getString("rec_full_name"));
			  		profile.setRec_gender(rs.getString("rec_gender"));
			  		profile.setRec_mobileno(rs.getLong("rec_mobileno"));
			  		profile.setRecuiter_id(rs.getInt("recuiter_id"));
			  		profile.setUser_id(rs.getInt("user_id"));
			  		
			  	
			  		list.add(profile);
			  return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return null;
	}

	public List getClientDetails(int user_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM client_profile_tb WHERE user_id=?");
			  ps.setInt(1,user_id);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		ClientProfilePojo profile=new ClientProfilePojo();
			  		
			  		profile.setClient_id(rs.getInt("client_profile_id"));
			  		profile.setUser_id(rs.getInt("user_id"));
			  		profile.setClient_name(rs.getString("client_name"));
			  		profile.setClient_founded(rs.getString("client_founded"));
			  		profile.setClient_location(rs.getString("client_location"));
			  		profile.setProject(rs.getString("client_project"));
			  		profile.setTechnology(rs.getString("project_technology"));
			  		profile.setClient_city(rs.getString("client_city"));
			  		profile.setClient_pincode(rs.getInt("client_pincode"));
			  		profile.setClient_state(rs.getString("client_state"));
			  		profile.setClient_country(rs.getString("client_country"));
			  	
			  		list.add(profile);
			  return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return null;
	}

	public List getClientContactUs(int user_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM client_contact_tb WHERE user_id=?");
			  ps.setInt(1,user_id);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		ClientProfilePojo profile=new ClientProfilePojo();
			  		
			  		profile.setClient_about(rs.getString("client_about"));
			  		profile.setClient_contact_no(rs.getLong("client_contact_no"));
			  		profile.setClient_email_id(rs.getString("client_email_id"));
			  		profile.setClient_website(rs.getString("client_website"));
			  		profile.setContact_id(rs.getInt("contact_id"));
			  		profile.setUser_id(rs.getInt("user_id"));
			  		
			  		list.add(profile);
			  return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return null;
	}

	public List getClientProfileImage(int user_id) 
	{
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM can_image_tb WHERE user_id=?");
			  ps.setInt(1,user_id);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		ClientProfilePojo profile=new ClientProfilePojo();
		
			  		profile.setUser_id(rs.getInt("user_id"));
			  		profile.setProfile_image(rs.getString("profile_image"));
			  	
			  		list.add(profile);
			  return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return null;
	}
	public List getIdProof(int user_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM id_proof_tb WHERE user_id=?");
			  ps.setInt(1,user_id);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		ClientProfilePojo profile=new ClientProfilePojo();
		
			  		profile.setUser_id(rs.getInt("user_id"));
			  		profile.setId_proof(rs.getString("id_proof"));
			  	
			  		list.add(profile);
			  return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return null;
	}

	public List<SignUp> getCandidateDetails(String technology) {
		// TODO Auto-generated method stub
		
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			
			  PreparedStatement ps=conn.prepareStatement("select * from signup_tb  inner join candidateeducation_tb where candidateeducation_tb.can_id=signup_tb.user_id and  signup_tb.status=? and candidateeducation_tb.can_skill LIKE '%"+ technology+"%'");
				ps.setString(1, "Approve");
			    ResultSet rs=ps.executeQuery();
			    System.out.println("pssssssss"+ps);
			  	List<SignUp> list=new ArrayList<SignUp>();
			  	while(rs.next())
			  	{
			  		 SignUp profile=new SignUp();
			  		profile.setId(rs.getInt("user_id"));
			  		profile.setUsername(rs.getString("username"));
			  		profile.setEmail_id(rs.getString("email_id"));
			  		profile.setCan_skill(rs.getString("can_skill"));
			  		list.add(profile);
			  
			  	}
			  	return list;
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return null;
	}

	public List<SignUp> notSelectedCandidateDetails(String technology) {
		// TODO Auto-generated method stub
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			
			  PreparedStatement ps=conn.prepareStatement("select * from signup_tb  inner join candidateeducation_tb where candidateeducation_tb.can_id=signup_tb.user_id and  signup_tb.status=? and candidateeducation_tb.can_skill NOT LIKE '%"+ technology+"%'");
				ps.setString(1, "Approve");
			    ResultSet rs=ps.executeQuery();
			    System.out.println("pssssssss"+ps);
			  	List<SignUp> list=new ArrayList<SignUp>();
			  	while(rs.next())
			  	{
			  		 SignUp profile=new SignUp();
			  		profile.setId(rs.getInt("user_id"));
			  		profile.setUsername(rs.getString("username"));
			  		profile.setEmail_id(rs.getString("email_id"));
			  		profile.setCan_skill(rs.getString("can_skill"));
			  		list.add(profile);
			  
			  	}
			  	return list;
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return null;
	}
	

}
