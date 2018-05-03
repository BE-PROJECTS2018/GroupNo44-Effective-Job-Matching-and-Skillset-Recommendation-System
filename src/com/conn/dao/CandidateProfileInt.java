package com.conn.dao;

import java.util.List;

import com.conn.pojo.CandidateProfile;

public interface CandidateProfileInt 
{
 public boolean addCandidatePersonal(CandidateProfile cp);

 public boolean addCandidateEducation(CandidateProfile cp);

 public boolean addCandidateExperience(CandidateProfile cp);

 public boolean addCandidateProject(CandidateProfile cp);
 
 public boolean addCandidateImage(CandidateProfile cp);
 
 public boolean addIdProof(CandidateProfile cp);
 
 public List getCandidatePersonal(int canId);

 public List getCandidateEducation(int canId);

 public List getCandidateExperience(int canId);

 public List getCandidateProject(int canId);
 
 public List getCandidateImage(int canId);
 
 public List getCandidateProfile(int can_id);
 
 public boolean subscribe(String emailId);

 public List subScribeList();
 
 public String getCandidateName(int canId);
 
 public int getEducationYear(int canId);
 
 public String getCandidateSkills(int canId);
 
 public List getIdProof(int user_id);
 
}
