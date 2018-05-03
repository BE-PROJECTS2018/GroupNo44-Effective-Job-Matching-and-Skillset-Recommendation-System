package com.conn.dao;

import java.util.List;

import com.conn.pojo.PostDataPojo;

public interface PostDataInt {
public boolean postProject(PostDataPojo pd);
public List postProjectList();
public List clientPostedList(int clientId);
public boolean deletePost(int postId);
public List postProjectListByFilter(int costing);
public List postProjectListByFilterAbove20000(int costing);
}
