<!DOCTYPE html>
<html lang="en">
<%@ page import="java.util.*,com.conn.pojo.*" %>
<head>
 <title>User HomePage</title>
   <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="Bootstrap/font-awesome.min.css">
  <script src="Bootstrap/jquery.min.js"></script>
  <script src="Bootstrap/bootstrap.min.js"></script>
  <link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
<style type="text/css">
   a#r1{color: #e60000}
   </style>
   
   <script>
   $(document).ready(function(){
	   $(".applyButton").click(function(){
		   $(this).attr("class","btn btn-danger disabled applyButton");
		   $(this).text("Applied");
		   //$(this).append("<button type='button' class='btn btn-danger disabled applyButton'> Applied </button>");
	   });
	   
   });
   
   </script>

</head>
<body >

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <!--<img src="logo1.jpg" class="img-rounded" alt="Cinque Terre" width="200" height="50">
    	--> <h1  style="size: xx-large; font-family: cooper; color:blue;"><b> Pro-Interns</b></h1>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="UserHomeServlet?userId=<%=session.getAttribute("userId") %>">Home</a></li>	
       
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">My Profile <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="CandidateDataServlet?userId=<%=session.getAttribute("userId") %>&action=viewProfile">View Profile</a></li>
            <li><a href="CandidateDataServlet?userId=<%=session.getAttribute("userId") %>&action=editProfile">Edit Profile</a></li>
          </ul>
        </li>
        <li><a href="PostDisplayServlet?userId=<%=session.getAttribute("userId") %>">Project</a></li>
        
        
        </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#"><span class="glyphicon glyphicon-user">Welcome </span> <%=session.getAttribute("userName") %></a></li>
        <li><a href="signUp.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container">
<div class="row">
<div class="col-sm-5">
<div class="alert alert-warning">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <i><strong><a href='SubscribeServlet?emailId=<%=session.getAttribute("emailId") %>' id="r1">Subscribe Now!</a></strong> <blink>To get new posted project notification.</blink></i> 
  </div>
   
 <%
List list2=(List)session.getAttribute("profileImage");
if(list2!=null&&list2.size()>0)
{
	for(int i=0;i<list2.size();i++)
	{
  		CandidateProfile cp=(CandidateProfile)list2.get(i);
		%>
<div class="well"><div class="panel panel-default">
<div class="panel-body">
  &nbsp&nbsp<font color="blue"><h3><b><span class="glyphicon glyphicon-user"></span>Welcome <%=session.getAttribute("userName") %></b></h3></font>
 <hr>		
 <center><img src="Profile image\<%=cp.getProfile_image() %>" class="img-circle img-responsive" width="300" height="300"></center>
 <%} %> <br><br>
  <!-- <label for="dob">Upload Your Profile Image:</label>
  Trigger the modal with a button
  <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal"> Click Here </button>
 -->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content col-sm-10 offset col-sm-2">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Upload Your Profile image :</h4>
        </div>
        <div class="modal-body">
         <form action="ImageUploadServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" value='<%=session.getAttribute("userId")%>' name="userId">
         <div class="form-group">
<input type="file" class="btn btn-default" name="dataFile" id="fileChooser"><br><br>
<input type="submit" class="btn btn-primary" value="Upload" name="action">
  </div>
  </form>
        </div> 
      </div>
      
    </div>
  </div>
  </div>
  </div></div>
  <%} 
else
{%>
<div class="well"><div class="panel panel-default">
<div class="panel-body">
  &nbsp&nbsp<font color="blue"><h3><b><span class="glyphicon glyphicon-user"></span>Welcome <%=session.getAttribute("userName") %></b></h3></font>
 <hr>
  <center><img src="Profile image\4.jpg" class="img-circle img-responsive" width="400" height="400"></center>
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
        <input type="hidden" value='<%=session.getAttribute("userId")%>' name="userId">
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
 </div>

<%} %>
  
  
  
 <%
List list1=(List)session.getAttribute("personalData");
if(list1!=null&&list1.size()>0)
{
	for(int i=0;i<list1.size();i++)
	{
  		CandidateProfile cp=(CandidateProfile)list1.get(i);
%>
  <div class="well">
  <div class="panel panel-default">
<div class="panel-body">
<font color="blue"><h3><b>About me</b></h3></font>


   
 
  <div class="form-group">
  <label for="gender">Gender:</label>
	<font><%=cp.getCan_gender() %></font>
</div>

  <div class="form-group">
    <label for="location">Location:</label>
   <font><%=cp.getCan_address()%></font>
  </div>
   
  
   <div class="form-group">
    <label for="city">City:</label>
    <font><%=cp.getCan_city()%></font>
      </div> 
 
  
 
  <div class="form-group">
    <label for="pincode">Pincode:</label>
    <font><%=cp.getCan_pincode()%></font>
  </div> 
 
  <div class="form-group">
    <label for="state">State:</label>
   <font><%=cp.getCan_state() %></font>
     </div>
   
   <div class="form-group">
    <label for="country">Country:</label>
    <font><%=cp.getCan_country() %></font>
  </div>
 
  
  <div class="form-group">
<label for="dob">Date Of Birth:</label>
  <font><%=cp.getCan_dob() %></font>
  </div>
  
<div class="form-group">
    <label for="name">Mobile Number:</label>
   <font> <%=cp.getCan_mobileno() %></font>
  </div>

     </div>
</div>
  </div>
   <%
	}
}


