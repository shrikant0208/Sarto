<style>
 #mcubebanner ul li a{
    margin-bottom: 0px;
    padding-top: 1px;
    padding-bottom: 1px;
}

#mcubebanner .dropdown-menu  li a{
    margin-bottom: 0px;
    padding-top: 10px;
    padding-bottom: 10px;
} 
.serachbox {
    width: 20%;
    float: left;
    display: block;
    }

.searchbutton{
	margin-top: 0px;
    padding-right: 4px;
    padding-left: 3px;
    margin-bottom: 0px;
    margin-right: 0px;
}


</style>

<script>
$(function() {
	
	var customerName= "<%=session.getAttribute("Username")%>";
	
	var customerrole= "<%=session.getAttribute("role")%>";
	if(customerrole !='admin' && customerrole != 'super admin'){
		$("#create").hide();
	}
	else{
		$("#create").show();
	}
	
	var time=localStorage.getItem(customerName+".loggedtime");
	var date=localStorage.getItem(customerName+".loggedDate");
	/* date =date.replace("\"","");
	time =time.replace("\"",""); */
	$("#date").text(date);
	$("#time").text(time);
	
	$("#logout").click(function() {

		$.ajax({
			type : "POST",
			url : "/logout",
			data : {},			
			success : function(data) {
				/* alert(data.length); */
				var path="${pageContext.request.contextPath}";
				$(location).attr("href",path.concat("/")); 
				
				localStorage.removeItem(customerName);
				localStorage.removeItem(customerName+".categoryAll");
				localStorage.removeItem(customerName+".categoryMT");
				localStorage.removeItem(customerName+".channelMT");
				localStorage.removeItem(customerName+".startDateMT");
				localStorage.removeItem(customerName+".endDateMT");
				localStorage.removeItem(customerName+".fromCycleMT");
				localStorage.removeItem(customerName+".toCycleMT");
				localStorage.removeItem(customerName+".productGroupMT");
				localStorage.removeItem(customerName+".category");
				localStorage.removeItem(customerName+".channel");
				localStorage.removeItem(customerName+".startdate");
				localStorage.removeItem(customerName+".enddate");
				localStorage.removeItem(customerName+".radiorange");
			}
			
		})
		
	});
	
	
	});	

$(window).scroll(function(){
	  var sticky = $('#tophead'),
	      scroll = $(window).scrollTop();

	  if (scroll >= 2) sticky.addClass('fixed');
	  else sticky.removeClass('fixed');
	});
</script>
<!-- <style type="text/css">
#banner {
	padding: inherit;
	width: 1104px;
}
</style> -->
<style type="text/css">
#logo {
	padding-left: 33px;
	background-color: white;
	/*  border-style: groove; */
}
</style>
              <!-- header -->
              
        <div class="nav_menu" style=" margin-bottom: 0px;">
                    <nav class="" role="navigation">
                     <%--    <div class="nav toggle">
                           
                            
                            <a id="menu_toggle"
				href="${pageContext.request.contextPath}/master/index.jsp"><img
				src="${pageContext.request.contextPath}/resources/images/mcube/mcubelogosmall.png" /></a>
                            
                         
                        </div> --%>
                        <div class="col-md-3" style="
    padding-left: 0px;
">
	<div class="profile">
		<div class="nav_profile" id="logo" style="padding-right: 0px;padding-left: 0px;">
			<a id="menu_toggle"
				href="${pageContext.request.contextPath}/master/index.jsp"><img
				src="${pageContext.request.contextPath}/resources/images/mcube/mcubelogosmall.png" /></a>
			<!-- <span>Welcome,  Anthony Fernando</span>  -->
		</div>
	</div>
</div>	

