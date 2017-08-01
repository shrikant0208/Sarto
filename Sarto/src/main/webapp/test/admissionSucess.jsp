<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome on success page</title>
</head>
<body>
 <h1>${HEADERNAME}</h1>
<table>
<tr>
<td>Student Name : </td>
<td>${student.studentName}</td>
</tr>
<tr>
<td>Student Hobby : </td>
<td>${student.studentHobby}</td>
</tr>
<tr>
<td>Student Phn No. : </td>
<td>${student.studentMobile}</td>
</tr>
<tr>
<td>Student DOB : </td>
<td>${student.DOB}</td>
</tr>
<tr>
<td>Student Skills : </td>
<td>${student.studentSkills}</td>
</tr>

<tr><td>
Student Address:</td></tr>

<tr>
<td>Student Country : </td>
<td>${student.address.country}</td>
</tr>
<tr>
<td>Student City. : </td>
<td>${student.address.city}</td>
</tr>
<tr>
<td>Student Street : </td>
<td>${student.address.street}</td>
</tr>
<tr>
<td>Student Pincode : </td>
<td>${student.address.pincode}</td>
</tr>


</table>
</body>
</html>