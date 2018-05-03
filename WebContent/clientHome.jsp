<!DOCTYPE html>
<%@ page import="java.util.*,com.conn.pojo.*" %>
<html lang="en">
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="Bootstrap/font-awesome.min.css">
  <script src="Bootstrap/jquery.min.js"></script>
  <script src="Bootstrap/bootstrap.min.js"></script>
  <link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
  <script>
  $(document).ready(function(){
	  $("#status").change(function(){
			var status=$("#status option:selected").val();
			alert(status);
			var applyId=$("#status").attr("alt");
			var clientId=$("#status").attr("alt2");
			alert(applyId);
			$.ajax({
				  url: 'StatusChangeServlet',
				  type: 'POST',
				  data: {status:status,applyId:applyId,clientId:clientId},
				  success: function(data) {
					 
					//$("#abcd").append(data);  
				
				  },
				  error: function(e) {
					  
				
				  }
				});
			
			
			
		
 });
  });
  </script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
       <h1  style="size: xx-large; font-family: cooper; color:blue;"><b> Pro-Interns</b></h1>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="ClientHomeServlet?userId=<%=session.getAttribute("userId") %>">Home</a></li>
		 <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">My Profile <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="ClientDataServlet?userId=<%=session.getAttribute("userId") %>&action=viewProfile">View Profile</a></li>
            <li><a href="ClientDataServlet?userId=<%=session.getAttribute("userId") %>&action=editProfile">Edit Profile</a></li>
          </ul>
        </li>
        <li><a href="postProjectPage.jsp">Post Project</a></li>
        
        </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#"><span class="glyphicon glyphicon-user">Welcome</span> <%=session.getAttribute("userName") %></a></li>
        <li><a href="signUp.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
      </ul>
    </div>
  </div>
</nav>
 
  
<div class="container">
<div class="row">
  <div class="col-sm-5">
  
  
 <div class="well"><div class="panel panel-default">
<div class="panel-body">
  &nbsp;&nbsp;<font color="blue"><h3><b><span class="glyphicon glyphicon-user"></span>Welcome <%=session.getAttribute("userName") %></b></h3></font>
 <hr>
 
  <%
List list4=(List)session.getAttribute("ClientProfileImageList");
if(list4!=null&&list4.size()>0)
{
	for(int i=0;i<list4.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list4.get(i);
		String image=cp.getProfile_image();
		if(image.isEmpty() || image.equalsIgnoreCase("null") || image==null){
%>
 <center><img src="Profile image\1.jpg" class="img-circle img-responsive" width="300" height="300"></center>
<%}else{ %>
  <center><img src="Profile image\<%=cp.getProfile_image() %>" class="img-circle img-responsive" width="300" height="300"></center>
 <%}}} %>
 
    <br><br>
  <label for="dob">Upload Your Profile Image:</label>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal"> Click Here </button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" style="left: 0px;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Upload Your Profile image :</h4>
        </div>
        <div class="modal-body">
         <form action="ImageUploadServlet" method="post" enctype="multipart/form-data">
         <div class="form-group">
<input type="file" class="btn btn-default" name="dataFile" id="fileChooser"><br><br>
<input type="submit" class="btn btn-primary" value="Upload">
  </div>
  </form>
        </div> 
      </div>
      
    </div>
  </div>
  </div>
  </div>
  <div class="panel panel-default">
<div class="panel-body">
<%
List list1=(List)session.getAttribute("recriuterList");
if(list1!=null&&list1.size()>0)
{
	for(int i=0;i<list1.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list1.get(i);
		
%>

<font color="blue"><h3><b>Recruiter Details</b></h3></font>

<div class="form-group">
  <label for="gender">Gender:</label>
	<font><%=cp.getRec_gender() %></font>
</div>
  

  <div class="form-group">
  <label for="contact">Contact No:</label>
	<font><%=cp.getRec_mobileno() %></font>
</div>
  
  
   <%
	}
}
%>


</div>
</div>
  
   <div class="panel panel-default">
<div class="panel-body">
<font color="blue"><h3><b>Client Details</b></h3></font>
<%
List list2=(List)session.getAttribute("ClientDetailsList");
if(list2!=null&&list2.size()>0)
{
	for(int i=0;i<list2.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list2.get(i);
%>
<form> 
   
 <div class="form-group">
 <label for="Company_name">Client Name:</label>
<font><%=cp.getClient_name() %></font>
</div>

  <div class="form-group">
  <label for="founded">Founded Year:</label>
  <font><%=cp.getClient_founded() %></font>
  </div>
  
  
  <div class="form-group">
    <label for="location">Location:</label>
<font><%=cp.getClient_location() %></font>
    </div> 
  
     
   <div class="form-group">
    <label for="city">City:</label>
<font><%=cp.getClient_city() %></font>
    </div> 
   
 
  <div class="form-group">
    <label for="pincode">Pincode:</label>
   <font><%=cp.getClient_pincode() %></font>
  </div> 
 
  <div class="form-group">
    <label for="state">State:</label>
   <font><%=cp.getClient_state() %></font>
     </div>
       <%
	}
}
%>
    <%
