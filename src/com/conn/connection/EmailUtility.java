package com.conn.connection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.conn.dao.CandidateProfileImp;
import com.conn.dao.CandidateProfileInt;
import com.conn.dao.PostDataImp;
import com.conn.dao.PostDataInt;
import com.conn.pojo.CandidateProfile;
import com.conn.pojo.ClientProfilePojo;
import com.conn.pojo.PostDataPojo;
import com.conn.pojo.SignUp;

public class EmailUtility {
	public static boolean sendEmail(String emailId,int canId, String projectName)
	{
		System.out.println("Can id email"+canId);
		final String userName="prointerns22@gmail.com";
		final String password="admin987";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		
		try
		{
			CandidateProfile canPojo=new CandidateProfile();
			
			CandidateProfileInt intf=new CandidateProfileImp();
			String fName,location,city,state,country,education,experience,cName,overallAgg,branch,keyskill,university;
			long mobileNumber;
			List canList=intf.getCandidateProfile(canId);
			Iterator it=canList.iterator();
			while(it.hasNext())
			{
				canPojo=(CandidateProfile)it.next();
			fName=canPojo.getCan_full_name();
			location=canPojo.getCan_address();
			city=canPojo.getCan_city();
			state=canPojo.getCan_state();
			country=canPojo.getCan_country();
			mobileNumber=canPojo.getCan_mobileno();
			
			education=canPojo.getCan_education();
			overallAgg=canPojo.getCan_overall_percentage();
			branch=canPojo.getCan_branch();
			university=canPojo.getCan_university_name();
			keyskill=canPojo.getCan_skill();
			
			experience=canPojo.getCan_experience();
			cName=canPojo.getCan_experience_details();
			
			System.out.println("Name='"+fName+"' Location='"+location+"' City='"+city+"' State='"+state+"' Country='"+country+"' Mobile Number='"+mobileNumber+"' Education='"+education+"' Overall Aggregate='"+overallAgg+"' Branch='"+branch+"' University='"+university+"'Key Skills='"+keyskill+"' Candidate Experience'"+experience+"' Company Name='"+cName+"'");
			System.out.println("project name"+projectName);
			
			
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress("fairactdemo@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId));
		    message.setSubject("Applying for your Project");
		    message.setContent("<table bgcolor='black' width='100%'><th><h1><font color='white'>Pro-Interns</font></h1></th></table><br><table border='4' width='100%'><td><br><h3><b>&nbsp;&nbsp;Dear client,</b></h3><b>&nbsp;&nbsp;The details given below is of the candidate who has applied for your "+projectName+" project.</b><br><b><h3><hr>&nbsp;&nbsp;<font color='#000066'><u>Personal Details</u></font></h3></b><b>&nbsp;&nbsp;Name:</b>"+fName+"<br><b>&nbsp;&nbsp;Address:-</b> "+location+", "+city+", "+state+", "+country+"<br><b>&nbsp;&nbsp;Contact number:-</b> "+mobileNumber+"<br><hr><h3><b>&nbsp;&nbsp;<font color='#000066'><u>Education Details</u></font></b></h3><b>&nbsp;&nbsp;Education:-</b>  "+education+"<br><b> &nbsp;&nbsp;Overall Aggregate:-</b> "+overallAgg+"<br><b>&nbsp;&nbsp;University Name:-</b> "+university+" <br><b>&nbsp;&nbsp;Key Skills:-</b>"+keyskill+"<br><h3><b><hr>&nbsp;&nbsp;<font color='#000066'><u>Experience Deatils</u></font></b></h3><b>&nbsp;&nbsp;Experience:-</b> "+experience+" years <br><b>&nbsp;&nbsp;Company name:-</b> "+cName+"<br><br><br></td></table>","text/html");
		    
			Transport.send(message);
            System.out.println("Done");
			}
		}
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
		return true;
	
	}



	public static boolean sendEmail(String emailId)
	{
		final String userName="prointerns22@gmail.com";
		final String password="admin987";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		
		try
		{
			PostDataPojo postPojo=new PostDataPojo();
			
			PostDataInt intf=new PostDataImp();
			String[] project_name=new String[4];
			String[] project_desciption=new String[4];
			String[] skills=new String[4];
			String[] client_name=new String[4];
			String[] time_span=new String[4];
			int[] experience=new int[4];	
			double[] costing=new double[4];
			List postProjectList=intf.postProjectList();
			Iterator it=postProjectList.iterator();
			int i=0;
			while(it.hasNext() && i<=3)
			{
				postPojo=(PostDataPojo)it.next();
				
				project_name[i]=postPojo.getProject_name();
				project_desciption[i]=postPojo.getProject_desciption();
				skills[i]=postPojo.getSkills();
				client_name[i]=postPojo.getClient_name();
				experience[i]=postPojo.getExperience();
				time_span[i]=postPojo.getTime_span();	
				costing[i]=postPojo.getCosting();
				i++;
			}
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress("fairactdemo@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId));
		    message.setSubject("Applying for your Project");
		    message.setContent("<table bgcolor='black' width='100%'><th><h1><font color='white'>Pro-Interns</font></h1></th></table><br><table border='4' width='100%'><td><br><h3><b>&nbsp;&nbsp;Project Name:-</b>  "+project_name[0]+"<br><b> &nbsp;&nbsp;Project Description:-</b> "+project_desciption[0]+"<br><b>&nbsp;&nbsp;Client Name:-</b> "+client_name[0]+"<br><b>&nbsp;&nbsp;Key Skills:-</b>"+skills[0]+"<br><b>&nbsp;&nbsp;Experience:-</b>"+experience[0]+" <br><b>&nbsp;&nbsp;Time Span:-</b>"+time_span[0]+"<br><b>&nbsp;&nbsp;Total Cost:-</b>"+costing[0]+"<br><br><hr><h3><b>&nbsp;&nbsp;Project Name:-</b>  "+project_name[1]+"<br><b> &nbsp;&nbsp;Project Description:-</b> "+project_desciption[1]+"<br><b>&nbsp;&nbsp;Client Name:-</b> "+client_name[1]+"<br><b>&nbsp;&nbsp;Key Skills:-</b>"+skills[1]+"<br><b>&nbsp;&nbsp;Experience:-</b>"+experience[1]+" <br><b>&nbsp;&nbsp;Time Span:-</b>"+time_span[1]+"<br><b>&nbsp;&nbsp;Total Cost:-</b>"+costing[1]+"<br><br><hr><h3><b>&nbsp;&nbsp;Project Name:-</b>  "+project_name[2]+"<br><b> &nbsp;&nbsp;Project Description:-</b> "+project_desciption[2]+"<br><b>&nbsp;&nbsp;Client Name:-</b> "+client_name[2]+"<br><b>&nbsp;&nbsp;Key Skills:-</b>"+skills[2]+"<br><b>&nbsp;&nbsp;Experience:-</b>"+experience[2]+" <br><b>&nbsp;&nbsp;Time Span:-</b>"+time_span[2]+"<br><b>&nbsp;&nbsp;Total Cost:-</b>"+costing[2]+"<br><br><hr><h3><b>&nbsp;&nbsp;Project Name:-</b>  "+project_name[3]+"<br><b> &nbsp;&nbsp;Project Description:-</b> "+project_desciption[3]+"<br><b>&nbsp;&nbsp;Client Name:-</b> "+client_name[3]+"<br><b>&nbsp;&nbsp;Key Skills:-</b>"+skills[3]+"<br><b>&nbsp;&nbsp;Experience:-</b>"+experience[3]+" <br><b>&nbsp;&nbsp;Time Span:-</b>"+time_span[3]+"<br><b>&nbsp;&nbsp;Total Cost:-</b>"+costing[3]+"<br><br><br></td></table>","text/html");

		    
			Transport.send(message);
            System.out.println("Done");
			 
		}
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
		return true;
	
	}



	public void sendEmail(String email, String username, String cName,String technology) {
		// TODO Auto-generated method stub
		
		final String userName="prointerns22@gmail.com";
		final String password="admin987";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		
		try
		{
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		    message.setSubject("EmailConfirmation");
		    message.setText("Your Profile Has Been Selected For  "+cName +    " And They Are Looking For" +technology+ " Developer.");
		//    message.setText("email :"+email +    "    URL :"  +url+    "    OldPassword :"  +pass);
			Transport.send(message);
            System.out.println("Done");
		}
		//?emailId='"+emailId+"'
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
		
		
	}



	public void sendClientMail(String client_mail, List<SignUp> canList,String cName,String technology) {
		// TODO Auto-generated method stub
		
		final String userName="prointerns22@gmail.com";
		final String password="admin987";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		
		try
		{
			//List<SignUp> list=new ArrayList<SignUp>();
			System.out.println("canList.size() in email"+canList.size());
			/*StringBuilder str = new StringBuilder();
			str.append("<html><head></head><title></title>");
			str.append("<body style='font-size:12px;font-family:Trebuchet MS;'>");
			str.append("<table width='600px' align='center' border='0' cellpadding='0' cellspacing='0' style='border-top:5px solid white;'");
			str.append("<tr><th>Candidate Name</th><th>Candidate Skill</th><th>Candidate EmailID</th></tr>");
			for(int i=0;i<canList.size();i++){
			str.append("<tr><td>"+canList.get(i).getUsername()+"</td><td>"+canList.get(i).getCan_skill()+"</td><td>"+canList.get(i).getEmail_id()+"</td></tr>");
			}
			str.append("</table>");*/
			String msg ="Your Client "+cName+ "  Is Looking For "+technology+" Profile.\n";
			msg +="The Candidate Are Shown Below: \n";
			msg += "<table width='600px' align='center' border='1' cellpadding='0' cellspacing='0' ";
	        msg += "<tr><th>Candidate Name</th><th>Candidate Skill</th><th>Candidate EmailID</th></tr>";
	        for(int i=0;i<canList.size();i++){
	        msg += "<tr><td>"+canList.get(i).getUsername()+"</td><td>"+canList.get(i).getCan_skill()+"</td><td>"+canList.get(i).getEmail_id()+"</td></tr>";
	        }
	        msg +="</table>";
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(client_mail));
		    message.setSubject("EmailConfirmation");
		    message.setContent(msg, "text/html");
	
			Transport.send(message);
            System.out.println("Done");
		}
		//?emailId='"+emailId+"'
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
		
	}



	public void sendEmailNotSeleted(String email, String username,
			String cName, String technology) {
		// TODO Auto-generated method stub
		
		final String userName="prointerns22@gmail.com";
		final String password="admin987";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session=Session.getInstance(properties,
				new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication(){
			        	 return new PasswordAuthentication(userName, password);
			        }
		});
		
		try
		{
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress("ticketingsystem007@gmail.com"));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		    message.setSubject("EmailConfirmation");
		    message.setText("Your Profile Not Selected For  "+cName +    " Because They Are Looking For " +technology+ " Developer.\n"
		    		+ "If You Are Interested Then You Have To Be Expert in "+technology+".");
		//    message.setText("email :"+email +    "    URL :"  +url+    "    OldPassword :"  +pass);
			Transport.send(message);
            System.out.println("Done");
		}
		//?emailId='"+emailId+"'
		catch(MessagingException e)
		{
			throw new RuntimeException(e);
	}
		
	}

	
	
}