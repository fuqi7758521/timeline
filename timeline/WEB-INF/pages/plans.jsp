<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath() %>/assets/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/flat-ui.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/demo.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/toastr.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/images/favicon.ico" rel="shortcut icon">
<style>
.selected {
	 background-color:rgba(156, 227, 162, 0.46);
}   
</style>

<title>计划-时间轴</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
    <div class="container">

      <div class="row demo-tiles" style="margin-top:55px;">
      
      <div class="col-md-6" style="margin-bottom:10px;margin-top:5px;">
              <div class="btn-toolbar">
                <div class="btn-group">
                  <a class="btn btn-primary" title="添加计划" href="javascript:;" data-toggle="modal" data-target="#createPlanModal"><span class="fui-plus-circle"></span></a>
                  <a class="btn btn-primary " title="编辑计划" href="javascript:;" id="editPlanBtn"><span class="fui-new"></span></a>
                  <a class="btn btn-primary" title="删除计划" href="javascript:;" id="delPlanBtn"><span class="fui-trash"></span></a>
                  <a class="btn btn-primary" title="列表展示" href="<%=request.getContextPath() %>/plans.html"><span class="fui-list-small-thumbnails"></span></a>
                </div>
              </div> 
       </div>
       <div class="col-md-6" style="margin-bottom:10px;margin-top:5px;">
       		<form class="navbar-form navbar-right" action="<%=request.getContextPath() %>/plans.html" method="post" role="search">
            <div class="form-group">
              <div class="input-group">
                <input class="form-control" id="navbarInput-01" name="content" type="search" placeholder="Search">
                <span class="input-group-btn">
                  <button type="submit" class="btn"><span class="fui-search"></span></button>
                </span>
              </div>
            </div>
          </form>
       </div>
      	  <c:if test="${plans == null }">
      	  	<div class="jumbotron" style="margin-top:55px;">
        		<h1>新建计划</h1>
        		<p>你暂时还没有计划，可以点击左上角的 <a href="javascript:;" class="fui-plus-circle btn-primary" data-toggle="modal" data-target="#createPlanModal"></a>，进行增加。</p>
      		</div>
      	  </c:if>
      
	      <c:forEach items="${plans }" var="plan">
	        <div class="col-xs-3">
	          <div class="tile">
	            <input type="hidden" value="${plan.id }">
	            <img src="<%=request.getContextPath() %>/assets/images/icons/svg/${plan.icon }.svg" alt="${plan.icon }" class="tile-image big-illustration">
	            <h3 class="tile-title">${plan.title }</h3>
	            <p>${plan.content }</p>
	            <a class="btn btn-primary btn-large btn-block" href="<%=request.getContextPath() %>/items.html?planId=${plan.id}&legend=table">详&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;情</a>
	          </div>
	        </div>
	      </c:forEach>
	  
       
      </div>
      <c:if test="${plans != null and total gt 8}">
	      <div class="row" style="margin-top:-55px;">
		      <div class="pagination pagination-danger col-md-4" style="float:right;margin-right:-60px;">
		            <a href="<%=request.getContextPath() %>/plans.html?pageNum=${pageNum - 1}" class="btn btn-danger previous <c:if test="${pages == pageNum - 1 or pageNum - 1 == 0}">disabled</c:if>">
		              <i class="fui-arrow-left"></i>
		              NEWER
		            </a>
		            <a href="<%=request.getContextPath() %>/plans.html?pageNum=${pageNum + 1}" class="btn btn-danger next <c:if test="${pages == pageNum}">disabled</c:if>">
		              OLDER
		              <i class="fui-arrow-right"></i>
		            </a>
		       </div>
	       </div>
       </c:if>

    </div> <!-- /container -->
    
  <!-- 新建计划框 --> 
  <div class="modal fade " id="createPlanModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">创建计划</h4>
      </div>
      <div class="modal-body">
        	<form id="addPlanForm" class="form-horizontal" role="form" method="post" action="<%=request.getContextPath() %>/addPlan.html">
			  <div class="form-group">
			    <label for="title" class="col-sm-2 control-label">标题</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="title" maxlength="5" name="title" placeholder="输入标题">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="content" class="col-sm-2 control-label">说明</label>
			    <div class="col-sm-10">
			       <textarea rows="3" class="form-control" id="content" name="content" placeholder="输入简要说明"></textarea>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="icon" class="col-sm-2 control-label">图标</label>
			    <div class="col-sm-10">
					<select data-toggle="select"  name="icon" class="form-control select select-primary mrs mbm" >
			          <option value="book">book</option>
			          <option value="calendar">calendar</option>
			          <option value="chat">chat</option>
			          <option value="clipboard">clipboard</option>
			          <option value="clocks">clocks</option>
			          <option value="compas">compas</option>
			          <option value="gift-box">gift-box</option>
			          <option value="loop">loop</option>
			          <option value="mail">mail</option>
			          <option value="map">map</option>
			          <option value="paper-bag">paper-bag</option>
			          <option value="pencils">pencils</option>
			          <option value="ribbon">ribbon</option>
        			</select>
			    </div>
			  </div>
			  
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="save" onclick="addPlan()">保存</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
 
 
 <!-- 修改计划框 --> 
  <div class="modal fade " id="editPlanModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">编辑计划</h4>
      </div>
      <div class="modal-body">
        	<form id="editPlanForm" class="form-horizontal" role="form"  method="post" action="<%=request.getContextPath() %>/updatePlan.html">
			  <input type="hidden" name="id">
			  <div class="form-group">
			    <label for="title" class="col-sm-2 control-label">标题</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="edit_title" maxlength="5" name="title" placeholder="输入标题">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="content" class="col-sm-2 control-label">说明</label>
			    <div class="col-sm-10">
			       <textarea rows="3" class="form-control" id="edit_content" name="content" placeholder="输入简要说明"></textarea>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="icon" class="col-sm-2 control-label">图标</label>
			    <div class="col-sm-10">
					<select data-toggle="select"  name="icon" class="form-control select select-primary mrs mbm" >
			          <option value="book">book</option>
			          <option value="calendar">calendar</option>
			          <option value="chat">chat</option>
			          <option value="clipboard">clipboard</option>
			          <option value="clocks">clocks</option>
			          <option value="compas">compas</option>
			          <option value="gift-box">gift-box</option>
			          <option value="loop">loop</option>
			          <option value="mail">mail</option>
			          <option value="map">map</option>
			          <option value="paper-bag">paper-bag</option>
			          <option value="pencils">pencils</option>
			          <option value="ribbon">ribbon</option>
        			</select>
			    </div>
			  </div>
			  
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="update" onclick="updatePlan()">修改</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
 
 
 
 <!-- 删除计划框 --> 
  <div class="modal fade " id="delPlanModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">删除计划</h4>
      </div>
      <div class="modal-body">
			<p>你确定删除 "<span id="delPlanTitle"></span>" 计划吗？</p>
			<form id="delPlanForm" method="post" action="<%=request.getContextPath() %>/delPlan.html">
				<input type="hidden" name="id">
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-danger" id="delete" onclick="delPlan()">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
    
    
    <c:if test="${plans!=null }">
		<jsp:include page="footer.jsp"/>
    </c:if>
    <c:if test="${plans==null }">
		<jsp:include page="footer-fixed.jsp"/>
    </c:if>
    
	<input id="msg" value="${msg}" type="hidden">
	
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/flat-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/toastr.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/plan.js"></script>

</body>
</html>