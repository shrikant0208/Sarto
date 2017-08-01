  		var createTextNode = function (text) {
                var span = document.createElement("span");
                span.setAttribute("style", "margin-left: 2px");
                var tx = document.createTextNode(text);
                span.appendChild(tx);
 
                return span;
            };
 	

		var filBuilder12 = function(obj, examesNode, root){
			
			if(root)
			$.each(obj, function (i, aExam) { 
			
					var examNode = document.createElement("li");
					examNode.className = "open";					
					//span = document.createElement("span");
				//	span.className = "file";
					var checkbox = document.createElement("INPUT");
                    checkbox.setAttribute("type", "checkbox");
                    checkbox.setAttribute("style", "width: 25px");
                    checkbox.setAttribute("class", "cat");
                   
                    examNode.appendChild(checkbox);

                    var tx3 = document.createTextNode(aExam.Name);
                    examNode.appendChild(tx3);
					/*span.appendChild(createTextNode(aExam.Name));
					
					examNode.appendChild(span);*/
					
					
					examesNode.appendChild(examNode);
						
             }); 
			 else{
				 
				 	var examNode = document.createElement("li");
					examNode.className = "open";					
					//span = document.createElement("span");
				//	span.className = "file";
					var checkbox = document.createElement("INPUT");
                    checkbox.setAttribute("type", "checkbox");
                    checkbox.setAttribute("style", "width: 25px");
                    checkbox.setAttribute("class", "cat");
                    examNode.appendChild(checkbox);
                    
                    var tx4 = document.createTextNode(obj.Name);
                    examNode.appendChild(tx4);
					/*span.appendChild(createTextNode(obj.Name));
					
					examNode.appendChild(span);*/
					examesNode.appendChild(examNode);
				 
			}	
		}
		
	
	
	var folBuilder12 = function(obj, classesNode){
			
			$.each(obj, function (i, aClass) {  
                    var classNode = document.createElement("li");
                    classNode.className = "open";
                   // span = document.createElement("span");
                   // span.className = aClass.folder ? "folder" : "file"
                    var checkbox = document.createElement("INPUT");
                    checkbox.setAttribute("type", "checkbox");
                    checkbox.setAttribute("style", "width: 25px");
                    checkbox.setAttribute("class", "cat");
                   // checkbox.setAttribute("id",aClass.id);
                    classNode.appendChild(checkbox);

                    var tx5 = document.createTextNode(aClass.Name);
                    classNode.appendChild(tx5);
                   /* span.appendChild(createTextNode(aClass.Name))
                    classNode.appendChild(span);
                    */
                    
                    var examesNode = document.createElement("ul"); 
                //    examesNode.className = aClass.folder ? "folder" : "file"; 
					
					if(aClass.folder && obj[0].ChildSubSet && obj[0].ChildSubSet.length>0){ 
						classNode.appendChild(examesNode);
						classesNode.appendChild(classNode);
						folBuilder12(aClass.ChildSubSet, examesNode);
					}
					else if(aClass.folder && obj[0].ChildSubSet && obj[0].ChildSubSet.length==0){ 
						
					var examNode = document.createElement("li");
					examNode.className = "open";
					
				//	span = document.createElement("span");
				//	span.className = "folder";
					examNode.appendChild(checkbox);
					
					 var tx1 = document.createTextNode(obj.Name);
					examNode.appendChild(tx1);
				/*	span.appendChild(createTextNode(obj.Name));
					
					examNode.appendChild(span);*/
					
					
					
					examesNode.appendChild(examNode);
					classesNode.appendChild(classNode);
					}
					else { 
					filBuilder12(aClass, examesNode);
		    
                    classesNode.appendChild(classNode);
					
					}

                });	
			
		}
	
 
        var buildTree1 = function (students) {
        	 
            var root = document.createElement("ul");
       
            root.id = "StudentTreeRoot";
            root.setAttribute("style", "margin: 60px");
            root.className = "filetreecat";
            $.each(students.Root, function (i, student) { 
                var studentNode = document.createElement("li");
                studentNode.className = "open";
                var span = document.createElement("span");
                //span.className = student.folder ? "folder" : "file";
                var checkbox = document.createElement("INPUT");
                checkbox.setAttribute("type", "checkbox");
             checkbox.setAttribute("style", "width: 25px");
             checkbox.setAttribute("class", "cat");
                
            //    checkbox.setAttribute("onclick", "checkuncheck();");
               // checkbox.setAttribute("id", student.id);
                studentNode.appendChild(checkbox);

                //document.appendChild(student.Name);
                var tx = document.createTextNode(student.Name);
                studentNode.appendChild(tx);
                
               /* span.appendChild(createTextNode(student.Name));
                studentNode.appendChild(span);*/
 
                var classesNode = document.createElement("ul"); 
				if(student.folder && student.ChildSubSet)
					folBuilder12(student.ChildSubSet, classesNode);
				else
					filBuilder12(student.ChildSubSet, classesNode, true); 
				
                studentNode.appendChild(classesNode);
                root.appendChild(studentNode);
            });
            
            $("#Tree").html("").append(root);
            $("#Tree").treeviewcat({
            	collapsed: false,
        		animated: "normal",
        		unique: true,
        		persist: "location",
        			control: "#treecontrol"
    			 });

        };
    
        
  $(document).ready(function () { $("#Tree").html("");
       
		var jsonObj1 = {
				"Root": [
							{"Name": "Home & Kitchen", 
							"ChildSubSet": [
								{"Name": "Home Appliances", "ChildSubSet":[{ "Name":"Water purifiers", "ChildSubSet":[{ "Name":"Water Filter Cartridges", "folder":false}], "folder":true}], "folder":true},
								{"Name": "Kitchen Appliances", "ChildSubSet":[{ "Name":"Sandwich & Roti Makers", "folder":false},{ "Name":"Donut Makers", "folder":false}], "folder":true}
								
							], "folder":true
							},
							{"Name": "Computers", 
								"ChildSubSet": [
									{"Name": "Audio Players", "ChildSubSet":[{ "Name":"Audio Player Accessories", "ChildSubSet":[{ "Name":"Headphones", "folder":false}], "folder":true},{"Name":"Home Audio","folder":false} ], "folder":true},
									{"Name": "Software", "ChildSubSet":[{ "Name":"Utilities", "folder":false},{ "Name":"Office Tools", "folder":false}], "folder":true},
									{"Name": "Computer Peripherals", "ChildSubSet":[{ "Name":"Printers & Inks", "ChildSubSet":[{ "Name":"Printers", "ChildSubSet":[{ "Name":"Multi Function Printers","ChildSubSet":[], "folder":false }], "folder":true }], "folder":true}], "folder":true}
								], "folder":true
								
								}
							
				         /*{"Name": "Home & Kitchen", 
								"ChildSubSet": [
									{"Name": "Home Appliances", "ChildSubSet":[{ "Name":"Water purifiers", "folder":true}], "folder":true},
									{"Name": "Kitchen Appliances", "ChildSubSet":[{ "Name":"Sandwich & Roti Makers","folder":true},{ "Name":"Donut Makers", "folder":false}], "folder":true}
									
								], "folder":true
								}*/
						]};
	
	buildTree1(jsonObj1);});
