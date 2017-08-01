<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<jsp:include page="${pageContext.request.contextPath}/master/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sarto/registration.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <h1 class="well">Registration Form</h1>
	<div class="col-lg-12 well">
	<div class="row">
	
				<form action="/submitUserApplication" method="POST">
					<div class="col-sm-12">
					
						<div class="row">
							<div class="col-sm-6 form-group">
								<spring:message code="label.UserFirstName"></spring:message>
								<input type="text" name="firstName" placeholder="Enter First Name Here.." class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<spring:message code="label.UserLastName"></spring:message>
								<input type="text" name="lastName" placeholder="Enter Last Name Here.." class="form-control">
							</div>
						</div>					
						<div class="form-group">
							<spring:message code="label.UserAddress"></spring:message>
							<textarea placeholder="Enter Address Here.." name="address.location" rows="3" class="form-control"></textarea>
						</div>	
						<div class="row">
							<div class="col-sm-4 form-group">
							<spring:message code="label.UserCity"></spring:message>
								<input type="text"  name="address.city" placeholder="Enter City Name Here.." class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<spring:message code="label.UserState"></spring:message>
								<input type="text" placeholder="Enter State Name Here.." name="address.state" class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<spring:message code="label.UserPincode"></spring:message>
								<input type="text" placeholder="Enter Zip Code Here.." name="address.pincode" class="form-control">
							</div>		
						</div>
									
					<div class="form-group">
					<spring:message code="label.UserContactNumber"></spring:message>
						<input type="text" placeholder="Enter Phone Number Here.."  name="contactNumber" class="form-control">
					</div>		
					<div class="form-group">
						<spring:message code="label.UserEmailId"></spring:message>
						<input type="text" placeholder="Enter Email Address Here.."  name="emailId" class="form-control">
					</div>	
					
					<input type="submit" value="submit" class="btn btn-lg btn-info"/>
					</form>				
					</div>
				
				</div>
	</div>
	</div>
</body>
</html>