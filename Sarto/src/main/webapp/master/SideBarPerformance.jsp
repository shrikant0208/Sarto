
<script type="text/javascript">
$(document).ready(function () {
	
	<%-- "<%=session.getAttribute("Username")%>"; --%>
var customerName= "<%=session.getAttribute("Username")%>";
var customerid= "<%=session.getAttribute("Cid")%>";

/* category selection */

if(localStorage.getItem(customerName +".category") == "null"){
	
var stringData = $.ajax({
    type: "POST",
    url: "/retrieveCustomerCheckedCategory",
    dataType: "json",
    data:{"id":customerid},
    async: false,
    success: function (data) {
      //alert(JSON.stringify(data)); 
    }
}).responseText;
var jsonData=jQuery.parseJSON(stringData);

 $('#jstree_demo_div').jstree({

	 "core" : {"data":jsonData,
	               "themes" : { "icons": false }
	 },

		 "plugins" : [ "checkbox" , "search" ],
		"checkbox": {  
						"three_state": false,
	        			"real_checkboxes":true,
	        			"tie_selection":false
					}
		 
		});

/*  loading category */
var checked_ids=[];
var j=0;
$('#jstree_demo_div').on('loaded.jstree', function (e, data) {
	//console.log("loaded");
	checked_ids=$('#jstree_demo_div').jstree('get_selected',true);
	$("#jstree_demo_div").jstree('select_all');
	$.each(checked_ids,function(index,value) {
		
		$("#jstree_demo_div").jstree('deselect_node',value);
		uiParentsShow(value);
		if(j==0)
		{
			$("#jstree_demo_div").jstree('check_node',value);
		}
		
		j++;
	});
	checked_ids=$('#jstree_demo_div').jstree('get_selected',true);
	$.each(checked_ids,function(index,value) {
		$("#jstree_demo_div").jstree('hide_node',value);
		
	});
	checked_ids=$('#jstree_demo_div').jstree('deselect_all',true);
});
}

else{
	//alert(JSON.stringify(localStorage));
	var v=localStorage.getItem(customerName +".category");
	//console.log(v)
	var jsonData=jQuery.parseJSON(v);
	//console.log(jsonData)
	 $('#jstree_demo_div').jstree({

		 "core" : {"data":jsonData,
		               "themes" : { "icons": false }
		 },

			 "plugins" : [ "checkbox" , "search" ],
			"checkbox": {  
							"three_state": false,
		        			"real_checkboxes":true,
		        			"tie_selection":false
						}
			 
			});
	// alert("2nd")
}
 //var v =$("#jstree_demo_div").jstree(true).get_json('#', { 'flat': true });
 //alert(v)
 
	 function uiGetParents(node) {
			try {
			    var level = node.node.parents.length;
			    var elem = $('#' + node.node.id);
			    //var isChecked=$("#jstree_demo_div").jstree('is_checked',elem);
			    for (var ln = 0; ln <= level - 1 ; ln++) {
			    	$("#jstree_demo_div").jstree('check_node',elem);
			    	if(ln!=(level - 1))
			    	{
			    		i=1;	
			    	}
			    	elem = elem.parent().parent();
			    	
				}
			}
			catch (err) {
			  //  console.log('Error in uiGetParents'+err);
			}
		}
 
 $('#jstree_demo_div').on('uncheck_node.jstree', function (e, data) {
		for (var i = 0; i < data.node.children_d.length; i++) {
			$("#jstree_demo_div").jstree('uncheck_node',data.node.children_d[i]);
		} 
	});   
	  var i=0;
	  $('#jstree_demo_div').on('check_node.jstree', function (e, data) {
			if(i==1)
			{
				i=0;
			}
			else
			{
				//console.log("in check node");
				i++;
				//$("#jstree_demo_div").jstree("uncheck_all");
				uiGetParents(data);
				$("#jstree_demo_div").jstree('check_node',data.node);
				
			}
		}); 
	  


	  function getBread(node,array) {
		  var bread="";
		  	try 
		  	{
		  		if($.inArray(node, array)==-1)
		  			{
		  			array.push(node);
		  			//console.log(node);
		  			bread=node.text+">>";
		  			var parent=$("#jstree_demo_div").jstree('get_parent',node);
		  				 while (parent != '#') {
		  					bread=$("#jstree_demo_div").jstree('get_node',parent).text+">>"+bread;
		  					array.push($("#jstree_demo_div").jstree('get_node',parent));
		  					parent=$("#jstree_demo_div").jstree('get_parent',parent);
				  		} 
		  			}
		  		else
		  			{
		  			//console.log("found"+$.inArray(node, array));
		  			}
		  	}
		  	catch (err) {
		  	    console.log('Error in getBread'+err);
		  	}
		  	return bread
		  }
	  function uiParentsShow(node) {
	  	try 
	  	{
	  			var parent=$("#jstree_demo_div").jstree('get_parent',node);
	  			if(j==0)
	  			{
	  				$("#jstree_demo_div").jstree('check_node',parent);
		  			i=1;
	  			}
	  			
		  		$("#jstree_demo_div").jstree('deselect_node',parent);
		  		
		  		if (parent != '#') {
		  			 uiParentsShow(parent);
		  	} 
	  		
	  	}
	  	catch (err) {
	  	    console.log('Error in uiGetParents'+err);
	  	}
	  }

	  
/* channel selection */
var jsonData = $.ajax({
	type: "POST",
	url: "/getChannelName",
	data:{customer:customerName},
	dataType: "json",
	async: false,
	success: function (data) {
		/* alert(data.rows); */
		//console.log(data); 
		  $.each(data, function(i, item) {
				 $('#channel').append(
						'<li><input type="checkbox"  name='+item.name+' value='+item.id+' class="onlycheck"><label style="left: 100px">'+item.name+'</label></li>'
				); 
				
		  })
	 }
});

if (localStorage.getItem(customerName +".channel") == "null") {
	 $("input.selectall[value=0]").prop('checked',true);	
}



 $("input.selectall[value=0]").prop('checked',function() {
    if ($(this).is(':checked')) {
        $('.onlycheck').prop('checked', true);
    } else {
        $('.onlycheck').prop('checked', false);
    }
   
}); 

  $('.selectall').change(function() {
    if ($(this).is(':checked')) {
        $('.onlycheck').prop('checked', true);
    } else {
        $('.onlycheck').prop('checked', false);
    }
   
});  

$(".onlycheck").click(function(){

   if($(".onlycheck").length == $(".onlycheck:checked").length) {
	   $('.selectall').prop('checked', true);
   } else {
	   $('.selectall').prop('checked', false);
   }

});


if (localStorage.getItem(customerName +".radiorange") == "null"){
	$("input.range[value=Q]").prop('checked',true);	
	localStorage.setItem(customerName +".radiorange","Q");
	
}


//alert(channel);
  if (localStorage.getItem(customerName +".channel") == "null"){
	  var channel=[];
	  $("input.onlycheck[type=checkbox]:checked").each(function() {
	  	 channel.push($(this).val());
	     });
	  //channelName=channel;
	  localStorage.setItem(customerName +'.channel', JSON.stringify(channel));
	  //console.log(localStorage.getItem(customerName +'.channel'));
	 // alert("hello")
  }
 
});
</script>


