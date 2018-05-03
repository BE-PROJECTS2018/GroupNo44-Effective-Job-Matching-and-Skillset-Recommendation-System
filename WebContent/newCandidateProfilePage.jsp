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


<script type="text/javascript">
function reloadThis()
{
	window.location.reload();
	}
</script>

<script><!--
$(document).ready(function(){
	
	

	$("#submit12").click(function(){	
	alert("Your Request Is Being Proceed.... Please Logged In After Few Hours..!!!");
	
	});
	
	
	
	
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
		
		var sscyear=$("#sscyear").val();
		var per=100;
		var hscyear=$("#hscyear").val();
		//alert("sscyear"+sscyear);
		//alert("hscyear"+hscyear);
		var sscmarks=$("#sscmarks").val();
		//alert("sscmarks"+sscmarks);
		
        if(parseInt(sscmarks)>parseInt(100)){
			alert("Please Enter Valid Percentage");
			 document.myForm.sscmarks.focus() ;
			return false;
		}
		var hscmarks=$("#hscmarks").val();
		
		 if(parseInt(hscmarks)>parseInt(100)){
				alert("Please Enter Valid Percentage");
				 document.myForm.hscmarks.focus() ;
				return false;
			}
		//alert("sscyear"+sscyear);
		//alert("hscyear"+hscyear);
		
		var overallpercent=$("#can_overall_percentage").val();
		 if(parseInt(overallpercent)>parseInt(100)){
				alert("Please Enter Valid Percentage");
				 document.myForm.can_overall_percentage.focus() ;
				return false;
			}
		var year=$("#can_year").val();
		var universityname=$("#can_university_name").val();
		var skill=$("#skills").val();
		if(sscyear==null && hscmarks==null && sscmarks==null && overallpercent==null){
			return false;
		}
	 	var action="saveEducationDetails";
		
		$.ajax({
			  url: 'CanProfileServlet',
			  type: 'POST',
			  data: {userId:userId,education:education,overallpercent:overallpercent,year:year,universityname:universityname,skill:skill,sscyear:sscyear, hscyear:hscyear,sscmarks:sscmarks,hscmarks:hscmarks,action:action},
			  success: function(data) {
				  alert(data);
				  window.location.reload();
				  alert(data);
				  alert("Successfully Data Saved");
				//$("#abcd").append(data);  
			reloadThis();
				//$("#sss").append(data);  
			
			  },
			  error: function(e) {
				  
				 
				//$("#abcd").append(data);  
			reloadThis();
			  }
			}); 
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
		
		$.ajax({
			  url: 'CanProfileServlet',
			  type: 'POST',
			  data: {userId:userId,fName:fName,gender:gender,address:address,city:city,pincode:pincode,state:state,country:country,dob:dob,mobileno:mobileno,action:action},
			  success: function(data) {
				  window.location.reload();
				  alert("Successfully Data Saved");
				//$("#abcd").append(data);  
			reloadThis();
			  },
			  error: function(e) {
				 
			  }
			});
			});

	$("#experienceUpdate").click(function(){
		var userId=$("#hiddenUserId").val();
		
		var experience=$("#can_experience").val();
		var experiencedetail=$("#can_experience_details").val();
		var ctc=$("#can_ctc").val();
		var action="saveExperienceDetails";
		
		$.ajax({
			  url: 'CanProfileServlet',
			  type: 'POST',
			  data: {userId:userId,experience:experience,experiencedetail:experiencedetail,ctc:ctc,action:action},
			  success: function(data) {
				
				  window.location.reload();
				  alert("Successfully Data Saved");
				//$("#abcd").append(data);  
			reloadThis();
			//$("#abcd").append(data);  
			
			  },
			  error: function(e) {
				
				 
			  }
			});
			});
	$("#projectUpdate").click(function(){
		
		var userId=$("#hiddenUserId").val();
		
		
		var projectName=$("#canProjectName").val();
		var projectDescription=$("#canProjectDescription").val();
		var projectModule=$("#canProjectModules").val();
		var action="saveProjectDetails";
		
		$.ajax({
			  url: 'CanProfileServlet',
			  type: 'POST',
			  data: {userId:userId,projectName:projectName,projectDescription:projectDescription,projectModule:projectModule,action:action},
			  success: function(data) {
			//$("#abcd").append(data);  
			
			  },
			  error: function(e) {
				  
			
			  }
			});
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
   
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#"><span class="glyphicon glyphicon-user">Welcome</span> <%=session.getAttribute("userName") %></a></li>
       
      </ul>
        </div>
  </div>
</nav>


<br>





<div class="container">

<div class="panel-group" id="accordion">

<div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
          <span class="glyphicon glyphicon-plus"></span>
         Profile Picture
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse">
      <div class="panel-body">
     
      <div class="well"><div class="panel panel-default">
<div class="panel-body">

  <br><br>
  <label for="dob">Upload Your Profile Image:</label>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal"> Click Here </button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" style="    left: 0px;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Upload Your Profile image :</h4>
        </div>
        <div class="modal-body">
         <form action="RegistrationImageUpload" method="post" enctype="multipart/form-data">
        <input type="hidden" value='<%=session.getAttribute("userId")%>' name="userId">
         <div class="form-group">
<input type="file" class="btn btn-default" name="dataFile" id="fileChooser"><br><br>
<input type="submit" class="btn btn-primary" value="Save" name="action">
  </div>
  </form>
        </div> 
      </div>
      
    </div>
  </div>
  </div>
  </div></div>
    
    
      </div>
    </div>
  </div>





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
 name="fName" placeholder="Enter Name" value="<%=cp.getCan_full_name() %>" required="required">
  </div>
  <div class="form-group">
  <label for="gender">Gender:</label>
<label class="radio-inline"><input type="radio" id="can_gender" name="gender" value="Male"  <%String gender="Male";  if(cp.getCan_gender().equals(gender)){%> checked <%}%> >Male</label>
<label class="radio-inline"><input type="radio" id="can_gender" name="gender" value="Female" <%gender="Female";  if(cp.getCan_gender().equals(gender)){%> checked <%}%> >Female</label>
</div>

  <div class="form-group">
    <label for="location">Location:</label>
    <input type="text" class="form-control" id="can_address" name="address" placeholder="Enter Address" value="<%=cp.getCan_address()%>" required="required">
  </div>
  
   <div class="row">
  <div class="col-sm-6">
   <div class="form-group">
    <label for="city">City:</label>
    <input type="text" class="form-control" id="can_city"  name="city" placeholder="City" value="<%=cp.getCan_city()%>" required="required">
  </div> 
  </div> 
  
  <div class="col-sm-6">
  <div class="form-group">
    <label for="pincode">Pincode:</label>
    <input type="number" class="form-control" id="can_pincode"  name="pincode" placeholder="Pincode" value="<%=cp.getCan_pincode()%>" required="required">
  </div> 
  </div> 
  </div> 
  
  
  <div class="row">
  <div class="col-sm-6">
  <div class="form-group">
    <label for="state">State:</label>
<%--     <input type="text" class="form-control" id="can_state"  name="state"  placeholder="State" value="<%=cp.getCan_state() %>" required="required">
 --%>  <select class="form-control" id="can_state" name="state"  placeholder="State" required="required">
<option  value="<%=cp.getCan_state() %>"></option>
<option value='Andaman and Nicobar Islands'>Andaman and Nicobar Islands</option>
<option value='Andhra Pradesh'>Andhra Pradesh</option>
<option value='Arunachal Pradesh'>Arunachal Pradesh</option>
<option value='Assam'>Assam</option>
<option value='Bihar'>Bihar</option>
<option value='Chandigarh'>Chandigarh</option>
<option value='Chhattisgarh'>Chhattisgarh</option>
<option value='Dadra and Nagar Haveli'>Dadra and Nagar Haveli</option>
<option value='Daman and Diu'>Daman and Diu</option>
<option value='Delhi'>Delhi</option>
<option value='Goa'>Goa</option>
<option value='Gujarat'>Gujarat</option>
<option value='Haryana'>Haryana</option>
<option value='Himachal Pradesh'>Himachal Pradesh</option>
<option value='Jammu and Kashmir'>Jammu and Kashmir</option>
<option value='Jharkhand'>Jharkhand</option>
<option value='Karnataka'>Karnataka</option>
<option value='Kerala'>Kerala</option>
<option value='Lakshadweep'>Lakshadweep</option>
<option value='Madhya Pradesh'>Madhya Pradesh</option>
<option value='Maharashtra'>Maharashtra</option>
<option value='Manipur'>Manipur</option>
<option value='Meghalaya'>Meghalaya</option>
<option value='Mizoram'>Mizoram</option>
<option value='Nagaland'>Nagaland</option>
<option value='Odisha'>Odisha</option>
<option value='Puducherry'>Puducherry</option>
<option value='Punjab'>Punjab</option>
<option value='Rajasthan'>Rajasthan</option>
<option value='Sikkim'>Sikkim</option>
<option value='Tamil Nadu'>Tamil Nadu</option>
<option value='Telengana'>Telengana</option>
<option value='Tripura'>Tripura</option>
<option value='Uttar Pradesh'>Uttar Pradesh</option>
<option value='Uttarakhand'>Uttarakhand</option>
<option value='West Bengal'>West Bengal</option>
</select>
  
  </div>
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="country">Country:</label>
<%--     <input type="text" class="form-control" id="can_country"  name="country"  placeholder="Country" value="<%=cp.getCan_country() %>" required="required">
 --%>  
 <select class="form-control" id="can_country"  name="country"  placeholder="Country" value="<%=cp.getCan_country() %>" required="required">
<option  value="<%=cp.getCan_country() %>"><%=cp.getCan_country() %></option>
<option  value="India">India</option>

</select>
 </div>
  </div> 
  </div> 
  
  <div class="form-group">
<label for="dob">Date Of Birth:</label>
  <input type="text" id="can_dob" name="dob" value="<%=cp.getCan_dob() %>" placeholder="dd//mm//yyyy" required="required">
  </div>
<div class="form-group">
    <label for="name">Mobile Number:</label>
    <input type="number" class="form-control" id="can_mobileno"  name="mobileno"  placeholder="Enter Mobile Number" value="<%=cp.getCan_mobileno() %>" required="required">
  </div>
      <input type="hidden" value="savePeronalDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
   <input type="hidden" value="newCandidate" name="page">
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
    <input type="text" class="form-control" id="can_full_name" name="fName" placeholder="Enter Name" required="required">
  </div>
  <div class="form-group">
  <label for="gender">Gender:</label>
<label class="radio-inline"><input type="radio" id="can_gender" name="gender" value="Male" >Male</label>
<label class="radio-inline"><input type="radio" id="can_gender" name="gender" value="Female">Female</label>
</div>

  <div class="form-group">
    <label for="location">Location:</label>
    <input type="text" class="form-control" id="can_address" name="address" placeholder="Enter Address" required="required">
  </div>
  
   <div class="row">
  <div class="col-sm-6">
   <div class="form-group">
    <label for="city">City:</label>
    <input type="text" class="form-control" id="can_city" name="city"  placeholder="City" required="required">
  </div> 
  </div> 
  
  <div class="col-sm-6">
  <div class="form-group">
    <label for="pincode">Pincode:</label>
    <input type="number" class="form-control" id="can_pincode" name="pincode"  placeholder="Pincode" required="required">
  </div> 
  </div> 
  </div> 
  
  
  <div class="row">
  <div class="col-sm-6">
  <div class="form-group">
    <label for="state">State:</label>
   <!--  <input type="text" class="form-control" id="can_state" name="state"  placeholder="State" required="required"> -->
    <select class="form-control" id="can_state" name="state"  placeholder="State" required="required">
<option value='Andaman and Nicobar Islands'>Andaman and Nicobar Islands</option>
<option value='Andhra Pradesh'>Andhra Pradesh</option>
<option value='Arunachal Pradesh'>Arunachal Pradesh</option>
<option value='Assam'>Assam</option>
<option value='Bihar'>Bihar</option>
<option value='Chandigarh'>Chandigarh</option>
<option value='Chhattisgarh'>Chhattisgarh</option>
<option value='Dadra and Nagar Haveli'>Dadra and Nagar Haveli</option>
<option value='Daman and Diu'>Daman and Diu</option>
<option value='Delhi'>Delhi</option>
<option value='Goa'>Goa</option>
<option value='Gujarat'>Gujarat</option>
<option value='Haryana'>Haryana</option>
<option value='Himachal Pradesh'>Himachal Pradesh</option>
<option value='Jammu and Kashmir'>Jammu and Kashmir</option>
<option value='Jharkhand'>Jharkhand</option>
<option value='Karnataka'>Karnataka</option>
<option value='Kerala'>Kerala</option>
<option value='Lakshadweep'>Lakshadweep</option>
<option value='Madhya Pradesh'>Madhya Pradesh</option>
<option value='Maharashtra'>Maharashtra</option>
<option value='Manipur'>Manipur</option>
<option value='Meghalaya'>Meghalaya</option>
<option value='Mizoram'>Mizoram</option>
<option value='Nagaland'>Nagaland</option>
<option value='Odisha'>Odisha</option>
<option value='Puducherry'>Puducherry</option>
<option value='Punjab'>Punjab</option>
<option value='Rajasthan'>Rajasthan</option>
<option value='Sikkim'>Sikkim</option>
<option value='Tamil Nadu'>Tamil Nadu</option>
<option value='Telengana'>Telengana</option>
<option value='Tripura'>Tripura</option>
<option value='Uttar Pradesh'>Uttar Pradesh</option>
<option value='Uttarakhand'>Uttarakhand</option>
<option value='West Bengal'>West Bengal</option>
</select>
  </div>
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="country">Country:</label>
<!--     <input type="text" class="form-control" id="can_country" name="country"  placeholder="Country" required="required">
 -->  
 <select class="form-control" id="can_country"  name="country"  placeholder="Country" required="required">

<option  value="India">India</option>

</select>
 
 </div>
  </div> 
  </div> 
  
  <div class="form-group">
<label for="dob">Date Of Birth:</label>
  <input type="text" id="can_dob" name="dob" placeholder="dd//mm//yyyy">
  </div>
<div class="form-group">
    <label for="name">Mobile Number:</label>
    <input type="number" class="form-control" id="can_mobileno"  name="mobileno" placeholder="Enter Mobile Number" min="10" max="10" required="required">
  </div>
  
  <input type="hidden" value="savePeronalDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
     <input type="hidden" value="newCandidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="personalUpdate" value="Update" name="button1">
  
	
      </div>
    </div>
  </div>
  </form>
	<%
	}
	%>

 <%
List list2=(List)session.getAttribute("educationData");
if(list2!=null&&list2.size()>0)
{
	
	for(int i=0;i<list2.size();i++)
	{
  		CandidateProfile cp=(CandidateProfile)list2.get(i);
%>	
	 
  <form name=" myForm" action="CanProfileServlet" method="post">
  
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
    <input type="text" class="form-control" id="sscmarks" name="sscmarks" placeholder="SCC Percentage " value="<%=cp.getScc_marks() %>" required="required">
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
    <input type="text" class="form-control" id="hscmarks" name="hscmarks" placeholder="HSC/Diploma Percentage" value="<%=cp.getHsc_diploma_marks()%>" required="required">
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
    <input type="text" class="form-control" id="can_overall_percentage" name="overallpercent" placeholder="Overall Aggregate" value="<%=cp.getCan_overall_percentage() %>" required="required">
  </div> 
  </div> 

  </div> 
<div class="form-group">
    <label for="can_university_name">University:</label>
    <input type="text" class="form-control" id="can_university_name" name="universityname" placeholder="Enter University/College Name" value="<%=cp.getCan_university_name() %>" required="required">
  </div>
  
  <div class="form-group">
  <label for="sel1">What Are Your Key Skills:-</label>
    <input type="text" class="form-control" id="skills" name="skill" value="<%=cp.getCan_skill() %>" required="required">
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
    <input type="text" class="form-control" id="sscmarks" name="sscmarks" placeholder="SCC Percentage "  required="required">
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
    <input type="text" class="form-control" id="hscmarks" name="hscmarks" placeholder="HSC/Diploma Percentage"  required="required"="required="required"">
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
List list3=(List)session.getAttribute("experianceData");
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
          Experience Details
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">
     
        <div class="form-group">
  <label for="sel1">Enter Your Experiane Details:</label>
  
<br>

<div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">Total Experiance:</label>
    <input type="text" class="form-control" id="can_experience" name="experiance" required="required">
       </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Company Name:</label>
    <input type="text" class="form-control" id="can_experience_details" name="company" placeholder="Company Name" value="<%=cp.getCan_experience_details() %>" required="required">
  </div> 
  </div> 

  </div> 
  
  <div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">Current CTC:</label>
    <input type="text" class="form-control" id="can_ctc" name="salary" required="required">
        </div> 
  </div> 
  </div> 
  
       <input type="hidden" value="saveExperienceDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
     <input type="hidden" value="newCandidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="experienceUpdate" value="Update" name="button1">
  
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
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
          <span class="glyphicon glyphicon-plus"></span>
          Experiance Details
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">
   
         <div class="form-group">
  <label for="sel1">Enter Your Experiane Details:</label>
  
<br>

<div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">Total Experiance:</label>
    <input type="text" class="form-control" id="experiance" name="experiance" required="required">
       </div> 
  </div> 
  
  <div class="col-sm-6">
   <div class="form-group">
    <label for="can_overall_percentage">Company Name:</label>
    <input type="text" class="form-control" id="company" name="company" placeholder="Company Name" value="" required="required">
  </div> 
  </div> 

  </div> 
  
  <div class="row">
 
  <div class="col-sm-6">
  <div class="form-group">
    <label for="can_branch">Current CTC:</label>
    <input type="text" class="form-control" id="salary" name="salary" required="required">
        </div> 
  </div> 
  
 

  </div> 
  
       <input type="hidden" value="saveExperienceDetails" name="action">
  <input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
     <input type="hidden" value="newCandidate" name="page">
      <br><br>
  <input type="submit"  class="btn btn-primary" id="experienceUpdate" value="Update" name="button1">
  
	    </div>
     
    </div>
  </div>
  

  
</div>
	</form>
	<%} %>


<div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
          <span class="glyphicon glyphicon-plus"></span>
          Personal Document
        </a>
      </h4>
    </div>
    <div id="collapseSix" class="panel-collapse collapse">
      <div class="panel-body">
     
      <div class="well"><div class="panel panel-default">
<div class="panel-body">

 
 
  <br><br>
  <label for="dob">*Upload Your ID proof:</label>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal1"> Click Here </button>

  <!-- Modal -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog" style="    left: 0px;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Upload Your ID proof:</h4>
        </div>
        <div class="modal-body">
         <form action="RegIdProofUpload" method="post" enctype="multipart/form-data">
        <input type="hidden" value='<%=session.getAttribute("userId")%>' name="userId">
         <div class="form-group">
<input type="file" class="btn btn-default" name="dataFile" id="fileChooser"><br><br>
<input type="submit" class="btn btn-primary" value="Save" name="action">
  </div>
  </form>
        </div> 
      </div>
      
    </div>
  </div>
  </div>
  </div></div>
    
    
      </div>
    </div>
  </div>



</div>




<center><b> After Filling All Data &nbsp;<a href="signUp.jsp"   id="submit12">Click Here</a> </b></center>
 
</div>
 
</body>
</html>