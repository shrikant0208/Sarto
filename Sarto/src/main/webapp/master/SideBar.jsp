
<!-- <script type="text/javascript">
$(document).ready(
		function() {
$("#selectall").change(function () {
    $("input:checkbox").prop('checked', $(this).prop("checked"));
});
		});	
</script> -->



<style type="text/css">
.datepicker {
	cursor: pointer;
}
</style>


<script type="text/javascript">
$(document).ready(function() {
	var customerName= "<%=session.getAttribute("Username")%>";
	 if (localStorage.getItem(customerName +".productGroupMT") == "null") {
		 $('input:checkbox[name="Top Selling"]').attr('checked', true);
		 
		 //alert("1st")
		
	}
	else{
		var productGroup=localStorage.getItem(customerName +".productGroupMT");
		$('input:checkbox[name="'+productGroup+'"]').attr('checked', true);
		
	}
	
	
	
	$(".productcheck").change(function() {
	    $(".productcheck").prop('checked', false);
	    $(this).prop('checked', true);
	    
	});
});	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var i=0;
		var customerName= "<%=session.getAttribute("Username")%>";
		var customerid= "<%=session.getAttribute("Cid")%>";
		
				 $.ajax({
				        type: "POST",
				        url: "/getChannelName",
				        dataType: "json",
				    	data:{customer:customerName},
				        async: false,
				        success: function (data) {
				         // alert(JSON.stringify(data));
				        
				      	  $.each(data, function(i, item) {
				      		 $('#channel').append(
				      				
										'<li><input type="checkbox" name='+item.name+' value='+item.id+' class="onlycheck"><label style="left: 100px">'+item.name+'</label></li>'
				      				 
								); 
				 		  	}); 
				        }
				    });	
				 
				
				 
				 if (localStorage.getItem(customerName +".channelMT") == "null") {
					 $('input:checkbox:first').attr('checked', true);
					 //alert("1st")
					
				}
				else{
					var channel=localStorage.getItem(customerName +".channelMT");
					$('input:checkbox[name='+channel+']').attr('checked', true);
					
				}

				 
				 				  
				 $(".onlycheck").change(function() {
					    $(".onlycheck").prop('checked', false);
					    $(this).prop('checked', true);
					    
					    
					});
				 
			//	alert(JSON.stringify(localStorage));
				 //Categories load
				 if(localStorage.getItem(customerName +".categoryAll") == "null" && localStorage.getItem(customerName +".categoryMT") == "null" ){
					 var stringData = $.ajax({
					     type: "POST",
					     url: "/retrieveCustomerCheckedCategory",
					     dataType: "json",
					     data:{"id":customerid},
					     async: false,
					     success: function (data) {
					       /*  alert(JSON.stringify(data));  */
					     }
					 }).responseText;
					 //console.log(stringData)
					 var jsonData=jQuery.parseJSON(stringData);
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
					 //alert("1st");
					 var checked_ids=[];
						var j=0;
				 	 $('#jstree_demo_div').on('loaded.jstree', function (e, data) {
						  	//console.log("loaded");
						  	//j=0;
						  	checked_ids=$('#jstree_demo_div').jstree('get_selected',true);
						  	$("#jstree_demo_div").jstree('select_all');
						  	$.each(checked_ids,function(index,value) {
						  		
						  		$("#jstree_demo_div").jstree('deselect_node',value);
						  		uiParentsShow(value);
						  		if(j==0)
						  		{
						  			//console.log(value+"check");
						  			$("#jstree_demo_div").jstree('check_node',value);
						  		}
						  		
						  		j++;
						  	});
						  	checked_ids=$('#jstree_demo_div').jstree('get_selected',true);
						  	$.each(checked_ids,function(index,value) {
						  		$("#jstree_demo_div").jstree('hide_node',value);
						  		
						  	});
							checked_ids=$('#jstree_demo_div').jstree('deselect_all',true);
						   //console.log(category);
						  i=0;
							//category ="Home>>"+category;
							//console.log(category)
						  });
					 	
							// alert("Inside Main");
				 
			
					 }
					 else{
						 var v="";
						
						if(localStorage.getItem(customerName +".categoryMT") == "null")
					 		v=localStorage.getItem(customerName +".categoryAll");
						else
							v=localStorage.getItem(customerName +".categoryMT");
							
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
							  		else
						  			{
							  			if(j==1)
							  			{
							  				$("#jstree_demo_div").jstree('check_node',node);
								  			i=1;
							  			}
							  			
						  			}
						  	}
						  	catch (err) {
						  	    console.log('Error in uiGetParents'+err);
						  	}
						  }
					 function uiGetParents(node) {
							try {
							    var level = node.node.parents.length;
							    var elem = $('#' + node.node.id);
							    var text = node.node.id;
							    //var isChecked=$("#jstree_demo_div").jstree('is_checked',elem);
							    for (var ln = 0; ln <= level - 1 ; ln++) {
							    	/* if(isChecked)
							    	{
							    		$("#jstree_demo_div").jstree('check_node',elem);
							    	} */
							    	//console.log("in_fun "+i);
							    	$("#jstree_demo_div").jstree('check_node',elem);
							    	if(ln!=(level - 1))
							    	{
							    		i=1;	
							    	}
							    	elem = elem.parent().parent();
									
							    }

							   
							}
							catch (err) {
							    console.log('Error in uiGetParents'+err);
							}
							}
					 
					 $('#jstree_demo_div').on('uncheck_node.jstree', function (e, data) {
							for (var i = 0; i < data.node.children_d.length; i++) {
								$("#jstree_demo_div").jstree('uncheck_node',data.node.children_d[i]);
							} 
						});   
						 
						  $('#jstree_demo_div').on('check_node.jstree', function (e, data) {
							  //console.log(i);
								if(i==1)
								{
									i=0;
								}
								else
								{
									i++;
									$("#jstree_demo_div").jstree("uncheck_all");
									uiGetParents(data);
									$("#jstree_demo_div").jstree('check_node',data.node);
									
								}
								var parent = $("#jstree_demo_div").jstree(true).get_path(data.node,">");
								var selectedNodes =$(this).jstree(true).get_checked();
							 
							}); 		 
			 
				
			});
