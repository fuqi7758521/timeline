<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=request.getContextPath() %>/assets/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/flat-ui.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/demo.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/images/favicon.ico" rel="shortcut icon">

<title>首页-时间轴</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron" style="margin-top:55px;">
        <h1>Time line</h1>
        <p>记录你计划的运行时间和轨迹，对自己的时间安排进行合理的调整。</p>
      </div>

    </div> <!-- /container -->
    
 <jsp:include page="footer-fixed.jsp"/>
	
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/flat-ui.js"></script>
</body>
</html>