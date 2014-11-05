<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header" >
          <a class="navbar-brand" href="<%=request.getContextPath()%>">
          	<img style="margin-top:-10px;margin-right:-22px;" alt="" width="150" src="<%=request.getContextPath()%>/assets/images/logo4.png">
          </a>
        </div>
        <div class="navbar-collapse collapse">
          <c:if test="${user != null}">
	          <ul class="nav navbar-nav navbar-right">
	            <li class="active"><a class="fui-user" href="<%=request.getContextPath()%>/plans.html">${user.username }</a></li>
	            <li ><a href="<%=request.getContextPath()%>/logout.html" class="fui-exit">退出</a></li>
	          </ul>
          </c:if>
          <c:if test="${user == null}">
	          <ul class="nav navbar-nav navbar-right">
	            <li <c:if test="${method == 'login' }">class="active"</c:if> ><a href="<%=request.getContextPath()%>/login.html">登录</a></li>
	            <li <c:if test="${method == 'signup' }">class="active"</c:if> ><a href="<%=request.getContextPath()%>/signup.html">注册</a></li>
	          </ul>
          </c:if>
        </div>
      </div>
    </div>