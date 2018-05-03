package com.conn.dao;

import java.util.List;

import com.conn.pojo.CandidateProfile;
import com.conn.pojo.ClientProfilePojo;
import com.conn.pojo.SignUp;

public interface ClientProfileIntDao {
	public boolean addRecruiterDetails(ClientProfilePojo cp);

	 public boolean addClientDetails(ClientProfilePojo cp);

	 public boolean addClientContact(ClientProfilePojo cp);
	 
	 public List getClientProfile(int user_id);
	
	 public String getClientName(int user_id);
	 
	 public String getClientEmail(int user_id);
	 
	 public List getRecruiterDetails(int user_id);

	 public List getClientDetails(int user_id);
	
	 public List getClientContactUs(int user_id);
	
	 public List getClientProfileImage(int user_id);
	 public List getIdProof(int user_id);

	 public List<SignUp> getCandidateDetails(String technology);
	
	 public List<SignUp> notSelectedCandidateDetails(String technology);

}
