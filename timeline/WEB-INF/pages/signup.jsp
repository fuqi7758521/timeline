<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath() %>/assets/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/flat-ui.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/demo.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/toastr.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/images/favicon.ico" rel="shortcut icon" >


<title>注册-时间轴</title>
</head>
<body>

	<jsp:include page="header.jsp"/>

    <div class="container">

      <div class="login">
        <div class="login-screen">

		 <form id="signupForm" method="post" action="<%=request.getContextPath() %>/doSignup.html">
          <div class="login-form">
            <div class="form-group">
              <input type="text" class="form-control login-field" maxlength="10" name="username" placeholder="用户名" id="username">
              <label class="login-field-icon fui-user" for="username"></label>
            </div>

            <div class="form-group">
              <input type="password" class="form-control login-field" maxlength="10" name="password" placeholder="密码" id="password">
              <label class="login-field-icon fui-lock" for="password"></label>
            </div>
            <div class="form-group">
              <input type="password" class="form-control login-field" maxlength="10" name="cofirmPassword" placeholder="密码确认" id="confirmPassword">
              <label class="login-field-icon fui-lock" for="confirmPassword"></label>
            </div>

            <a class="btn btn-primary btn-lg" href="javascript:;" onclick="signup()" id="signupBtn" style="margin-left: 70px;">注&nbsp;&nbsp;册</a>
            <a class="btn btn-primary btn-lg" href="javascript:;" id="removeInfo" style="margin-left: 16px;">清&nbsp;&nbsp;空</a>
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
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/signup.js"></script>
    
</body>
</html>