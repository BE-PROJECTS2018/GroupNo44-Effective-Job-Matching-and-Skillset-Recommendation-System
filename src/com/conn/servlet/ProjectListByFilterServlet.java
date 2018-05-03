package com.conn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.dao.PostDataImp;
import com.conn.dao.PostDataInt;

/**
 * Servlet implementation class ProjectListByFilterServlet
 */
public class ProjectListByFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectListByFilterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
	String costing=request.getParameter("costing");
	PostDataInt intf=new PostDataImp();
	if(costing.equalsIgnoreCase("upto5000"))
	{
		
		List postProjectList=intf.postProjectListByFilter(5000);
		session.removeAttribute("postProjectList");
		session.setAttribute("postProjectList", postProjectList);
		response.sendRedirect("projectListPage.jsp");
	}
	if(costing.equalsIgnoreCase("upto10000"))
	{
		
		List postProjectList=intf.postProjectListByFilter(10000);
		session.removeAttribute("postProjectList");
		session.setAttribute("postProjectList", postProjectList);
		response.sendRedirect("projectListPage.jsp");
	}
	if(costing.equalsIgnoreCase("upto15000"))
	{
		
		List postProjectList=intf.postProjectListByFilter(15000);
		session.removeAttribute("postProjectList");
		session.setAttribute("postProjectList", postProjectList);
		response.sendRedirect("projectListPage.jsp");
	}
	if(costing.equalsIgnoreCase("upto20000"))
	{
		
		List postProjectList=intf.postProjectListByFilter(20000);
		session.removeAttribute("postProjectList");
		session.setAttribute("postProjectList", postProjectList);
		response.sendRedirect("projectListPage.jsp");
	}
	if(costing.equalsIgnoreCase("above20000"))
	{
		
		List postProjectList=intf.postProjectListByFilterAbove20000(20000);
		session.removeAttribute("postProjectList");
		session.setAttribute("postProjectList", postProjectList);
		response.sendRedirect("projectListPage.jsp");
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
