package com.conn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.dao.SignUpImp;
import com.conn.dao.SignUpInt;

/**
 * Servlet implementation class AdminHomeServlet
 */
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SignUpInt intf=new	SignUpImp();
		List userList=intf.userList("Pending");
		HttpSession session=request.getSession();
		session.removeAttribute("userList");
		session.setAttribute("userList", userList);
		List userListApprove=intf.userList("Approve");
		session=request.getSession();
		session.removeAttribute("userListApprove");
		session.setAttribute("userListApprove", userListApprove);
		response.sendRedirect("adminHome.jsp");
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
