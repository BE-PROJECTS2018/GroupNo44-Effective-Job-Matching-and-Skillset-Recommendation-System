package com.conn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.dao.ClientProfileImpDao;
import com.conn.dao.ClientProfileIntDao;
import com.conn.dao.PostDataImp;
import com.conn.dao.PostDataInt;

/**
 * Servlet implementation class PostRemoveServlet
 */
public class PostRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postId=Integer.parseInt(request.getParameter("postId"));
		PostDataInt intf=new PostDataImp();
		intf.deletePost(postId);
		HttpSession session=request.getSession();
		int clientid=Integer.parseInt(request.getParameter("userId"));
		ClientProfileIntDao  intf1=new ClientProfileImpDao();
		List clientList=intf1.getClientProfile(clientid);
		session.removeAttribute("clientList");
		session.setAttribute("clientList", clientList);
		PostDataInt intf2=new PostDataImp();
		List postProjectList=intf2.clientPostedList(clientid);
		session.removeAttribute("postProjectList");
		session.setAttribute("postProjectList", postProjectList);
		
		response.sendRedirect("clientHome.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
