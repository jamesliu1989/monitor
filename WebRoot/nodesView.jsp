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
	<title>无线测温监测系统 | 节点信息</title>
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
  vertical-align: middle;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(2, 0, 0); notification()">

	<!-- BEGIN HEADER -->
    <%@include file="header.jsp"%> 
	<!-- END HEADER -->
	
	<!-- BEGIN CONTAINER -->
	<div class="page-container row-fluid">
	
		<!-- BEGIN SIDEBAR -->
	<%@include file="sidebar.jsp" %>
		<!-- END SIDEBAR -->
		
		<!-- BEGIN PAGE -->
		<div class="page-content" style="position: relative; zoom: 1;">
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
							无线测温监测系统 <small>节点信息</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.html">首页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">节点一览</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="#">节点信息</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT--> 
				<div class="row-fluid">
					<div class="span12">
						<div class="form-inline">
							<label class="control-label">控制器号：</label> 
							<select id="ctrlerNo_s" style="width:80px;height:28px;" name="ctrlerNo">
								<option value="-1">全部</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="control-label">区域名称：</label> 
							<select id="areaName_s"
								style="width:100px;height:28px;" name="areaNo">
								<option value="-1">全部区域</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary" id="subbtn">
								<i class="icon-search icon-white"></i>&nbsp;查询
							</button>
						</div>
					</div>
				</div>         
				<div class="row-fluid" style="padding-top:14px;">
					<div class="span12">
						<!-- BEGIN BORDERED TABLE PORTLET-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption"><i class="icon-table"></i>节点信息</div>
								<div class="actions">
								    <div class="btn-group">
										<a class="btn blue" href="#" data-toggle="dropdown">
										<i class="icon-search"></i> 状态
										<i class="icon-angle-down"></i>
										</a>
										<ul class="dropdown-menu pull-right">
											<li><a href="#"><span class="label label-info"> 所有节点</span></a></li>
											<li><a href="#"><span class="label label-success"> 在线节点</span></a></li>
											<li><a href="#"><span class="label label-important"> 离线节点</span></a></li>
										    <li class="divider"></li>
										</ul>
									</div>
									<div class="btn-group">
										<a class="btn green" href="#" data-toggle="dropdown">
										<i class="icon-cogs"></i> 工具
										<i class="icon-angle-down"></i>
										</a>
										<ul class="dropdown-menu pull-right">
											<li><a onclick="javascript:print();">
										        <i class="icon-print"></i> 打印</a></li>
										<%--	<li><a href="#"><i class=" icon-download-alt"></i> 导出到EXCEL</a></li>--%>
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
											<th>节点编号</th>
											<th>介质温度（℃）</th>
											<th>环境温度（℃）</th>
											<th>湿度（%RH）</th>
											<th>烟雾报警</th>
											<th>电池电压（V）</th>
											<th>工作状态</th>
											<th>无线信号</th>
											<th>采集时间</th>
											<th>节点描述</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
<%-- 								<div class="row-fluid">
								    <div class="span6">
								       <!--  <div class="dataTables_info" id="sample_1_info">Showing 1 to 10 of 43 entries</div> -->
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
			<!-- HERE WILL BE LOADED AN AJAX CONTENT -->
 			<div id="ajaxLoading" style="display: none; z-index: 1011; position: absolute; padding: 2px; margin: 0px; width: 30%; top: 45%; left: 361px; text-align: center; color: rgb(0, 0, 0); border: none; cursor: wait;"><img src="./media/image/ajax-loading.gif"></div>
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
	<script src="media/js/jquery.jqprint-0.3.js" type="text/javascript"></script>      
	<script>
	    function print(){
	    	$('.table').jqprint();
	    }
