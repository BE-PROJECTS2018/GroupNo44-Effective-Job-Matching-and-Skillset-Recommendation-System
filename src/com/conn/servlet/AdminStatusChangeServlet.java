package com.conn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.dao.ApplyNowImp;
import com.conn.dao.ApplyNowInt;
import com.conn.dao.SignUpImp;
import com.conn.dao.SignUpInt;

/**
 * Servlet implementation class AdminStatusChangeServlet
 */
public class AdminStatusChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminStatusChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String status=request.getParameter("status");
		int userId=Integer.parseInt(request.getParameter("userId"));

		SignUpInt intf=new SignUpImp();
		if(status.equalsIgnoreCase("Approve"))
		{
		boolean bb=intf.changeStatus(userId, status);
		if(bb)
		{
			response.sendRedirect("AdminHomeServlet");
		}
		}
		if(status.equalsIgnoreCase("Reject"))
		{
		String usertype=request.getParameter("usertype");
		boolean bb=intf.deleteUserData(userId, usertype);
	
		if(bb)
		{ 
			response.sendRedirect("AdminHomeServlet");
		}
		}
	}

}
