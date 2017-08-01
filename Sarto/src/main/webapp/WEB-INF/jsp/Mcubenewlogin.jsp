

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/toaster/toaster.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/toaster/toaster.js"></script> --%>
<jsp:include page="${pageContext.request.contextPath}/master/header.jsp" />
<script>
	$(function() {
		$("#loginButton").click(function(event) {
							event.preventDefault();
							$.ajax({
										type : "POST",
										url : "/login",
										data : {
											username : $("#user").val(),
											password : $("#pass").val()
										},

										success : function(data) {
											var path = "${pageContext.request.contextPath}";

											//console.log("login")
										//alert(JSON.stringify(data));

											if (data == "") {
												//alert("invalid")
												$("#error").text("* Invalid Username or Password");
											} else {
												var customerName = data[0].customerName 
												$.ajax({
													type : "GET",
													url : "/datetimereturn",
													//data : customerName,
													contentType: "application/json",
													 //dataType: 'text json',
						   // dataType: 'json',
													success : function(data) {
														
															var dateTime=JSON.stringify(data.date);
															
															var arr=dateTime.split("at");
															//alert(dateTime);
															var date =arr[0].toString().replace("\"", '');
															
															var time =arr[1].toString().replace("\"", '');
															
														localStorage.setItem(customerName+".loggedtime",time);
														localStorage.setItem(customerName+".loggedDate",date);

													},
													error :function(data) {				
														var dateTime=JSON.stringify(data.date);
														
														var arr=dateTime.split("at");
														//alert(dateTime);
														var date =arr[0];
														
														var time =arr[1];
														
													localStorage.setItem(customerName+".loggedtime",time);
													localStorage.setItem(customerName+".loggedDate",date);
															
													}
													
												})
												
												if (data[0].role == "super admin") {
													$(location)	.attr("href",path.concat("/crawler/configuration.jsp"));
																																							
													
						 								
												} else if (data[0].active == 1) {
													var c_id = data[0].customerId;
													var u_id = data[0].id;
													console.log("id  "+u_id);
													$.ajax({
																type : "POST",
																url : "/getLandingPageMcube",
																data : {
																	userId : u_id
																},
																success : function(
																		data) {

																	if (data == 0){
																		
																		if(c_id=='C200000034'||c_id=='C200000025'||c_id=='C200000026'||c_id=='C200000027' || c_id=='C200000028' ||c_id=='C200000029'||c_id=='C200000030'||c_id=='C200000031'||c_id=='C200000032'||c_id=='C200000033'||c_id=='C200000035'  ){
																			$(location).attr("href",path.concat("/returns/displayReportVault.jsp"));
																			
																		}else{
																			$(location).attr("href",path.concat("/crawler/Mcube.jsp"));
																			}
																		
																	}
																									
																	else{
																		//alert("old");"src/main/webapp/crawler/priceRecommendation.jsp"
																		$(location).attr("href",path.concat("/crawler/priceRecommendation.jsp"));
																	}
																	
																}
															})
												} else if (data[0].active == 0) {
												//	$(location)	.attr("href",path.concat("/master/ReglandPage.jsp"));
													$('#InactiveModal').modal('show');
												}
												
												/* if(localStorage.getItem(customerName) == customerName){
												
												}else{
													localStorage.setItem(customerName ,customerName);
													localStorage.setItem(customerName +".categoryAll",null);
													localStorage.setItem(customerName +".categoryMT",null);
													localStorage.setItem(customerName +".channelMT",null);
													localStorage.setItem(customerName +".startDateMT",null);
													localStorage.setItem(customerName +".endDateMT",null);
													localStorage.setItem(customerName +".fromCycleMT",null);
													localStorage.setItem(customerName +".toCycleMT",null);
													localStorage.setItem(customerName +".productGroupMT",null);
													localStorage.setItem(customerName +".category",null);
						 							localStorage.setItem(customerName +".channel",null);
						 							localStorage.setItem(customerName +".startdate",null);
						 							localStorage.setItem(customerName +".enddate",null);
						 							localStorage.setItem(customerName +".radiorange",null);
													
												}
													 */
											}
										}

									})

						});

		function toast(msg, type) {
			var yourText = msg, toastMessageSettings = {
				text : yourText,
				sticky : false,
				position : 'top-right',
				type : type,
				closeText : '',

			};

			$().toastmessage('showToast', toastMessageSettings);
		}
		$("#submitButton")
				.click(
						function(event) {
							event.preventDefault();

							$
									.ajax({
										type : "POST",
										url : "/getPassword",
										data : {
											email : $("#EmailAddress").val()
										},

										success : function(data) {
											var path = "${pageContext.request.contextPath}";

											//alert(JSON.stringify(data));

											if (data == true) {
												toast(
														"Password has been sent on your Email Id",
														"success");
											} else if (data == false) {
												/* alert("df");  */
												toast(
														"Sorry , there is no such account",
														"warning");
											}
										}

									})
							$("#EmailAddress").val("");

						});
		 $(function() {
			 
             if (localStorage.chkbx && localStorage.chkbx != '') {
                 $('#remember-me').attr('checked', 'checked');
                 $('#user').val(localStorage.usrname);
                 $('#pass').val(localStorage.pass);
             } else {
                 $('#remember-me').removeAttr('checked');
                 $('#user').val('');
                 $('#pass').val('');
             }

             $('#remember-me').click(function() {

                 if ($('#remember-me').is(':checked')) {
                     // save username and password
                     localStorage.usrname = $('#user').val();
                     localStorage.pass = $('#pass').val();
                     localStorage.chkbx = $('#remember-me').val();
                 } else {
                     localStorage.usrname = '';
                     localStorage.pass = '';
                     localStorage.chkbx = '';
                 }
             });
         });


	});

	$(document).ready(function() {
		$("#error").empty();
		$("#pass").keyup(function(event){
			
		    if(event.keyCode == 13){
		    	
		        $("#loginButton").trigger('click');
		    }
		});

	});
