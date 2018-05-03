package com.conn.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.dao.CandidateProfileImp;
import com.conn.dao.CandidateProfileInt;
import com.conn.pojo.CandidateProfile;

/**
 * Servlet implementation class CanProfileServlet
 */
public class CanProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CanProfileServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		HttpSession session=request.getSession();
		//PrintWriter out=response.getWriter();
		System.out.println("action::"+action);		
			
		CandidateProfileInt intf=new CandidateProfileImp();
		
		if(action!=null && action.equalsIgnoreCase("savePeronalDetails"))
		{	
		//	System.out.println("savePeronalDetails");
			int canid=Integer.parseInt(request.getParameter("userId"));
			String fName=request.getParameter("fName");
			String gender=request.getParameter("gender");
			String address=request.getParameter("address");
			String city=request.getParameter("city");
			int pincode=Integer.parseInt(request.getParameter("pincode"));
			String state=request.getParameter("state");
			String country=request.getParameter("country");
			String dob=request.getParameter("dob");
			long mobileno=Long.parseLong(request.getParameter("mobileno"));
			
			CandidateProfile cp=new CandidateProfile();
			cp.setCan_id(canid);
			cp.setCan_full_name(fName);
			cp.setCan_gender(gender);
			cp.setCan_address(address);
			cp.setCan_city(city);
			cp.setCan_pincode(pincode);
			cp.setCan_state(state);
			cp.setCan_country(country);
			cp.setCan_dob(dob);
			cp.setCan_mobileno(mobileno);
			
		boolean bb=intf.addCandidatePersonal(cp);
		if(bb)
		{
			
			List personalData=intf.getCandidatePersonal(canid);
			session.removeAttribute("personalData");
			session.setAttribute("personalData", personalData);
			String page=request.getParameter("page");
			System.out.println("page............."+page);
			if(page.equalsIgnoreCase("candidate"))
			response.sendRedirect("candidateProfile.jsp");
			if(page.equalsIgnoreCase("newCandidate"))
				response.sendRedirect("newCandidateProfilePage.jsp");
		String data="<label>Successfully Signed Up!!!</label>";
	//   out.print(data);
		}
		}
		
		else if(action!=null && action.equalsIgnoreCase("saveEducationDetails"))
		{
		//	System.out.println("saveEducationDetails");
			int canid=Integer.parseInt(request.getParameter("userId"));
			String education=request.getParameter("education");
			String overallpercent=request.getParameter("overallpercent");
			int year=Integer.parseInt(request.getParameter("year"));
			String universityname=request.getParameter("universityname");
			String skill=request.getParameter("skill");
			int sscyear=Integer.parseInt(request.getParameter("sscyear"));
			int hscyear=Integer.parseInt(request.getParameter("hscyear"));
			String sscmarks=request.getParameter("sscmarks");
			String hscmarks=request.getParameter("hscmarks");
			
			
			CandidateProfile cp=new CandidateProfile();
			cp.setCan_education(education);
			cp.setCan_overall_percentage(overallpercent);
			cp.setCan_year(year);
			cp.setCan_university_name(universityname);
			cp.setCan_skill(skill);
			cp.setCan_id(canid);
			cp.setScc_year(sscyear);
			cp.setHsc_year(hscyear);
			cp.setScc_marks(sscmarks);
			cp.setHsc_diploma_marks(hscmarks);
			
			boolean bb=intf.addCandidateEducation(cp);
		if(bb)
		{	
			
			List educationData=intf.getCandidateEducation(canid);
			session.removeAttribute("educationData");
			session.setAttribute("educationData", educationData);	
			String page=request.getParameter("page");
			System.out.println("page"+page);
			if(page.equalsIgnoreCase("candidate")){
			response.sendRedirect("candidateProfile.jsp");
			}
			
			else if(page.equalsIgnoreCase("newCandidate"))
			response.sendRedirect("newCandidateProfilePage.jsp");
	    String data="<label>Successfully Signed Up!!!</label>";
	  // out.print(data);
		}
		}
		else if(action!=null && action.equalsIgnoreCase("saveExperienceDetails"))
		{
		//	System.out.println("saveEducationDetails");
			int canid=Integer.parseInt(request.getParameter("userId"));
			String experiance=request.getParameter("experiance");
			String company_name=request.getParameter("company");
			double salary=Double.parseDouble(request.getParameter("salary"));
			
			
			
			CandidateProfile cp=new CandidateProfile();
			cp.setCan_experience(experiance);
			cp.setCan_experience_details(company_name);
			cp.setCan_id(canid);
			cp.setCan_ctc(salary);
			
			boolean b=intf.addCandidateExperience(cp);
			if(b){
				List experianceData=intf.getCandidateExperience(canid);
				session.removeAttribute("experianceData");
				session.setAttribute("experianceData", experianceData);
				String page=request.getParameter("page");
				System.out.println("page"+page);
				if(page.equalsIgnoreCase("candidate"))
				response.sendRedirect("candidateProfile.jsp");
				if(page.equalsIgnoreCase("newCandidate"))
					response.sendRedirect("newCandidateProfilePage.jsp");
		    String data="<label>Successfully Signed Up!!!</label>";
				
			}
		}
	}
}
