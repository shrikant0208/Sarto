$("#form").click(function(event) {
	login(event);
});
function login(event) {
	console.log(Date());
	User = {};
	User["loginName"] = $("#userid").val();
	User["password"] = $("#pswrd").val();
	console.log(User)
	event.preventDefault();
	$.ajax({
		type : "POST",
		url : "/Login",
		data : JSON.stringify(User),
		contentType : "application/json; charset=utf-8",
		dataType : "JSON",

		success : function(data) {

			var path = "${pageContext.request.contextPath}";
			console.log(data);

			var username = $("#userid").val();
			console.log("user : " + username);
			//alert(data)
			var dateTime = JSON.stringify(Date());

			if (data != 0 && data != "0" && data != null) {
				//alert("in if")
				localStorage.setItem('username', username);
				localStorage.setItem('userId', data);
				console.log("userId: " + localStorage.getItem('userId'))
				var store = localStorage.getItem($("#userid").val()
						+ ".loggedtime", Date());
				console.log(sessionStorage.getItem($("#userid").val()
						+ ".loggedtime", store))
				$(location).attr("href",
						path.concat("/manual_upload/fileUpload.jsp"));

			} else {

				// alert("in else");
				$("#error").text("Invalid Username or Password");
				$("#userid").val("");
				$("#pswrd").val("");
				return false;

			}

		},//success

		error : function(data) {
			console.log("in error: " + JSON.stringify(data))
			
		}

	});

}