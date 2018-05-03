<!DOCTYPE html>

<html lang="en">
<head>
  <title>Sign Up</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="Bootstrap/font-awesome.min.css">
  <script src="Bootstrap/jquery.min.js"></script>
  <script src="Bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="Bootstrap/css/bootstrap.css">

  <!-- <style type="text/css">
   body { background: black; }
   <style> -->
   
   
  <script> 
   function validator()
{

  

   var emailID = document.myForm.email.value;
   atpos = emailID.indexOf("@");
   dotpos = emailID.lastIndexOf(".");
   if(emailID=="")
   {
  		 alert( "please provide email ID" );
           document.myForm.email.focus() ;
           return false;       
    }
   if (atpos < 1 || ( dotpos - atpos < 2 )) 
   {
      alert("Please enter correct email ID.")
      document.myForm.email.focus() ;
      return false;
   }
  
 
 
  
}
   </script>
<!--<script>
$(document).ready(function(){
	$("#create").click(function(){
var eId=$("#emailid").val();
var uName=$("#username").val();
var pWord=$("#password").val();
var cPassword=$("#confirmpassword").val();
var uType=$('input:radio[id="looking_for"]:checked').val();
var action="signup";
$.ajax({
	  url: 'SignUpServlet',
	  type: 'POST',
	  data: {eId:eId,uName:uName,pWord:pWord,cPassword:cPassword,uType:uType,action:action},
	  success: function(data) {
		location.href="CandidateProfileJsp.jsp";  
	  },
	  error: function(e) {
	  }
	});
	});
	$("#login").click(function(){
		var loginName=$("#loginUsername").val();
		var loginPassword=$("#loginPassword").val();
		var action="login";
		$.ajax({
			  url: 'SignUpServlet',
			  type: 'POST',
			  data: {loginName:loginName,loginPassword:loginPassword,action:action},
			  success: function(data) {
				location.href="UserHomeJsp.jsp";  
				//alert("successfully");
			  },
			  error: function(e) {
				  alert("Username Password combination is wrong");
					location.href="SignUpJsp.jsp";						  
			  }
			});
			});
});

</script>


  -->
  
  <script>
  $(document).ready(function(){
	  
	  var flag=$("#flag").val();
	  var flag1=1;
	  var flag2=2;
	  if(flag.match(flag1)&&flag==flag1)
		  {
		  alert("Your Registration Request Is Still Pending!!! Please Try Again Later...");
		  }
	  if(flag.match(flag2)&&flag==flag2)
	  {
		  alert("Invalid Username And Password!!!");
	  }
	  
	  
	    $("#confirmpassword").keyup(function(){
	var pwd=$("#password").val();
	var cpwd=$("#confirmpassword").val();
	if(pwd.match(cpwd)&&pwd==cpwd )
	{
	        $("#checkPassword").text("Password Match!");}
	else
	 {
	$("#checkPassword").text("Password Not Match!");}
	    });
	});

  
  </script>
  </head>
<body>
<%
if(session.getAttribute("flag")==null)
{
%>
<input type="hidden" value="0" id="flag">
<%}
else
{
%>
<input type="hidden" value="<%=session.getAttribute("flag") %>" id="flag">

<%}
%>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     <!--<img src="logo1.jpg" class="img-rounded" alt="Cinque Terre" width="200" height="50">
    -->
   <h1  style="size: xx-large; font-family: cooper; color:blue;"><b> Pro-Interns</b> </h1>
    <h3 style="size: xx-large; font-family: cooper; color:yellow;"><b>We provide you value and services</b> </h3>
    </div>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li>
        <div class="col-sm-6">
        </div>
        <div class="col-sm-5">
        <form action="SignUpServlet" method="post">
            <div class="row">
                    <div class="col-sm-5">
                        <label for="email" style="color: white;">Email Id:</label>
			<label for="pwd" style="color: white;">Password:</label>
	                   </div>
                    <div class="col-sm-5">
        <input type="email" id="loginUsername" name="luserName" placeholder="Enter Email Id" required>              
    <input type="password"  id="loginPassword" name="lpassWord" placeholder="Enter password" required>
  </div>
            </div>
			
        <button class="btn btn-primary btn-sm" id="login" name="action" value="login"><span class="glyphicon glyphicon-log-in"></span> <b>Login</b></button>
		</form>
		<div>
		<font color="red" id="msgStatus"></font>
		</div>
		</div>
    </li>
      </ul>
    </div>
    </div>
</nav>
 

<br><br><br><br><br>

<div class="row">
  <div class="col-sm-3"></div>
  <div class="col-sm-6"> 
<div id="p" class="container-fluid">
<div class="jumbotron">
    <form role="form"  name="myForm" action="SignUpServlet" method="post" onsubmit="return validator();">
	<h2><b>Sign Up</b></h2>
	<br>
	
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="text" name="emailName" id="email" class="form-control" id="emailid" placeholder="Enter email" required>
  </div>
  
  <div class="form-group">
    <label for="username">Username:</label>
    <input type="text" name="userName" class="form-control" id="username" placeholder="Username" required>
  </div>
  
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" name="passWord" class="form-control" id="password" placeholder="Password" required>
  </div>
  <div class="form-group">
    <label for="confirmpwd">Confirm Password:</label>
    <input type="password" name="cPassWord" class="form-control" id="confirmpassword" placeholder="Confirm Password" required>
  	<font color="red"><label id="checkPassword"></label></font>
    
  </div> 
   
  <center><h2>I want to</h2>
    <br>

<span class="btn-group" >
                            <label class="btn btn-primary">
                                <input type="radio" name="usertype" id="looking_for" value="Client" data-role="none" required> Hire
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="usertype" id="looking_for" value="Candidate" data-role="none" required> Work
                            </label>
                        </span>
  <br><br>
<button class="btn btn-success btn-lg" id="create" name="action" value="signUp">Create Account</button></center>
</form>
  </div>
  </div>
 </div>
</div>


 

</body>
</html>
