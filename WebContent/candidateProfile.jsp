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

</style>

<script>
$(document).ready(function(){
	
	
	
	
	
	
	
	$("#skillSelect").click(function(){
var txt1=$( "#skills").val();
if(txt1==null || txt1=="")
{
var txt=$( "#skillSelect").val();
	$( "#skills").val(txt);

}
else
{
txt1=($("#skills").val()+",");
var txt=$( "#skillSelect").val();
	txt1=txt1+txt;
	$( "#skills").val(txt1);
}
});
	


	$("#educationUpdate").click(function(){
		var userId=$("#hiddenUserId").val();
		
		var education=$("#can_education").val();
		var overallpercent=$("#can_overall_percentage").val();
		var year=$("#can_year").val();
		var universityname=$("#can_university_name").val();
		var skill=$("#skills").val();
		
		var action="saveEducationDetails";
		
	/* 	$.ajax({
			  url: 'CanProfileServlet',
			  type: 'POST',
			  data: {userId:userId,education:education,overallpercent:overallpercent,year:year,universityname:universityname,skill:skill,action:action},
			  success: function(data) {
				  window.location.reload();
				  alert("Successfully Data Saved");
				//$("#abcd").append(data);  
		
				 
				//$("#sss").append(data);  
			
			  },
			  error: function(e) {
				  
				
			  }
			}); */
			});

	$("#personalUpdate").click(function(){
		var userId=$("#hiddenUserId").val();
		var fName=$("#can_full_name").val();
		var gender=$('input:radio[name="gender"]:checked').val();
		
		var address=$("#can_address").val();
		var city=$("#can_city").val();
		var pincode=$("#can_pincode").val();
		var state=$("#can_state").val();
		var country=$("#can_country").val();
		var dob=$("#can_dob").val();
		var mobileno=$("#can_mobileno").val();
		var ln=mobileno.length;
		
		if(ln!=10)
			{
			alert("Mobile Number Should Be Of 10 Digit!!!");
			return false;
			
			}
		var pinln=pincode.length;
		
		if(pinln!=6)
			{
			alert("Pincode Should Be Of 6 Digit!!!");
			return false;
			
			}
		var action="savePeronalDetails";
		
		/* $.ajax({
			  url: 'CanProfileServlet',
			  type: 'POST',
			  data: {userId:userId,fName:fName,gender:gender,address:address,city:city,pincode:pincode,state:state,country:country,dob:dob,mobileno:mobileno,action:action},
			  success: function(data) {
				  window.location.reload();
				  alert("Successfully Data Saved");
				//$("#abcd").append(data);  
			
			  },
			  error: function(e) {
				 
			
			  }
			}); */
			});

	$("#experienceUpdate").click(function(){
		var userId=$("#hiddenUserId").val();
		alert(userId);
		var experience=$("#can_experience").val();
		alert(experience);
		var experiencedetail=$("#can_experience_details").val();
		alert(experiencedetail);
		var ctc=$("#can_ctc").val();
		alert(ctc);
		var action="saveExperienceDetails";
		
	/* 	$.ajax({
			  url: 'CanProfileServlet',
			  type: 'POST',
			  data: {userId:userId,experience:experience,experiencedetail:experiencedetail,ctc:ctc,action:action},
			  success: function(data) {
				 
			//$("#abcd").append(data);  
			
			  },
			  error: function(e) {
				
			
			  }
			}); */
			});
	$("#projectUpdate").click(function(){
		
		var userId=$("#hiddenUserId").val();
		var projectName=$("#canProjectName").val();
		var projectDescription=$("#canProjectDescription").val();
		var projectModule=$("#canProjectModules").val();
		var action="saveProjectDetails";
		
	/* 	$.ajax({
			  url: 'CanProfileServlet',
			  type: 'POST',
			  data: {userId:userId,projectName:projectName,projectDescription:projectDescription,projectModule:projectModule,action:action},
			  success: function(data) {
				
			//$("#abcd").append(data);  
			
			  },
			  error: function(e) {
				  
			
			  }
			}); */
			});

	
			
});

