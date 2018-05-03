<%@ page import="java.util.*,com.conn.pojo.*" %>
<!DOCTYPE html>
<html lang="en">
<%@ page import="java.util.*" %>
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
		var status=$("#hiddenStatus").val();
		if(status=="Approve")
			{
			
			$(".applyNow").attr('disabled', true);
			}
		

	});
	</script>
</head>
<body>
<%
if(session.getAttribute("status")!=null)
{
%>
<input type="hidden" value="<%=session.getAttribute("status")%>" id="hiddenStatus">
<%
}
else
{
%>
<input type="hidden" value="free" id="hiddenStatus">
<%
}

%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <!--<img src="logo1.jpg" class="img-rounded" alt="Cinque Terre" width="200" height="50">
    	-->  <h1  style="size: xx-large; font-family: cooper; color:blue;"><b> Pro-Interns</b></h1>
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
        <li class="active"><a href="#"><span class="glyphicon glyphicon-user">Welcome</span> <%=session.getAttribute("userName") %></a></li>
        <li><a href="signUp.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container">

<div class="row">
  <div class="col-sm-3">
  
  <div class="well">
  <font color="blue"><h3><b><span class="glyphicon glyphicon-filter"></span>Filter By:</b></h3></font>
  
  <div class="list-group">
  <a href="ProjectListByFilterServlet?costing=upto5000"  class="list-group-item">Upto 5000</a>
  <a href="ProjectListByFilterServlet?costing=upto10000" class="list-group-item">Upto 10,000</a>
  <a href="ProjectListByFilterServlet?costing=upto15000" class="list-group-item">Upto 15,000</a>
   <a href="ProjectListByFilterServlet?costing=upto20000" class="list-group-item">Upto 20,000</a>
   <a href="ProjectListByFilterServlet?costing=above20000" class="list-group-item">Above 20,000</a>
</div>  
  </div>
  </div>


<div class="col-sm-9">
<%
List list=(List)session.getAttribute("postProjectList");
if(list!=null&&list.size()>0)
{
	for(int i=0;i<list.size();i++)
	{
		PostDataPojo postPojo=(PostDataPojo)list.get(i);
%>

<input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId">

<form><div class="well"><div class="panel panel-default">

  <div class="panel-body">
   
   <font color="blue"> <h3><b><span class="glyphicon glyphicon-duplicate"></span> &nbsp <%=postPojo.getProject_name() %></font></b></h3>
<hr>  
<div class="row">
  <div class="col-sm-9">
   <span class="glyphicon glyphicon-briefcase"></span><label for="companyname">&nbsp <%=postPojo.getClient_name()  %></label><br>
</div>
 <div class="col-sm-3">
 <a class="btn btn-primary applyNow" href="ApplyNowServlet?clientUserId=<%=postPojo.getUser_id() %>&canID=<%=session.getAttribute("userId") %>&projectName=<%=postPojo.getProject_name() %>" > Apply Now </a> 
 </div>
 </div>	
 <div class="row">
  <div class="col-sm-3">
	<span class="glyphicon glyphicon-briefcase"></span><label for="skills">&nbsp Experience:</label>&nbsp <%=postPojo.getExperience() %> Years</div>
  <div class="col-sm-3">  <span class="glyphicon glyphicon-piggy-bank"></span><label for="skills">&nbsp Cost:</label>&nbsp <%=postPojo.getCosting() %> Rupees</div>
    <div class="col-sm-3"><span class="glyphicon glyphicon-calendar"></span><label for="skills">&nbsp Timespan:</label>&nbsp <%=postPojo.getTime_span() %> </div></div>
    <br><span class="glyphicon glyphicon-pushpin"></span><label for="skills">&nbsp Key Skills:</label>
    <%=postPojo.getSkills() %>
    <br><br><span class="glyphicon glyphicon-info-sign"></span><label for="description">&nbsp Project Description:</label>
    <%=postPojo.getProject_desciption() %>

 
 
  </div>
 
 
</div>
</div>

</form>
<%}} %>
</div>
</div>
</div>
</body>
</html>
