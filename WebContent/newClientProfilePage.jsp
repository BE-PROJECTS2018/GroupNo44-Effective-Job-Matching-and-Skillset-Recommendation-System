

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
<script>
$(document).ready(function(){
	
	
	$("#submit12").click(function(){	
		alert("Your Request Is Being Proceed.... Please Logged In After Few Hours..!!!");
		
		});
		
$("#clientUpdate").click(function(){
	var userId=$("#hiddenUserId").val();
	var cName=$("#clientname").val();
	var founded=$("#founded").val();
	var location=$("#location").val();
	var city=$("#city").val();
	var project=$("#project").val();
	var technology=$("#technology").val();
	var pincode=$("#pincode").val();
	var state=$("#state").val();
	var country=$("#country").val();
	var action="saveClientDetails";
	
	var pinln=pincode.length;
	
	if(pinln!=6)
		{
		alert("Pincode Should Be Of 6 Digit!!!");
		return false;
		
		}
	$.ajax({
		  url: 'ComProfileServlet',
		  type: 'POST',
		  data: {userId:userId,cName:cName,founded:founded,location:location,city:city,pincode:pincode,state:state,country:country,action:action,project:project,technology:technology},
		  success: function(data) {
			  window.location.reload();
			  alert("Successfully Data Saved");

			//$("#abcd").append(data);  
		
		  },
		  error: function(e) {
		
		  }
		});
		});


$("#recruiterUpdate").click(function(){
	
	var userId=$("#hiddenUserId").val();
	var fName=$("#fname").val();
	var gender=$('input:radio[id="gender"]:checked').val();
	var mobileno=$("#mobilenumber").val();
	var action="saveRecruiterDetails";
	var ln=mobileno.length;
	
	if(ln!=10)
		{
		alert("Mobile Number Should Be Of 10 Digit!!!");
		return false;
		
		}
	
	$.ajax({
		  url: 'ComProfileServlet',
		  type: 'POST',
		  data: {userId:userId,fName:fName,gender:gender,mobileno:mobileno,action:action},
		  success: function(data) {
			 
			  window.location.reload();
			  alert("Successfully Data Saved");
			//$("#abcd").append(data);  
		
		  },
		  error: function(e) {
		
		  }
		});
		});

$("#contactUpdate").click(function(){
	var userId=$("#hiddenUserId").val();
	var contactNo=$("#contactno").val();
	var emailId=$("#emailid").val();
	var website=$("#website").val();
	var companyDetails=$("#companyDetails").val();
	var action="saveContactDetails";
	
	$.ajax({
		  url: 'ComProfileServlet',
		  type: 'POST',
		  data: {userId:userId,contactNo:contactNo,emailId:emailId,website:website,companyDetails:companyDetails,action:action},
		  success: function(data) {
			  window.location.reload();
			  alert("Successfully Data Saved");
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
       
    
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#"><span class="glyphicon glyphicon-user"></span> UserName</a></li>
      </ul>
    </div>
  </div>
</nav>

<div> 
<br>
<div id="p" class="container-fluid">
<div class="panel-group" id="accordion">

<div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">
          <span class="glyphicon glyphicon-plus"></span>
         Profile Picture
        </a>
      </h4>
    </div>
    <div id="collapseNine" class="panel-collapse collapse">
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
List list=(List)session.getAttribute("recriuterList");
if(list!=null&&list.size()>0)
{
	for(int i=0;i<list.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list.get(i);
%>
<form action="ComProfileServlet" method="POST">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
          <span class="glyphicon glyphicon-minus"></span>
          Recruiter Details
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
      <div class="panel-body">
   

  <div class="form-group">
    <label for="name">Full Name:</label>
    <input type="text" class="form-control" id="fname"  name="fName" placeholder="Enter Name" value="<%=cp.getRec_full_name()  %>" required>
  </div>
  <div class="form-group">
  <label for="gender">Gender:</label>
<label class="radio-inline"><input type="radio" id="gender" name="gender" value="Male"  <%String gender="Male";  if(cp.getRec_gender().equals(gender)){%> checked <%}%> >Male</label>
<label class="radio-inline"><input type="radio" id="gender" name="gender" value="Female" <%gender="Female";  if(cp.getRec_gender().equals(gender)){%> checked <%}%> >Female</label>
</div>
	
 <div class="form-group">
    <label for="mobileno">Mobile Number:</label>
    <input type="number" class="form-control" id="mobilenumber" name="mobileno" placeholder="Enter Mobile Number" value="<%=cp.getRec_mobileno()  %>"  required>
  </div>
  <input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">
<input type="hidden" value="saveRecruiterDetails" id="hiddenUserId" name="action">
<input type="hidden" value="newclient" id="hiddenUserId" name="page">
  <br><br>
  <input type="submit"  class="btn btn-primary" id="recruiterUpdate" value="Update" name="recruiterUpdate">

	<button type="reset"  class="btn btn-primary" id="reset">Reset</button>
 
      </div>
    </div>
  </div>
  </form>
  <%
	}
}
else{
%>
 <form action="ComProfileServlet" method="POST">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
          <span class="glyphicon glyphicon-minus"></span>
          Recruiter Details
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
      <div class="panel-body">
   
   
  <div class="form-group">
    <label for="name">Full Name:</label>
    <input type="text" class="form-control" id="fname"  name="fName" placeholder="Enter Name" required>
  </div>
  <div class="form-group">
  <label for="gender">Gender:</label>
<label class="radio-inline"><input type="radio" id="gender" name="gender" value="Male">Male</label>
<label class="radio-inline"><input type="radio" id="gender" name="gender" value="Female">Female</label>
</div>
	
 <div class="form-group">
    <label for="mobileno">Mobile Number:</label>
    <input type="number" class="form-control" id="mobilenumber" name="mobileno" placeholder="Enter Mobile Number" max="9999999999" required>
  </div>
  
   <input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">
<input type="hidden" value="saveRecruiterDetails" id="hiddenUserId" name="action">
<input type="hidden" value="newclient" id="hiddenUserId" name="page">
  <br><br>
  <input type="submit"  class="btn btn-primary" id="recruiterUpdate" value="Update" name="recruiterUpdate">

	<button type="reset"  class="btn btn-primary" id="reset">Reset</button>
    
      </div>
    </div>
  </div>
  
  </form>
 <%} %>
 
 
 
 
 
 <%
List list1=(List)session.getAttribute("ClientDetailsList");
if(list1!=null&&list1.size()>0)
{
	for(int i=0;i<list1.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list1.get(i);
%>
<!-- <form action="ComProfileServlet" method="POST"> -->
	  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
          <span class="glyphicon glyphicon-plus"></span>
          Client Details
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">

   <div class="form-group">
    <label for="clientname">Client Name:</label>
    <input type="text" class="form-control" id="clientname"   name="cName" placeholder="Enter Client Name" value="<%=cp.getClient_name()  %>" required>
  </div>
  
<div class="form-group">
    <label for="founded">Founded:</label>
    <input type="text" class="form-control" id="founded"    name="founded" placeholder="Enter Founded Date" value="<%=cp.getClient_founded()  %>" required>
  </div>
  
   <div class="form-group">
    <label for="poject">Project:</label>
    <input type="text" class="form-control" id="project"  name="project" value="<%=cp.getProject()  %>" placeholder="Enter Project" required>
  </div>
  
   <div class="form-group">
    <label for="technology">Required Technology:</label>
    <input type="text" class="form-control" id="technology" value="<%=cp.getTechnology()%>"  name="technology" placeholder="Enter Address" required>
  </div>
  
  
  
    <div class="form-group">
    <label for="location">Location:</label>
    <input type="text" class="form-control" id="location"     name="location" placeholder="Enter Address" value="<%=cp.getClient_location()  %>" required>
  </div>
  
   <div class="row">
  <div class="col-sm-6">
   <div class="form-group">
    <label for="city">City:</label>
    <input type="text" class="form-control" id="city"	 name="city"  placeholder="City" value="<%=cp.getClient_city()  %>" required>
  </div> 
  </div> 
  
  <div class="col-sm-6">
  <div class="form-group">
    <label for="pincode">Pincode:</label>
    <input type="number" class="form-control" id="pincode" 	  name="pincode" placeholder="Pincode" value="<%=cp.getClient_pincode()  %>"  required>
  </div> 
  </div> 
  </div> 
  
  
  <div class="row">
  <div class="col-sm-6">
  <div class="form-group">
    <label for="state">State:</label>
<%--     <input type="text" class="form-control" id="state" placeholder="State"	   name="state"  value="<%=cp.getClient_state()  %>" required>
 --%>  <select class="form-control" id="state" name="state"  placeholder="State" required>
<option value="<%=cp.getClient_state()  %>"><%=cp.getClient_state()  %></option>
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
    <input type="text" class="form-control" id="country"	    name="country"  placeholder="Country" value="<%=cp.getClient_country()  %>" required>
  
  <select class="form-control" id="country" name="country"  placeholder="Country" required>
  <option value="<%=cp.getClient_country()%>"><%=cp.getClient_country()  %></option>
   <option value="India">India</option>

</select>
  </div>
  </div> 
  </div> 
  
  <input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">
<input type="hidden" value="saveClientDetails" id="hiddenUserId" name="action">
<input type="hidden" value="newclient" id="hiddenUserId" name="page">
  <br><br>
  <input type="submit"  class="btn btn-primary" id="clientUpdate" value="Update" name="clientUpdate">
<!-- 	<button type="reset"  class="btn btn-primary" >Reset</button> -->

  </div>
  </div>
  </div>
<!--  </form> -->
   <%
	}
}
else{
%>
<!-- <form action="ComProfileServlet" method="POST"> -->
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
          <span class="glyphicon glyphicon-plus"></span>
          Client Details
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">

   <div class="form-group">
    <label for="clientname">Client Name:</label>
    <input type="text" class="form-control" id="clientname"   name="cName" placeholder="Enter Client Name" required>
  </div>
  
<div class="form-group">
    <label for="founded">Founded:</label>
    <input type="text" class="form-control" id="founded"    name="founded" placeholder="Enter Founded Year" required>
  </div>
  
  
   <div class="form-group">
    <label for="location">Project:</label>
    <input type="text" class="form-control" id="project"  name="project" placeholder="Enter Project" required>
  </div>
  
   <div class="form-group">
    <label for="location">Required Technology:</label>
    <input type="text" class="form-control" id="technology"  name="technology" placeholder="Enter Address" required>
  </div>
  
  
    <div class="form-group">
    <label for="location">Location:</label>
    <input type="text" class="form-control" id="location"  name="location" placeholder="Enter Address" required>
  </div>
  
   <div class="row">
  <div class="col-sm-6">
   <div class="form-group">
    <label for="city">City:</label>
    <input type="text" class="form-control" id="city"  name="city" placeholder="City" required>
  </div> 
  </div> 
  
  <div class="col-sm-6">
  <div class="form-group">
    <label for="pincode">Pincode:</label>
    <input type="number" class="form-control" id="pincode"  name="pincode" placeholder="Pincode" max="999999" required>
  </div> 
  </div> 
  </div> 
  
  
  <div class="row">
  <div class="col-sm-6">
  <div class="form-group">
    <label for="state">State:</label>
   <!--  <input type="text" class="form-control" id="state"  name="state" placeholder="State" required> -->
   
   <select class="form-control" id="state" name="state"  placeholder="State" required>

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
   <!--  <input type="text" class="form-control" id="country" name="country"  placeholder="Country" required> -->
   <select class="form-control" id="country" name="country"  placeholder="Country" required>
<option value="India">India</option>

</select>
 
  </div>
  </div> 
  </div> 
   <input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">
<input type="hidden" value="saveClientDetails" id="hiddenUserId" name="action">
<input type="hidden" value="newclient" id="hiddenUserId" name="page">
  <br><br>
  <input type="submit"  class="btn btn-primary" id="clientUpdate" value="Update" name="clientUpdate">

	<!-- 	<button type="reset"  class="btn btn-primary"   >Reset</button> -->
    

  </div>
  </div>
  </div>
 <!--  </form> -->
 <%} %>
   
   
   
   
  <%
List list2=(List)session.getAttribute("ClientContactUsList");
if(list2!=null&&list2.size()>0)
{
	for(int i=0;i<list2.size();i++)
	{
		ClientProfilePojo cp=(ClientProfilePojo)list2.get(i);
%>
<form action="ComProfileServlet" method="POST">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
          <span class="glyphicon glyphicon-plus"></span>
          Contact Us
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse">
      <div class="panel-body">

  
  <div class="row">
  <div class="col-sm-6">
  
   <div class="form-group">
    <label for="location">Contact No.:</label>
    <input type="number" class="form-control" id="contactno"  name="contactNo" placeholder="Enter Contact No." value="<%=cp.getClient_contact_no()  %>" max="9999999999" required>
  </div>
</div>
</div>
 <div class="row">
  <div class="col-sm-6">
<div class="form-group">
    <label for="location">Email ID:</label>
    <input type="email" class="form-control" id="emailid"  name="emailId" placeholder="Enter Email Address" value="<%=cp.getClient_email_id()  %>" required>
  </div>
  </div></div>

 <div class="row">
  <div class="col-sm-6">
  <div class="form-group">
    <label for="location">Website:</label>
    <input type="url" class="form-control" id="website" name="website"  placeholder="Enter Website Name" value="<%=cp.getClient_website()  %>" required>
  </div>
</div></div>
  
<div class="form-group">
  <label for="aboutcompany">About Company:</label>
  <textarea class="form-control" rows="2" id="companyDetails"   name="companyDetails" placeholder="Enter company details" value="<%=cp.getClient_about()  %>" required><%=cp.getClient_about()  %></textarea>
</div> 

<input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">
<input type="hidden" value="saveContactDetails" id="hiddenUserId" name="action">
<input type="hidden" value="newclient" id="hiddenUserId" name="page">
  <br><br>
  <input type="submit"  class="btn btn-primary" id="contactUpdate" value="Update" name="contactUpdate">

 <!--  <button  class="btn btn-primary" id="contactUpdate">Update</button>  -->
	<button type="reset"  class="btn btn-primary" id="reset">Reset</button>
    

  </div>
 </div>
</div>
 </form>
    <%
	}
}
else{
%>
<form action="ComProfileServlet" method="POST">
   <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
          <span class="glyphicon glyphicon-plus"></span>
          Contact Us
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse">
      <div class="panel-body">

  
  <div class="row">
  <div class="col-sm-6">
  
   <div class="form-group">
    <label for="location">Contact No.:</label>
    <input type="number" class="form-control" id="contactno"  name="contactNo" placeholder="Enter Contact No." max="9999999999" required>
  </div>
</div>
</div>
 <div class="row">
  <div class="col-sm-6">
<div class="form-group">
    <label for="location">Email ID:</label>
    <input type="email" class="form-control" id="emailid" name="emailId"  placeholder="Enter Email Address" required>
  </div>
  </div></div>

 <div class="row">
  <div class="col-sm-6">
  <div class="form-group">
    <label for="location">Website:</label>
    <input type="url" class="form-control" id="website" name="website"  placeholder="Enter Website Name" required>
  </div>
</div></div>
  
<div class="form-group">
  <label for="aboutcompany">About Company:</label>
  <textarea class="form-control" rows="2" id="companyDetails" name="companyDetails"  placeholder="Enter company details" required></textarea>
</div> <br><br>
  <input type="hidden" value="<%=session.getAttribute("userId")%>" id="hiddenUserId" name="userId">
<input type="hidden" value="saveContactDetails" id="hiddenUserId" name="action">
<input type="hidden" value="newclient" id="hiddenUserId" name="page">
  <br><br>
  <input type="submit"  class="btn btn-primary" id="contactUpdate" value="Update" name="contactUpdate">

	<button type="reset" class="btn btn-primary" id="reset">Reset</button>
    

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
 </div>
 
<center><b> After Filling All Data &nbsp;<a href="signUp.jsp"   id="submit12">Click Here</a> </b></center>
</div>


</body>
</html>