</script>


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
      <!--<img src="logo1.jpg" class="img-rounded" alt="Cinque Terre" width="200" height="50">
    -->
   <h1  style="size: xx-large; font-family: cooper; color:blue;"><b> Pro-Interns</b></h1>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav nav-pills">
        <li><a href="UserHomeServlet?userId=<%=session.getAttribute("userId") %>">Home</a></li>
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






<div class="panel-group" id="accordion">


<%
List list=(List)session.getAttribute("personalData");
if(list!=null&&list.size()>0)
{
	
	for(int i=0;i<list.size();i++)
	{
  		CandidateProfile cp=(CandidateProfile)list.get(i);
%>


<form action="CanProfileServlet" method="post">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
          <span class="glyphicon glyphicon-minus"></span>
          Personal Details
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
      <div class="panel-body">
      
        <div class="form-group" id="abcd">
  </div>
  <div class="form-group">
    <label for="name">Full Name:</label>
    <input type="text" class="form-control" id="can_full_name" 
 name="fName" placeholder="Enter Name" value="<%=cp.getCan_full_name() %>" required>
  </div>
  <div class="form-group">
  <label for="gender">Gender:</label>
<label class="radio-inline"><input type="radio" id="can_gender" name="gender" value="Male"  <%String gender="Male";  if(cp.getCan_gender().equals(gender)){%> checked <%}%> >Male</label>
<label class="radio-inline"><input type="radio" id="can_gender" name="gender" value="Female" <%gender="Female";  if(cp.getCan_gender().equals(gender)){%> checked <%}%> >Female</label>
</div>

  <div class="form-group">
    <label for="location">Location:</label>
    <input type="text" class="form-control" id="can_address" name="address" placeholder="Enter Address" value="<%=cp.getCan_address()%>" required>
  </div>
  
   <div class="row">
  <div class="col-sm-6">
   <div class="form-group">
    <label for="city">City:</label>
    <input type="text" class="form-control" id="can_city"  name="city" placeholder="City" value="<%=cp.getCan_city()%>" required>
  </div> 
  </div> 
  
  <div class="col-sm-6">
  <div class="form-group">
    <label for="pincode">Pincode:</label>
    <input type="number" class="form-control" id="can_pincode"  name="pincode" placeholder="Pincode" value="<%=cp.getCan_pincode()%>" required>
  </div> 
  </div> 
  </div> 
  
  
  <div class="row">
  <div class="col-sm-6">
  <div class="form-group">
    <label for="state">State:</label>
    <input type="text" class="form-control" id="can_state"  name="state"  placeholder="State" value="<%=cp.getCan_state() %>" required>
  </div>
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="country">Country:</label>
    <input type="text" class="form-control" id="can_country"  name="country"  placeholder="Country" value="<%=cp.getCan_country() %>" required>
  </div>
  </div> 
  </div> 
  
  <div class="form-group">
<label for="dob">Date Of Birth:</label>
  <input type="date" id="can_dob" name="dob" value="<%=cp.getCan_dob() %>" required>
  </div>
<div class="form-group">
    <label for="name">Mobile Number:</label>
    <input type="number" class="form-control" id="can_mobileno"  name="mobileno"  placeholder="Enter Mobile Number" value="<%=cp.getCan_mobileno() %>" required>
  </div>
      <input type="hidden" value="savePeronalDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
     <input type="hidden" value="candidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="personalUpdate" value="Update" name="button1">
  
 
	 
      </div>
    </div>
  </div>
  </form>
<%}
}else
	{
	%>  
	<form action="CanProfileServlet" method="post">
	  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
          <span class="glyphicon glyphicon-minus"></span>
          Personal Details
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
      <div class="panel-body">
      
        <div class="form-group" id="abcd">
  </div>
  <div class="form-group">
    <label for="name">Full Name:</label>
    <input type="text" class="form-control" id="can_full_name" name="fName" placeholder="Enter Name" required>
  </div>
  <div class="form-group">
  <label for="gender">Gender:</label>
<label class="radio-inline"><input type="radio" id="can_gender" name="gender" value="Male" >Male</label>
<label class="radio-inline"><input type="radio" id="can_gender" name="gender" value="Female">Female</label>
</div>

  <div class="form-group">
    <label for="location">Location:</label>
    <input type="text" class="form-control" id="can_address" name="address" placeholder="Enter Address" required>
  </div>
  
   <div class="row">
  <div class="col-sm-6">
   <div class="form-group">
    <label for="city">City:</label>
    <input type="text" class="form-control" id="can_city" name="city"  placeholder="City" required>
  </div> 
  </div> 
  
  <div class="col-sm-6">
  <div class="form-group">
    <label for="pincode">Pincode:</label>
    <input type="number" class="form-control" id="can_pincode" name="pincode"  placeholder="Pincode" required>
  </div> 
  </div> 
  </div> 
  
  
  <div class="row">
  <div class="col-sm-6">
  <div class="form-group">
    <label for="state">State:</label>
    <input type="text" class="form-control" id="can_state" name="state"  placeholder="State" required>
  </div>
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="country">Country:</label>
    <input type="text" class="form-control" id="can_country" name="country"  placeholder="Country" required>
  </div>
  </div> 
  </div> 
  
  <div class="form-group">
<label for="dob">Date Of Birth:</label>
  <input type="date" id="can_dob" name="dob">
  </div>
<div class="form-group">
    <label for="name">Mobile Number:</label>
    <input type="number" class="form-control" id="can_mobileno"  name="mobileno" placeholder="Enter Mobile Number" min="10" max="10" required>
  </div>
  
  <input type="hidden" value="savePeronalDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
    <input type="hidden" value="candidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="personalUpdate" value="Update" name="button1">
  
	
      </div>
    </div>
  </div>
  </form>
	<%
	}
	%>