else
{
%>
<div class="well">
  <div class="panel panel-default">
<div class="panel-body">
<div class="alert alert-warning">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <i><strong><a href="CandidateDataServlet?userId=<%=session.getAttribute("userId") %>&action=editProfile" id="r1">Click Here!</a></strong> <blink>To edit your Profile.</blink></i> 
  </div>
<font color="blue"><h3><b>About me</b></h3></font>

  <div class="form-group">
  <label for="gender">Gender:</label>
	<font></font>
</div>

  <div class="form-group">
    <label for="location">Location:</label>
   <font></font>
  </div>
   
  
   <div class="form-group">
    <label for="city">City:</label>
    <font></font>
      </div> 
 
  
 
  <div class="form-group">
    <label for="pincode">Pincode:</label>
    <font></font>
  </div> 
 
  <div class="form-group">
    <label for="state">State:</label>
   <font></font>
     </div>
   
   <div class="form-group">
    <label for="country">Country:</label>
    <font></font>
  </div>
 
  
  <div class="form-group">
<label for="dob">Date Of Birth:</label>
  <font></font>
  </div>
  
<div class="form-group">
    <label for="name">Mobile Number:</label>
   <font> </font>
  </div>


</div>
</div>
  </div>

<%} %>




</div>
 

<div class="col-sm-7">

  
   <%
List list9=(List)session.getAttribute("approveList");
if(list9!=null&&list9.size()>0)
{%>

  <div class="alert alert-warning ">
    <i><strong><label id="r1" style="color:red;">Latest News!</label></strong> <blink>Your Request for Project Is Approved. Please Change Your Project Status After Completion Of Project.</blink></i> 
  
  </div>
  
  <input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">

<div class="well" style="float:left">
 
<div class="panel panel-default">

  <div class="panel-body">
   <div class="row" >
  
 
   <div class="col-sm-3" ><b>Candidate Name</b></div>
    <div class="col-sm-3" ><b>Project Name</b></div>
     <div class="col-sm-3" ><b>Status</b></div>
   </div>
   <hr style="    border-top: 2px solid #0797CE;">
  

    <%
	for(int i=0;i<list9.size();i++)
	{
		ApplyDataDao data=(ApplyDataDao)list9.get(i);
%>


  <form action="StatusChangeServlet" method="post">  <div class="row" ><div class="col-sm-3" ><%=data.getCandidate_name() %> </div><div class="col-sm-3" ><%=data.getProject_name() %> </div><div class="col-sm-3" ><select class="form-control" name="status"  style="padding-left: 0px; padding-right: 0px;">
									
									<option value="Approve">Approve</option>
									
									<option value="Done">Done</option>
									
									</select> 
									<input type="hidden" value="<%=data.getCandidate_id() %>" name="canId">
									<input type="hidden" value="<%=data.getApply_id() %>" name="applyId">
									
									</div>
									<div class="col-sm-3" ><input type="submit" class="btn btn-primary" value="Submit" name="action"> </div> </div></form>
   
<%}%>
 
</div>
</div>
</div>
<%} %>

  <%
Map projectMap=(Map)session.getAttribute("projectMap");
if(projectMap!=null && projectMap.size()>0)
{
	%>
	
	 <div class="alert alert-warning ">
    <h2><strong>Latest Uploaded Projects:</strong></h2>
  </div>
	<%
	for(Object key:projectMap.keySet())
	{
		PostDataPojo postPojo=(PostDataPojo)projectMap.get(key);
		
		
		
%>

<input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId">

<div class="well">
 
<div class="panel panel-default">

  <div class="panel-body">
   <font color="blue"> <h3><b><span class="glyphicon glyphicon-duplicate"></span> &nbsp <%=postPojo.getProject_name() %></font></b></h3>
<hr>  
<div class="row">
  <div class="col-sm-9">
   <span class="glyphicon glyphicon-briefcase"></span><label for="companyname">&nbsp Company Name</label><br>
   <input type="hidden" value="<%=postPojo.getSkills()%>">
</div>
 <div class="col-sm-3">
 <button type="button" class="btn btn-info applyButton"> Apply Now </button> 
 </div>
 </div>	
 <div class="row">
  <div class="col-sm-2">
	<span class="glyphicon glyphicon-briefcase"></span>&nbsp <%=postPojo.getExperience() %> Years</div>
  <div class="col-sm-3">  <span class="glyphicon glyphicon-piggy-bank"></span>&nbsp <%=postPojo.getCosting() %> Rupees</div>
    <div class="col-sm-2"><span class="glyphicon glyphicon-calendar"></span>&nbsp <%=postPojo.getTime_span() %> Days</div></div>
    <br><span class="glyphicon glyphicon-pushpin"></span><label for="skills">&nbsp Key Skills:</label>
    <%=postPojo.getSkills() %>
    <br><br><span class="glyphicon glyphicon-info-sign"></span><label for="description">&nbsp Project Description:</label>
    <%=postPojo.getProject_desciption() %>
 
</div>
</div>
</div>
<%}} %>
  
  
  
</div>
</div>
</div>



 
   
</body></html>
