package com.conn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conn.connection.MyConnection;
import com.conn.pojo.DumyUser;
import com.conn.pojo.PostDataPojo;

public class DumyUserImp implements DumyUserInt{

	public List getDumyList() {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("SELECT * from dumyuser_tb");
			 ResultSet rs=ps.executeQuery();
			 List list=new ArrayList();
			 while(rs.next())
			 {
				 DumyUser dd=new DumyUser();
				dd.setAddress(rs.getString("address"));
				dd.setEmail_id(rs.getString("email_id"));
				
				dd.setGender(rs.getString("gender"));
				dd.setMobile_no(rs.getLong("mobile_no"));
				dd.setName(rs.getString("name"));
				dd.setImage(rs.getString("image"));
				 
				 
				list.add(dd);
				}
			 return list;
			 	 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }
		return null;
	}

}