<script  type="text/javascript">
$(document).ready(function() {
	
	 var customerName= "<%=session.getAttribute("Username")%>";
	var stringData = $.ajax({
	    type: "POST",
	    url: "/getdaterange",
	    dataType: "json",
	    data:{clientName:customerName},
	    async: false,
	    success: function (data) {
	      /*  alert(JSON.stringify(data));  */
	    }
	}).responseText;

	var jsonData=jQuery.parseJSON(stringData);
//var value=jsonData[0].mindate;
	//console.log(jsonData[0].mindate);
   /*  $( ".datepicker" ).datepicker();  */
    $("#from").datepicker({
            minDate: jsonData[0].mindate,
            maxDate:jsonData[0].maxdate,
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
            value:jsonData[0].mindate,
           // maxDate: "31-01-2016",
    });
    $("#to").datepicker({
    	 minDate: jsonData[0].mindate,
         maxDate:jsonData[0].maxdate,
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
});
   //$("#from").val(jsonData[0].mindate);
    //localStorage.setItem('startdate', startdate); 
    
    $("#to").val(jsonData[0].maxdate);
    
    if (localStorage.getItem(customerName +".startdate") == "null"){
    	var startdate=jsonData[0].mindate;
    	
    	$("#from").val(jsonData[0].mindate);
    	localStorage.setItem(customerName + '.startdate', startdate)
    	
    }
    
    if (localStorage.getItem(customerName +".enddate") == "null"){
    	var enddate=jsonData[0].maxdate;
    	
    	$("#to").val(jsonData[0].maxdate);
    	localStorage.setItem(customerName + '.enddate', enddate)
    	
    }
}); 
/* popup */
/* $(function() {
    //----- OPEN
    $('[data-popup-open]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-open');
        $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
 
        e.preventDefault();
    });
 
    //----- CLOSE
    $('[data-popup-close]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-close');
        $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
 
        e.preventDefault();
    });
}); */


  </script>
