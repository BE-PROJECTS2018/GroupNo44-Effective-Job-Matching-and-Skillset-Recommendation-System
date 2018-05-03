package com.conn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.dao.ClientProfileImpDao;
import com.conn.dao.ClientProfileIntDao;
import com.conn.dao.PostDataImp;
import com.conn.dao.PostDataInt;
import com.conn.pojo.PostDataPojo;

/**
 * Servlet implementation class PostProjectServlet
 */
public class PostProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("userId"));
		String work_require=request.getParameter("work_require");
		String project_name=request.getParameter("project_name");
		String project_description=request.getParameter("project_description");
		String project_skills=request.getParameter("project_skills");
		int experience=Integer.parseInt(request.getParameter("experience"));
		double costing=Double.parseDouble(request.getParameter("costing"));
		String timespan=request.getParameter("timespan");
		ClientProfileIntDao intf2=new ClientProfileImpDao();
		String clientName=intf2.getClientName(userId);
		
		
		if(work_require.equalsIgnoreCase("") || work_require==null || project_name.equalsIgnoreCase("") || project_name==null || project_description.equalsIgnoreCase("") || project_description==null|| project_skills.equalsIgnoreCase("") || project_skills==null|| timespan.equalsIgnoreCase("") || timespan==null)
		{
			
		}
		else
		{
		//System.out.println("clientName servlet"+clientName);
		PostDataPojo pd=new PostDataPojo();
		pd.setUser_id(userId);
		pd.setWork_required(work_require);
		pd.setProject_name(project_name);
		pd.setProject_desciption(project_description);
		pd.setSkills(project_skills);
		pd.setExperience(experience);
		pd.setCosting(costing);
		pd.setTime_span(timespan);
		pd.setClient_name(clientName);
		
		PostDataInt intf=new PostDataImp();
		boolean bb=intf.postProject(pd);
		
		
		}
		
		}

}
