package com.conn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.dao.CandidateProfileImp;
import com.conn.dao.CandidateProfileInt;
import com.conn.dao.ClientProfileImpDao;
import com.conn.dao.ClientProfileIntDao;

/**
 * Servlet implementation class ClientDataServlet
 */
public class ClientDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int userId=Integer.parseInt(request.getParameter("userId"));
		String action=request.getParameter("action");
	//	System.out.println("action"+action);
	//	System.out.print("can id"+userId);
		ClientProfileIntDao intf=new ClientProfileImpDao();
		List clientList=intf.getClientProfile(userId);
		session.removeAttribute("clientList");
		session.setAttribute("clientList", clientList);
		
		
		List recriuterList=intf.getRecruiterDetails(userId);
		session.removeAttribute("recriuterList");
		session.setAttribute("recriuterList", recriuterList);
		
		
		List ClientDetailsList=intf.getClientDetails(userId);
		session.removeAttribute("ClientDetailsList");
		session.setAttribute("ClientDetailsList", ClientDetailsList);
		
		
		List ClientContactUsList=intf.getClientContactUs(userId);
		session.removeAttribute("ClientContactUsList");
		session.setAttribute("ClientContactUsList", ClientContactUsList);
		
		if(action.equalsIgnoreCase("editProfile"))
		response.sendRedirect("clientProfilePage.jsp");
		else
			response.sendRedirect("clientProfileDisplayPage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
