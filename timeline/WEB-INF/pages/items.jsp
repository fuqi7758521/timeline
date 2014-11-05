<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath() %>/assets/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/flat-ui.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/demo.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/toastr.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/assets/images/favicon.ico" rel="shortcut icon">

<title>计划-时间轴</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
    <div class="container">

      <div class="row demo-tiles" style="margin-top:55px;margin-bottom:10px;">
      
      <div class="col-md-12" style="margin-bottom:10px;margin-top:5px;">
              <div class="btn-toolbar">
                <div class="btn-group">
                  <a class="btn btn-primary" title="创建条目" href="javascript:;" data-toggle="modal" data-target="#createItemModal"><span class="fui-plus-circle"></span></a>
                  <a title="表格展示" class="btn btn-primary <c:if test="${param.legend == 'table' }">active</c:if>" href="<%=request.getContextPath() %>/items.html?planId=${param.planId}&legend=table" ><span class="fui-list-numbered"></span></a>
                  <a title="图表展示" class="btn btn-primary <c:if test="${param.legend == 'chart' }">active</c:if>" href="<%=request.getContextPath() %>/itemsChart.html?planId=${param.planId}&legend=chart" id="delPlanBtn"><span class="fui-image"></span></a>
                  <a title="计划列表" class="btn btn-primary" href="<%=request.getContextPath() %>/plans.html"><span class="fui-list-small-thumbnails"></span></a>
                </div>
              </div> 
       </div>
		  <c:if test="${param.legend == 'chart' }">
	 		<div class="col-md-12" id="container"></div>
 		  </c:if>
 		  <c:if test="${param.legend == null || param.legend == 'table' }">
      	  <c:if test="${items == null || total eq 0}">
      	  	<div class="jumbotron" style="margin-top:55px;">
        		<h1>新建条目</h1>
        		<p>该计划还没有条目，可以点击左上角的 <a href="javascript:;" class="fui-plus-circle btn-primary" data-toggle="modal" data-target="#createItemModal"></a>，进行添加。</p>
      		</div>
      	  </c:if>
      	  <c:if test="${items != null and total gt 0}">
      	  	<div class="col-md-12">
      	  		<table class="table table-bordered table-hover table-striped" style="border-radius:3px;">
      	  			<caption><h4>${planName }</h4><h7>总计：大约${totalHours}小时</h7></caption>
      	  			<thead>
      	  				<tr style="background-color:#1abc9c;color:#fff">
      	  					<th>日期</th>
      	  					<th>开始时间</th>
      	  					<th>结束时间</th>
      	  					<th>耗时</th>
      	  					<th>操作</th>
      	  				</tr>
      	  			</thead>
      	  			<tbody>
			      	  <c:forEach items="${items }" var="item">
			      	  	 <c:set var="consumeTime" value="${item.consumeTime}"/>
      	  				 <tr class="${item.rowFlag }">
      	  				 	<td><fmt:formatDate value="${item.createdDate}" pattern="yyyy-MM-dd"/></td>
      	  				 	<td>${item.startTimeShort}</td>
      	  				 	<td>${item.endTimeShort}</td>
      	  				 	<td>${consumeTime } </td>
      	  				 	<td><a itemId=${item.id } startTime="${item.startTime }" endTime="${item.endTime }" class="fui-new" href="javascript:;" onclick="updateItem(this);"></a>&nbsp;&nbsp;
      	  				 	    <a itemId="${item.id }" style="color:#e74c3c;" class="fui-trash" href="javascript:;" onclick="delItem(this)"></a></td>
      	  				 </tr>
			      	  </c:forEach>
      	  			</tbody>
      	  		</table>
      	  	</div>
      	  </c:if>
      	  
			<c:if test="${items != null and total gt 10}">
		      <div class="row" style="margin-top:-55px;">
			      <div class="pagination pagination-danger col-md-4" style="float:right;margin-right:-60px;">
			            <a href="<%=request.getContextPath() %>/items.html?planId=${param.planId }&pageNum=${pageNum - 1}" class="btn btn-danger previous <c:if test="${pages == pageNum - 1 or pageNum - 1 == 0}">disabled</c:if>">
			              <i class="fui-arrow-left"></i>
			              NEWER
			            </a>
			            <a href="<%=request.getContextPath() %>/items.html?planId=${param.planId }&pageNum=${pageNum + 1}" class="btn btn-danger next <c:if test="${pages == pageNum}">disabled</c:if>">
			              OLDER
			              <i class="fui-arrow-right"></i>
			            </a>
			       </div>
		       </div>
	        </c:if>
	        
	        </c:if>
	  
       
      </div>


    </div> <!-- /container -->
    
 
  <!-- 新建条目框 --> 
  <div class="modal fade " id="createItemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">创建条目</h4>
      </div>
      <div class="modal-body">
        	<form id="addItemForm" class="form-horizontal" role="form" method="post" action="<%=request.getContextPath() %>/addItem.html">
			 <input id="planId" name="planId" value="${param.planId}" type="hidden">
			 <div class="row">
			 	  <div class="col-md-2"></div>
				  <div class="form-group  col-md-7">
	                <div class='input-group date' id='startTimePicker'>
	                    <input type='text' name="startTime" class="form-control" data-date-format="YYYY-MM-DD HH:mm" placeholder="开始时间"/>
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	             </div>
			 </div>
             <div class="row">
             	<div class="col-md-2"></div>
				  <div class="form-group col-md-7">
	                <div class='input-group date' id='endTimePicker'>
	                    <input type='text' name="endTime" class="form-control" data-date-format="YYYY-MM-DD HH:mm" placeholder="结束时间"/>
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	             </div>
			 </div>
			  
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="addItem()">保存</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
 
 
 <!-- 编辑条目框 --> 
  <div class="modal fade" id="editItemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">编辑条目</h4>
      </div>
      <div class="modal-body">
        	<form id="updateItemForm" class="form-horizontal" role="form" method="post" action="<%=request.getContextPath() %>/updateItem.html">
			 <input name="planId" value="${param.planId}" type="hidden">
			 <input name="id" type="hidden">
			 <div class="row">
			 	  <div class="col-md-2"></div>
				  <div class="form-group col-md-7">
	                <div class='input-group date' id='startTimePickerForEdit'>
	                    <input type='text' name="startTime" class="form-control" data-date-format="YYYY-MM-DD HH:mm" placeholder="开始时间"/>
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	             </div>
			 </div>
             <div class="row">
                  <div class="col-md-2"></div>
				  <div class="form-group col-md-7">
	                <div class='input-group date' id='endTimePickerForEdit'>
	                    <input type='text' name="endTime" class="form-control" data-date-format="YYYY-MM-DD HH:mm" placeholder="结束时间"/>
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	             </div>
			 </div>
			  
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="updateItem">修改</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
 
 
 
 <!-- 删除条目 --> 
  <div class="modal fade " id="delItemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">删除条目</h4>
      </div>
      <div class="modal-body">
			<p>你确定删除该条目吗？</p>
			<form id="delItemForm" method="post" action="<%=request.getContextPath() %>/delItem.html">
				<input name="id" type="hidden">
				<input name="planId" value="${param.planId}" type="hidden">
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-danger" id="delItem">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
 	
 
    <c:if test="${total >= 10 }">
		<jsp:include page="footer.jsp"/>
    </c:if>
    <c:if test="${total < 10 }">
		<jsp:include page="footer-fixed.jsp"/>
    </c:if>
    
	<input id="msg" value="${msg}" type="hidden">
	<input id="legend" value="${param.legend}" type="hidden">
	
	
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/highcharts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/flat-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/toastr.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/moment.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/common.js"></script>
<script type="text/javascript">
$(function () {
	$('#startTimePicker').datetimepicker();
	$('#endTimePicker').datetimepicker();
	$('#startTimePickerForEdit').datetimepicker();
	$('#endTimePickerForEdit').datetimepicker();
	
	//创建计划，输入Enter键，进行提交
    $('#addItemForm input').keypress(function (e) {
    	  if (e.which == 13) {
    		  addItem();
    	  }
    });
	
	$("#updateItem").click(function(){
		$("#updateItemForm").submit();
	});
	
	$("#delItem").click(function(){
		$("#delItemForm").submit();
	});
	
	var legend = $("#legend").val();
	
	if(legend == 'chart') {
		$('#container').highcharts({
	        title: {
	            text: '${planName}',
	            x: -20 //center
	        },
	        subtitle: {
	            text: '总计：大约${totalHours}小时',
	            x: -20
	        },
	        xAxis: {
	            categories: ${categorys}
	        },
	        yAxis: {
	            title: {
	                text: 'min'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }]
	        },
	        tooltip: {
	            valueSuffix: 'min'
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        exporting: {
	            enabled: false
	        },
	        credits:{
	        	enabled:false
	        },
	        series: [{
	            name: '花费时间',
	            data: ${datas}
	        }]
	    });
	}
	
	
	
});

function addItem(){

	$("#addItemForm").submit();
}

function updateItem(obj){
	var $this = $(obj);
	var startTime = $this.attr("startTime");
	var endTime = $this.attr("endTime");
	var itemId = $this.attr("itemId");
	$("#editItemModal input[name='startTime']").val(startTime);
	$("#editItemModal input[name='endTime']").val(endTime);
	$("#editItemModal input[name='id']").val(itemId);
	$("#editItemModal").modal();
}

function delItem(obj){
	var $this = $(obj);
	var itemId = $this.attr("itemId");
	console.log(itemId);
	$("#delItemForm input[name='id']").val(itemId);
	$("#delItemModal").modal();
}

</script>
</body>
</html>