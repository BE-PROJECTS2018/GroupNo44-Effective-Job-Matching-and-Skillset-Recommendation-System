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
     
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#"><span class="glyphicon glyphicon-user">Welcome</span> Admin</a></li>
        <li><a href="signUp.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
      </ul>
    </div>
  </div>
</nav>


<br>
 <div class="row">
<%
List list9=(List)session.getAttribute("profileImage");
if(list9!=null&&list9.size()>0)
{
	
	for(int i=0;i<list9.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list9.get(i);%>
  		<div class="well"><div class="panel panel-default">
<div class="panel-body">
<font color="blue"><h2><b><span class="glyphicon glyphicon-user"></span>Profile Image</b></h2></font>
 
  <img src="Profile image/<%=cp.getProfile_image() %>" class="img-circle img-responsive" width="300" height="300">
</div></div></div>
 
<% }
 }
else
{
 %>
 <img src="Profile image\1.jpg" class="img-circle img-responsive" width="300" height="300">
 <%} %>
 
 
 <%
List list21=(List)session.getAttribute("idList");
if(list21!=null&&list21.size()>0)
{
	
	for(int i=0;i<list21.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list21.get(i);
		System.out.println("cp.getId_proof()"+cp.getId_proof());
		%>
		<div class="well"><div class="panel panel-default">
<div class="panel-body">
  		<font color="blue"><h2><b><span class="glyphicon glyphicon-user"></span>ID Proof</b></h2></font>
  <img src="ID Proof/<%=cp.getId_proof() %>" class="img-thumbnail img-responsive" width="470" height="300">
</div></div></div>
 
<% }
 }
%>


<%
List list1=(List)session.getAttribute("recriuterList");
if(list1!=null&&list1.size()>0)
{
	for(int i=0;i<list1.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list1.get(i);
%>
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
   
  <%
	}
}

%>  
<%
List list2=(List)session.getAttribute("ClientDetailsList");
if(list2!=null&&list2.size()>0)
{
	for(int i=0;i<list2.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list2.get(i);
%> 
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
   <%
	}
}

%>  
<%
List list3=(List)session.getAttribute("ClientContactUsList");
if(list3!=null && list3.size()>0)
{
	for(int i=0;i<list3.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list3.get(i);
%>
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

<a href="AdminHomeServlet">Back</a>

</div>
</body>
</html>
