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
	<title>Metronic | Data Tables - Basic Tables</title>
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
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="media/image/favicon.ico" />
<style type="text/css">
.table thead tr th{
  color: #666;
  background-color: #DDD;
  text-align: center;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(5, 1, 1); notification()">

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
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div id="portlet-config" class="modal hide">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button"></button>
					<h3>portlet Settings</h3>
				</div>
				<div class="modal-body">
					<p>Here will be a configuration form</p>
				</div>
			</div>
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
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
							Basic Tables <small>basic table samples</small>
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
							<li><a href="#">日报表</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT--> 
				<div class="row-fluid">
					<div class="span12">
						<form class="form-inline" action="action/alarmInfo">
							<label class="control-label">区域名称：</label> <select id="areaName_s"
								style="width:100px;height:28px;" name="subId">
								<option value="-1">选择区域</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="control-label">节点编号：</label> <select id="nodeNo_s"
								style="width:100px;height:28px;" name="subId">
								<option value="-1">选择节点</option>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary" id="subbtn">
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
											<li><a href="#"><i class="icon-print"></i> 打印</a></li>
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
											<th>节点编号</th>																					
											<th>介质温度最大值（℃）</th>
											<th>介质温度最小值（℃）</th>
											<th>介质温度均值（℃）</th>
											<th>环境温度最大值（℃）</th>
											<th>环境温度最小值（℃）</th>
											<th>环境温度均值（℃）</th>
											<th>温差绝对值（℃）</th>
											<th>电池电压（V）</th>
											<th>烟雾报警</th>
											<th>工作状态</th>
											<th>有无报警</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>10.5</td>
											<td>23.9</td>
											<td>10.5</td>
											<td>23.9</td>
											<td>10.5</td>
											<td>23.9</td>											
											<td>5</td>											
											<td>98</td>
											<td>34</td>
											<td><span class="label label-success">在线</span></td>
											<td><span class="label label-warning">报警</span></td>
										</tr>
										<tr>
											<td>2</td>
											<td>10.5</td>
											<td>23.9</td>
											<td>10.5</td>
											<td>23.9</td>
											<td>10.5</td>
											<td>23.9</td>											
											<td>5</td>											
											<td>98</td>
											<td>34</td>
											<td><span class="label label-success">在线</span></td>
											<td><span class="label label-warning">报警</span></td>
										</tr>										
										<tr>
											<td>3</td>	
											<td>10.5</td>
											<td>23.9</td>
											<td>10.5</td>
											<td>23.9</td>
											<td>10.5</td>
											<td>23.9</td>											
											<td>5</td>											
											<td>98</td>
											<td>34</td>
											<td><span class="label label-success">在线</span></td>
											<td><span class="label label-warning">报警</span></td>
										</tr>
										<tr>
											<td>4</td>
											<td>10.5</td>
											<td>23.9</td>
											<td>10.5</td>
											<td>23.9</td>
											<td>10.5</td>
											<td>23.9</td>											
											<td>5</td>											
											<td>98</td>
											<td>34</td>
											<td><span class="label label-success">在线</span></td>
											<td><span class="label label-warning">报警</span></td>
										</tr>
									</tbody>
								</table>
								<div class="row-fluid">
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
	<!-- END CORE PLUGINS -->
	<script src="media/js/app.js"></script>   
	<script src="media/js/jquery.validate.min.js" type="text/javascript"></script>    
	<script>
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();
		   //获取区域选择框类容 
		   $.post('json/areaAction_areaConfig','',function(data){
				  if(data.length>0){
					 var options = "";
				     for(var i=0;i<data.length;i++){
					   options +='<option value="'+data[i][1]+'">'+data[i][1]+'</option>';
				     }
				     $('#areaName_s').append(options);
				  }
		   });
		   
		 //获取节点选择框类容 
		   $('#areaName_s').change(function(){			   			   
			   $('#nodeNo_s').html('');
			   $('#nodeNo_s').append('<option value="-1">选择节点</option>');
			   $.post('json/nodeAction_nodeNo', {areaName:this.value} ,function(data){
					  if(data.length>0){
						 var options = "";
					     for(var i=0;i<data.length;i++){
						   options +='<option value="'+data[i]+'">'+data[i]+'</option>';
					     }				     
					     $('#nodeNo_s').append(options);
					  }
			   });
		   });
		});
	</script>
</body>
<!-- END BODY -->
</html>