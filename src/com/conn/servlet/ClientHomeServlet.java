package com.conn.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.dao.ApplyNowImp;
import com.conn.dao.ApplyNowInt;
import com.conn.dao.CandidateProfileImp;
import com.conn.dao.CandidateProfileInt;
import com.conn.dao.ClientProfileImpDao;
import com.conn.dao.ClientProfileIntDao;
import com.conn.dao.PostDataImp;
import com.conn.dao.PostDataInt;
import com.conn.pojo.ApplyDataDao;

/**
 * Servlet implementation class ClientHomeServlet
 */
public class ClientHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int clientid=Integer.parseInt(request.getParameter("userId"));
		
		ClientProfileIntDao  intf=new ClientProfileImpDao();
		
		List recriuterList=intf.getRecruiterDetails(clientid);
		session.removeAttribute("recriuterList");
		session.setAttribute("recriuterList", recriuterList);
		
		
		List ClientDetailsList=intf.getClientDetails(clientid);
		session.removeAttribute("ClientDetailsList");
		session.setAttribute("ClientDetailsList", ClientDetailsList);
		
		
		List ClientContactUsList=intf.getClientContactUs(clientid);
		session.removeAttribute("ClientContactUsList");
		session.setAttribute("ClientContactUsList", ClientContactUsList);
		
		
		
		List ClientProfileImageList=intf.getClientProfileImage(clientid);
		session.removeAttribute("ClientProfileImageList");
		session.setAttribute("ClientProfileImageList", ClientProfileImageList);
		
		
		
		ApplyDataDao ad=new ApplyDataDao();
		ApplyNowInt intf3=new ApplyNowImp();
		List pendingList=intf3.getApplyList(clientid,"Pending");
		if(pendingList!=null && pendingList.size()>0)
		{
			Iterator it=pendingList.iterator();
			int applyId[]=new int[pendingList.size()];
			int id[]=new int[pendingList.size()];
			int year[]=new int[pendingList.size()];
			int score[]=new int[pendingList.size()];
			int i=0;
			while(it.hasNext())
			{
				ad=(ApplyDataDao)it.next();
				id[i]=ad.getCandidate_id();
				year[i]=ad.getEducation_year();
				score[i]=ad.getScore();
				applyId[i]=ad.getApply_id();
				i++;
			}
			System.out.println("On Score Priority");
			for(i=0;i<pendingList.size();i++)
			{
				System.out.println(id[i]+" "+year[i]+" "+score[i]);
			}	
		
			for(i=0;i<pendingList.size()-1;i++)
			{
				
					if(year[i]==year[i+1] && score[i]<score[i+1])
					{
						id[i]=id[i]+id[i+1];
						id[i+1]=id[i]-id[i+1];
						id[i]=id[i]-id[i+1];
						
						year[i]=year[i]+year[i+1];
						year[i+1]=year[i]-year[i+1];
						year[i]=year[i]-year[i+1];
						
						score[i]=score[i]+score[i+1];
						score[i+1]=score[i]-score[i+1];
						score[i]=score[i]-score[i+1];
						
						applyId[i]=applyId[i]+applyId[i+1];
						applyId[i+1]=applyId[i]-applyId[i+1];
						applyId[i]=applyId[i]-applyId[i+1];
					}
				
				
			
			}	
			System.out.println("If Score Priority Is Same Then By Education Year Priority");
			for(i=0;i<pendingList.size();i++)
			{
				System.out.println(id[i]+" "+year[i]+" "+score[i]);
			}
			
			
			int k=pendingList.size();
			pendingList.clear();
			for(i=0;i<k;i++)
			{
				ad=intf3.getDataByApplyId(applyId[i]);
				pendingList.add(ad);
			
			}
			

			float yearMean=0,scoreMean=0,yearVarience=0,scoreVarience=0;
			
			for(int j=0;j<pendingList.size();j++)
			{
				yearMean+=year[j];
				scoreMean+=score[j];
			
			}
			
			for(int j=0;j<pendingList.size();j++)
			{
				float yearStudent=(float)year[j]/yearMean;
				float scoreStudent=(float)score[j]/scoreMean;
			System.out.println("Candidate Id: "+id[j]+" Year Probability: "+yearStudent+" Score Probability: "+scoreStudent);
			}
			yearMean/=pendingList.size();
			scoreMean/=pendingList.size();
			
			System.out.println("\nMean=Sum Of All Value/No. Of Value");
			
			System.out.println("\nYear Mean "+yearMean+"\nScore mean "+scoreMean+"\n");
			
			for(int j=0;j<pendingList.size();j++)
			{
				yearVarience+=(year[j]-yearMean)*(year[j]-yearMean);
				scoreVarience+=(score[j]-scoreMean)*(score[j]-scoreMean);
			}
			
			yearVarience/=pendingList.size()-1;
			scoreVarience/=pendingList.size()-1;
			System.out.println("Varience=(Sum Of Mean-Value)/(No. Of Value-1)");
			System.out.println("\nYear Varience "+yearVarience+"\nScore Varience "+scoreVarience+"\n");
			
			System.out.println("Probability=(1/Sqaure Root Of(2*pi*varience))*(exp(-(6-mean)Sqaure)/(2*varience)) \n");
			float w=(-((2-yearMean)*(2-yearMean))/(2*yearVarience));
			float probYear=(float) ((1/(Math.sqrt(6.28*yearVarience)))*(Math.exp(w)));
			
			System.out.println("Probability Year: "+probYear);
			
			w=(-((10-scoreMean)*(10-scoreMean))/(2*scoreVarience));
			float probScore=(float) ((1/(Math.sqrt(6.28*scoreVarience)))*(Math.exp(w)));
				
			System.out.println("Probability Score: "+probScore);
			
			
				System.out.println("\nEvidence=Multiplication Of All Probability");
				float evidence=(float)(probYear*probScore);
				System.out.println("Evidence "+evidence);
				
				System.out.println("Posterior Prob=Prob/Evidence \n");
				evidence*=10000;
			float posteriorYear=(float)((probYear)/evidence);
			float posteriorScore=(float)((probScore)/evidence);
			
			
			
			System.out.println("Posterior Prob Year "+posteriorYear);
			System.out.println("Posterior Prob Score "+posteriorScore+"\n\n");
			
			
			
			
		}
		session.removeAttribute("pendingList");
		session.setAttribute("pendingList", pendingList);
	
		
		
		List approveList=intf3.getApplyList(clientid,"Approve");
		session.removeAttribute("approveList");
		session.setAttribute("approveList", approveList);
	
		
		List doneList=intf3.getApplyList(clientid,"Done");
		session.removeAttribute("doneList");
		session.setAttribute("doneList", doneList);
	
		

		List completedList=intf3.getFeedBackList(clientid);
		session.removeAttribute("completedList");
		session.setAttribute("completedList", completedList);
		
		
		
		PostDataInt intf1=new PostDataImp();
		List postProjectList=intf1.clientPostedList(clientid);
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
