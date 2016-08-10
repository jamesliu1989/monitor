<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>无线测温监测系统 | 报警信息</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/style-metro.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="media/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" href="media/css/DT_bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="highcharts/css/bootstrap-datetimepicker.min.css" />
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="media/image/favicon.ico" />
<style type="text/css">
.table thead tr th{
  color: #666;
  background-color: #DDD;
  text-align: center;
  vertical-align: middle;
}
.table tbody tr td{
  font-size:14px;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(10, 0, 0); notification()">

	<!-- BEGIN HEADER -->
    <%@include file="header.jsp"%> 
	<!-- END HEADER -->
	
	<!-- BEGIN CONTAINER -->
	<div class="page-container row-fluid">
	
		<!-- BEGIN SIDEBAR -->
	<%@include file="sidebar.jsp" %>
		<!-- END SIDEBAR -->
		
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->        
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
					
						<!-- BEGIN STYLE CUSTOMIZER -->
				         <%@include file="theam.jsp" %>
						<!-- END BEGIN STYLE CUSTOMIZER --> 
						 
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							无线测温监测系统 <small>报警信息</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.html">首页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">节点信息</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="#">报警信息</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->  
				<form action="alertAction_getUnReadByNodeTime">
				<div class="row-fluid">
					<div class="span12">
						<div class="form-inline">
							<label class="control-label">控制器号：</label> 
							<select id="ctrlerNo_s" style="width:80px;height:28px;" name="ctrlerNo">
								<option value="-1">选择</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="control-label">区域名称：</label> <select id="areaName_s"
								style="width:100px;height:28px;" name="areaNo">
								<option value="-1">选择区域</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="control-label">节点编号：</label> 
							<select id="nodeNo_s"
								style="width:100px;height:28px;" name="nodeNo">
								<option value="-1">选择节点</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="radio">
						        <input id="radio1" type="radio" name="range" value="0" checked>未处理
					        </label>
					        <label class="radio">
						        <input id="radio2" type="radio" name="range" value="1">所有
					        </label>
					        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary" id="subbtn" onclick="return formCheck();">
								<i class="icon-search icon-white"></i>&nbsp;查询
							</button>
						</div>
					</div>
				</div>  
				<div class="row-fluid">
					<div class="span12">
						<div class="form-inline">
							<label class="control-label">起止时间：</label>
							<div class="input-append date" id="startDate"
								style="padding-right: 15px;">
								<input size="16" type="text" readonly
									style="width:160px;height:28px;" id="sdate" name="startTime" value="<fmt:formatDate value="${startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>">
								<span class="add-on" style="height: 18px;"><i class="icon-calendar"></i></span>
							</div>
							至
							<div class="input-append date" id="endDate"
								style="padding-left: 15px;">
								<input size="16" type="text" readonly
									style="width:160px;height:28px;" id="edate" name="endTime" value="<fmt:formatDate value="${endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>">
								<span class="add-on" style="height: 18px;"><i class="icon-calendar"></i></span>
							</div>
						</div>
					</div>
				</div>
				</form>       
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN BORDERED TABLE PORTLET-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption"><i class="icon-table"></i>节点信息</div>
								<div class="actions">
									<div class="btn-group">
										<a class="btn green" href="#" data-toggle="dropdown">
										<i class="icon-cogs"></i> 工具
										<i class="icon-angle-down"></i>
										</a>
										<ul class="dropdown-menu pull-right">
											<li><a onclick="javascript:print();">
										        <i class="icon-print"></i> 打印</a></li>
											<li><a href="#"><i class=" icon-download-alt"></i> 导出到EXCEL</a></li>
											<li class="divider"></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-bordered table-hover"  id="nodeViewTable">
									<thead>
										<tr>
											<th>序号</th>
											<th>区域名称</th>
											<th>节点编号</th>
											<th>报警属性</th>
											<th>报警类型</th>
											<th>报警值</th>
											<th>报警单位</th>
											<th>报警时间</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
							  <s:iterator value="%{alerts}" id="alert" status="st">
									<tr>
									    <td>${st.index+1 }</td>
									    <td>${alert.areaNo }</td>
									    <td>${alert.nodeNo }</td>
									    <td>
									    <s:if test="#alert.alertProperty==1">
									       <label class="label label-warning">预报警</label>
									    </s:if>
									    <s:else>
									       <label class="label label-important">报警</label>
									       </s:else>
									    </td>
									    <td>${alert.alertType }</td>
									    <s:if test="#alert.alertProperty==1">
									      <td><label class="label label-warning">${alert.alertValue }</label></td>
									    </s:if>
									    <s:else>
									      <td><label class="label label-important">${alert.alertValue }</label></td>
									    </s:else>
									    <td>${alert.alertMeasurement }</td>
									    <td><fmt:formatDate value="${alert.alertTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									    <td><s:if test="#alert.isRead == true"><label class="label label-warning">已处理</label></s:if><s:else><a onclick="relieveAlert(this, ${alert.id})" class="btn-small btn green" style="padding: 2px 10px;">解除</a></s:else></td>
									</tr>
							</s:iterator>
									</tbody>
								</table>
								<div class="row-fluid">
								    <div class="span12">
								      <div class="dataTables_paginate paging_bootstrap pagination">
								       <ul>
								       <s:if test="%{page!=0}">
								          <li class="prev"><a href="alertAction_getUnReadByNodeTime?page=${pre}&ctrlerNo=${ctrlerNo}&areaNo=${areaNo}&nodeNo=${nodeNo}&startTime=<fmt:formatDate value="${startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&endTime=<fmt:formatDate value="${endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&range=${range}">← <span class="hidden-480">上一页</span></a></li>
								       </s:if>
									   <c:forEach var="i" begin="${page+1}" end="${pageNum}" step="1">
											<c:if test="${i==page+1}">
											     <li class="active">
											</c:if>
											<c:if test="${i!=page+1}">
											     <li>
											</c:if>
											<a href="alertAction_getUnReadByNodeTime?page=${i-1}&ctrlerNo=${ctrlerNo}&areaNo=${areaNo}&nodeNo=${nodeNo}&startTime=<fmt:formatDate value="${startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&endTime=<fmt:formatDate value="${endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&range=${range}">${i}</a></li>
									   </c:forEach>                                                         
								       <s:if test="%{next!=pageNum}">
								          <li class="next"><a href="alertAction_getUnReadByNodeTime?page=${next}&ctrlerNo=${ctrlerNo}&areaNo=${areaNo}&nodeNo=${nodeNo}&startTime=<fmt:formatDate value="${startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&endTime=<fmt:formatDate value="${endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&range=${range}"><span class="hidden-480">下一页</span> → </a></li>
								       </s:if>
								       </ul>
								     </div>
								  </div>
							 </div>
							</div>
						</div>
						<!-- END BORDERED TABLE PORTLET-->
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
   <%@include file="footer.jsp" %>
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<script src="media/js/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      
	<script src="media/js/bootstrap.min.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
	<script src="media/js/excanvas.min.js"></script>
	<script src="media/js/respond.min.js"></script>  
	<![endif]-->   
	<script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="media/js/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.uniform.min.js" type="text/javascript" ></script>
		<script src="media/js/bootstrap-datetimepicker.js" type="text/javascript"></script> 
	<script src="media/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script> 
	<!-- END CORE PLUGINS -->
	<script src="media/js/app.js"></script> 
	<script src="media/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.jqprint-0.3.js" type="text/javascript"></script>      
	<script>
	    function print(){
	    	$('.table').jqprint();
	    }
	    //解除报警按钮
	    function relieveAlert(obj, id){
	    	
	    	$.post('json/alertAction_relieveAlert', {id:id}, function(data){
	    		if(data == 1){
	    			$(obj).parent().html("<label class='label label-warning'>已处理</label>");
	    			alert("报警解除成功！");
	    		}else{
	    			alert("报警解除失败！");
	    		}
	    	});
	    }
	    
	    function formCheck(){
	    	if($("#ctrlerNo_s").val() == '-1'){
	    		alert('请选择控制器!');
	    		return false;
	    	}else if($("#areaName_s").val() == '-1'){
	    		alert('请选择区域!');
	    		return false;
	    	}else{
	    		return true;
	    	}
	    }
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();
		   
		   //范围选择初始化
		    var range = "${range}";
			if(range != "" && range == "1"){
				$("#radio1").parent('span').removeClass('checked');
				$("#radio2").parent('span').addClass('checked');
				$("#radio2").attr("checked",'checked');
			}
		   
		   var lastCtrlerNo = '${ctrlerNo}';
		   $.post('json/areaAction_getAllCtrlerNo','',function(data){
				  if(data.length>0){
					 var options = "";
				     for(var i=0;i<data.length;i++){
					   options +='<option value="'+data[i]+'">C'+data[i]+'</option>';
				     }
				     $('#ctrlerNo_s').append(options);
				     if(lastCtrlerNo != ''){
				    	 getAreas(lastCtrlerNo);
				    	 $("#ctrlerNo_s").val(lastCtrlerNo);				    	 
				     }
				  }
		   });
		   
		     //开始时间
		   $('#sdate').datetimepicker({  
		        format: 'yyyy-mm-dd hh:ii:ss',  
		         weekStart: 1,  
		         autoclose: true,  
		         startView: 2,  
		         minView: 0, 
		         minuteStep: 1,
		         forceParse: false,  
		         language: 'zh-CN'  
		    });
		     //结束时间
		   $('#edate').datetimepicker({  
		        format: 'yyyy-mm-dd hh:ii:ss',  
		         weekStart: 1,  
		         autoclose: true,  
		         startView: 2,  
		         minView: 0,  
		         minuteStep: 1,
		         forceParse: false,  
		         language: 'zh-CN'  
		    });
		     //提交前单选框值
		     var lastAreaNo = '${areaNo}';
		     var lastNodeNo = '${nodeNo}';
		 //获取节点选择框类容 
		   function getNodes(areaNo){
			   $('#nodeNo_s').html('');
			   $('#nodeNo_s').append('<option value="-1">选择节点</option>');
			   $.post('json/nodeAction_nodeNo', {areaNo:areaNo} ,function(data){
					  if(data.length>0){
						 var options = "";
					     for(var i=0;i<data.length;i++){
						   options +='<option value="'+data[i]+'">'+data[i]+'</option>';
					     }				     
					     $('#nodeNo_s').append(options);
					     
					     if(lastNodeNo !=''){
					    	 $("#nodeNo_s").val(lastNodeNo);
					     }
					  }
			   }); 
		   }
		   
		 //area事件绑定 
		   $('#areaName_s').change(function(){	
			   lastNodeNo = '';		   			   
			   getNodes(this.value);
		   });
		 		     
			   //获取区域选择框类容 
			   function getAreas(ctrlerNo){
				   $('#areaName_s').html('');
				   $('#areaName_s').append('<option value="-1">全部区域</option>');
				   $.post('json/areaAction_areaConfig', {ctrlerNo:ctrlerNo} ,function(data){
						  if(data.length>0){
							 var options = "";
						     for(var i=0;i<data.length;i++){
							   options +='<option value="'+data[i][0]+'">'+data[i][1]+'</option>';
						     }				     
						     $('#areaName_s').append(options);
						     if(lastAreaNo !=''){
						    	 getNodes(lastAreaNo);
						    	 $("#areaName_s").val(lastAreaNo);
						     }
						  }
				   }); 
			   }
			 //area事件绑定 
		   $('#ctrlerNo_s').change(function(){			   			   
			   getAreas(this.value);
		   });			 		   
		});
	</script>
</body>
<!-- END BODY -->
</html>