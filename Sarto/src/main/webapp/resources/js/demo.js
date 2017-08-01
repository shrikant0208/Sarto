  		var createTextNode = function (text) {
                var span = document.createElement("span");
                span.className = "sname";
                span.setAttribute("style", "margin-left: 2px");
                var tx = document.createTextNode(text);
                span.appendChild(tx);
 
                return span;
            };
 		
		var filBuilder = function(obj, examesNode, root){
			
			if(root)
			$.each(obj, function (i, aExam) { 
			
					var examNode = document.createElement("li");
					examNode.className = "open";					
					span = document.createElement("span");
					span.className = "file";
					span.appendChild(createTextNode(aExam.Name));
					
					examNode.appendChild(span);
					examesNode.appendChild(examNode);
					
				
						
             }); 
			 else{
				 	var examNode = document.createElement("li");
					examNode.className = "open";					
					span = document.createElement("span");
					span.className = "file";
					span.appendChild(createTextNode(obj.Name));
					
					examNode.appendChild(span);
					examesNode.appendChild(examNode);
			}	
			
					
			
		}

		var filBuilder12 = function(obj, examesNode, root){
			
			if(root)
			$.each(obj, function (i, aExam) { 
			
					var examNode = document.createElement("li");
					examNode.className = "open";					
					//span = document.createElement("span");
				//	span.className = "file";
					var checkbox = document.createElement("INPUT");
                    checkbox.setAttribute("type", "checkbox");
                   // checkbox.setAttribute("id", aExam.id);
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
                    //checkbox.setAttribute("id", obj.id);
                    examNode.appendChild(checkbox);
                    
                    var tx4 = document.createTextNode(obj.Name);
                    examNode.appendChild(tx4);
					/*span.appendChild(createTextNode(obj.Name));
					
					examNode.appendChild(span);*/
					examesNode.appendChild(examNode);
				 
			}	
		}
		
		
		var folBuilder = function(obj, classesNode){
			
			$.each(obj, function (i, aClass) {  
                    var classNode = document.createElement("li");
		    classNode.className = "open";
                    span = document.createElement("span");
                    span.className = aClass.folder ? "folder" : "file"
                    span.appendChild(createTextNode(aClass.Name))
                    classNode.appendChild(span);
                    var examesNode = document.createElement("ul"); 
                    examesNode.className = aClass.folder ? "folder" : "file"; 
					
					if(aClass.folder && obj[0].ChildSubSet && obj[0].ChildSubSet.length>0){ 
					classNode.appendChild(examesNode);
                    			classesNode.appendChild(classNode);
					folBuilder(aClass.ChildSubSet, examesNode);
					}
					else if(aClass.folder && obj[0].ChildSubSet && obj[0].ChildSubSet.length==0){ 
					var examNode = document.createElement("li");
					examNode.className = "open";					
					span = document.createElement("span");
					span.className = "folder";
					span.appendChild(createTextNode(obj.Name));
					
					examNode.appendChild(span);
					examesNode.appendChild(examNode);
					classesNode.appendChild(classNode);
					}
					else { 
					filBuilder(aClass, examesNode);
		    
                    classesNode.appendChild(classNode);
					
					}
					
					
					
					
                });	
			
		}
	
	var folBuilder12 = function(obj, classesNode){
			
			$.each(obj, function (i, aClass) {  
                    var classNode = document.createElement("li");
                    classNode.className = "open";
                   // span = document.createElement("span");
                   // span.className = aClass.folder ? "folder" : "file"
                    var checkbox = document.createElement("INPUT");
                    checkbox.setAttribute("type", "checkbox");
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
	
		
		
		var buildTree = function (students) {
 
            var root = document.createElement("ul");
            root.id = "StudentTreeRoot";
            root.setAttribute("style", "margin: 15px");
            root.className = "filetree";
            $.each(students.Root, function (i, student) { 
                var studentNode = document.createElement("li");
                studentNode.className = "open";
                var span = document.createElement("span");
                span.className = student.folder ? "folder" : "file";
                span.appendChild(createTextNode(student.Name));
                studentNode.appendChild(span);
 
                var classesNode = document.createElement("ul"); 
				if(student.folder && student.ChildSubSet)
				folBuilder(student.ChildSubSet, classesNode);
				else
				filBuilder(student.ChildSubSet, classesNode, true); 
				
                studentNode.appendChild(classesNode);
                root.appendChild(studentNode);
            });
 
            $("#StudentTree").html("").append(root);
            $("#StudentTree").treeview({
            	collapsed: false,
        		animated: "normal",
        		unique: true,
        		persist: "location",
        			control: "#treecontrol"
				 });
            
           

        };
 
        var buildTree1 = function (students) {
        	 
            var root = document.createElement("ul");
       
            root.id = "StudentTreeRoot";
            root.setAttribute("style", "margin: 60px");
            root.className = "filetree";
            $.each(students.Root, function (i, student) { 
                var studentNode = document.createElement("li");
                studentNode.className = "open";
                var span = document.createElement("span");
                //span.className = student.folder ? "folder" : "file";
                var checkbox = document.createElement("INPUT");
                checkbox.setAttribute("type", "checkbox");
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
            $("#Tree").treeview({
            	collapsed: false,
        		animated: "normal",
        		unique: true,
        		persist: "location",
        			control: "#treecontrol"
    			 });

        };
    
        $(document).ready(function () { $("#StudentTree").html("");
       
		
		
		var jsonObj = {
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
						
					]};
	
	buildTree(jsonObj);});
        
 /* $(document).ready(function () { $("#CatTree").html("");
       
		
		
		var jsonObj = {
				"Root": [
							{"Name": "Electronics", 
							"ChildSubSet": [
								{"Name": "Camera", "ChildSubSet":[{ "Name":"hello", "ChildSubSet":[{ "Name":"hello1", "folder":false}], "folder":true}], "folder":true},
								{"Name": "Entertentment", "ChildSubSet":[{ "Name":"hello12", "folder":false},{ "Name":"hello123", "folder":false}], "folder":true},
								{"Name": "Home Electronics", "ChildSubSet":[{ "Name":"hello", "ChildSubSet":[{ "Name":"hello1", "ChildSubSet":[{ "Name":"hello2","ChildSubSet":[], "folder":true }], "folder":true }], "folder":true}], "folder":true}
							], "folder":true
							},
							{"Name": "Indra", 
								"ChildSubSet": [
									{"Name": "IndraSub1", "ChildSubSet":[{ "Name":"hello", "ChildSubSet":[{ "Name":"hello1", "folder":false}], "folder":true}], "folder":true},
									{"Name": "IndraSub2", "ChildSubSet":[{ "Name":"hello12", "folder":false},{ "Name":"hello123", "folder":false}], "folder":true},
									{"Name": "IndraSub1", "ChildSubSet":[{ "Name":"hello", "ChildSubSet":[{ "Name":"hello1", "ChildSubSet":[{ "Name":"hello2","ChildSubSet":[], "folder":true }], "folder":true }], "folder":true}], "folder":true}
								], "folder":true
								
								}
							
						]};
	
	buildTree1(jsonObj);});*/
