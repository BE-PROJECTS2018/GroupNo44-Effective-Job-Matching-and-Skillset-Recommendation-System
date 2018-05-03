
package com.conn.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.conn.pojo.PostDataPojo;

/**
 * Servlet implementation class UserHomeServlet
 */
public class UserHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
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
		
		
		
		ApplyNowInt intf9=new ApplyNowImp();
		List approveList =intf9.getCandidateApproveList(canid);
		
		session.removeAttribute("approveList");
		session.setAttribute("approveList", approveList);
	//	System.out.println("approveList"+approveList);
		
		PostDataInt intf1=new PostDataImp();
		List postProjectList=intf1.postProjectList();
		session.removeAttribute("postProjectList");
		session.setAttribute("postProjectList", postProjectList);
		
		CandidateProfileInt candidateProfileInt=new CandidateProfileImp();
		String candidate_skills=candidateProfileInt.getCandidateSkills(canid);	
		System.out.println("candidate_skills"+candidate_skills);
		session.removeAttribute("candidate_skills");
		session.setAttribute("candidate_skills", candidate_skills);
		
		Map<Integer, PostDataPojo> projectMap=new HashMap<Integer, PostDataPojo>();
		for(Object obj:postProjectList){
			
			PostDataPojo postPojo=(PostDataPojo)obj;
		
				String[] canSkill_Array=candidate_skills.split(",");
				
				System.out.println("Projects Skill----"+postPojo.getSkills());
				
				for(String skill:canSkill_Array){
					System.out.println("Jsp Skill----"+skill);
				if(postPojo.getSkills().contains(skill)){
					System.out.println("in skill if");
					projectMap.put(postPojo.getPost_id(), postPojo);
		
				}
				}
		}
		
				session.removeAttribute("projectMap");
				session.setAttribute("projectMap", projectMap);
		
		System.out.println("Candidate Skills++++++++"+candidate_skills);
		
		response.sendRedirect("userHome.jsp");
		
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
