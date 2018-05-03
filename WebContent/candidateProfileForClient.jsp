<%@ page import="java.util.*,com.conn.pojo.*" %>
<!DOCTYPE html>
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

font
{
 font-family:Arial Rounded MT Bold;
}
</style>




<script>
$('.collapse').on('shown.bs.collapse', function(){
	$(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
	}).on('hidden.bs.collapse', function(){
	$(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
	});
</script>


</head>
<body bgcolor="black">









<input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId">
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
        <li class="active"><a href="#"><span class="glyphicon glyphicon-user">Welcome</span> <%=session.getAttribute("userName") %></a></li>
        <li><a href="signUp.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
      </ul>
    </div>
  </div>
</nav>






<div class="container"> 

<div class="row"> 
<%
List list9=(List)session.getAttribute("profileImage");
if(list9!=null&&list9.size()>0)
{
	ClientProfilePojo cp=new ClientProfilePojo();
	for(int i=0;i<list9.size();i++)
	{
		cp=(ClientProfilePojo)list9.get(i);%>
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
		ClientProfilePojo cp=(ClientProfilePojo)list21.get(i);%>
		<div class="well"><div class="panel panel-default">
<div class="panel-body">
  		<font color="blue"><h2><b><span class="glyphicon glyphicon-user"></span>ID Proof</b></h2></font>
  <img src="ID Proof/<%=cp.getId_proof() %>" class="img-thumbnail img-responsive" width="470" height="300">
</div></div></div>
 
<% }
 }
%>
 
 
 


<%
List list=(List)session.getAttribute("personalData");
if(list!=null&&list.size()>0)
{
	
	for(int i=0;i<list.size();i++)
	{
  		CandidateProfile cp=(CandidateProfile)list.get(i);
%>

<div class="well"><div class="panel panel-default">
<div class="panel-body">
 <font color="blue"><h2><b><span class="glyphicon glyphicon-user"></span>Personal Details</b></h2></font>
 <hr>

        <div class="form-group" id="abcd">
  </div>
  
  <div class="form-group">
    <label for="name">Full Name:</label>
   <font><%=cp.getCan_full_name() %></font>
  </div>
 
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
	
	<div class="well"><div class="panel panel-default">
<div class="panel-body">
 <font color="blue"><h2><b><span class="glyphicon glyphicon-user"></span>Personal Details</b></h2></font>
 <hr>
 
        <div class="form-group" id="abcd">
  </div>
  
  <div class="form-group">
    <label for="name">Full Name:</label>
   
  </div>
 
  <div class="form-group">
  <label for="gender">Gender:</label>
	
</div>

  <div class="form-group">
    <label for="location">Location:</label>
   
  </div>
   
  
   <div class="form-group">
    <label for="city">City:</label>
   
      </div> 
 
  
 
  <div class="form-group">
    <label for="pincode">Pincode:</label>
   
  </div> 
 
  <div class="form-group">
    <label for="state">State:</label>
  
     </div>
   
   <div class="form-group">
    <label for="country">Country:</label>
   
  </div>
 
  
  <div class="form-group">
<label for="dob">Date Of Birth:</label>
  
  </div>
  
<div class="form-group">
    <label for="name">Mobile Number:</label>
 
  </div>
     
  
    </div>
      </div>
     
 </div>
	
	
	<%} %>
	
<%
List list2=(List)session.getAttribute("educationData");
if(list2!=null&&list2.size()>0)
{
	
	for(int i=0;i<list2.size();i++)
	{
  		CandidateProfile cp=(CandidateProfile)list2.get(i);
%>	
	
	

<div class="well"><div class="panel panel-default">
<div class="panel-body">
 <font color="blue"><h2><b><span class="glyphicon glyphicon-education"></span> Education Details</b></h2></font>
  <hr>
  
        <div class="form-group">
  <label for="sel1">Education Background:</label>
 <font><%=cp.getCan_education() %></font>
   

 
 
   <div class="form-group">
    <label for="can_overall_percentage">Year Of Engineering:</label>
   <font><%=cp.getCan_year() %></font>
  </div> 
 

 
  
<div class="form-group">
    <label for="can_university_name">University:</label>
 <font><%=cp.getCan_university_name() %></font>
  </div>
  
  <div class="form-group">
  <label for="sel1">What Are Your Key Skills:-</label>
   <font><%=cp.getCan_skill() %></font>
  </div>
        
      </div>
   
  </div></div>
  </div>
  
  
 <%
	}
	}else
{
	%>
	
	<div class="well"><div class="panel panel-default">
<div class="panel-body">
 <font color="blue"><h2><b><span class="glyphicon glyphicon-education"></span> Education Details</b></h2></font>
  <hr>
    
        <div class="form-group">
  <label for="sel1">Education Background:</label>
 
   
<div class="form-group">
    <label for="can_overall_percentage">Year Of Engineering:</label>
   
  </div> 
 
 
   <div class="form-group">
    <label for="can_overall_percentage">Overall Aggregate:</label>
   
  </div> 
 
  

 
  
<div class="form-group">
    <label for="can_university_name">University:</label>
 
  </div>
  
  <div class="form-group">
  <label for="sel1">What Are Your Key Skills:-</label>
   
  </div>
        
      </div>
  
  </div></div>
  </div>
	
	
	<%} %>
</div>

</div>

</body>
</html>