<div class="col-md-3 serachbox " >
				 <div class="input-group">
					<input type="text" class="form-control"
						placeholder="Search...">  <span
						class="input-group-btn"> 
						<button class="btn btn-default searchbutton" type="button" "   style="border-radius: 3px;">Go!</button> 
					</span>
				</div> 
	</div>
			

                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                               <span style="color: black;"> Hi, <label id="user"></label>! </span>  <img src="${pageContext.request.contextPath}/resources/images/mcube/face.png" > 
                                
                                </a>
                                
                            </li>

                            <li role="presentation" class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                   <img src="${pageContext.request.contextPath}/resources/images/mcube/admin.png" />
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                   <li><a href="${pageContext.request.contextPath}/crawler/Mcube.jsp" id="account">Setup Marketplace Account</a></li>
									<li class="divider"></li>
									 <li><a href="${pageContext.request.contextPath}/crawler/setupProductNLC.jsp" id="products">Setup Products</a></li>
									<li class="divider"></li>
									 <li><a href="${pageContext.request.contextPath}/crawler/executionProduct.jsp" id="execution">Execution</a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/master/RegisterPageUser.jsp" id="create">Create User</a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/admin/amdprofile.jsp">Profile</a></li>
                                </ul>
                            </li>

							<li role="presentation" class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                   <img src="${pageContext.request.contextPath}/resources/images/mcube/support.png" />
                                </a>
                            </li>
                        </ul>
                  
                    </nav>
                </div>
              
              
              
              
	<div class="col-xs-12 .col-sm-6 .col-md-8" id="mcubebanner" style="padding-left: 0px;padding-right: 0px;">
							
		 <div class="nav navbar-nav nav-colour" >
		 <ul class="nav navbar-nav " style=" margin-left: 5px;margin-right: 5px;">
			 		 <li class="dropdown"><a href="${pageContext.request.contextPath}/crawler/priceIntelligence.jsp" >PRICE INTELLIGENCE<b></b></a>
					</li>
					
					<li class="dropdown"><a href="#" class="dropdown-toggle mcube"
					  data-toggle="dropdown" >RECOMMENDED PRICES
					   <b></b></a>
					</li> 
					
					<li class="dropdown" style="float:right;"><a href="#" class="dropdown-toggle"
					  data-toggle="dropdown" id="logout">LOGOUT <b></b></a>
					   <%--  <img src="${pageContext.request.contextPath}/resources/images/mcube/logout.png" /> --%>
					</li>
					
					<%-- <li class="dropdown" style="float:right;"><a href="#" class="dropdown-toggle" data-toggle="dropdown">ADMIN<b
						class="caret"></b></a>
					<ul class="dropdown-menu">
					<li><a href="${pageContext.request.contextPath}/crawler/Mcube.jsp" id="account">Account Setup</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/master/RegisterPageUser.jsp" id="create">Create User</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/admin/amdprofile.jsp">Profile</a></li>
						<li class="divider"></li>
					</ul></li>  --%>
		</ul> 
		</div>	 
										 
	</div>
               <!-- /end header -->




<%-- <div class="nav_menu">


		<div class="nav navbar-nav nav-colour" style="float: right;">
		<ul class="nav navbar-nav navbar-left">
				 <li class="dropdown"><a href="#" class="dropdown-toggle"
					  data-toggle="dropdown">FAQs <b
						 ></b></a>
					</li>
					
						<li class="dropdown"><a href="#" class="dropdown-toggle"
					  data-toggle="dropdown">Support/Chat <b
						 ></b></a>
					</li>
					
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
					
						<li><a href="${pageContext.request.contextPath}/master/RegisterPageUser.jsp" id="create">Create User</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/admin/amdprofile.jsp">Profile</a></li>
						<li class="divider"></li>
						
						<!-- <li><a href="mappresence.jsp">MAP Presence</a></li>
						<li class="divider"></li> -->
						<li><a href="${pageContext.request.contextPath}/admin/amdcategory.jsp">Category</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/admin/amdchannel.jsp" >Channel</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/admin/amdproducts.jsp">Products</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/admin/amdipc.jsp">IPC</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/admin/amdprofile.jsp">Profile</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/admin/amdcompetitor.jsp">Competitor</a></li>
						<li class="divider"></li>
						<li><a href="http://192.168.13.184:2551/product_count_report.html" target="_blank">Products Crawled</a></li>
						<li class="divider"></li>
						<li><a href="http://172.29.55.55:8080/reinlabs_mario" target="_blank">Mario</a></li>
					</ul></li>
				
				
				<a href="#" class="dropdown-toggle"
					  data-toggle="dropdown" id="logout"><img src="${pageContext.request.contextPath}/resources/images/rsz_1logout_button.png" />
					
					  </a>
				
					<li class="dropdown"><a href="#" class="dropdown-toggle"
					  data-toggle="dropdown" id="logout">Logout <b></b></a>
					</li>
			</ul> 
