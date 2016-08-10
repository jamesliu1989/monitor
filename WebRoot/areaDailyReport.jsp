<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
	<title>无线测温监测系统 | 区域日报</title>
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
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(5, 1, 2); notification()">

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
							无线测温监测系统 <small>区域日报</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.html">首页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">报表</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="#">区域日报表</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT--> 
				<div class="row-fluid">
					<div class="span12">
						<form class="form-inline" action="reportAction_areaDailyReport">
							<label class="control-label">控制器号：</label> 
							<select id="ctrlerNo_s" style="width:80px;height:28px;" name="ctrlerNo">
								<option value="-1">选择</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="control-label">区域名称：</label> <select id="areaName_s"
								style="width:100px;height:28px;" name="areaNo">
								<option value="-1">选择区域</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="control-label">月份：</label>
							<div class="input-append date" id="startDate"
								style="padding-right: 15px;">
								<input size="16" type="text" readonly
									style="width:160px;height:28px;" id="monthDate" name="month" value="${month}">
								<span class="add-on" style="height: 18px;"><i class="icon-calendar"></i></span>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary" id="subbtn" onclick="return formCheck();">
								<i class="icon-search icon-white"></i>&nbsp;查询
							</button>
						</form>
					</div>
				</div>         
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN BORDERED TABLE PORTLET-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption"><i class="icon-table"></i>报表</div>
								<div class="actions" style="margin-top:10px;">
									<div class="btn-group">
										<a class="btn green" href="#" data-toggle="dropdown">
										<i class="icon-cogs"></i> 工具
										<i class="icon-angle-down"></i>
										</a>
										<ul class="dropdown-menu pull-right">
											<li><a onclick="javascript:print();"><i class="icon-print"></i> 打印</a></li>
											<li><a href="#"><i class=" icon-download-alt"></i> 导出到EXCEL</a></li>
											<li class="divider"></li>
										</ul>
									</div>
								</div>					
							</div>
							<div class="portlet-body">
								<table class="table table-bordered table-hover">
									<thead>
									    <tr>
									        <th colspan="16">${month}&nbsp;区域温度日报表（${areaName}）</th>
									    </tr>
										<tr>
											<th style="width:90px;">日期</th>																				
											<th>介质温度最大值（℃）</th>
											<th>介质温度最小值（℃）</th>
											<th>介质温度均值（℃）</th>
											<th>环境温度最大值（℃）</th>
											<th>环境温度最小值（℃）</th>
											<th>环境温度均值（℃）</th>
											<th>温差绝对值（℃）</th>
											<th>湿度最大值（%RH）</th>
											<th>湿度最小值（%RH）</th>
											<th>湿度平均值（%RH）</th>
											<th>电池电压（V）</th>
											<th>无线信号（dB）</th>
											<th>烟雾报警</th>
											<th>工作状态</th>
											<th>有无报警</th>
										</tr>
									</thead>
									<tbody>
									<s:iterator value="%{reportDailyAreas}" id="report">
										<tr>
											<td>${report.dayOfYear}</td>
											<td>${report.tempMedMax}</td>
											<td>${report.tempMedMin}</td>
											<td>${report.tempMedAvg}</td>
											<td>${report.tempEnvMax}</td>
											<td>${report.tempEnvMin}</td>
											<td>${report.tempEnvAvg}</td>											
											<td>${report.tempDevAbs}</td>
											<td>${report.humidityMax}</td>
											<td>${report.humidityMin}</td>
											<td>${report.humidityAvg}</td>
											<td>${report.batteryVol}</td>
											<td>${report.wirelessSig}</td>
											<td>
											 <s:if test="#report.smogAlert == 1">
											    <span class="label label-success">无</span>
											 </s:if>
											 <s:else>
											    <span class="label label-important">有</span>
											 </s:else>
											 </td>
											<td>
											 <s:if test="#report.status == 1">
											    <span class="label label-success">在线</span>
											 </s:if>
											 <s:else>
											    <span class="label label-important">离线</span>
											 </s:else>
											 </td>
											<td>
                                             <s:if test="#report.alert == 0">
											    <span class="label label-success">正常</span>
											 </s:if>
											 <s:else>
											    <span class="label label-important">报警</span>
											 </s:else>
											</td>
										</tr>
								   </s:iterator>										
									</tbody>
								</table>
<%-- 								<div class="row-fluid">
								    <div class="span6">
								        <div class="dataTables_info" id="sample_1_info">Showing 1 to 10 of 43 entries</div>
								    </div>
								    <div class="span6">
								      <div class="dataTables_paginate paging_bootstrap pagination">
								       <ul>
								          <li class="prev disabled"><a href="#">← <span class="hidden-480">上一页</span></a></li>
								          <li class="active"><a href="#">1</a></li>
								          <li><a href="#">2</a></li>
								          <li><a href="#">3</a></li>
								          <li><a href="#">4</a></li>
								          <li><a href="#">5</a></li>
								          <li class="next"><a href="#"><span class="hidden-480">下一页</span> → </a></li>
								       </ul>
								     </div>
								  </div>
							 </div> --%>
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
	<!-- END CORE PLUGINS -->
	<script src="media/js/app.js"></script>   
	<script src="media/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="media/js/bootstrap-datetimepicker.js" type="text/javascript"></script> 
	<script src="media/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>    
	<script src="media/js/jquery.jqprint-0.3.js" type="text/javascript"></script>      
	<script>
	    function print(){
	    	$('.table').jqprint();
	    }
	function formCheck(){
		if($("#areaName_s").val() != '-1' && $("#monthDate").val() != ''){
			return true;
		}else{
			alert('请正确选择区域和月份!');
			return false;
		}
	}
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();
		   //获取控制器选择框类容 
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
		     //选择年月份
		   $('#monthDate').datetimepicker({  
		        format: 'yyyy-mm',  
		         weekStart: 1,  
		         autoclose: true,  
		         startView: 3,  
		         minView: 3,  
		         forceParse: false,  
		         language: 'zh-CN'  
		    });
		     //提交前单选框值
		     var lastAreaNo = '${areaNo}';
		     
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