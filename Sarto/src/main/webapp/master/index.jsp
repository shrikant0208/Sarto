

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<jsp:include page="${pageContext.request.contextPath}/master/header.jsp" />
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- top navigation -->
			<div id="tophead" class="top_nav">
				<jsp:include
					page="${pageContext.request.contextPath}/master/banner.jsp" />
			</div>

			<div id="sidebarScroll" class="col-md-3 left_col">
				<jsp:include
					page="${pageContext.request.contextPath}/master/SideBar.jsp" />
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<div class="right_col" role="main">
					<div class="col-md-12 col-sm-12 col-xs-8">
						<%-- 	<jsp:include page="common_menu.jsp" /> --%>
					</div>
					<hr>
					<br />

					<!-- dynamic page -->
					<div id="pageContent">
						<div class="row" style="height: 500px;">
							<div id="body" class="well well-lg">
								<center>
									<h1>Welcome to LDRL</h1>
								</center>
							</div>
						</div>
					</div>
					<!-- dynamic page end -->
				</div>
			</div>


		</div>

	</div>

	<%-- 	<jsp:include page="${pageContext.request.contextPath}/master/footer.jsp" /> --%>
</body>

</html>