<script>
	function over() {
		$('ul.nav li.dropdown').hover(function() {
			$(this).find('.dropdown-menu').first().stop(true, true).delay(200).fadeIn(500);
		}, function() {
			$(this).find('.dropdown-menu').first().stop(true, true).delay(200).fadeOut(500);
		});
	}
</script>

 <div class="nav navbar-nav nav-colour">
<ul class="nav navbar-nav ">

     <li class="dropdown">
              <a href="#" class="dropdown-toggle" onmouseover="over()" data-toggle="dropdown">PERFORMANCE <b class="caret"></b></a>
              <ul class="dropdown-menu">
                
             
                <li><a href="${pageContext.request.contextPath}/performance/performanceprofit.jsp"">P&L</a></li>
                <li class="divider"></li>
                
               <li class="dropdown dropdown-submenu">
               	<a onmouseover="over()" data-toggle="dropdown" href="#">Revenue Deep Dive</a>
               		<ul class="dropdown-menu">
               		
               		 <li class="dropdown dropdown-submenu">
               	<a onmouseover="over()" data-toggle="dropdown" href="#">Sales Velocity</a>
               		<ul class="dropdown-menu">
              			 <li class=""><a href="${pageContext.request.contextPath}/performance/performancediveprod.jsp">Sales Velocity by Channel-Prod Level</a></li>
						<li class="divider"></li>
						 <li class=""><a href="${pageContext.request.contextPath}/performance/performancediveoverall.jsp">Sales Velocity by Channel-Overall</a></li>
						
               		</ul>
               </li>
               
              		<%-- 	 <li class="divider"></li>
						<li class=""><a href="${pageContext.request.contextPath}/performance/performancestore.jsp">Store Performance</a></li>
                 --%>
               		</ul>
               </li>
               
                <li class="divider"></li>
              
               
               <li class="dropdown dropdown-submenu">
               	<a onmouseover="over()" data-toggle="dropdown" href="#">Cost Deep Dive</a>
               		<ul class="dropdown-menu">
              			 <li class=""><a href="${pageContext.request.contextPath}/performance/performancecostdeepdivemargin.jsp">Gross Margin by Payment Mode</a></li>
						<li class="divider"></li>
						 <li class=""><a href="${pageContext.request.contextPath}/performance/performancecostdeepdivereturn.jsp">Return Analysis</a></li>
						 <li class="divider"></li>
						 <li class=""><a href="${pageContext.request.contextPath}/performance/performancecostdeepdivebreakdown.jsp">Cost Breakdown</a></li>
						<%-- li class="divider"></li>
						<li class=""><a href="${pageContext.request.contextPath}/performance/performancestore.jsp">Store Performance</a></li>
                --%>
               		</ul>
               </li>
               
               
                
              </ul>
            </li>
            <li class="dropdown">
            <a href="#" class="dropdown-toggle" onmouseover="over()" data-toggle="dropdown">MARKET TRENDS <b class="caret"></b></a>
              <ul class="dropdown-menu">
                 <li><a href="${pageContext.request.contextPath}/markettrends/marketassortment.jsp">Assortment</a></li>
                <li class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/markettrends/marketpricing.jsp">Pricing</a></li>
                <li class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/markettrends/marketpromotions.jsp">Promotions</a></li>
                            
              </ul></li>

            <li class="dropdown"> <a href="#" class="dropdown-toggle" onmouseover="over()" data-toggle="dropdown">OPPORTUNITIES <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/opportunities/opportunities_pricingInsights.jsp">Pricing Insights </a></li>
                 <li class="divider"></li>
                 <li><a href="${pageContext.request.contextPath}/opportunities/product-brand.jsp">Products Not Found </a></li>
                 
  <%--               <li class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/opportunities/oppertunities_pricing.jsp">Competitive Insights</a></li>
                <li class="divider"></li>
   --%>
  
                <!-- <li><a href="#">Channel</a></li>
                <li class="divider"></li>
                <li><a href="#">Content</a></li> -->
              </ul>
             </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" onmouseover="over()" data-toggle="dropdown">ACTION <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action 1</a></li>
                <li class="divider"></li>
                <li><a href="#">Action 2</a></li>
                <li class="divider"></li>
                <li><a href="#">Action 3</a></li>
                <li class="divider"></li>
                <li><a href="#">Action 4</a></li>
                <li class="divider"></li>
                <li><a href="#">Action 5</a></li>
              </ul>
            </li>
        
          </ul>
 </div>         

