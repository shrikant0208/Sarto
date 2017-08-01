<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link
	href="${pageContext.request.contextPath}/resources/css/RegistartionStyle.css"
	rel="stylesheet" type="text/css">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/toaster/toaster.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/toaster/toaster.css" />
<title>Registration</title>
<script>
$(document).ready(function() { 
	/* $("#trendedtarget").empty();
	 $("input.productcheck").attr('disabled','disabled'); 
	 $('#profile-tab').click(function() {

		    document.getElementById("from").disabled = true;
		    document.getElementById("to").disabled = true;
		    
	 }); */
	/* var channelName ="";
	var category = "";
	var startDate = "";
	var endDate = "";
	var productGroup = "";
	 var dataObj={}; */
	 
function toast(msg){
		/* alert(msg); */
		var yourText = msg,
        toastMessageSettings = {
            text: yourText,
            sticky: false,
            position: 'top-right',
            type: 'success',
            closeText: '',
           
        };
		
		$().toastmessage('showToast', toastMessageSettings);
		}
	 		 
	$("#btnReg").click(function(e) {

		 e.preventDefault(); 
		/* alert("sds");  */
	  var call =true;
	  var firstname = document.getElementById('First_Name');
	  var lastname = document.getElementById('Last_Name');
	  var password = document.getElementById('Password');
	  var email = document.getElementById('Email_Address');
	  var username = document.getElementById('User_Name');
	  var confirmpassword = document.getElementById('Confirm_Password');
	  var firstnamevalue = firstname.value.trim();
	  var lastnamevalue = lastname.value.trim();
	  var passwordvalue = password.value.trim();
	  var confirmpasswordvalue = confirmpassword.value.trim();
	  var usernamevalue = username.value.trim();
	  var emailvalue = email.value.trim();
	  var tc = document.getElementById('Tcc');
	 
	 
	 
	  if (firstnamevalue == '') {
		 
		  call=false;
		 
		  shake(firstname);
		 /*  alert("sdsa"); */
	    }
	    else {
	    	firstname.style.backgroundColor = null;
	    }
	  if (lastnamevalue == '') {
		  shake(lastname);
		  call=false;
	    }
	    else {
	    	lastname.style.backgroundColor = null;
	    }
	  if (emailvalue == '') {
		  shake(email);
		  call=false;
	    }
	    else {
	    	email.style.backgroundColor = null;
	    }
	  if (usernamevalue== '') {
		  shake(username);
		  call=false;
	    }
	    else {
	    	username.style.backgroundColor = null;
	    }
	  if (passwordvalue == '') {
		  shake(password);
		  call=false;
   		 }
    else {
        password.style.backgroundColor = null;
   		 }
	  if (confirmpasswordvalue == '') {
		  shake(confirmpassword);
		  call=false;
   		 }
    else {
        confirmpassword.style.backgroundColor = null;
   		 }
	  if (!isEmail(emailvalue)) {
		  email.value="";
		  shake(email);
		  $("#Email_Address").attr("placeholder", "Enter valid Email id");
		  call=false;
   		 }
    else {
        confirmpassword.style.backgroundColor = null;
   		 }
	  
	  function shake (element){
		  element.style.backgroundColor = '#ffe8e6';
		  element.classList.add('errorr');
	        setTimeout(function() {
	        	element.classList.remove('errorr');
	        }, 300);     
	        e.preventDefault();
	  }
	  function shake1 (element){
		  element.style.backgroundColor = '#ff4c4c';
		  element.classList.add('errorr1');
	        setTimeout(function() {
	        	element.classList.remove('errorr1');
	        }, 300);     
	        e.preventDefault();
	  }
	  function isEmail(emailvalue) {
		  var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
		  if (filter.test(emailvalue)) {
			
		  return true;
		  }
		}
		var dataObj={};
	 
	  if (passwordvalue!=confirmpasswordvalue)
		  {
		  shake(password);
		  shake1(confirmpassword);
		  password.value="";
		  confirmpassword.value="";
		  call=false;
		  }
	  	/* if(!$('#TC').is(":checked"))
	  		{
	  		tc.classList.add('blink');
	         setTimeout(function() {
	        	element.classList.remove('blink');
	        }, 500); 
	         e.preventDefault();
	  		call=false;
	  		 $("#Tcc").css("font-weight",""); 
	  		} */
	  		 
	  		/* alert(call); */
	if(call==true)
		{
	  dataObj["name"]=firstnamevalue +" "+lastnamevalue; 
	  dataObj["password"]=passwordvalue;
	  dataObj["loginName"]=usernamevalue;
	  dataObj["role"]="admin";
	  dataObj["email"]=emailvalue;
	  dataObj["active"]=0;
	 /*  alert("sds3"); */
		/*  alert(JSON.stringify(dataObj));  */
	 var data={};
	 data=JSON.stringify(dataObj);
	/*  alert(data); */
		$.ajax({
			type : "POST",
			url : "/registerUser",
			data :data,
			 contentType: "application/json",
	         async: false,
			success : function(data) {
				/* alert("sds4"); */
				                toast("REGISTRATION SUCCESSFUL"); 						 		
						 		
						 		setTimeout(function() {
						 			  window.location.href = "${pageContext.request.contextPath}/";
						 			}, 3000);
						  
					 } 

				}) 
		
				/* alert("sds4"); */
				
		}

		
	
		  
	});
});
</script>
</head>
<body>
	<!--start-login-form-->
	<div class="main">
		<div class="login-head">
			<!---728x90--->
			<div style="text-align: center;">
				<ins style="display: inline-block; width: 728px; height: 90px"></ins>
			</div>

		</div>


		<div class="wrap">
			<div class="Regisration">
				<div class="Regisration-head">
					<h2>
						<span></span>Register
					</h2>
				</div>
				<form>
					<table>
						<tr>
							<td><label style="padding-left: 5%;">First Name : </label></td>
							<td><input type="text" id="First_Name" autofocus
								placeholder="First Name" onfocus="this.value = &#39;&#39;;">
								<label id="Fname" style="color: red;"></label></td>
						</tr>
						<tr>
							<td><label style="padding-left: 5%;">Last Name :</label></td>
							<td><input type="text" id="Last_Name"
								placeholder="Last Name" onfocus="this.value = &#39;&#39;;"><label
								id="Lname" style="color: red"></label></td>
						</tr>
						<tr>
							<td><label style="padding-left: 5%;">Email :</label></td>
							<td><input type="text" id="Email_Address"
								placeholder="Email Address" onfocus="this.value = &#39;&#39;;">
								<label id="Email" style="color: red"></label></td>
						</tr>
						<tr>
							<td><label style="padding-left: 5%;">Username :</label></td>
							<td><input type="text" id="User_Name"
								placeholder="User Name" onfocus="this.value = &#39;&#39;;">
								<label id="Uname" style="color: red"></label></td>
						</tr>
						<tr>
							<td><label style="padding-left: 5%;">Password :</label></td>
							<td><input type="password" id="Password"
								placeholder="Password" onfocus="this.value = &#39;&#39;;">
								<label id="Pw" style="color: red"></label></td>
						</tr>
						<tr>
							<td><label style="padding-left: 5%;">Confirm
									Password :</label></td>
							<td><input type="password" id="Confirm_Password"
								placeholder="Confirm Password"
								onfocus="this.value = &#39;&#39;;"> <label id="Cpw"
								style="color: red"></label></td>
						</tr>
					</table>
					<div class="Remember-me">
						<div class="p-container">
							<%-- <label id="Tcc"><input id="TC" type="checkbox" name="checkbox" checked><i></i>I
								agree to the <a
								href="${pageContext.request.contextPath}/master/TermsAndCondition.jsp">Terms
									and Conditions</a></label> --%>
							<div class="clear"></div>
						</div>

						<div class="submit">
							<input type="image" id="btnReg" name="btnReg"
								src="${pageContext.request.contextPath}/resources/images/register.jpg" />
							<!-- 	<input type="button" id="submit" value="Sign Up "> -->
						</div>
						<a href="${pageContext.request.contextPath}/"
							style="position: relative; left: -2%;"> Back to Login </a>
						<div class="clear"></div>

					</div>

				</form>
			</div>
			<!---728x90--->
		</div>


	</div>
	</div>
	<!---728x90--->
	<div style="text-align: center;"></div>
	<!--//End-login-form-->






</body>
</html>