List list5=(List)session.getAttribute("ClientContactUsList");
if(list5!=null&&list5.size()>0)
{
	for(int i=0;i<list5.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list5.get(i);
%> 
   <div class="form-group">
    <label for="about">About Client:</label>
   <font> <%=cp.getClient_about() %></font>
  </div>
  <div class="form-group">
    <label for="name">Mobile Number:</label>
   <font> <%=cp.getClient_contact_no() %></font>
  </div>
   
   <div class="form-group">
    <label for="email_id">Email Id:</label>
    <font><%=cp.getClient_email_id() %></font>
  </div>
 
  
  <div class="form-group">
<label for="website">Website:</label>
  <font><%=cp.getClient_website() %></font>
  </div>
  
<div class="form-group">
    <label for="name">Mobile Number:</label>
   <font> <%=cp.getClient_contact_no() %></font>
  </div>
    
    </form>
 <%
	}
}
%>
</div>
</div>




  </div>
  

  </div>
  
  

<div class="col-sm-7">
<div class="row">
  <div class="col-sm-12">
   <%
List list9=(List)session.getAttribute("pendingList");
if(list9!=null&&list9.size()>0)
{%>

  <div class="alert alert-warning ">
    <h2><strong>Pending Candidate List For Projects:</strong></h2>
  </div>
  
  <input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">

<div class="well">
 
<div class="panel panel-default">

  <div class="panel-body">
   <div class="row" >
  
 
   <div class="col-sm-2" ><b>Candidate Name</b></div>
    <div class="col-sm-2" ><b>Project Name</b></div>
    <div class="col-sm-2" ><b>View</b></div>
     <div class="col-sm-4" ><b>Status</b></div>
   </div>
   <hr style="    border-top: 2px solid #0797CE;">
  

    <%
	for(int i=0;i<list9.size();i++)
	{
		ApplyDataDao data=(ApplyDataDao)list9.get(i);
%>


  <form action="StatusChangeServlet" method="post">  <div class="row" ><div class="col-sm-2" ><%=data.getCandidate_name() %> </div><div class="col-sm-2" ><%=data.getProject_name() %> </div><div class="col-sm-2" ><a href="CandidateDataServlet?canid=<%=data.getCandidate_id() %>&action=viewProfileByClient" >View Profile</a> </div><div class="col-sm-3" ><select class="form-control" name="status"  style="padding-left: 0px; padding-right: 0px;">
									
									<option value="Approve" <%String status="Approve";  if(data.getStatus().equals(status)){%> selected <%}%>>Approve</option>
									<option value="Pending" <%String status1="Pending"; if(data.getStatus().equals(status1)){%> selected <%}%> >Pending</option>
									<option value="Reject">Reject</option>
									
									
									</select> 
									<input type="hidden" value="<%=session.getAttribute("userId") %>" name="clientId">
									<input type="hidden" value="<%=data.getApply_id() %>" name="applyId">
									
									</div>
									<div class="col-sm-2" ><input type="submit" class="btn btn-primary" value="Submit" name="action"> </div> </div></form>
   
<%}%>
 
</div>
</div>
</div>
<%} %>


   <%
List list12=(List)session.getAttribute("approveList");
if(list12!=null&&list12.size()>0)
{%>

  <div class="alert alert-warning ">
    <h2><strong>Approved Candidate List For Projects:</strong></h2>
  </div>
  
  <input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">

<div class="well">
 
<div class="panel panel-default">

  <div class="panel-body">
   <div class="row" >
  
 
   <div class="col-sm-3" ><b>Candidate Name</b></div>
    <div class="col-sm-3" ><b>Project Name</b></div>
    <div class="col-sm-3" ><b>View</b></div>
     <div class="col-sm-3" ><b>Status</b></div>
   </div>
   <hr style="    border-top: 2px solid #0797CE;">
  

    <%
	for(int i=0;i<list12.size();i++)
	{
		ApplyDataDao data=(ApplyDataDao)list12.get(i);
%>


    <div class="row" ><div class="col-sm-3" ><%=data.getCandidate_name() %> </div><div class="col-sm-3" ><%=data.getProject_name() %> </div><div class="col-sm-3" ><a href="CandidateDataServlet?canid=<%=data.getCandidate_id() %>&action=viewProfileByClient" >View Profile</a> </div><div class="col-sm-3" > Approved</div>
									</div>
   
<%}%>
 
</div>
</div>
</div>
<%} %>


   <%
