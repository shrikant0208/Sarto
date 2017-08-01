
<div id=”header”>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


	<title>Welcome to Sarto |</title>

	<!-- Bootstrap core CSS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>


	<link
		href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
		rel="stylesheet" type="text/css">
	<link
		href="${pageContext.request.contextPath}/resources/fonts/css/font-awesome.min.css"
		rel="stylesheet">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.min.css" />

	<!-- Custom styling plus plugins -->


	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/select/select2.css" />
	
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/toaster/toaster.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/star/star.css" />
	<link
		href="${pageContext.request.contextPath}/resources/css/datatables/css/dataTable.min.css"
		rel="stylesheet">

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-migrate-1.3.0.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>

	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/category_resources/themes/default/style.min.css" />

	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>


	<script>
$(document).ready(function(){
	var user="<%=session.getAttribute("Uname")%>";
	$("#user").append(user);
	if(user==null || user.trim()=="" ||user.trim()=="null")
		{
		var path="${pageContext.request.contextPath}";
		var pathname = window.location.pathname;
		
		if(pathname!="/")
			{
		  <%-- var user="<%=session.getAttribute("Username")%>"; --%>
			  $(location).attr("href","/");
		}
		}
    
});
</script>
	<script type="text/javascript">
            $(document).ready(function(){
                 $(".banner").click(function(){
                	 var url = $( this ).attr( 'content' );   
                     $("#body").load(url);
                 });
            });
</script>



</div>
