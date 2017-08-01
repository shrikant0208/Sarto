<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
 
 <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/toaster/toaster.css" />
	
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-migrate-1.3.0.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
		
	<link
	href="${pageContext.request.contextPath}/resources/css/sarto/custom.css"
	rel="stylesheet">	
		
<script
	src="${pageContext.request.contextPath}/resources/js/toaster/toaster.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/sarto/loginPage.js"></script>
	
 


    
<body>
<form onsubmit="login()" method="post" class="outer">
  <div class="login">
  <%-- <div class=logo><img src="${pageContext.request.contextPath}/resources/images/luminadm_logo.png" style="height: 99%;padding-left: 17%;"></img></div> --%>
  <div class="loginDiv"><img src="${pageContext.request.contextPath}/resources/images/sarto/sarto_logo.png"  />
			<img id="loginCaption" src="${pageContext.request.contextPath}/resources/images/sarto/sarto_caption.png" /></a></div>
	<h1>Login</h1>
    <div>
    	<input type="text" name="uname" id="userid" placeholder="Username" required="required" />
        <input type="password" name="psw" id="pswrd" required placeholder="Password" required="required" />
        <input type="submit" class="btn btn-primary btn-block btn-large" id="form" onclick="login(event)" value="Login"></input>
    </div>
    <div id="error" ><span></span></div>
     
    </form>
</div>
  
  

</body>
</html>