List list13=(List)session.getAttribute("doneList");
if(list13!=null&&list13.size()>0)
{
%>

  <div class="alert alert-warning ">
    <h2><strong>Done Candidate List For Projects:</strong></h2>
  </div>
  
  <input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">

<div class="well">
 
<div class="panel panel-default">

  <div class="panel-body">
   <div class="row" >
  
 
   <div class="col-sm-4" ><b>Candidate Name</b></div>
    <div class="col-sm-4" ><b>Project Name</b></div>
     <div class="col-sm-4" ><b>Status</b></div>
   </div>
   <hr style="    border-top: 2px solid #0797CE;">
  

    <%
	for(int i=0;i<list13.size();i++)
	{
		ApplyDataDao data=(ApplyDataDao)list13.get(i);
%>
<hr>

  <form action="StatusChangeServlet" action="post">  <div class="row" ><div class="col-sm-4" ><%=data.getCandidate_name() %> </div><div class="col-sm-4" ><%=data.getProject_name() %> </div><div class="col-sm-4" ><select class="form-control" name="status"  style="padding-left: 0px; padding-right: 0px;">
									
									<option value="Done" selected>Done</option>
									<option value="Completed" >Completed</option>
									
									</select> 
									<input type="hidden" value="<%=session.getAttribute("userId") %>" name="clientId">
									<input type="hidden" value="<%=data.getCandidate_id() %>" name="candidate_id">
									<input type="hidden" value="<%=data.getCandidate_name() %>" name="candidate_name">
									<input type="hidden" value="<%=data.getProject_name() %>" name="project_name">
								<input type="hidden" value="<%=data.getApply_id() %>" name="applyId">
									
									</div></div>
									<br>
									<div class="row" >
									<div class="col-sm-2" >Feedback:-
									</div>
									<div class="col-sm-8" >
										<select class="form-control" name="feedback"  style="padding-left: 0px; padding-right: 0px;">
									
			
									<option value="Bad" >Bad</option>
									<option value="Poor" >Poor</option>
									<option value="Good" >Good</option>
									<option value="Very Good" >Very Good</option>
									
									
									</select> 
									 </div>
									<div class="col-sm-2" ><input type="submit" class="btn btn-primary" value="Submit" name="action" style="padding-left: 0px; padding-right: 0px;width: 72.22222px;"> </div> </div></form>
									
   
<%}%>
 
</div>
</div>
</div>
<%} %>



 <%
List list14=(List)session.getAttribute("completedList");
if(list14!=null&&list14.size()>0)
{
%>

  <div class="alert alert-warning ">
    <h2><strong>Completed Projects:</strong></h2>
  </div>
  
  <input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">

<div class="well">
 
<div class="panel panel-default">

  <div class="panel-body">
   <div class="row" >
  
 
   <div class="col-sm-4" ><b>Candidate Name</b></div>
    <div class="col-sm-4" ><b>Project Name</b></div>
     <div class="col-sm-4" ><b>Feedback</b></div>
   </div>
   <hr style="    border-top: 2px solid #0797CE;">
  

    <%
	for(int i=0;i<list14.size();i++)
	{
		ApplyDataDao data=(ApplyDataDao)list14.get(i);
%>
<hr>

  <div class="row" ><div class="col-sm-4" ><%=data.getCandidate_name() %> </div><div class="col-sm-4" ><%=data.getProject_name() %> </div><div class="col-sm-4" >
									
									<label><%=data.getFeedback() %> </label>
								
									
									</div></div>
		
									
   
<%}%>
 
</div>
</div>
</div>
<%} %>





<%
List list=(List)session.getAttribute("postProjectList");
if(list!=null&&list.size()>0)
{ %>
  <div class="alert alert-warning ">
    <h2><strong>My Posted Projects:</strong></h2>
  </div>
  
  <%
	for(int i=0;i<list.size();i++)
	{
		PostDataPojo postPojo=(PostDataPojo)list.get(i);
%>
  

<input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">

<div class="well">
 
<div class="panel panel-default">

  <div class="panel-body">
   <font color="blue"> <h3><b><span class="glyphicon glyphicon-duplicate"></span> &nbsp; <%=postPojo.getProject_name() %></font></b></h3>
<hr>  
<div class="row">
  <div class="col-sm-9">
   <span class="glyphicon glyphicon-briefcase"></span><label for="companyname">&nbsp; <%=postPojo.getClient_name() %></label><br>
</div>
 <div class="col-sm-3">
 <a class="btn btn-primary" href="PostRemoveServlet?postId=<%=postPojo.getPost_id() %>&userId=<%=session.getAttribute("userId")%>"> Remove </a> 
 </div>
 </div>	
 <div class="row">
  <div class="col-sm-2">
	<span class="glyphicon glyphicon-briefcase"></span>&nbsp; <%=postPojo.getExperience() %> Years</div>
  <div class="col-sm-3">  <span class="glyphicon glyphicon-piggy-bank"></span>&nbsp; <%=postPojo.getCosting() %> Rupees</div>
    <div class="col-sm-2"><span class="glyphicon glyphicon-calendar"></span>&nbsp; <%=postPojo.getTime_span() %> Days</div></div>
    <br><span class="glyphicon glyphicon-pushpin"></span><label for="skills">&nbsp; Key Skills:</label>
    <%=postPojo.getSkills() %>
    <br><br><span class="glyphicon glyphicon-info-sign"></span><label for="description">&nbsp; Project Description:</label>
    <%=postPojo.getProject_desciption() %>
 
</div>
</div>
</div>

<%}} %>
 
  </div>
</div>
  </div>
</div>


</div>

</body>
</html>
