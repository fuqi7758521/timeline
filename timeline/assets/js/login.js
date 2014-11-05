$(function() {
	    
	    $('input').keypress(function (e) {
	    	  if (e.which == 13) {
	    		  login();
	    	  }
	    });
	    
	}); 
	
    function login(){
    	var username = $("#username").val();
    	var password = $("#password").val();
    	if(username.trim() == ""){
    		toastr.warning("用户名不能为空！");
    		return false;
    	}
    	if(password.trim() == ""){
    		toastr.warning("密码不能为空！");
    		return false;
    	}
		$("#loginForm").submit();
    }
    
    function forgetPassword(){
    	toastr.warning("请联系:<a href='mailto:fuqi7758521@qq.com'>管理员</a>");
    }