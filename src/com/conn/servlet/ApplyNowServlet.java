package com.conn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.connection.EmailUtility;
import com.conn.dao.ApplyNowImp;
import com.conn.dao.ApplyNowInt;
import com.conn.dao.CandidateProfileImp;
import com.conn.dao.CandidateProfileInt;
import com.conn.dao.ClientProfileImpDao;
import com.conn.dao.ClientProfileIntDao;

/**
 * Servlet implementation class ApplyNowServlet
 */
public class ApplyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyNowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int clientUserId=Integer.parseInt(request.getParameter("clientUserId"));
		
		String projectName=request.getParameter("projectName");
		
		CandidateProfileInt cp=new CandidateProfileImp();
		int canId=Integer.parseInt(request.getParameter("canID"));
		String name=cp.getCandidateName(canId);		
		int year=cp.getEducationYear(canId);
		ApplyNowInt intf2=new ApplyNowImp();
		
		int score=intf2.getScore(canId);
		
		intf2.sendApply(clientUserId, canId, name, projectName,year,score);
		String status=intf2.getStatus(canId);
		session.removeAttribute("userId");
		session.setAttribute("userId", canId);
		session.removeAttribute("status");
		session.setAttribute("status", status);
		
		
		
		
		
		//EmailUtility.sendEmail(emailId,canId,projectName);
		response.sendRedirect("projectListPage.jsp");
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