</script>
<style>
.main{
 	margin-top: 70px;
}

h1.title { 
	font-size: 50px;
	font-family: 'Passion One', cursive; 
	font-weight: 400; 
}

hr{
	width: 10%;
	color: #fff;
}
.input-group {
    margin-top: 3px; 
      /*   border: groove;
    border-radius: 9px;
    border-bottom-width: 0px; */
}
.form-group{
	margin-bottom: 1px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
  /*  -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3); */
  /*   border-bottom: groove;
    border-radius: 9px; */

}

.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 370px;
 	/* margin-left: 1000px; */
   /*  padding: 40px 40px; */

}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}
img {
width:100%;
}

</style>
</head>
<body style="background: #fff;">
<div class="col-md-12">&nbsp;</div>
<div class="col-md-12">&nbsp;</div>
<div class="col-md-12">&nbsp;</div>
<div class="col-md-12">
<div class="col-md-2">&nbsp;</div>
<div class="col-md-3">
<div align="center">
<img alt="" src="${pageContext.request.contextPath}/resources/images/mcube/retail_1.png"> 
</div>
</div>
<div class="col-md-6">
<div class="container">
			<div class="row main">
				
				<div class="main-login main-center">
				<div class="logincls">
					<form class="form-horizontal" method="post" action="#">
						<div class="form-group">
							<!-- <label for="username" class="cols-sm-2 control-label">Username</label> -->
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-users fa" aria-hidden="true"></i> 
									<!-- <img alt="" src="/resources/images/mcube/username.png"
									style="width: 100px; height: 100px;"> -->
									</span>
									<input type="text" class="form-control" name="username" id="user"  placeholder="USERNAME"/>
								</div>
							</div>
						</div>

						<div class="form-group">
						<!-- 	<label for="password" class="cols-sm-2 control-label">Password</label> -->
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-lock fa-lg" aria-hidden="true"></i> 
									<!-- <img alt="" src="/resources/images/mcube/passwrd.png"
									style="width: 100px; height: 100px;"> -->
									</span>
									<input type="password" class="form-control" name="password" id="pass"  placeholder="PASSWORD"/>
								</div>
							</div>
						</div>

					
						<!-- 	<label for="password" class="cols-sm-2 control-label">Password</label> -->
							
									
									
						
						
						
					</form>
					<div class="errordiv" style="padding-top: 4px;">
					<span id="error" class="errormsg"></span>
					</div>
			<!-- 	<div>&nbsp;</div>
					 -->
					
					<div >
									<input type="image" name="loginButton" id="loginButton"
										src="${pageContext.request.contextPath}/resources/images/mcube/login_mcube.png" style="float: right;padding-top: 8px;"/>
									
								</div>
				</div>
				</div>
				
						
		</div>
			</div>
			
</div>
</div>
<%-- <div class="col-md-8">

<img alt="" src="${pageContext.request.contextPath}/resources/images/mcube/retailtao_1.png"> 


</div> --%>

</body>

</html>