<!--  <script type="text/javascript">
  /* toggle */
  jQuery(document).ready(function() {
	 
      jQuery('.toggle-nav').click(function(e) {
    	  
          jQuery(this).toggleClass('active');
          jQuery('.menu ul').toggleClass('active');
   
          e.preventDefault();
      });
  });
</script> -->
<!-- not used -->
<!-- <script type="text/javascript">
$(document).ready(function() {
	$(".productcheck").change(function() {
	    $(".productcheck").prop('checked', false);
	    $(this).prop('checked', true);
	    
	});
});	
</script> 
<script type="text/javascript">
	$(document).ready(
			function() {
				$('.sitecat').on("click", function(){  
					  $(this).parents('ul').prev().prop('checked', false);

					  $(this).parents('ul').children('li').each(function () {
					 $('.sitecat', this).prop('checked', false);
					  });
					   $(this).prop('checked', true);

							
							var sibs = false;
							$(this).closest('ul').children('li').each(
									function() {
										if ($('.sitecat', this).is(
												':checked'))
											sibs = true;
									})
							$(this).parents('ul').prev().prop('checked', sibs);
						
							/*  var bread = [];
					            $.each($(".sitecat:checked"), function(){            
					           
					            	bread.push($(this).val());
					            });
					            alert( bread.join(">> ")); */
						});
				
			});
</script>
 -->

 
 <style type="text/css">
 .datepicker {
 cursor: pointer;
	}
</style>
 
<style type="text/css">
.nav.side-menu>li>.sitedata {
	height: 40px;
	background-color: #e2e2e2;
	padding-left: 42px;
	line-height: 38px;
	font-weight: bold;
	color: black;
	margin-bottom: 10px;
}
</style>

<body>
	<div class="left_col scroll-view">
		<div class="clearfix"></div>
		<br />

		<!--  sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

			<div class="menu_section">
		
				<h3>Market Insights</h3>
				
				<ul class="nav side-menu" style="width: 229px;">
				
					<li>
						<div class=sitedata>Select Categories <!-- <a class="btn1" data-popup-open="popup-1" href="#">#1</a> -->
						</div>
						<ul style="height: 175px; overflow: auto;padding-left: 0px;">
						  <div id="jstree_demo_div"></div>  
							<!-- <div id="performanceTree"></div> -->
						</ul>
					</li>

					<li><div class=sitedata>Select Channel</div>
						<ul	 style="height: 175px;overflow: auto" id="channel">
						
						<li><input type="checkbox"  name="All" value="0" class="selectall"><label 
							style="left: 100px">All</label></li>
						</ul></li>

					</br>

					<li><div class=sitedata>Select Date Range</div>

						<ul>
						
								
								<form name="form1" action="" method="post" id=selectbox >
								<input type="text" placeholder="From" id="from" class="datepicker"
								name="c1date" style="position: relative;cursor:auto" value=""> <i
								align="center">to</i>
							<input type="text" placeholder="Upto" id="to" class="datepicker"
								name="c2date" style="position: relative;cursor:auto" value="">
								</form>
								
								<div class="dateranges">&nbsp</div>
								<label>
      									<input type="radio" name="title" value="D" class="range">
    											 D
    							</label>
    							<label>
      									<input type="radio" name="title" value="W" class="range">
   												 W
    							</label>
    							<label>
      									<input type="radio" name="title" value="M" class="range">
      											M
    							</label>
    							 <label>
     									<input type="radio" name="title" value="Q" class="range">
     											Q
    							</label>
							
						</ul></li>
					</br>

						<li>
						<div class="form-group">
							<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
								<button type="button" id="sidebarbutton" class="btn btn-success">Submit</button>
							</div>
						</div>
						</li>
				</ul>
			</div>

		</div>
		
		<!-- /menu footer buttons -->
		
	</div>


 
</body>
<!-- <<script type="text/javascript">
$(document).ready(function () {
var channel=[];
$("input.onlycheck[type=checkbox]:checked").each(function() {
	 channel.push($(this).val());
   });
//channelName=channel;
localStorage.setItem('channel', JSON.stringify(channel)); 
alert(channel)
});
</script>  -->
<style>
.dateranges {
position: relative;
    min-height: 1px;
    float: left;
        height: 15px;
   width: 175px;
    min-height: 1px;
    float: left;
}

</style>


