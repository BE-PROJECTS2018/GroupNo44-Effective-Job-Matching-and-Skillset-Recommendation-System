package com.conn.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.connection.EmailUtility;
import com.conn.dao.ClientProfileImpDao;
import com.conn.dao.ClientProfileIntDao;
import com.conn.pojo.CandidateProfile;
import com.conn.pojo.ClientProfilePojo;
import com.conn.pojo.SignUp;

/**
 * Servlet implementation class ComProfileServlet
 */
public class ComProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComProfileServlet() {
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
		String action=request.getParameter("action");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		System.out.println("action"+action);
		//System.out.println("hieeee"+action);
		ClientProfileIntDao intf=new ClientProfileImpDao();
		if(action!=null && action.equalsIgnoreCase("saveRecruiterDetails"))
		{
			//System.out.print("saveRecruiterDetails");
			int userId=Integer.parseInt(request.getParameter("userId"));
			String fName=request.getParameter("fName");
			String gender=request.getParameter("gender");
			long mobileno=Long.parseLong(request.getParameter("mobileno"));
			ClientProfilePojo cp=new ClientProfilePojo();
			cp.setUser_id(userId);
			cp.setRec_full_name(fName);
			cp.setRec_gender(gender);
			cp.setRec_mobileno(mobileno);
		boolean bb=intf.addRecruiterDetails(cp);
		if(bb)
		{
			List recriuterList=intf.getRecruiterDetails(userId);
			session.removeAttribute("recriuterList");
			session.setAttribute("recriuterList", recriuterList);
			String page=request.getParameter("page");
			if(page.equalsIgnoreCase("newclient"))
			{
				response.sendRedirect("newClientProfilePage.jsp");
			}
			if(page.equalsIgnoreCase("client"))
			{
				response.sendRedirect("clientProfilePage.jsp");
			}
			
		}
		}
		if(action!=null && action.equalsIgnoreCase("saveClientDetails"))
		{
		//	System.out.print("saveClientDetails");
			int userId=Integer.parseInt(request.getParameter("userId"));
			System.out.println("userId"+userId);
			String cName=request.getParameter("cName");
			System.out.println("cName"+cName);
			String founded=request.getParameter("founded");
			System.out.println("founded"+founded);
			String project=request.getParameter("project");
			System.out.println("project"+project);
			String technology=request.getParameter("technology");
			System.out.println("technology"+technology);
			String location=request.getParameter("location");
			System.out.println("location"+location);
			String city=request.getParameter("city");
			System.out.println("city"+city);
			int pincode=Integer.parseInt(request.getParameter("pincode"));
			System.out.println("pincode"+pincode);
			String state=request.getParameter("state");
			System.out.println("state"+state);
			String country=request.getParameter("country");
			System.out.println("country"+country);
			ClientProfilePojo cp=new ClientProfilePojo();
			cp.setUser_id(userId);
			cp.setClient_name(cName);
			cp.setClient_founded(founded);
			cp.setTechnology(technology);
			cp.setProject(project);
			cp.setClient_location(location);
			cp.setClient_city(city);
			cp.setClient_pincode(pincode);
			cp.setClient_state(state);
			cp.setClient_country(country);
			
		boolean bb=intf.addClientDetails(cp);
		if(bb)
		{
			String client_mail=(String) session.getAttribute("client_mail");
			System.out.println("client_mail"+client_mail);
			List<SignUp> canList=intf.getCandidateDetails(technology);
			List<SignUp> notSelectedcanList=intf.notSelectedCandidateDetails(technology);
			System.out.println("canList"+canList.size());
			String email=null;
			String username=null;
			EmailUtility emailUtility=new EmailUtility();
			
			emailUtility.sendClientMail(client_mail,canList,cName,technology);
			
			for(int i=0;i<canList.size();i++)
			{
				email=canList.get(i).getEmail_id();
				System.out.println("email"+email);
				username=canList.get(i).getUsername();
				System.out.println("username"+username);
				//emailUtility.sendEmail(emailId, canId, projectName)
				emailUtility.sendEmail(email,username,cName,technology);
			}
			
			for(int i=0;i<notSelectedcanList.size();i++)
			{
				email=notSelectedcanList.get(i).getEmail_id();
				System.out.println("email"+email);
				username=notSelectedcanList.get(i).getUsername();
				System.out.println("username"+username);
				//emailUtility.sendEmail(emailId, canId, projectName)
				emailUtility.sendEmailNotSeleted(email,username,cName,technology);
			}
	
			List ClientDetailsList=intf.getClientDetails(userId);
			session.removeAttribute("ClientDetailsList");
			session.setAttribute("ClientDetailsList", ClientDetailsList);
			String page=request.getParameter("page");
			if(page.equalsIgnoreCase("newclient"))
			{
				response.sendRedirect("newClientProfilePage.jsp");
			}
			if(page.equalsIgnoreCase("client"))
			{
				response.sendRedirect("clientProfilePage.jsp");
			}
			
		}
		}
		
		if(action!=null && action.equalsIgnoreCase("saveContactDetails"))
		{
		//	System.out.print("saveContactDetails");
			int userId=Integer.parseInt(request.getParameter("userId"));
			long contactNo=Long.parseLong(request.getParameter("contactNo"));
			String emailId=request.getParameter("emailId");
			String website=request.getParameter("website");
			String companyDetails=request.getParameter("companyDetails");
			ClientProfilePojo cp=new ClientProfilePojo();
			cp.setUser_id(userId);
			cp.setClient_contact_no(contactNo);
			cp.setClient_email_id(emailId);
			cp.setClient_website(website);
			cp.setClient_about(companyDetails);
	
		boolean bb=intf.addClientContact(cp);
		if(bb)
		{
			List ClientContactUsList=intf.getClientContactUs(userId);
			session.removeAttribute("ClientContactUsList");
			session.setAttribute("ClientContactUsList", ClientContactUsList);
			String page=request.getParameter("page");
			if(page.equalsIgnoreCase("newclient"))
			{
				response.sendRedirect("newClientProfilePage.jsp");
			}
			if(page.equalsIgnoreCase("client"))
			{
				response.sendRedirect("clientProfilePage.jsp");
			}
			
		}
		
		}
		

	}

}
