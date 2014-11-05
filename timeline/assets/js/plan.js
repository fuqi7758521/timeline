$(function(){
		
		$('select[name="icon"]').select2({dropdownCssClass: 'select-inverse-dropdown show-select-search'});
		
		//创建计划，输入Enter键，进行提交
	    $('#addPlanForm input').keypress(function (e) {
	    	  if (e.which == 13) {
	    		  addPlan();
	    	  }
	    });
		
		//编辑计划，输入Enter键，进行提交
	    $('#editPlanForm input').keypress(function (e) {
	    	  if (e.which == 13) {
	    		  updatePlan();
	    	  }
	    });
	    
	    //选中某一个计划，让她的背景颜色变化
	    $("div.col-xs-3 > div.tile").click(function(){
	    	var $this = $(this);
	    	$("div.col-xs-3 > div.tile").removeClass("selected");
	    	$this.toggleClass("selected");
	    	
	    	//填充编辑计划弹出框的属性值
	    	var title = $this.find(".tile-title").html();
	    	var content = $this.find("p").html();
	    	var icon = $this.find("img").attr("alt");
	    	var id = $this.find("input").val();
	    	$("#editPlanModal input[name='id']").val(id);
	    	$("#editPlanModal input[name='title']").val(title);
	    	$("#editPlanModal textarea[name='content']").val(content);
	    	$("#editPlanModal select[name='icon']").select2("val",icon);
	    	
	    	$("#delPlanModal input[name='id']").val(id);
	    	$("#delPlanModal span[id='delPlanTitle']").html(title);
	    });
	    
	    $("#editPlanBtn").click(function(){
	    	if(!$("div.col-xs-3 > div.tile").hasClass("selected")){
	    		toastr.warning("请选择计划！");
	    		return false;
	    	}
	    	$("#editPlanModal").modal();
	    });
	    
	    $("#delPlanBtn").click(function(){
	    	if(!$("div.col-xs-3 > div.tile").hasClass("selected")){
	    		toastr.warning("请选择计划！");
	    		return false;
	    	}
	    	
	    	$("#delPlanModal").modal();
	    });
		
	});
	
	//创建计划，对属性进行校验和提交
	function addPlan(){
		var title = $("#title").val();
		if(title.trim() == ""){
			toastr.warning("标题不能为空！");
			return false;
		}
		var content = $("#content").val();
		if(content.trim() == ""){
			toastr.warning("说明不能为空！");
			return false;
		}
		$("#addPlanForm").submit();
	}
	
	//编辑计划，对属性进行校验和提交
	function updatePlan(){
		var title = $("#edit_title").val();
		if(title.trim() == ""){
			toastr.warning("标题不能为空！");
			return false;
		}
		var content = $("#edit_content").val();
		if(content.trim() == ""){
			toastr.warning("说明不能为空！");
			return false;
		}
		$("#editPlanForm").submit();
	}
	
	function delPlan(){
		$("#delPlanForm").submit();
	}