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
import com.conn.dao.ClientProfileImpDao;
import com.conn.dao.ClientProfileIntDao;
import com.conn.dao.SignUpImp;
import com.conn.dao.SignUpInt;
import com.conn.pojo.SignUp;

/**
 * Servlet implementation class SignUpServlet
 */
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
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
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		String emailId=request.getParameter("emailName");
		String userName=request.getParameter("userName");
		String passWord=request.getParameter("passWord");
		String confirmPassword=request.getParameter("cPassWord");
		String userType=request.getParameter("usertype");
		
		String loginuserName=request.getParameter("luserName");
		String loginPassword=request.getParameter("lpassWord");
		
		//System.out.println("usertype "+userType);
	//	System.out.println("action"+action);
		
	//	System.out.println("emailId"+emailId);
	//	System.out.println("action"+action);
	//	System.out.println("userName"+userName);
	//	System.out.println("passWord"+passWord);
	//	System.out.println("confirmPassword"+confirmPassword);
		PrintWriter out=response.getWriter();
		
		SignUp signUp=new SignUp();
		signUp.setEmail_id(emailId);
		signUp.setUsername(userName);
		signUp.setPassword(passWord);
		signUp.setUsertype(userType);
		ClientProfileIntDao cProfile=new ClientProfileImpDao();
		SignUpInt intf=new SignUpImp();
		
		if(action!=null && action.equals("signUp"))
		{
			
			
			boolean bb=intf.addUser(signUp);
			if(bb)
			{
				
			String data="<label>Successfully Signed Up!!!</label>";
			
			if(userType.equalsIgnoreCase("Candidate"))
			{
				CandidateProfileInt intf1=new CandidateProfileImp();
				int userId=intf.getCandidateId(emailId);
			//	System.out.println("can user id"+userId);
				session.removeAttribute("userId");
				session.setAttribute("userId", userId);
				String username=intf.getUsername(userId);
				session.removeAttribute("userName");
				session.setAttribute("userName", username);
				List personalData=intf1.getCandidatePersonal(userId);
				session.removeAttribute("personalData");
				session.setAttribute("personalData", personalData);
				List educationData=intf1.getCandidateEducation(userId);
				session.removeAttribute("educationData");
				session.setAttribute("educationData", educationData);	
				List profileImage=intf1.getCandidateImage(userId);
				session.removeAttribute("profileImage");
				session.setAttribute("profileImage", profileImage);
				List idList=intf1.getIdProof(userId);
				session.removeAttribute("idList");
				session.setAttribute("idList", idList);
				
			response.sendRedirect("newCandidateProfilePage.jsp");
			}
			if(userType.equalsIgnoreCase("Client"))
			{
				int userId=intf.getCandidateId(emailId);
				session.removeAttribute("userId");
				session.setAttribute("userId", userId);
				session.setAttribute("client_mail", emailId);
				System.out.println("userId on servlet"+userId);
				String username=intf.getUsername(userId);
				System.out.println("client username"+username);
				session.removeAttribute("userName");
				session.setAttribute("userName", username);
				System.out.println("username on servlet"+username);
			response.sendRedirect("newClientProfilePage.jsp");
			}
			}
		}
		
		if(action!=null && action.equals("login"))
		{   
			int flag=0;
			int  userId=intf.login(loginuserName, loginPassword);
			if(userId>0)
			{
				
				int id=intf.getCandidateId(loginuserName);
				session.removeAttribute("userId");
				session.setAttribute("userId", id);
			//	System.out.println("userid"+id);
				String username=intf.getUsername(id);
				session.removeAttribute("userName");
				session.setAttribute("userName", username);
				session.removeAttribute("emailId");
				session.setAttribute("emailId", loginuserName);
				session.setAttribute("client_mail", loginuserName);
				String usertype=intf.getUserType(id);
				String status=intf.getUserStatus(id);
			//	System.out.println("usertype"+usertype);
				if(usertype.equalsIgnoreCase("Candidate"))
				{
					
					if(status.equalsIgnoreCase("Approve"))
					{
						flag=0;
						session.removeAttribute("flag");
						session.setAttribute("flag", flag);
				response.sendRedirect("UserHomeServlet?userId="+userId);
					}
					else if(status.equalsIgnoreCase("Pending"))
					{
						flag=1;
					session.removeAttribute("flag");
					session.setAttribute("flag", flag);
				//	System.out.println("flag"+flag);
						response.sendRedirect("signUp.jsp");
					}
					
				}
				if(usertype.equalsIgnoreCase("Client"))
				{
					String clientName=cProfile.getClientName(id);
				//	System.out.println("clientName"+clientName);
					session.removeAttribute("clientName");
					session.setAttribute("clientName", clientName);
					
					if(status.equalsIgnoreCase("Approve"))
					{
						flag=0;
						session.removeAttribute("flag");
						session.setAttribute("flag", flag);
					response.sendRedirect("ClientHomeServlet?userId="+id);
					}
					
					else if(status.equalsIgnoreCase("Pending"))
					{
						flag=1;
					session.removeAttribute("flag");
					session.setAttribute("flag", flag);
			//		System.out.println("flag"+flag);
						response.sendRedirect("signUp.jsp");
					}
					}
				if(usertype.equalsIgnoreCase("Admin"))
				{
					
					response.sendRedirect("AdminHomeServlet");
				}
				

			}
			else
			{ 
				flag=2;
				session.removeAttribute("flag");
				session.setAttribute("flag", flag);
			//	System.out.println("flag"+flag);
					response.sendRedirect("signUp.jsp");
			}
		}
		
	}
}

