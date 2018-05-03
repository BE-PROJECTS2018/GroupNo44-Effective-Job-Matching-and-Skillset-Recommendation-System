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
import com.conn.dao.CandidateProfileImp;
import com.conn.dao.CandidateProfileInt;
import com.conn.dao.PostDataImp;
import com.conn.dao.PostDataInt;

/**
 * Servlet implementation class PostDisplayServlet
 */
public class PostDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostDisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		//String action=request.getParameter("action");
		//System.out.println("action"+action);
		int canid=Integer.parseInt(request.getParameter("userId"));
		PostDataInt intf=new PostDataImp();
		List postProjectList=intf.postProjectList();
		ApplyNowInt intf1=new ApplyNowImp();
		String status=intf1.getStatus(canid);
		session.removeAttribute("userId");
		session.setAttribute("userId", canid);
		session.removeAttribute("status");
		session.setAttribute("status", status);
		//System.out.println("status"+status);
		
		session.removeAttribute("postProjectList");
		session.setAttribute("postProjectList", postProjectList);
		response.sendRedirect("projectListPage.jsp");
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
