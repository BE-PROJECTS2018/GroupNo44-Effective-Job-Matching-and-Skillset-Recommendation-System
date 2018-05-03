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
     
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#"><span class="glyphicon glyphicon-user">Welcome</span> Admin</a></li>
        <li><a href="signUp.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
  
      </ul>
    </div>
  </div>
</nav>
 
  
<div class="container">
<div class="well">
  <div class="panel panel-default">
<div class="panel-body">
<center><font color="blue"><h3><b>Pending User List</b></h3></font></center>
<br><br>
<%
List list1=(List)session.getAttribute("userList");
if(list1!=null&&list1.size()>0)
{
	%>



<div class="row">
<div class="col-sm-3"><b style="font-size: large;">Email Id</b>
</div>
<div class="col-sm-2"><b style="font-size: large;">Usertype</b>
</div>
<div class="col-sm-2"><b style="font-size: large;">View</b>
</div>
<div class="col-sm-2"><b style="font-size: large;">Status</b>
</div>

</div>
<%	
	for(int i=0;i<list1.size();i++)
	{
		SignUp sp=(SignUp)list1.get(i);
		
%>
<hr>
<form action="AdminStatusChangeServlet" method="post">
<div class="row"><div class="col-sm-3"><%=sp.getEmail_id() %></div><div class="col-sm-2"><%=sp.getUsertype() %></div><div class="col-sm-2"><a href="ShowProfile?userId=<%=sp.getId() %>&usertype=<%=sp.getUsertype() %>">View Profile</a></div><div class="col-sm-2"><select class="form-control status" name="status" id="status" >
									<option value="Pending" >Pending</option>
									<option value="Approve" >Approve</option>
									<option value="Reject">Reject</option>
									</select></div>
									<div class="col-sm-2">
									<input type="submit" value="Submit" name="action" class="btn btn-primary">
									</div>
									</div>
					
									<input type="hidden" value="<%=sp.getId() %>" name="userId">
									<input type="hidden" value="<%=sp.getUsertype() %>" name="usertype">

</form>

  
  
   <%
	}
}
else
{
%>
<label>Oops!!! No Pending Request...</label>
<%} %>





</div>
</div>
</div>


<div class="well">
  <div class="panel panel-default">
<div class="panel-body">
<center><font color="blue"><h3><b>Approve User List</b></h3></font></center>
<br><br>
<%
List list2=(List)session.getAttribute("userListApprove");
if(list2!=null&&list2.size()>0)
{
	%>



<div class="row">
<div class="col-sm-3"><b style="font-size: large;">Email Id</b>
</div>
<div class="col-sm-2"><b style="font-size: large;">Usertype</b>
</div>
<div class="col-sm-2"><b style="font-size: large;">View</b>
</div>
<div class="col-sm-2"><b style="font-size: large;">Status</b>
</div>

</div>
<%	
	for(int i=0;i<list2.size();i++)
	{
		SignUp sp=(SignUp)list2.get(i);
		
%>
<hr>
<form action="AdminStatusChangeServlet" method="post">
<div class="row"><div class="col-sm-3"><%=sp.getEmail_id() %></div><div class="col-sm-2"><%=sp.getUsertype() %></div><div class="col-sm-2"><a href="ShowProfile?userId=<%=sp.getId() %>&usertype=<%=sp.getUsertype() %>">View Profile</a></div><div class="col-sm-2"><%=sp.getStatus() %></div>
									
									</div>
					

</form>

  
  
   <%
	}
}
else
{
%>
<label>Oops!!! No Pending Request...</label>
<%} %>





</div>
</div>
</div>
</div>
</body>
</html>