</script>




<script type="text/javascript">
$(document).ready(function() {
   /*  $( ".datepicker" ).datepicker();  */
   
   	var customerName= "<%=session.getAttribute("Username")%>";
    var stringData = $.ajax({
		url : "/getCycleDateMap",
		dataType : "json",
		async : false
	}).responseText;
	
	var jsonData=jQuery.parseJSON(stringData);

	   var enableDays = jsonData.date;
	   var cycle = jsonData.cycle;
	   
	 //alert(JSON.stringify(enableDays));
	 //console.log(stringData);
	   var mindate=enableDays[enableDays.length-10];
	   var minindex=cycle[cycle.length-10];
	   
	   if(mindate == undefined){
		  mindate=enableDays[enableDays.length-1];
		  minindex=cycle[cycle.length-1];
	   }
	   
		var maxdate=enableDays[enableDays.length-1];
	   var maxindex=cycle[cycle.length-1];
		
	   //console.log(maxindex);
	   //console.log(maxdate);
	   //console.log(minindex);
	  // console.log(mindate);
	   var arr=JSON.stringify(enableDays);
	  // console.log(JSON.stringify(enableDays))
	 
	 
    function enableAllTheseDays(date) {
    	
        var sdate = $.datepicker.formatDate( 'dd-mm-yy', date);
        //console.log(sdate);
        if($.inArray(sdate, enableDays) != -1) {
            return [true];
        }
        return [false];
    }
  /*  
    $('.datepicker').datepicker({dateFormat: 'dd-mm-yy', beforeShowDay: enableAllTheseDays});  
    
    */
    var index = "";
    
    $(function () {
        $("#from").datepicker({
            minDate: "01-01-2015",
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd-mm-yy',
            beforeShowDay: enableAllTheseDays,
            onClose: function (selectedDate, instance) {
            	
                /* $("#to").datepicker("option", "minDate", selectedDate);
                var date = $.datepicker.parseDate(instance.settings.dateFormat, selectedDate, instance.settings);
                date.setMonth(date.getMonth() + 1); */
               
               	index = enableDays.indexOf(selectedDate);
               	
            	$("#fromCycle").val(cycle[index]);
                //$("#fromCyle").val() = cycle[index];
               	//  alert(cycle[a]);
                //console.log(selectedDate, date);
                /* $("#to").datepicker("option", "minDate", selectedDate);
                $("#to").datepicker("option", "maxDate", date); */
            }
       
        });
        $("#to").datepicker({
            minDate: "01-01-2015",
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd-mm-yy',
            beforeShowDay: enableAllTheseDays,
            onClose: function (selectedDate) {
            	/* $("#from").datepicker("option", "maxDate", selectedDate); */
            	index = enableDays.indexOf(selectedDate);
            	$("#toCycle").val(cycle[index]);
                
            }
        });
      
      /*   
        if (localStorage.getItem(customerName +".startDateMT") == "null"){
        	       
        
        }else{
        	var fromDate = localStorage.getItem(customerName +".startDateMT");
        	$("#from").val(fromDate);
        	
        }
       
        
        if (localStorage.getItem(customerName +".endDateMT") == "null"){
        	       
        
        }else{
        	var toDate = localStorage.getItem(customerName +".endDateMT");
        	$("#to").val(toDate);
        	
        }

        
        if (localStorage.getItem(customerName +".fromCycleMT") == "null"){
 	       
            
        }else{
        	var fromCycle = localStorage.getItem(customerName +".fromCycleMT");
        	$("#fromCycle").val(fromCycle);
        	
        }
       
        
        if (localStorage.getItem(customerName +".toCycleMT") == "null"){
        	       
        
        }else{
        	var toCycle = localStorage.getItem(customerName +".toCycleMT");
        	$("#toCycle").val(toCycle);
        	
        } */
        
        
        if (localStorage.getItem(customerName +".startDateMT") == "null"){
        	
        	$("#from").val(mindate);
        	localStorage.setItem(customerName + '.startDateMT', mindate);
        	
        
        }else{
        	var fromDate = localStorage.getItem(customerName +".startDateMT");
        	$("#from").val(fromDate);
        	
        }
       
        
        if (localStorage.getItem(customerName +".endDateMT") == "null"){
        	$("#to").val(maxdate);
        	localStorage.setItem(customerName + '.endDateMT', maxdate);
        
        }else{
        	var toDate = localStorage.getItem(customerName +".endDateMT");
        	$("#to").val(toDate);
        	
        }

        
        if (localStorage.getItem(customerName +".fromCycleMT") == "null"){
        	$("#fromCycle").val(minindex);
        	localStorage.setItem(customerName + '.fromCycleMT', minindex);
            
        }else{
        	var fromCycle = localStorage.getItem(customerName +".fromCycleMT");
        	$("#fromCycle").val(fromCycle);
        	
        }
       
        
        if (localStorage.getItem(customerName +".toCycleMT") == "null"){
        	$("#toCycle").val(maxindex);
        	localStorage.setItem(customerName + '.toCycleMT', maxindex);    
        
        }else{
        	var toCycle = localStorage.getItem(customerName +".toCycleMT");
        	$("#toCycle").val(toCycle);
        	
        }
        

       
        /* $("#from").change(function() {
        	 
        	 $("#from").val() = cycle[index];
        	 
        	//alert($("#from").val());
        }); 
          
       */
        
    });
    
      

		  
		  
		 
    
  });
  </script>


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
						<div class=sitedata>Select Categories</div>
						<ul style="height: 175px; overflow: auto; padding-left: 0px;">
							<div id="jstree_demo_div"></div>
						</ul>
					</li>

					<li><div class=sitedata>Select Channel</div>

						<ul style="height: 175px; overflow: auto" id="channel">

							<!-- 	<li><input type="checkbox"  name="Amazon" value="Amazon" class="onlycheck"><label
								style="left: 100px;"> Amazon</label></li>
							<li><input type="checkbox"  name="Snapdeal" value="Snapdeal" class="onlycheck" checked><label
								style="left: 100px" > Snapdeal</label></li>
						<li><input type="checkbox" name="Flipkart" value="Flipkart"  class="onlycheck"><label
								style="left: 100px"> Flipkart</label></li>
							<li><input type="checkbox" name="Paytm" value="Paytm"  class="onlycheck"><label
								style="left: 100px"> Paytm</label></li>
							<li><input type="checkbox" name="Nykaa" value="Nykaa"  class="onlycheck"><label
								style="left: 100px"> Nykaa</label></li>
							<li><input type="checkbox" name="Purplle" value="Purplle"  class="onlycheck"><label
								style="left: 100px"> Purplle</label></li>
							<li><input type="checkbox" name="Ebay" value="Ebay"  class="onlycheck"><label
								style="left: 100px"> Ebay</label></li>
							<li><input type="checkbox" name="Shopclues" value="Shopclues"  class="onlycheck"><label
							 style="left: 100px">Shopclues</label></li>
							<li><input type="checkbox" name="Jabong" value="Jabong"  class="onlycheck"><label
								style="left: 100px"> Jabong</label></li>
							<li><input type="checkbox" name="Fabfurnish"value="Fabfurnish"  class="onlycheck"><label 
							style="left: 100px">Fabfurnish</label></li>
							<li><input type="checkbox" name="Urbanladder"value="Urbanladder"  class="onlycheck"><label
							 style="left: 100px"> Urbanladder</label></li>
							<li><input type="checkbox" name="Firstcry" value="Firstcry"  class="onlycheck"><label
								style="left: 100px"> Firstcry</label></li>
									<li><input type="checkbox" name="JABONG"value="JABONG"  class="onlycheck"><label 
							style="left: 100px">Jabong</label></li>
							<li><input type="checkbox" name="LIMEROAD"value="LIMEROAD"  class="onlycheck"><label
							 style="left: 100px"> Limeroad</label></li>
							 <li><input type="checkbox" name="MYNTRA"value="MYNTRA"  class="onlycheck"><label
							 style="left: 100px"> Myntra</label></li> -->
						</ul></li>

					</br>

					<li><div class=sitedata>Select Date Range</div>

						<ul>


							<form name="form1" action="" method="post">
								<input type="text" placeholder="From" id="from"
									class="datepicker" name="c1date"
									style="position: relative; cursor: auto" value="">
								<i align="center">to</i> <input type="text" placeholder="Upto"
									id="to" class="datepicker" name="c2date"
									style="position: relative; cursor: auto" value="">
								<input type="hidden" id="fromCycle" value=""> <input
									type="hidden" id="toCycle" value="">
							</form>
							<div class="row" style="height: 20px">



								<!-- start -->
						</ul></li>


					</br>

					<li><div class=sitedata>Select Product Group</div>

						<ul style="height: 100px; overflow: auto" id="chkProductGroup">
							<li><input type="checkbox" name="All" value="1"
								class="productcheck"> All</li>
							<li><input type="checkbox" name="Top Selling"
								class="productcheck" value="2"> Top Selling</li>
							<li><input type="checkbox" name="New Arrival"
								class="productcheck" value="3"> New Arrival</li>

						</ul></li>
					<!-- line bar -->

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



