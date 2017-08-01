<link
	href="${pageContext.request.contextPath}/resources/css/sarto/custom.css"
	rel="stylesheet">
<div class="nav_menu" style="margin-bottom: 0px;">
	<nav class="" role="navigation">

     <div class="col-md-4" style="
    padding-left: 0px;
">
	<div class="profile">
		<div class="nav_profile" id="logo">
			<img src="${pageContext.request.contextPath}/resources/images/sarto/sarto_logo.png" id="sLogo" />
			<img src="${pageContext.request.contextPath}/resources/images/sarto/sarto_caption.png" id="sCaption"/></a>
			<!-- <span>Welcome,  Anthony Fernando</span>  -->
		</div>
	</div>
</div>

		<div class="col-md-3">
			 <div class="input-group">
	 
				<span class="input-group-btn">
					<h3>Welcome User</h3>
				</span>
				
			</div>
		</div>


		<ul class="nav navbar-nav navbar-right">
			<%-- <li class=""><a href="javascript:;"
				class="user-profile dropdown-toggle" data-toggle="dropdown"
				aria-expanded="false"> <span style="color: black;"> Hi, <label
						id="user"></label>!
				</span> <img
					src="${pageContext.request.contextPath}/resources/images/mcube/face.png">

			</a></li> --%>

			<li class=""><a href="javascript:;"
				class="user-profile dropdown-toggle" data-toggle="dropdown"
				aria-expanded="false"> <span style="color: black;"> Hi, <label
						id="user"></label>!
				</span> <img
					src="${pageContext.request.contextPath}/resources/images/mcube/face.png">

			</a>
				<ul
					class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
					<li><a
						href="${pageContext.request.contextPath}/crawler/Mcube.jsp"
						id="account">Setup Marketplace Account</a></li>
					<li class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath}/crawler/setupProductNLC.jsp"
						id="products">Setup Products</a></li>
					<li class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath}/crawler/executionProduct.jsp"
						id="execution">Execution</a></li>
					<li class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath}/master/RegisterPageUser.jsp"
						id="create">Create User</a></li>
					<li class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/amdprofile.jsp">Profile</a></li>
				</ul></li>

		</ul>

	</nav>
</div>
