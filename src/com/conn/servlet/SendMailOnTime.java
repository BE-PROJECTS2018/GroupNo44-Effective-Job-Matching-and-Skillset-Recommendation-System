package com.conn.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.connection.EmailUtility;
import com.conn.dao.CandidateProfileImp;
import com.conn.dao.CandidateProfileInt;
import com.conn.dao.PostDataImp;
import com.conn.dao.PostDataInt;
import com.conn.pojo.PostDataPojo;

/**
 * Servlet implementation class SendMailOnTime
 */
public class SendMailOnTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailOnTime() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		Calendar cal = Calendar.getInstance();

		 String time= new SimpleDateFormat("HH:mm:ss").format(cal.getTime());
		 System.out.println("local date"+time);
		 try{
		 String checkDate ="11:00:00";
		 
		 if (time.equals(checkDate))
		 {
			 
			 
			 CandidateProfileInt intf=new CandidateProfileImp();
				
				List subscribeList=intf.subScribeList();
				Iterator it=subscribeList.iterator();
				
				while(it.hasNext())
				{
					String emailid=(String) it.next();
					System.out.println(""+emailid);
					EmailUtility.sendEmail(emailid);
					
					 	
				}
				
		 }
		 }
		
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		}
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