<%--  <%
List list2=(List)session.getAttribute("educationData");
if(list2!=null&&list2.size()>0)
{
	
	for(int i=0;i<list2.size();i++)
	{
  		CandidateProfile cp=(CandidateProfile)list2.get(i);
%>	
	 
  <form action="CanProfileServlet" method="post">
  
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
          <span class="glyphicon glyphicon-plus"></span>
          Education Details
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse">
      <div class="panel-body">
     
        <div class="form-group">
  <label for="sel1">Select Your Education Background:</label>
  <select class="form-control" id="can_education" name="education"> 
    <option value="Select Education Background" disabled selected hidden>Select Education Background</option>
    <option value="Diploma In IT" <%String status="Diploma In IT";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Diploma In IT</option>
    <option value="Diploma In CS" <%status="Diploma In CS";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Diploma In CS</option>
    <option value="Diploma In CE" <%status="Diploma In CE";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Diploma In CE</option>
    <option value="Bachelor Of Engineering in IT" <%status="Bachelor Of Engineering in IT";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Bachelor Of Engineering in IT</option>
    <option value="Bachelor Of Engineering in CS" <%status="Bachelor Of Engineering in CS";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Bachelor Of Engineering in CS</option>
    <option value="Bachelor Of Engineering in CE" <%status="Bachelor Of Engineering in CE";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Bachelor Of Engineering in CE</option>
  </select> 
<br>

 <div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">Year Of Enginnering:</label>
    <select class="form-control" id="can_year" name="year">
     <%for( int k=1;k<=4;k++ ){%>
      <option value="<%=k %>" ><%=k %></option>
   <%} %>
  </select>   </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Overall Aggregate:(%)</label>
    <input type="text" class="form-control" id="can_overall_percentage" name="overallpercent" placeholder="Overall Aggregate" value="<%=cp.getCan_overall_percentage() %>" required>
  </div> 
  </div> 

  </div> 
<div class="form-group">
    <label for="can_university_name">University:</label>
    <input type="text" class="form-control" id="can_university_name" name="universityname" placeholder="Enter University/College Name" value="<%=cp.getCan_university_name() %>" required>
  </div>
  
  <div class="form-group">
  <label for="sel1">What Are Your Key Skills:-</label>
    <input type="text" class="form-control" id="skills" name="skill" value="<%=cp.getCan_skill() %>" required>
  <select multiple class="form-control" id="skillSelect">
    <option value="c">c</option>
    <option value="c++">c++</option>
    <option value="c#">c#</option>
    <option value="Core Java">Core Java</option>
    <option value="JSP-Servlet">JSP-Servlet</option>
    <option value="Asp.net">Asp.net</option>
    <option value="jQuery">jQuery</option>
    <option value="Java Script">Java Script</option>
    <option value="Html-Css">Html-Css</option>
    <option value="SQL">SQL</option>
<option value="Oracle">Oracle</option>
  </select> 
   </div>
       <input type="hidden" value="saveEducationDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
    <input type="hidden" value="candidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="educationUpdate" value="Update" name="button1">
  
	    </div>
       
    </div>
  </div>
  

  
</div>
</form>
<%}
}else
	{
	%> 
	<form action="CanProfileServlet" method="post">
	  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
          <span class="glyphicon glyphicon-plus"></span>
          Education Details
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse">
      <div class="panel-body">
   
        <div class="form-group">
  <label for="sel1">Select Your Education Background:</label>
  <select class="form-control" id="can_education" name="education">
    <option value="Select Education Background" disabled selected hidden>Select Education Background</option>
    <option value="Diploma In IT">Diploma In IT</option>
    <option value="Diploma In CS">Diploma In CS</option>
    <option value="Diploma In CE">Diploma In CE</option>
    <option value="Bachelor Of Engineering in IT">Bachelor Of Engineering in IT</option>
    <option value="Bachelor Of Engineering in CS">Bachelor Of Engineering in CS</option>
    <option value="Bachelor Of Engineering in CE">Bachelor Of Engineering in CE</option>
  </select> 
<br>

 <div class="row">
 
 <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">Year Of Enginnering:</label>
    <select class="form-control" id="can_year" name="year">
     <%for( int k=1;k<=4;k++ ){%>
      <option value="<%=k %>" ><%=k %></option>
   <%} %>
  </select>   </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Overall Aggregate: (%)</label>
    <input type="text" class="form-control" id="can_overall_percentage" name="overallpercent" placeholder="Overall Aggregate">
  </div> 
  </div> 

  </div> 
<div class="form-group">
    <label for="can_university_name">University:</label>
    <input type="text" class="form-control" id="can_university_name" name="universityname" placeholder="Enter University/College Name">
  </div>
  
  <div class="form-group">
  <label for="sel1">What Are Your Key Skills:-</label>
    <input type="text" class="form-control" id="skills" name="skill">
  <select multiple class="form-control" id="skillSelect">
    <option value="c">c</option>
    <option value="c++">c++</option>
    <option value="c#">c#</option>
    <option value="Core Java">Core Java</option>
    <option value="JSP-Servlet">JSP-Servlet</option>
    <option value="Asp.net">Asp.net</option>
    <option value="jQuery">jQuery</option>
    <option value="Java Script">Java Script</option>
    <option value="Html-Css">Html-Css</option>
    <option value="SQL">SQL</option>
<option value="Oracle">Oracle</option>
  </select> 
   </div>
      <input type="hidden" value="saveEducationDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
    <input type="hidden" value="candidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="educationUpdate" value="Update" name="button1">

	    </div>
     
    </div>
  </div>
  

  
</div>
	</form>
	<%} %>
 --%>
