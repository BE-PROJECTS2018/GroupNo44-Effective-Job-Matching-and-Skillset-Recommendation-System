package com.conn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conn.connection.MyConnection;
import com.conn.pojo.ClientProfilePojo;
import com.conn.pojo.PostDataPojo;

public class PostDataImp implements PostDataInt{

	public boolean postProject(PostDataPojo pd) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
				
			 PreparedStatement ps=conn.prepareStatement("insert into post_project_tb (user_id,work_required,project_name,project_desciption,skills,experience,costing,time_span,client_name) values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, pd.getUser_id());
			ps.setString(2, pd.getWork_required());
			ps.setString(3, pd.getProject_name());
			ps.setString(4, pd.getProject_desciption());
			ps.setString(5, pd.getSkills());
			ps.setInt(6, pd.getExperience());
			ps.setDouble(7, pd.getCosting());
			ps.setString(8, pd.getTime_span());
			ps.setString(9, pd.getClient_name());
				ps.executeUpdate();
			return true;
		 
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }
	
		return false;
	}

	public List postProjectList() {
		Connection conn=null;
	 try{
		 conn=MyConnection.getConnection();
		 PreparedStatement ps=conn.prepareStatement("SELECT * from post_project_tb order by post_id desc");
		 ResultSet rs=ps.executeQuery();
		 List list=new ArrayList();
		 while(rs.next())
		 {
			 PostDataPojo pd=new PostDataPojo();
			 pd.setCosting(rs.getDouble("costing"));
			pd.setExperience(rs.getInt("experience"));
			pd.setPost_id(rs.getInt("post_id"));
			pd.setProject_desciption(rs.getString("project_desciption"));
			pd.setProject_name(rs.getString("project_name"));
			pd.setSkills(rs.getString("skills"));
			pd.setWork_required(rs.getString("work_required"));
			pd.setTime_span(rs.getString("time_span"));
			pd.setUser_id(rs.getInt("user_id"));
			pd.setClient_name(rs.getString("client_name"));
			list.add(pd);
			}
		 return list;
		 	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		 
		 return null;
	}

	public List clientPostedList(int clientId) {
		Connection conn=null;
	 try{
		 conn=MyConnection.getConnection();
		 PreparedStatement ps=conn.prepareStatement("SELECT * from post_project_tb where user_id=? order by post_id desc");
		ps.setInt(1, clientId);
		 ResultSet rs=ps.executeQuery();
		 List list=new ArrayList();
		 while(rs.next())
		 {
			 PostDataPojo pd=new PostDataPojo();
			 pd.setCosting(rs.getDouble("costing"));
			pd.setExperience(rs.getInt("experience"));
			pd.setPost_id(rs.getInt("post_id"));
			pd.setProject_desciption(rs.getString("project_desciption"));
			pd.setProject_name(rs.getString("project_name"));
			pd.setSkills(rs.getString("skills"));
			pd.setWork_required(rs.getString("work_required"));
			pd.setTime_span(rs.getString("time_span"));
			pd.setUser_id(rs.getInt("user_id"));
			pd.setClient_name(rs.getString("client_name"));
			list.add(pd);
			}
		 return list;
		 	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }return null;
	}

	public boolean deletePost(int postId) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("delete from post_project_tb where post_id=?");
			ps.setInt(1, postId);
			ps.executeUpdate();
			return true;
		 }
	
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return false;
	}

	public List postProjectListByFilter(int costing) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("SELECT * from post_project_tb where costing<=? order by costing desc;");
			ps.setDouble(1, costing);
			 ResultSet rs=ps.executeQuery();
			 List list=new ArrayList();
			 while(rs.next())
			 {
				 PostDataPojo pd=new PostDataPojo();
				 pd.setCosting(rs.getDouble("costing"));
				pd.setExperience(rs.getInt("experience"));
				pd.setPost_id(rs.getInt("post_id"));
				pd.setProject_desciption(rs.getString("project_desciption"));
				pd.setProject_name(rs.getString("project_name"));
				pd.setSkills(rs.getString("skills"));
				pd.setWork_required(rs.getString("work_required"));
				pd.setTime_span(rs.getString("time_span"));
				pd.setUser_id(rs.getInt("user_id"));
				pd.setClient_name(rs.getString("client_name"));
				list.add(pd);
				}
			 return list;
			 	 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }

			 
		return null;
	}

	public List postProjectListByFilterAbove20000(int costing) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("SELECT * from post_project_tb where costing>? order by costing desc;");
				ps.setDouble(1, costing);
			 ResultSet rs=ps.executeQuery();
			 List list=new ArrayList();
			 while(rs.next())
			 {
				 PostDataPojo pd=new PostDataPojo();
				 pd.setCosting(rs.getDouble("costing"));
				pd.setExperience(rs.getInt("experience"));
				pd.setPost_id(rs.getInt("post_id"));
				pd.setProject_desciption(rs.getString("project_desciption"));
				pd.setProject_name(rs.getString("project_name"));
				pd.setSkills(rs.getString("skills"));
				pd.setWork_required(rs.getString("work_required"));
				pd.setTime_span(rs.getString("time_span"));
				pd.setUser_id(rs.getInt("user_id"));
				pd.setClient_name(rs.getString("client_name"));
				list.add(pd);
				}
			 return list;
			 	 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }

			 
		return null;
	}

}
