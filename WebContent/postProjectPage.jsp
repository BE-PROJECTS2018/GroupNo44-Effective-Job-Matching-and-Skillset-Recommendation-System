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

</style>
<script>
$(document).ready(function(){
$("#post_project").click(function(){
	var userId=$("#hiddenUserId").val();
	var clientName=$("#hiddenClientName").val();
	
	var work_require=$("#work_require").val();
	var project_name=$("#project_name").val();
	var project_description=$("#project_description").val();
	var project_skills=$("#project_skills").val();
	var experience=$("#experience").val();
	
	 if(parseInt(experience)<parseInt(0)){
			alert("Please Enter Valid Experiance");
			 document.myForm.experience.focus() ;
			return false;
		}
	
	var costing=$("#costing").val();
	
	 if(parseInt(costing)<parseInt(0)){
			alert("Please Enter Valid Cost");
			 document.myForm.costing.focus() ;
			return false;
		}
	var months=$("#months").val(),days=$("#days").val();
	if(days=='0')
	{
	days='';
	}
	else
	{	
	 days=$("#days").val()+' Days';
	}
	if(months=='0')
	{
	months='';
	}
	else
	{
	months=$("#months").val()+' Months';
	}
	var timespan=months+days;

	
	$.ajax({
		  url: 'PostProjectServlet',
		  type: 'POST',
		  data: {userId:userId,clientName:clientName,work_require:work_require,project_name:project_name,project_description:project_description,project_skills:project_skills,experience:experience,costing:costing,timespan:timespan},
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

<div> 
<br>
<div id="p" class="container-fluid">
<div class="jumbotron">
    <h3><b>Type Of Work Do You Require</b></h3>
       <hr>
   <form role="form" name="myForm">	
  <div class="form-group">
    <label for="work_require">Select Type Of Work Required</label>
     <select class="form-control" id="work_require" required>
    <option value="Select a category of work" disabled selected hidden>Select A Category Of Work</option>
    <option value="Websites IT & Software">Websites IT & Software</option>
    <option value="Android Mobile">Android Mobile</option>
    <option value="Web Application">Web Application</option>
    <option value="Sales & Marketing">Sales & Marketing</option>
    <option value="Web Design">Web Design</option>
  </select> 
  </div>
  <h3><b>Tell Us More About The Project</b></h3>
  <hr>
  <div class="form-group">
  <label for="project_name">What Is Your Project About</label>
<input type="text" class="form-control" id="project_name" placeholder="Enter Project Name" required>
</div>
	
	
	<div class="form-group">
  <label for="project_description">Decribe Your Project</label>
<input type="text" class="form-control" id="project_description" placeholder="Project Description" required>
</div>
	
	<div class="form-group">
  <label for="project_skills">What Skills Are Required</label>
<input type="text" class="form-control" id="project_skills" placeholder="What Skills Are Required" required>
</div>

<div class="form-group">
  <label for="experience">Experience Required</label>
  <span class = "input-group-addon ">Years &nbsp</span>
<input type="text" class="form-control" id="experience" placeholder="Enter Experience Required" required>
</div>
		
	
 <div class="form-group">
    <label for="costing">What Costing Do You Have In Mind(Rupees)</label>
   
    <div class = "input-group">
             <span class = "input-group-addon ">Rs. &nbsp</span>
              
         <input type = "text" class =" form-control" id="costing" placeholder="Enter Project Cost In Rupees" required>
     
     
		   
    
     </div>
   <br>
   <div class="form-group">
    <label for="timespan">Duration Require For Project</label>
     
     <div class="row">
  <div class="col-sm-6">
  
     <div class = "input-group">
     <span class = "input-group-addon ">Days</span>
     <select class="form-control" id="days" required>
    <%
	for(int i=0;i<=31;i++)
	{
	%>
	 <option value="Select Days" disabled selected hidden>Select Days</option>
    <option value="<%=i %>"><%=i %></option><%} %>
    </select>
    </div></div>
	  <div class="col-sm-6">
	  <div class = "input-group">
     <span class = "input-group-addon ">Months</span>
     <select class="form-control" id="months" required>
    <%
	for(int i=0;i<=12;i++)
	{
	%>
	 <option value="Select Months" disabled selected hidden>Select Months</option>
	    <option value="<%=i %>"><%=i %></option><%} %>
    </select>
    </div>
	  
	  
	  </div>
	  </div>
	  
	  
  <br><br>
  <button  class="btn btn-primary" id="post_project">Post</button> 
	<button  class="btn btn-primary" id="reset">Reset</button>
      </form>
      </div>
     
	  
  </div>
 </div>
</body>
</html>
