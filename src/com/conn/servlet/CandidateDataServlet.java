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
 * Servlet implementation class CandidateDataServlet
 */
public class CandidateDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandidateDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		
		ClientProfileIntDao  intf1=new ClientProfileImpDao();
		
		if(action.equalsIgnoreCase("editProfile"))
		{
			int canid=Integer.parseInt(request.getParameter("userId"));
			
			CandidateProfileInt intf=new CandidateProfileImp();
			List candidateList=intf.getCandidateProfile(canid);
			session.removeAttribute("candidateList");
			session.setAttribute("candidateList", candidateList);
			
			List personalData=intf.getCandidatePersonal(canid);
			session.removeAttribute("personalData");
			session.setAttribute("personalData", personalData);
			
			List educationData=intf.getCandidateEducation(canid);
			session.removeAttribute("educationData");
			session.setAttribute("educationData", educationData);
			
			List experienceData=intf.getCandidateExperience(canid);
			session.removeAttribute("experienceData");
			session.setAttribute("experienceData", experienceData);
			
			List projectData=intf.getCandidateProject(canid);
			session.removeAttribute("projectData");
			session.setAttribute("projectData", projectData);
			
			List profileImage=intf1.getClientProfileImage(canid);
			session.removeAttribute("profileImage");
			session.setAttribute("profileImage", profileImage);
			//System.out.println("profileImage"+profileImage);
			
			
			List idList=intf1.getIdProof(canid);
			session.removeAttribute("idList");
			session.setAttribute("idList", idList);
			//System.out.println("idList"+idList);
			
			
		response.sendRedirect("candidateProfile.jsp");
		}
		if(action.equalsIgnoreCase("viewProfile"))
		{
			int canid=Integer.parseInt(request.getParameter("userId"));
		//	System.out.print("can id"+canid);
			CandidateProfileInt intf=new CandidateProfileImp();
			List candidateList=intf.getCandidateProfile(canid);
			session.removeAttribute("candidateList");
			session.setAttribute("candidateList", candidateList);
			
			List personalData=intf.getCandidatePersonal(canid);
			session.removeAttribute("personalData");
			session.setAttribute("personalData", personalData);
			
			List educationData=intf.getCandidateEducation(canid);
			session.removeAttribute("educationData");
			session.setAttribute("educationData", educationData);
			
			List experienceData=intf.getCandidateExperience(canid);
			session.removeAttribute("experienceData");
			session.setAttribute("experienceData", experienceData);
			
			List projectData=intf.getCandidateProject(canid);
			session.removeAttribute("projectData");
			session.setAttribute("projectData", projectData);
			
			List profileImage=intf.getCandidateImage(canid);
			session.removeAttribute("profileImage");
			session.setAttribute("profileImage", profileImage);
		//	System.out.println("profileImage"+profileImage);
			
			
			List idList=intf1.getIdProof(canid);
			session.removeAttribute("idList");
			session.setAttribute("idList", idList);
		//	System.out.println("idList"+idList);
			
				response.sendRedirect("candidateProfileDisplay.jsp");
		}
		
		if(action.equalsIgnoreCase("viewProfileByClient")){
			
			int canid=Integer.parseInt(request.getParameter("canid"));
			//System.out.print("can id"+canid);
			CandidateProfileInt intf=new CandidateProfileImp();
			List candidateList=intf.getCandidateProfile(canid);
			session.removeAttribute("candidateList");
			session.setAttribute("candidateList", candidateList);
			
			List personalData=intf.getCandidatePersonal(canid);
			session.removeAttribute("personalData");
			session.setAttribute("personalData", personalData);
			
			List educationData=intf.getCandidateEducation(canid);
			session.removeAttribute("educationData");
			session.setAttribute("educationData", educationData);
			
			List experienceData=intf.getCandidateExperience(canid);
			session.removeAttribute("experienceData");
			session.setAttribute("experienceData", experienceData);
			
			List projectData=intf.getCandidateProject(canid);
			session.removeAttribute("projectData");
			session.setAttribute("projectData", projectData);
			
			List profileImage=intf.getCandidateImage(canid);
			session.removeAttribute("profileImage");
			session.setAttribute("profileImage", profileImage);
			
			
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