jQuery(document).ready(function() {
		   // initiate layout and plugins
		   App.init();
		   
		   $.post('json/areaAction_getAllCtrlerNo','',function(data){
				  if(data.length>0){
					 var options = "";
				     for(var i=0;i<data.length;i++){
					   options +='<option value="'+data[i]+'">C'+data[i]+'</option>';
				     }
				     $('#ctrlerNo_s').append(options);
				  }
		   });

			$.post('json/areaAction_areaConfig', {ctrlerNo:-1}, function(data){
				if(data.length>0){
					var options = "";
					for(var i=0;i<data.length;i++){
						options +='<option value="'+data[i][0]+'">'+data[i][1]+'</option>';
					}
					$('#areaName_s').append(options);
				}
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
					  }
			   }); 
		   }
		 //area事件绑定 
	   $('#ctrlerNo_s').change(function(){			   			   
		   getAreas(this.value);
	   });
      
		   //获取节点一览信息
       $('#subbtn').click(function(){
    	   $('#ajaxLoading').css('display','block');
    	   $("#nodeViewTable tbody").html('');
    	   var ctrlerNo = $('#ctrlerNo_s').val();
    	   var areaNo = $('#areaName_s').val();
		   $.post('json/regularDataAction_nodesView',{ctrlerNo:ctrlerNo, areaNo:areaNo},function(data){
				  if(data.length>0){
					  
				   for(var i=0; i<data.length;i++){
					   var nodes = data[i].nodes;
					   $("#nodeViewTable tbody").append(
					      '<tr style="color:#666;font-size:12px;background-color: #D4E7F9;">'+
						      '<td colspan="11"><i class="icon-globe"></i>&nbsp;'+ data[i].areaNo+'&nbsp;('+ data[i].areaDesc +')'+
						      '&nbsp;&nbsp;&nbsp;节点数：'+ data[i].activeNodeNum+'/'+data[i].nodeNum +
						      '&nbsp;&nbsp;&nbsp;介质温度（最高/最低/平均）：'+ data[i].tempMedMax + '&nbsp/&nbsp' + data[i].tempMedMin + '&nbsp/&nbsp' + data[i].tempMedAvg +'&nbsp;℃ '+
						      '&nbsp;&nbsp;&nbsp;环境温度（最高/最低/平均）：'+ data[i].tempEnvMax + '&nbsp/&nbsp' + data[i].tempEnvMin + '&nbsp/&nbsp' + data[i].tempEnvAvg +'&nbsp;℃ '+
                              '&nbsp;&nbsp;&nbsp;湿度（最高/最低/平均）：'+ data[i].humidityMax + '&nbsp/&nbsp' + data[i].humidityMin + '&nbsp/&nbsp' + data[i].humidityAvg +'&nbsp;%RH'+
						      '</tr>');
					   
					     for(var j = 0; j<nodes.length; j++){
						   var alert = '正常', alertLabel = 'label-success', alertIcon = 'icon-bullhorn';
						   var status = '在线', statusLabel = 'label-success', statusIcon = 'icon-signal';
						   if(nodes[j].smogAlert == 0){
							   alert = '报警';
							   alertLabel = 'label-important';
							   alertIcon = 'icon-bell-alt';
						   }
						   if(nodes[j].tempMed == 0 && nodes[j].tempEnv == 0 && nodes[j].batteryVol == 0 && nodes[j].wirelessSig == 0){
							   status = '离线';
							   statusLabel = 'label-important';
							   statusIcon = 'icon-plane';
						   }

						   if(nodes[j].tempMed == 6553.5) {
							   nodes[j].tempMed = '<span class="label-important" style="color:#fff">传感器错误</span>';
						   }else if(nodes[j].tempMed > data[i].medTempAlert){
							   nodes[j].tempMed = '<span class="label-important" style="color:#fff">'+ nodes[j].tempMed+ '</span>';
						   }else if(nodes[j].tempMed > data[i].medTempPreAlert){
							   nodes[j].tempMed = '<span class="label-warning" style="color:#fff">'+ nodes[j].tempMed+ '</span>';
						   }

						   if(nodes[j].tempEnv == 6553.5) {
							   nodes[j].tempEnv = '<span class="label-important" style="color:#fff">传感器错误</span>';
						   }else if(nodes[j].tempEnv > data[i].envTempAlert){
							   nodes[j].tempEnv = '<span class="label-important" style="color:#fff">'+ nodes[j].tempEnv+ '</span>';
						   }else if(nodes[j].tempEnv > data[i].envTempPreAlert){
							   nodes[j].tempEnv = '<span class="label-warning" style="color:#fff">'+ nodes[j].tempEnv+ '</span>';
						   }

						  if(nodes[j].humidity == 255) {
							  nodes[j].humidity = '<span class="label-important" style="color:#fff">传感器错误</span>';
						   }else if(nodes[j].humidity > data[i].humidityAlert){
							   nodes[j].humidity = '<span class="label-important" style="color:#fff">'+ nodes[j].humidity+ '</span>';
						   }else if(nodes[j].humidity > data[i].humidityPreAlert){
							   nodes[j].humidity = '<span class="label-warning" style="color:#fff">'+ nodes[j].humidity+ '</span>';
						   }
						   if(nodes[j].batteryVol < data[i].batteryVolAlert){
							   nodes[j].batteryVol = '<span class="label-important" style="color:#fff">'+ nodes[j].batteryVol+ '</span>';
						   }else if(nodes[j].batteryVol < data[i].batteryVolPreAlert){
							   nodes[j].batteryVol = '<span class="label-warning" style="color:#fff">'+ nodes[j].batteryVol+ '</span>';
						   }
						   if(nodes[j].wirelessSig < data[i].wirelessSigAlert){
							   nodes[j].wirelessSig = '<span class="label-important" style="color:#fff">'+ nodes[j].wirelessSig+ '</span>';
						   }else if(nodes[j].wirelessSig < data[i].wirelessSigPreAlert){
							   nodes[j].wirelessSig = '<span class="label-warning" style="color:#fff">'+ nodes[j].wirelessSig+ '</span>';
						   }
						   $("#nodeViewTable tbody").append(
					         '<tr>'+
						        '<td>'+(j+1)+'</td>'+						        
						        '<td>'+ nodes[j].nodeNo +'</td>'+
						        '<td>'+ nodes[j].tempMed +'</td>'+
						        '<td>'+ nodes[j].tempEnv +'</td>'+
                                '<td>'+ nodes[j].humidity +'</td>'+
						        '<td><span class="label '+ alertLabel +'"><i class="'+ alertIcon +'"></i>&nbsp;'+ alert +'</span></td>'+
						        '<td>'+ nodes[j].batteryVol +'</td>'+
						        '<td><span class="label '+ statusLabel +'"><i class="'+ statusIcon +'"></i>&nbsp;&nbsp;'+ status +'</span></td>'+
						        '<td>'+ nodes[j].wirelessSig +'</td>'+
						        '<td style="font-size:12px;">'+ nodes[j].collectTime.replace('T',' ') +'</td>'+
						        '<td style="font-size:12px;">'+ nodes[j].nodeDesc +'</td>'+
						     '</tr>');
				         }
				     }
				   $('#ajaxLoading').css('display','none');
			    }else{
			    	$('#ajaxLoading').css('display','none');
			    	$("#nodeViewTable tbody").append(
			    	  '<tr>'+
					      '<td>控制器或区域暂无节点数据！</td>'+
			    	  '</tr>');
			    }
		   });
       });

	$('#subbtn').click()
});
</script>
</body>
<!-- END BODY -->
</html>