package com.conn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.dao.ApplyNowImp;
import com.conn.dao.ApplyNowInt;
import com.conn.pojo.ApplyDataDao;

/**
 * Servlet implementation class StatusChangeServlet
 */
public class StatusChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatusChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session=request.getSession();
		String status=request.getParameter("status");
		int applyId=Integer.parseInt(request.getParameter("applyId"));
		
		ApplyNowInt intf=new ApplyNowImp();
	//	System.out.println("status"+status);
		if(status.equalsIgnoreCase("Approve"))
		{ 
			int clientId=Integer.parseInt(request.getParameter("clientId"));
		
		//	System.out.println("status"+status);
		boolean bb=intf.statusChange(status, applyId);
		response.sendRedirect("ClientHomeServlet?userId="+clientId);
		
		}
		
		if(status.equalsIgnoreCase("Reject"))
		{
		boolean bb=intf.deleteApply(applyId);
		if(bb)
		{
			int clientId=Integer.parseInt(request.getParameter("clientId"));
		
		//	System.out.println("status"+status);
			response.sendRedirect("ClientHomeServlet?userId="+clientId);
		}
		
		}
		
		if(status.equalsIgnoreCase("Done"))
		{    
		int canId=Integer.parseInt(request.getParameter("canId"));
		boolean bb=intf.statusChange(status, applyId);
		if(bb)
		{
	//		System.out.println("status"+status);
			response.sendRedirect("UserHomeServlet?userId="+canId);
		}
		}
		
		if(status.equalsIgnoreCase("Completed"))
		{
		boolean bb=intf.deleteApply(applyId);
		if(bb)
		{
			int clientId=Integer.parseInt(request.getParameter("clientId"));
			int candidate_id=Integer.parseInt(request.getParameter("candidate_id"));
			String candidate_name=request.getParameter("candidate_name");
			String project_name=request.getParameter("project_name");
			String feedback=request.getParameter("feedback");
		
			ApplyDataDao ad=new ApplyDataDao();
			ad.setCandidate_id(candidate_id);
			ad.setCandidate_name(candidate_name);
			ad.setClient_id(clientId);
			ad.setFeedback(feedback);
			ad.setProject_name(project_name);
			
			intf.saveFeedback(ad);
		
			
			
			
			if(feedback.equalsIgnoreCase("Bad"))
			{
				intf.updateScore(candidate_id, 0);
			}
			if(feedback.equalsIgnoreCase("Poor"))
			{
				intf.updateScore(candidate_id, 2);
			}
			if(feedback.equalsIgnoreCase("Good"))
			{
				intf.updateScore(candidate_id, 5);
			}
			if(feedback.equalsIgnoreCase("Very Good"))
			{
				intf.updateScore(candidate_id, 10);
			}
		//	System.out.println("status"+status);
			response.sendRedirect("ClientHomeServlet?userId="+clientId);
		}
		
		}
		
		
		
	}

}