<%
List list2=(List)session.getAttribute("educationData");
if(list2!=null&&list2.size()>0)
{
	
	for(int i=0;i<list2.size();i++)
	{
  		CandidateProfile cp=(CandidateProfile)list2.get(i);
%>	
	 
  <form action="CanProfileServlet" method="post">
  
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
          <span class="glyphicon glyphicon-plus"></span>
          Education Details
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse">
      <div class="panel-body">
     
        <div class="form-group">
  <label for="sel1">Select Your Education Background:</label>
  <select class="form-control" id="can_education" name="education"> 
    <option value="Select Education Background" disabled selected hidden>Select Education Background</option>
    <option value="Diploma In IT" <%String status="Diploma In IT";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Diploma In IT</option>
    <option value="Diploma In CS" <%status="Diploma In CS";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Diploma In CS</option>
    <option value="Diploma In CE" <%status="Diploma In CE";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Diploma In CE</option>
    <option value="Bachelor Of Engineering in IT" <%status="Bachelor Of Engineering in IT";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Bachelor Of Engineering in IT</option>
    <option value="Bachelor Of Engineering in CS" <%status="Bachelor Of Engineering in CS";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Bachelor Of Engineering in CS</option>
    <option value="Bachelor Of Engineering in CE" <%status="Bachelor Of Engineering in CE";  if(cp.getCan_education().equals(status)){%> selected <%}%>>Bachelor Of Engineering in CE</option>
  </select> 
<br>

<div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">SSC Year of Passing:</label>
    <select class="form-control" id="sscyear" name="sscyear">
     <%for( int k=2000;k<=2018;k++ ){%>
      <option value="<%=k %>" ><%=k %></option>
   <%} %>
  </select>   </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Percentage(%):</label>
    <input type="text" class="form-control" id="sscmarks" name="sscmarks" placeholder="SCC Percentage " value="<%=cp.getScc_marks() %>" required>
  </div> 
  </div> 

  </div> 
  
  <div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">HSC/Diploma Year of Passing:</label>
    <select class="form-control" id="hscyear" name="hscyear">
     <%for( int k=2000;k<=2018;k++ ){%>
      <option value="<%=k %>" ><%=k %></option>
   <%} %>
  </select>   </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Percentage(%):</label>
    <input type="text" class="form-control" id="hscmarks" name="hscmarks" placeholder="HSC/Diploma Percentage" value="<%=cp.getHsc_diploma_marks()%>" required>
  </div> 
  </div> 

  </div> 

 <div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">Year Of Enginnering:</label>
    <select class="form-control" id="can_year" name="year">
     <%for( int k=2000;k<=2018;k++ ){%>
      <option value="<%=k %>" ><%=k %></option>
   <%} %>
  </select>   </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Overall Aggregate:(%)</label>
    <input type="text" class="form-control" id="can_overall_percentage" name="overallpercent" placeholder="Overall Aggregate" value="<%=cp.getCan_overall_percentage() %>" required>
  </div> 
  </div> 

  </div> 
<div class="form-group">
    <label for="can_university_name">University:</label>
    <input type="text" class="form-control" id="can_university_name" name="universityname" placeholder="Enter University/College Name" value="<%=cp.getCan_university_name() %>" required>
  </div>
  
  <div class="form-group">
  <label for="sel1">What Are Your Key Skills:-</label>
    <input type="text" class="form-control" id="skills" name="skill" value="<%=cp.getCan_skill() %>" required>
  <select multiple class="form-control" id="skillSelect">
    <option value="c">c</option>
    <option value="c++">c++</option>
    <option value="c#">c#</option>
    <option value="Core Java">Core Java</option>
    <option value="JSP-Servlet">JSP-Servlet</option>
    <option value="Asp.net">Asp.net</option>
    <option value="jQuery">jQuery</option>
    <option value="Java Script">Java Script</option>
    <option value="Html-Css">Html-Css</option>
    <option value="SQL">SQL</option>
<option value="Oracle">Oracle</option>
  </select> 
   </div>
       <input type="hidden" value="saveEducationDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
     <input type="hidden" value="newCandidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="educationUpdate" value="Update" name="button1">
  
	    </div>
       
    </div>
  </div>
  

  
</div>
</form>
<%}
}else
	{
	%> 
	<form action="CanProfileServlet" method="post">
	  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
          <span class="glyphicon glyphicon-plus"></span>
          Education Details
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse">
      <div class="panel-body">
   
        <div class="form-group">
  <label for="sel1">Select Your Education Background:</label>
  <select class="form-control" id="can_education" name="education">
    <option value="Select Education Background" disabled selected hidden>Select Education Background</option>
    <option value="Diploma In IT">Diploma In IT</option>
    <option value="Diploma In CS">Diploma In CS</option>
    <option value="Diploma In CE">Diploma In CE</option>
    <option value="Bachelor Of Engineering in IT">Bachelor Of Engineering in IT</option>
    <option value="Bachelor Of Engineering in CS">Bachelor Of Engineering in CS</option>
    <option value="Bachelor Of Engineering in CE">Bachelor Of Engineering in CE</option>
  </select> 
<br>


<div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">SSC Year of Passing:</label>
    <select class="form-control" id="sscyear" name="sscyear">
     <%for( int k=2000;k<=2018;k++ ){%>
      <option value="<%=k %>" ><%=k %></option>
   <%} %>
  </select>   </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Percentage(%):</label>
    <input type="text" class="form-control" id="sscmarks" name="sscmarks" placeholder="SCC Percentage "  required>
  </div> 
  </div> 

  </div> 
  
  <div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">HSC/Diploma Year of Passing:</label>
    <select class="form-control" id="hscyear" name="hscyear">
     <%for( int k=2000;k<=2018;k++ ){%>
      <option value="<%=k %>" ><%=k %></option>
   <%} %>
  </select>   </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Percentage(%):</label>
    <input type="text" class="form-control" id="hscmarks" name="hscmarks" placeholder="HSC/Diploma Percentage"  required>
  </div> 
  </div> 

  </div> 

 <div class="row">
 
 <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">Year Of Enginnering:</label>
    <select class="form-control" id="can_year" name="year">
     <%for( int k=2000;k<=2018;k++ ){%>
      <option value="<%=k %>" ><%=k %></option>
   <%} %>
  </select>   </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Overall Aggregate: (%)</label>
    <input type="text" class="form-control" id="can_overall_percentage" name="overallpercent" placeholder="Overall Aggregate">
  </div> 
  </div> 

  </div> 
<div class="form-group">
    <label for="can_university_name">University:</label>
    <input type="text" class="form-control" id="can_university_name" name="universityname" placeholder="Enter University/College Name">
  </div>
  
  <div class="form-group">
  <label for="sel1">What Are Your Key Skills:-</label>
    <input type="text" class="form-control" id="skills" name="skill">
  <select multiple class="form-control" id="skillSelect">
    <option value="c">c</option>
    <option value="c++">c++</option>
    <option value="c#">c#</option>
    <option value="Core Java">Core Java</option>
    <option value="JSP-Servlet">JSP-Servlet</option>
    <option value="Asp.net">Asp.net</option>
    <option value="jQuery">jQuery</option>
    <option value="Java Script">Java Script</option>
    <option value="Html-Css">Html-Css</option>
    <option value="SQL">SQL</option>
<option value="Oracle">Oracle</option>
  </select> 
   </div>
      <input type="hidden" value="saveEducationDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
     <input type="hidden" value="newCandidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="educationUpdate" value="Update" name="button1">

	    </div>
     
    </div>
  </div>
  

  
</div>
	</form>
	<%} %>



