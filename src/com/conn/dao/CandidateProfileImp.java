

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

public class CandidateProfileImp implements CandidateProfileInt{
	public boolean addCandidateProject(CandidateProfile cp)
	{
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("select * from candidate_project_tb where can_id=?");
			 ps.setInt(1, cp.getCan_id());
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 PreparedStatement ps3=conn.prepareStatement("update candidate_project_tb set project_name=?,project_description=?,project_module=? where can_id=?");
					ps3.setString(1, cp.getProject_name());
					ps3.setString(2, cp.getProject_description());
					ps3.setString(3, cp.getProject_module());
					ps3.setInt(4, cp.getCan_id());
					
					ps3.executeUpdate();
				return true;
			 
			 }
			 PreparedStatement ps3=conn.prepareStatement("insert into candidate_project_tb (can_id,project_name,project_description,project_module) values(?,?,?,?)");
				ps3.setInt(1, cp.getCan_id());
				ps3.setString(2, cp.getProject_name());
				ps3.setString(3, cp.getProject_description());
				ps3.setString(4, cp.getProject_module());
			
				ps3.executeUpdate();
			return true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }
	
		return false;
	}

	public boolean addCandidatePersonal(CandidateProfile cp) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("select * from candidatepersonal_tb where can_id=?");
			 ps.setInt(1, cp.getCan_id());
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 PreparedStatement ps1=conn.prepareStatement("update candidatepersonal_tb set can_full_name=?,can_gender=?,can_address=?,can_city=?,can_pincode=?,can_state=?,can_country=?,can_dob=?,can_mobileno=? where can_id=?");
					ps1.setString(1, cp.getCan_full_name());
					ps1.setString(2, cp.getCan_gender());
					ps1.setString(3, cp.getCan_address());
					ps1.setString(4, cp.getCan_city());
					ps1.setInt(5, cp.getCan_pincode());
					ps1.setString(6, cp.getCan_state());
					ps1.setString(7, cp.getCan_country());
					ps1.setString(8, cp.getCan_dob());
					ps1.setLong(9, cp.getCan_mobileno());
					ps1.setInt(10, cp.getCan_id());
					ps1.executeUpdate();
				return true;
			 
			 }
			
		PreparedStatement ps1=conn.prepareStatement("insert into candidatepersonal_tb (can_full_name,can_gender,can_address,can_city,can_pincode,can_state,can_country,can_dob,can_mobileno,can_id) values(?,?,?,?,?,?,?,?,?,?)");
		ps1.setString(1, cp.getCan_full_name());
		ps1.setString(2, cp.getCan_gender());
		ps1.setString(3, cp.getCan_address());
		ps1.setString(4, cp.getCan_city());
		ps1.setInt(5, cp.getCan_pincode());
		ps1.setString(6, cp.getCan_state());
		ps1.setString(7, cp.getCan_country());
		ps1.setString(8, cp.getCan_dob());
		ps1.setLong(9, cp.getCan_mobileno());
		ps1.setInt(10, cp.getCan_id());
		ps1.executeUpdate();
		return true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }
		return false;
	}

	public boolean addCandidateEducation(CandidateProfile cp) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("select * from candidateeducation_tb where can_id=?");
			 ps.setInt(1, cp.getCan_id());
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 PreparedStatement ps2=conn.prepareStatement("update candidateeducation_tb set can_education=?,can_overall_percentage=?,can_university_name=?,can_skill=?,can_year=?,ssc_year=?,hsc_year=?,ssc_marks=?,hsc_diploma_marks=? where can_id=?");
				 ps2.setString(1, cp.getCan_education());
					ps2.setString(2, cp.getCan_overall_percentage());
					
					ps2.setString(3, cp.getCan_university_name());
					ps2.setString(4,cp.getCan_skill());
					ps2.setInt(5, cp.getCan_year());
					ps2.setInt(6,cp.getScc_year());
					ps2.setInt(7,cp.getHsc_year());
					ps2.setString(8, cp.getScc_marks());
					ps2.setString(9, cp.getHsc_diploma_marks());
					ps2.setInt(10, cp.getCan_id());
					
					ps2.executeUpdate();
				return true;
			 
			 }
			
			 		PreparedStatement ps2=conn.prepareStatement("insert into candidateeducation_tb (can_education,can_overall_percentage,can_university_name,can_skill,can_id,can_year,ssc_year,hsc_year,ssc_marks,hsc_diploma_marks) values(?,?,?,?,?,?,?,?,?,?)");
				ps2.setString(1, cp.getCan_education());
				ps2.setString(2, cp.getCan_overall_percentage());
				ps2.setString(3, cp.getCan_university_name());
				ps2.setString(4,cp.getCan_skill());
				ps2.setInt(5, cp.getCan_id());
				ps2.setInt(6, cp.getCan_year());
				ps2.setInt(7, cp.getScc_year());
				ps2.setInt(8, cp.getHsc_year());
				ps2.setString(9, cp.getScc_marks());
				ps2.setString(10, cp.getHsc_diploma_marks());
				ps2.executeUpdate();
			return true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }return false;
	}

	public boolean addCandidateExperience(CandidateProfile cp) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("select * from candidateexperience_tb where can_id=?");
			 ps.setInt(1, cp.getCan_id());
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 PreparedStatement ps3=conn.prepareStatement("update candidateexperience_tb set can_experience=?,can_experience_details=?,can_ctc=? where can_id=?");
				 ps3.setString(1, cp.getCan_experience());
					ps3.setString(2, cp.getCan_experience_details());
					ps3.setDouble(3, cp.getCan_ctc());
					ps3.setInt(4, cp.getCan_id());	
					ps3.executeUpdate();
				return true;
			 
			 }
			
			  PreparedStatement ps3=conn.prepareStatement("insert into candidateexperience_tb (can_experience,can_experience_details,can_ctc,can_id) values(?,?,?,?)");
				ps3.setString(1, cp.getCan_experience());
				ps3.setString(2, cp.getCan_experience_details());
				ps3.setDouble(3, cp.getCan_ctc());
				ps3.setInt(4, cp.getCan_id());
				ps3.executeUpdate();
			return true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }
		 return false;
	}

	public List getCandidateProfile(int canId) {
		Connection conn=null;
			 try{
				 conn=MyConnection.getConnection();
				  PreparedStatement ps=conn.prepareStatement("SELECT T1.*,T2.*,T3.*,T4.* FROM candidatepersonal_tb  AS T1 INNER JOIN candidateeducation_tb as T2 ON T1.can_id=T2.can_id INNER JOIN candidateexperience_tb AS T3 ON T2.can_id=T3.can_id INNER JOIN candidate_project_tb AS T4 ON T3.can_id = T4.can_id  WHERE T1.can_id=?");
				  	ps.setInt(1,canId);
				  	ResultSet rs=ps.executeQuery();
				  	List list=new ArrayList();
				  	while(rs.next())
				  	{
				  		CandidateProfile profile=new CandidateProfile();
				  		profile.setCan_address(rs.getString("can_address"));
				  		profile.setCan_city(rs.getString("can_city"));
				  		profile.setCan_year(rs.getInt("can_year"));
				  		profile.setCan_country(rs.getString("can_country"));
				  		profile.setCan_ctc(rs.getDouble("can_ctc"));
				  		profile.setCan_dob(rs.getString("can_dob"));
				  		profile.setCan_education(rs.getString("can_education"));
				  		profile.setCan_education_id(rs.getInt("can_education_id"));
				  		profile.setCan_experience(rs.getString("can_experience"));
				  		profile.setCan_experience_details(rs.getString("can_experience_details"));
				  		profile.setCan_experience_id(rs.getInt("can_experience_id"));
				  		profile.setCan_full_name(rs.getString("can_full_name"));
				  		profile.setCan_gender(rs.getString("can_gender"));
				  		profile.setCan_id(rs.getInt("can_id"));
				  		profile.setCan_mobileno(rs.getLong("can_mobileno"));
				  		profile.setCan_overall_percentage(rs.getString("can_overall_percentage"));
				  		profile.setCan_personal_id(rs.getInt("can_personal_id"));
				  		profile.setCan_pincode(rs.getInt("can_pincode"));
				  		profile.setCan_skill(rs.getString("can_skill"));
				  		profile.setCan_state(rs.getString("can_state"));
				  		profile.setCan_university_name(rs.getString("can_university_name"));
				  		profile.setProject_description(rs.getString("project_description"));
				  		profile.setProject_module(rs.getString("project_module"));
				  		profile.setProject_name(rs.getString("project_name"));
				  		//profile.setProfile_image(rs.getString("profile_image"));
				  		list.add(profile);
				  		return list;
				  	}
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }
		return null;
	}

	public boolean subscribe(String emailId) {
		
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("select * from subscribe_tb where emailId=?");
			 ps.setString(1,emailId );
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 PreparedStatement ps3=conn.prepareStatement("update subscribe_tb set emailId=? where emailId=?");
					ps3.setString(1, emailId);
					ps3.executeUpdate();
				return true;
			 
			 }
			 PreparedStatement ps3=conn.prepareStatement("insert into subscribe_tb (emailId) values(?)");
				
				ps3.setString(1, emailId);
				ps3.executeUpdate();
			return true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }

		return false;
	}

	public List subScribeList() {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("select * from subscribe_tb");
			 String emailId;
			 ResultSet rs=ps.executeQuery();
			 List list=new ArrayList();
			 while(rs.next())
			 {
				 emailId= rs.getString("emailId");
				 list.add(emailId);
			 }
			 return list;
		 }
			 catch(Exception e){
				 e.printStackTrace();
				 
			 }

		return null;
	

}

	public boolean addCandidateImage(CandidateProfile cp) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("select * from can_image_tb where user_id=?");
			 ps.setInt(1, cp.getCan_id());
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 PreparedStatement ps3=conn.prepareStatement("update can_image_tb set profile_image=? where user_id=?");
					ps3.setString(1, cp.getProfile_image());
					ps3.setInt(2, cp.getCan_id());
					
					ps3.executeUpdate();
				return true;
			 
			 }
			 PreparedStatement ps3=conn.prepareStatement("insert into can_image_tb (user_id,profile_image) values(?,?)");
				ps3.setInt(1, cp.getCan_id());
				ps3.setString(2, cp.getProfile_image());
				ps3.executeUpdate();
			return true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }
	
		return false;
	}

	public List getCandidatePersonal(int canId) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM candidatepersonal_tb WHERE can_id=?");
			  	ps.setInt(1,canId);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		CandidateProfile profile=new CandidateProfile();
			  		profile.setCan_address(rs.getString("can_address"));
			  		profile.setCan_city(rs.getString("can_city"));
			  		profile.setCan_country(rs.getString("can_country"));
			  		profile.setCan_dob(rs.getString("can_dob"));
			  		profile.setCan_full_name(rs.getString("can_full_name"));
			  		profile.setCan_gender(rs.getString("can_gender"));
			  		profile.setCan_id(rs.getInt("can_id"));
			  		profile.setCan_mobileno(rs.getLong("can_mobileno"));
			  		profile.setCan_personal_id(rs.getInt("can_personal_id"));
			  		profile.setCan_pincode(rs.getInt("can_pincode"));
			  		profile.setCan_state(rs.getString("can_state"));
			  		list.add(profile);
			  		return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return null;
	}

	public List getCandidateEducation(int canId) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM candidateeducation_tb WHERE can_id=?");
			  	ps.setInt(1,canId);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		CandidateProfile profile=new CandidateProfile();
			  		profile.setCan_education(rs.getString("can_education"));
			  		profile.setCan_education_id(rs.getInt("can_education_id"));
			  		profile.setCan_id(rs.getInt("can_id"));
			  		profile.setCan_overall_percentage(rs.getString("can_overall_percentage"));
			  		profile.setCan_university_name(rs.getString("can_university_name"));
			  		profile.setCan_year(rs.getInt("can_year"));
			  		profile.setCan_skill(rs.getString("can_skill"));
			  		profile.setScc_year(rs.getInt("ssc_year"));
			  		profile.setScc_marks(rs.getString("ssc_marks"));
			  		profile.setHsc_diploma_marks(rs.getString("hsc_diploma_marks"));
			  		profile.setHsc_year(rs.getInt("hsc_year"));
			  		list.add(profile);
			  		return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return null;
	}

	public List getCandidateExperience(int canId) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM candidateexperience_tb WHERE can_id=?");
			  	ps.setInt(1,canId);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		CandidateProfile profile=new CandidateProfile();
			  		profile.setCan_ctc(rs.getDouble("can_ctc"));
			  		profile.setCan_experience(rs.getString("can_experience"));
			  		profile.setCan_experience_details(rs.getString("can_experience_details"));
			  		profile.setCan_experience_id(rs.getInt("can_experience_id"));
			  		profile.setCan_skill(rs.getString("can_experience"));
			  		profile.setCan_id(rs.getInt("can_id"));
			  		list.add(profile);
			  		return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return null;
	}

	public List getCandidateProject(int canId) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM candidate_project_tb WHERE can_id=?");
			  	ps.setInt(1,canId);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		CandidateProfile profile=new CandidateProfile();
			  		profile.setProject_description(rs.getString("project_description"));
			  		profile.setProject_module(rs.getString("project_module"));
			  		profile.setProject_name(rs.getString("project_name"));
			  		list.add(profile);
			  		return list;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return null;
	}

	public List getCandidateImage(int canId) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM can_image_tb WHERE user_id=? ORDER BY profileimage_id LIMIT 1");
			  	ps.setInt(1,canId);
			  	ResultSet rs=ps.executeQuery();
			  	List list=new ArrayList();
			  	while(rs.next())
			  	{
			  		CandidateProfile profile=new CandidateProfile();
			  		profile.setProfile_image(rs.getString("profile_image"));
			  		list.add(profile);
			  	}

		  		return list;
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }

		return null;
	}
	public String getCandidateName(int canId) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM signup_tb WHERE user_id=?");
			  	ps.setInt(1,canId);
			  	ResultSet rs=ps.executeQuery();
			  	while(rs.next())
			  	{
			  		String canName=rs.getString("username");
			  	return canName;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
return null;
	
	}

	public boolean addIdProof(CandidateProfile cp) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			 PreparedStatement ps=conn.prepareStatement("select * from id_proof_tb where user_id=?");
			 ps.setInt(1, cp.getCan_id());
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 PreparedStatement ps3=conn.prepareStatement("update id_proof_tb set id_proof=? where user_id=?");
					ps3.setString(1, cp.getId_proof());
					ps3.setInt(2, cp.getCan_id());
					
					ps3.executeUpdate();
				return true;
			 
			 }
			 PreparedStatement ps3=conn.prepareStatement("insert into id_proof_tb (user_id,id_proof) values(?,?)");
				ps3.setInt(1, cp.getCan_id());
				ps3.setString(2, cp.getId_proof());
				ps3.executeUpdate();
			return true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 
		 }
		return false;
	}

	public int getEducationYear(int canId) {
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT * FROM candidateeducation_tb WHERE can_id=?");
			  	ps.setInt(1,canId);
			  	ResultSet rs=ps.executeQuery();
			  	while(rs.next())
			  	{
			  	int canYear=rs.getInt("can_year");
			  	return canYear;
			  	}
	 }
	 catch(Exception e){
		 e.printStackTrace();
		 
	 }
		return 0;
	}

	public String getCandidateSkills(int canId) {
		// TODO Auto-generated method stub
		Connection conn=null;
		 try{
			 conn=MyConnection.getConnection();
			  PreparedStatement ps=conn.prepareStatement("SELECT can_skill FROM candidateeducation_tb WHERE can_id=?");
			  	ps.setInt(1,canId);
			  	ResultSet rs=ps.executeQuery();
			  	while(rs.next())
			  	{
			  	String can_skill=rs.getString("can_skill");
			  	return can_skill;
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
			  		CandidateProfile profile=new CandidateProfile();
		
			  		profile.setCan_id(rs.getInt("user_id"));
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
}
