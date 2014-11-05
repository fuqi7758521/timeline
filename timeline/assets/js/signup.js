$(function() {
		
		$("#removeInfo").click(function(){
			$("#username").val("");
	    	$("#password").val("");
	    	$("#confirmPassword").val("");
		});
		
		$('input').keypress(function (e) {
	    	  if (e.which == 13) {
	    		  signup();
	    	  }
	    });
		
	});
	
	function signup(){
		var username = $("#username").val();
    	var password = $("#password").val();
    	var confirmPassword = $("#confirmPassword").val();
    	if(username.trim() == ""){
    		toastr.warning("用户名不能为空！");
    		return false;
    	}
    	if(password.trim() == ""){
    		toastr.warning("密码不能为空！");
    		return false;
    	}
    	if(password != confirmPassword){
    		toastr.warning("两次密码不一致！");
    		return false;
    	}
    	$("#signupForm").submit();
	}