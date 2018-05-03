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
<style>
hr {
  -moz-border-bottom-colors: none;
  -moz-border-image: none;
  -moz-border-left-colors: none;
  -moz-border-right-colors: none;
  -moz-border-top-colors: none;
  border-color: #EEEEEE -moz-use-text-color #FFFFFF;
  border-style: solid none;
  border-width: 1px 0;
  margin: 18px 0;
}

</style>

</head>
<body bgcolor="black">

<input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId">
<input type="hidden" value="<%=session.getAttribute("clientName")%>" id="hiddenClientName">
<%
List list=(List)session.getAttribute("clientList");
if(list!=null&&list.size()>0)
{
	for(int i=0;i<list.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list.get(i);
%>

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
      <ul class="nav navbar-nav nav-pills">
        <li><a href="ClientHomeServlet?userId=<%=session.getAttribute("userId") %>">Home</a></li>
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

<div> 
<br>
<div id="p" class="container-fluid">
<div class="well"><div class="panel panel-default">
<div class="panel-body">

         <font color="blue"> <h2><b><span class="glyphicon glyphicon-user"></span> Recruiter Details</b></h2>  </font>
          <hr> 
   <form role="form">	
  <div class="form-group">
    <label for="name">Full Name:</label>
    <label for="name"><%=cp.getRec_full_name()  %></label>
  </div>
  <div class="form-group">
  <label for="gender">Gender:</label>
  <label for="gender"><%=cp.getRec_gender() %></label>
</div>
	
 <div class="form-group">
    <label for="mobileno">Mobile Number:</label>
    <label for="mobileno"><%=cp.getRec_mobileno()  %></label>
  </div>
  </form>
  </div>
      </div>
      </div>
      
   
      </div>
    </div>
  
 
	<div id="p" class="container-fluid">
<div class="well"><div class="panel panel-default">
<div class="panel-body">
        <font color="blue">  <h2><b><span class="glyphicon glyphicon-briefcase"></span> Client Details</b></h2></font>
 <hr>
  <form>
   <div class="form-group">
    <label for="clientname">Client Name:</label>
    <label for="clientname"><%=cp.getClient_name()  %></label>
  </div>
  
<div class="form-group">
    <label for="founded">Founded:</label>
    <label for="founded"><%=cp.getClient_founded()  %></label>
  </div>
  
  
  
    <div class="form-group">
    <label for="location">Location:</label>
    <label for="location"><%=cp.getClient_location()  %></label>
  </div>
  
   <div class="row">
  <div class="col-sm-6">
   <div class="form-group">
    <label for="city">City:</label>
    <label for="city"><%=cp.getClient_city()  %></label>
  </div> 
  </div> 
  
  <div class="col-sm-6">
  <div class="form-group">
    <label for="pincode">Pincode:</label>
    <label for="pincode"><%=cp.getClient_pincode()  %></label>
  </div> 
  </div> 
  </div> 
  
  
  <div class="row">
  <div class="col-sm-6">
  <div class="form-group">
    <label for="state">State:</label>
    <label for="state"><%=cp.getClient_state()  %></label>
  </div>
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="country">Country:</label>
    <label for="country"><%=cp.getClient_country()  %></label>
  </div>
  </div> 
  </div> 
    
</form>
  </div>
  </div>
  </div>
  </div>
  
  <div id="p" class="container-fluid">
<div class="well"><div class="panel panel-default">
<div class="panel-body">
      <font color="blue">    <h2><b><span class="glyphicon glyphicon-phone-alt"></span> Contact Us</b></h2></font>
          <hr>
  <form>
  
  <div class="row">
  <div class="col-sm-6">
  
   <div class="form-group">
    <label for="location">Contact No.:</label>
    <label for="location"><%=cp.getClient_contact_no()  %></label>
  </div>
</div>
</div>
 <div class="row">
  <div class="col-sm-6">
<div class="form-group">
    <label for="location">Email ID:</label>
    <label for="location"><%=cp.getClient_email_id()  %></label>
  </div>
  </div></div>

 <div class="row">
  <div class="col-sm-6">
  <div class="form-group">
    <label for="location">Website:</label>
    <label for="location"><%=cp.getClient_website()  %></label>
  </div>
</div></div>
  
<div class="form-group">
  <label for="aboutcompany">About Company:</label>
  <label for="aboutcompany"><%=cp.getClient_about()  %></label>
</div>
</form>
  </div>

  </div>
 </div>
 </div>
<%
	}
}

%>


</body>
</html>
