<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="<spring:theme code='stylesheet'/>" type="text/css"/>
<p>
<a href="/getAdmissionForm?siteTheme=green">Green</a>|
<a href="/getAdmissionForm?siteTheme=red">Red</a>
</p>


<h1> ${HEADERNAME}</h1>
<h2> <spring:message code="label.welcome"></spring:message></h2>
<form:errors path="student.*"></form:errors>
<form action="/submitAdmissionForm" method="POST">
<p><spring:message code="label.studentName"></spring:message>
 <input type="text" name="studentName"  />
</p>

<p><spring:message code="label.studentHobby"></spring:message>
<input type="text" name="studentHobby"  />
</p>

<p><spring:message code="label.studentMobile"></spring:message>
. <input type="text" name="studentMobile"/>
</p>
<p><spring:message code="label.DOB"></spring:message>
 <input type="text" name="DOB"/>
</p>
<p><spring:message code="label.studentSkills"></spring:message>
<select name="studentSkills" multiple>
				<option value="eng">Eng.</option>
				<option value="Maths">Maths</option>
				<option value="Java">Java</option>
				<option value="DB">DB</option>
				</select>
</p>

<h5><spring:message code="label.Address"></spring:message></h5>
<p><spring:message code="label.address.country"></spring:message>
 <input type="text" name="address.country"  />
</p>

<p><spring:message code="label.address.city"></spring:message>
 <input type="text" name="address.city"  />
</p>
<p><spring:message code="label.address.street"></spring:message>
 <input type="text" name="address.street"/>
</p>
<p><spring:message code="label.address.pincode"></spring:message>
 <input type="text" name="address.pincode"/>
</p>




<input type="submit" value="label.submit"/>
</form>

</body>
</html>