<%
List list3=(List)session.getAttribute("experienceData");
if(list3!=null&&list3.size()>0)
{
	
	for(int i=0;i<list3.size();i++)
	{
  		CandidateProfile cp=(CandidateProfile)list3.get(i);
%>	
	 
  <form action="CanProfileServlet" method="post">
  
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
          <span class="glyphicon glyphicon-plus"></span>
          Experiance Details
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">
     
        <div class="form-group">
  <label for="sel1">Select Your Experiance :</label>
  <input type="text" class="form-control" id="can_experience" value="<%=cp.getCan_experience() %>" name="experiance"/> 
   </div>
<br>

 <div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">Company Name:</label>
    <input type="text" class="form-control" id="can_experience_details" value="<%=cp.getCan_experience_details() %>" name="company" />
       </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Current CTC :</label>
    <input type="text" class="form-control" id="can_ctc" name="salary" value="<%=cp.getCan_ctc() %>" placeholder="CTC" value="" required>
  </div> 
  </div> 

  </div> 

  
 
       <input type="hidden" value="saveExperienceDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
    <input type="hidden" value="candidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="experienceUpdate" value="Update" name="button1">
  
	   
       
    </div>
  </div>
  

  
</div>
</form>
<%}
}else
	{
	%> 
	<form action="CanProfileServlet" method="post">
	  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
          <span class="glyphicon glyphicon-plus"></span>
          Experiance Details
        </a>
      </h4>
    </div>
       <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">
     
        <div class="form-group">
  <label for="sel1">Select Your Experiance :</label>
  <input type="text" class="form-control" id="can_experience" name="experiance"/> 
   </div>
<br>

 <div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">Company Name:</label>
    <input type="text" class="form-control" id="can_experience_details" name="company" />
       </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Current CTC :</label>
    <input type="text" class="form-control" id="can_ctc" name="salary" placeholder="CTC" value="" required>
  </div> 
  </div> 

  </div> 

  
 
       <input type="hidden" value="saveExperienceDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
    <input type="hidden" value="candidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="experienceUpdate" value="Update" name="button1">
  
	   
       
    </div>
  </div>
  </div>
  

  
</div>
	</form>
	<%} %>
</div>
</div>


</body>
</html>
