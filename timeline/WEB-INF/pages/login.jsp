<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0 ,maximum-scale=1.0,user-scalable=no">
<link href="<%=request.getContextPath() %>/assets/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/flat-ui.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/demo.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/toastr.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/images/favicon.ico" rel="shortcut icon">

<title>登录-时间轴</title>
</head>
<body>

	<jsp:include page="header.jsp"/>

    <div class="container">

      <div class="login">
        <div class="login-screen">
		<form id="loginForm" action="<%=request.getContextPath() %>/doLogin.html" method="post">
          <div class="login-form">
            <div class="form-group">
              <input type="text" class="form-control login-field" maxlength="10" name="username" placeholder="用户名" id="username">
              <label class="login-field-icon fui-user" for="username"></label>
            </div>

            <div class="form-group">
              <input type="password" class="form-control login-field"  maxlength="10" name="password" placeholder="密码" id="password">
              <label class="login-field-icon fui-lock" for="password"></label>
            </div>

            <a class="btn btn-primary btn-lg btn-block" href="javascript:;" onclick="login()" id="loginBtn">登&nbsp;&nbsp;录</a>
            <a class="login-link" href="javascript:;" onclick="forgetPassword();">忘记密码?</a>
            
          </div>
         </form>
        </div>
      </div>

    </div> <!-- /container -->
	<jsp:include page="footer.jsp"/>
	
	<input id="msg" value="${msg}" type="hidden">
	
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/flat-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/toastr.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/login.js"></script>
</body>
</html>