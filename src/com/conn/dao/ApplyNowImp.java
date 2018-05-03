package com.conn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.conn.connection.MyConnection;
import com.conn.pojo.ApplyDataDao;

public class ApplyNowImp implements ApplyNowInt {

	public boolean sendApply(int client_id,int candidate_id,String candidate_name,String project_name,int year,int score) 
	{
		Connection conn=null;
		try{
			
			
		conn=MyConnection.getConnection();
		 PreparedStatement ps1=conn.prepareStatement("SELECT * FROM candidate_apply_tb WHERE candidate_id=? and project_name=?");
		  	ps1.setInt(1,candidate_id);
		  	ps1.setString(2, project_name);
		  	ResultSet rs=ps1.executeQuery();
		  	while(rs.next())
		  	{
		  		return true;
		  	}
		PreparedStatement ps=conn.prepareStatement("insert into candidate_apply_tb(client_id,candidate_id,candidate_name,project_name,eduacation_year,score) values(?,?,?,?,?,?)");
		ps.setInt(1, client_id);
		ps.setInt(2, candidate_id);
		
		ps.setString(3, candidate_name);
		ps.setString(4, project_name);
		ps.setInt(5, year);
		ps.setInt(6, score);
		ps.executeUpdate();
		return true;
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return false;
	}

	public String getStatus(int candidate_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM candidate_apply_tb WHERE candidate_id=?");
			  	ps.setInt(1,candidate_id);
			  	ResultSet rs=ps.executeQuery();
			  	while(rs.next())
			  	{
			  		String status=rs.getString("status");
			  		return status;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return null;
	}

	public List getApplyList(int client_id,String status) {
		Connection conn=null;
		 try{
			 List list=new ArrayList();
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM candidate_apply_tb WHERE client_id=? and status=? ORDER BY eduacation_year DESC"); 	
			  ps.setInt(1,client_id);
			  ps.setString(2, status);
			  	ResultSet rs=ps.executeQuery();
			  	while(rs.next())
			  	{
			  		ApplyDataDao ad=new ApplyDataDao();
			  		ad.setApply_id(rs.getInt("apply_id"));
			  		ad.setClient_id(rs.getInt("client_id"));
			  		ad.setCandidate_id(rs.getInt("candidate_id"));
			  		ad.setCandidate_name(rs.getString("candidate_name"));
			  		ad.setProject_name(rs.getString("project_name"));
			  		ad.setStatus(rs.getString("status"));
			  		ad.setEducation_year(rs.getInt("eduacation_year"));
			  		ad.setScore(rs.getInt("score"));
			  		list.add(ad);
			  		
			  	}
			  	return list;
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return null;
	}

	public boolean statusChange(String status, int applyId) {
		Connection conn=null;
		try{
		conn=MyConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement("update candidate_apply_tb set status=? where apply_id=?");
		ps.setString(1, status);
		ps.setInt(2, applyId);
		ps.executeUpdate();
		
		return true;
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return false;
	}

	public boolean deleteApply(int applyId) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("delete  FROM candidate_apply_tb WHERE apply_id=?");
			  	ps.setInt(1,applyId);
			  	ps.executeUpdate();
				return true;
				}
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return false;
	}

	public String getProjectName(int candidate_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM candidate_apply_tb WHERE candidate_id=?");
			  	ps.setInt(1,candidate_id);
			  	ResultSet rs=ps.executeQuery();
			  	while(rs.next())
			  	{
			  		String project_name=rs.getString("project_name");
			  		return project_name;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return null;
	}

	public List getCandidateApproveList(int candidate_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM candidate_apply_tb WHERE   status='Approve' and candidate_id=?");
			  	ps.setInt(1,candidate_id);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		ApplyDataDao ad=new ApplyDataDao();
			  		ad.setApply_id(rs.getInt("apply_id"));
			  		ad.setCandidate_id(rs.getInt("candidate_id"));
			  		ad.setCandidate_name(rs.getString("candidate_name"));
			  		ad.setProject_name(rs.getString("project_name"));
			  		ad.setStatus(rs.getString("status"));
			  		list.add(ad);
			  		return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return null;
	}

	public boolean saveFeedback(ApplyDataDao ad) {
		Connection conn=null;
		try{
		conn=MyConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement("insert into feedback_tb(client_id,candidate_id,candidate_name,project_name,feedback) values(?,?,?,?,?)");
		ps.setInt(1, ad.getClient_id());
		ps.setInt(2, ad.getCandidate_id());
		ps.setString(3, ad.getCandidate_name());
		ps.setString(4, ad.getProject_name());
		ps.setString(5, ad.getFeedback());
		ps.executeUpdate();
		
		 PreparedStatement ps1=conn.prepareStatement("delete from post_project_tb where project_name=? and user_id=?");
			ps1.setString(1,  ad.getProject_name());
			ps1.setInt(2, ad.getClient_id());
			ps1.executeUpdate();
		
		return true;
		}
		 catch (SQLException e) {
				
				e.printStackTrace();
			}
		
		return false;
	}

	public List getFeedBackList(int client_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM feedback_tb WHERE client_id=?");
			  	ps.setInt(1,client_id);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		ApplyDataDao ad=new ApplyDataDao();
			  		ad.setApply_id(rs.getInt("client_id"));
			  		ad.setCandidate_id(rs.getInt("candidate_id"));
			  		ad.setCandidate_name(rs.getString("candidate_name"));
			  		ad.setProject_name(rs.getString("project_name"));
			  		ad.setFeedback(rs.getString("feedback"));
			  		list.add(ad);
			  		
			  	}
			  	return list;
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return null;
	}

	public boolean updateScore(int candidate_id, int score) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("select * from score_tb where can_id=?");
			 ps.setInt(1,candidate_id );
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 int newScore=rs.getInt("score")+score;
				 
				 PreparedStatement ps3=conn.prepareStatement("update score_tb set score=? where can_id=?");
					ps3.setInt(1, newScore);
					ps3.setInt(2, candidate_id);
					ps3.executeUpdate();
				return true;
			 
			 }
			 PreparedStatement ps3=conn.prepareStatement("insert into score_tb (score,can_id) values(?,?)");
				
			 ps3.setInt(1, score);
				ps3.setInt(2, candidate_id);
				ps3.executeUpdate();
			return true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }

		return false;
	}

	public int getScore(int candidate_id) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM score_tb WHERE can_id=?");
			  	ps.setInt(1,candidate_id);
			  	ResultSet rs=ps.executeQuery();
			  	while(rs.next())
			  	{
			  		int  score=rs.getInt("score");
			  		return score;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return 0;
	}

	public ApplyDataDao getDataByApplyId(int applyId) {
		Connection conn=null;
		 try{
			 List list=new ArrayList();
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM candidate_apply_tb WHERE apply_id=?"); 	
			  ps.setInt(1,applyId);
			  	ResultSet rs=ps.executeQuery();
			  	while(rs.next())
			  	{
			  		ApplyDataDao ad=new ApplyDataDao();
			  		ad.setApply_id(rs.getInt("apply_id"));
			  		ad.setClient_id(rs.getInt("client_id"));
			  		ad.setCandidate_id(rs.getInt("candidate_id"));
			  		ad.setCandidate_name(rs.getString("candidate_name"));
			  		ad.setProject_name(rs.getString("project_name"));
			  		ad.setStatus(rs.getString("status"));
			  		ad.setEducation_year(rs.getInt("eduacation_year"));
			  		ad.setScore(rs.getInt("score"));
			  		return ad;
			  		
			  	}
			  
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return null;
	}

}
