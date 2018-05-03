package com.conn.dao;

import java.util.List;

import com.conn.pojo.ApplyDataDao;

public interface ApplyNowInt {
public boolean sendApply(int client_id,int candidate_id,String candidate_name,String project_name,int year,int score);
public String getStatus(int candidate_id);
public String getProjectName(int candidate_id);
public List getApplyList(int client_id,String status);
public boolean statusChange(String status,int applyId);
public boolean deleteApply(int applyId);

public List getCandidateApproveList(int candidate_id);

public boolean saveFeedback (ApplyDataDao ad);

public List getFeedBackList(int client_id);

public boolean updateScore(int candidate_id,int score);

public int getScore(int candidate_id);

public ApplyDataDao getDataByApplyId(int applyId);
}