</div>
		
 <div class="nav navbar-nav navbar-centre"> 
<div class="col-md-12" style="
    padding-left: 0px;
">


<div class="col-md-3" style="
    padding-left: 0px;
">
	<div class="profile">
		<div class="nav_profile" id="logo" style="padding-right: 0px;padding-left: 0px;">
			<a id="menu_toggle"
				href="${pageContext.request.contextPath}/master/index.jsp"><img
				src="${pageContext.request.contextPath}/resources/images/mcubelogo1.png" /></a>
			<!-- <span>Welcome,  Anthony Fernando</span>  -->
		</div>
	</div>
</div>	

			<div class="col-md-3 col-sm-5 col-xs-12 form-group pull-center top_search">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Search not operational..."> <span
						class="input-group-btn">
						<button class="btn btn-default" type="button"  style="margin-top: 0px;  margin-left: 0px;" >Go!</button>
					</span>
				</div>
			</div>
			
			<div class="col-md-4" style="
    padding-top: 45px;
    padding-left: 10px;
">
		<h2>support: help@retailtao.com  or 981 999 4356</h2>
</div>
		
		<div class="col-md-2" style="float:right;">
		<h3>  Hi, <label id="user"></label>!</h3>
		
		</div>
		 	<!-- <div class="col-md-9">
			<div class="col-md-9">
				<h3>   Welcome <label id="user"></label>!
					logged in at 
					<label id="date"></label>
					,
					<label id="time"></label>
				</h3>
			</div>
			<div class="col-md-2">&nbsp</div>

			<div class="col-md-3 col-sm-5 col-xs-12 form-group pull-right top_search">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Search not operational..."> <span
						class="input-group-btn">
						<button class="btn btn-default" type="button">Go!</button>
					</span>
				</div>
			</div>

		</div>  -->

	<div class="col-md-12" id="mcubebanner" style="padding-left: 0px;">
							  
		<div class="nav navbar-nav nav-colour" >
		 <ul class="nav navbar-nav ">
			 		<li class="dropdown"><a href="#" class="dropdown-toggle mcube"
					  data-toggle="dropdown" >PRICE INTELLEGENCE <b></b></a>
					</li>
					
					<li class="dropdown"><a href="#" class="dropdown-toggle mcube"
					  data-toggle="dropdown" >RECOMMENDED PRICES
					   <b></b></a>
					</li> 
					
					<li class="dropdown" style="float:right;"><a href="#" class="dropdown-toggle"
					  data-toggle="dropdown" id="logout">LOGOUT <b></b></a>
					</li>
					
					<li class="dropdown" style="float:right;"><a href="#" class="dropdown-toggle" data-toggle="dropdown">ADMIN<b
						class="caret"></b></a>
					<ul class="dropdown-menu">
					<li><a href="${pageContext.request.contextPath}/crawler/Mcube.jsp" id="account">Account Setup</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/master/RegisterPageUser.jsp" id="create">Create User</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/admin/amdprofile.jsp">Profile</a></li>
						<li class="divider"></li>
					</ul></li>
		</ul> 
		</div>	
										 
	</div>

</div>					
		

		<div class="col-md-8" id="banner">
			<jsp:include page="${pageContext.request.contextPath}/master/common_menu.jsp" />
		</div>
	<!-- </div> -->


	<div class="col-md-12 col-sm-12 col-xs-8">
						<jsp:include page="common_menu.jsp" />
					</div>
</div>
</div> --%>
