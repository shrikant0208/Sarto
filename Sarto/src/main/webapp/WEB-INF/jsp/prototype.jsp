<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="${pageContext.request.contextPath}/master/header.jsp" />

<link
	href="${pageContext.request.contextPath}/resources/css/sarto/sidebar.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sarto/custom.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/sarto/sidebar.js"></script>
</head>


<body>

		<div class="main_container">

			<div class="top_nav">
				<jsp:include page="${pageContext.request.contextPath}/sarto/sidebar.jsp" />
				
			</div>
			
			<div class="banner">
				
					<jsp:include page="${pageContext.request.contextPath}/sarto/banner.jsp" />
			</div>

			
				<div class="right_col" role="main">
					<div id="pageContent">
						
					</div>
				</div>
			
		</div>

</body>
</html>







<!-- down vote
var sizeFooter = function(){
    $(".webfooter").css("padding-bottom", "0px").css("padding-bottom", $(window).height() - $("body").height())
}
$(window).resize(sizeFooter); -->