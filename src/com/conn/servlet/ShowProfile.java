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
import com.conn.dao.DumyUserImp;
import com.conn.dao.DumyUserInt;

/**
 * Servlet implementation class ShowProfile
 */
public class ShowProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usertype=request.getParameter("usertype");
		HttpSession session=request.getSession();
		int userId=Integer.parseInt(request.getParameter("userId"));
		
		DumyUserInt intf5=new DumyUserImp();
		if(usertype.equalsIgnoreCase("Client"))
		{
			
			ClientProfileIntDao  intf=new ClientProfileImpDao();
			
			List recriuterList=intf.getRecruiterDetails(userId);
			session.removeAttribute("recriuterList");
			session.setAttribute("recriuterList", recriuterList);
		//	System.out.println("recriuterList"+recriuterList);
			
			List ClientDetailsList=intf.getClientDetails(userId);
			session.removeAttribute("ClientDetailsList");
			session.setAttribute("ClientDetailsList", ClientDetailsList);
		//	System.out.println("ClientDetailsList"+ClientDetailsList);
			
			List ClientContactUsList=intf.getClientContactUs(userId);
			session.removeAttribute("ClientContactUsList");
			session.setAttribute("ClientContactUsList", ClientContactUsList);
		//	System.out.println("ClientContactUsList"+ClientContactUsList);
			
			
			List ClientProfileImageList=intf.getClientProfileImage(userId);
			session.removeAttribute("profileImage");
			session.setAttribute("profileImage", ClientProfileImageList);
		//	System.out.println("ClientProfileImageList"+ClientProfileImageList);
			
			
			List idList=intf.getIdProof(userId);
			session.removeAttribute("idList");
			session.setAttribute("idList", idList);
			
			
		//	System.out.println("idList"+idList);
			
			
			
			response.sendRedirect("clientProfileForAdmin.jsp");
		}
		if(usertype.equalsIgnoreCase("Candidate"))
		{
			ClientProfileIntDao  intf1=new ClientProfileImpDao();

			CandidateProfileInt intf=new CandidateProfileImp();
			List candidateList=intf.getCandidateProfile(userId);
			session.removeAttribute("candidateList");
			session.setAttribute("candidateList", candidateList);
			
			List personalData=intf.getCandidatePersonal(userId);
			session.removeAttribute("personalData");
			session.setAttribute("personalData", personalData);
			
			List educationData=intf.getCandidateEducation(userId);
			session.removeAttribute("educationData");
			session.setAttribute("educationData", educationData);
			
			List experienceData=intf.getCandidateExperience(userId);
			session.removeAttribute("experienceData");
			session.setAttribute("experienceData", experienceData);
			
			List projectData=intf.getCandidateProject(userId);
			session.removeAttribute("projectData");
			session.setAttribute("projectData", projectData);
			
			List profileImage=intf1.getClientProfileImage(userId);
			session.removeAttribute("profileImage");
			session.setAttribute("profileImage", profileImage);
		//	System.out.println("profileImage"+profileImage);
			
			
			List idList=intf1.getIdProof(userId);
			session.removeAttribute("idList");
			session.setAttribute("idList", idList);
		//	System.out.println("idList"+idList);
			
			response.sendRedirect("candidateProfileForClient.jsp");
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
