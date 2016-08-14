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
	<title>无线测温监测系统 | 区域监测</title>
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
  border-left: 1px solid #D3CFCF;
  border-top: 1px solid #D3CFCF;
  vertical-align: middle;
  text-align: center;
}

.table tbody tr td{
  font-size:12px;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(3, 0, 0); notification()">

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
							无线测温监测系统 <small>区域监测</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.html">首页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">区域监测</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="#">区域信息</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->  
					<div class="row-fluid">
					<div class="span12">
						<div id="reportForm" class="form-inline" action="reportAction_nodeMonthReport">
							<label class="control-label">控制器号：</label> 
							<select id="ctrlerNo_s" style="width:80px;height:28px;" name="ctrlerNo">
								<option value="-1">选择</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;							
							<button class="btn btn-primary" id="subbtn">
								<i class="icon-search icon-white"></i>&nbsp;查询
							</button>
						</div>
					</div>
				</div>        
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN BORDERED TABLE PORTLET-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption"><i class="icon-table"></i>节点信息</div>
								<div class="actions" style="margin-top: 10px;">			
									<div class="btn-group">
										<a class="btn green" href="#" data-toggle="dropdown">
										<i class="icon-cogs"></i> 工具
										<i class="icon-angle-down"></i>
										</a>
										<ul class="dropdown-menu pull-right">
											<li><a onclick="javascript:print();"><i class="icon-print"></i> 打印</a></li>
											<%--<li><a href="#"><i class=" icon-download-alt"></i> 导出到EXCEL</a></li>--%>
											<li class="divider"></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-bordered table-hover" id="areaViewTable">
									<thead>
										<tr>
											<th rowspan="2">序号</th>
											<th rowspan="2">区域名称</th>
											<th rowspan="2">节点数量</th>
											<s:if test="#session.config.showTempMed == true">
											<th colspan="7">介质（℃）</th>
											</s:if>
											<s:if test="#session.config.showTempEnv == true">
											<th colspan="7">环境（℃）</th>
											</s:if>
											<s:if test="#session.config.showHumidity == true">
                                            <th colspan="3">湿度（%RH）</th>
											</s:if>
											<s:if test="#session.config.showTempMed == true && #session.config.showTempEnv == true">
											<th colspan="3">节点（℃）</th>
											</s:if>
											<th rowspan="2">报警</th>
										</tr>
										<tr>
											<s:if test="#session.config.showTempMed == true">
											<th>最高温度</th>
											<th>最低温度</th>
											<th>平均温度</th>
											
											<th>温升速率</th>
											<th>最高温升</th>
											<th>最低温升</th>
											<th>平均温升</th>
											</s:if>
											<s:if test="#session.config.showTempEnv == true">
											<th>最高温度</th>
											<th>最低温度</th>
											<th>平均温度</th>
											
											<th>温升速率</th>
											<th>最高温升</th>
											<th>最低温升</th>
											<th>平均温升</th>
                                            </s:if>
											<s:if test="#session.config.showHumidity == true">
                                            <th>最大湿度</th>
                                            <th>最小湿度</th>
                                            <th>平均湿度</th>
											</s:if>
											<s:if test="#session.config.showTempMed == true && #session.config.showTempEnv == true">
											<th>最高温差</th>
											<th>最低温差</th>
											<th>平均温差</th>
											</s:if>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
<%-- 								<div class="row-fluid">
								    <div class="span6">
								        <!-- <div class="dataTables_info" id="sample_1_info">Showing 1 to 10 of 43 entries</div> -->
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
			<div id="ajaxLoading"
				 style="display: none; z-index: 1011; position: absolute; padding: 2px; margin: 0px; width: 30%; top: 55%; left: 490px; text-align: center; color: rgb(0, 0, 0); border: none; cursor: wait;">
				<img src="./media/image/ajax-loading.gif">
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
	$('#subbtn').click(function(){	
		   $("#areaViewTable tbody").html('');
		   $('#ajaxLoading').css('display', 'block');  //显示loading图片
		   var ctrlerNo = $('#ctrlerNo_s').val();
		   //获取区域监测信息
		   $.post('json/areaAction_areasView',{ctrlerNo:ctrlerNo},function(data){
				  if(data.length>0){
				   var alert = '正常', alertLabel = 'label-success', alertIcon = 'icon-bullhorn';
				   for(var i=0; i<data.length;i++){
					   $("#areaViewTable tbody").append(
					      '<tr>'+
					          '<td>'+ (i+1) +'</td>'+
						      '<td>'+ data[i].areaName +'</td>'+
						      '<td>'+ data[i].activeNodeNum+'/'+data[i].nodeNum +'</td>'+
						  <s:if test="#session.config.showTempMed == true">
						      '<td>'+ data[i].tempMedMax +'</td>'+
						      '<td>'+ data[i].tempMedMin +'</td>'+
						      '<td>'+ data[i].tempMedAvg +'</td>'+
						      
						      '<td>'+ data[i].deltaMedRate +'</td>'+
						      '<td>'+ data[i].deltaMedMax +'</td>'+
						      '<td>'+ data[i].deltaMedMin +'</td>'+
						      '<td>'+ data[i].deltaMedAvg +'</td>'+
						    </s:if>
						  <s:if test="#session.config.showTempEnv == true">
						      '<td>'+ data[i].tempEnvMax +'</td>'+
						      '<td>'+ data[i].tempEnvMin +'</td>'+						      
						      '<td>'+ data[i].tempEnvAvg +'</td>'+
						      
						      '<td>'+ data[i].deltaEnvRate +'</td>'+
						      '<td>'+ data[i].deltaEnvMax +'</td>'+
						      '<td>'+ data[i].deltaEnvMin +'</td>'+
						      '<td>'+ data[i].deltaEnvAvg +'</td>'+
						  </s:if>
						  <s:if test="#session.config.showHumidity == true">
                              '<td>'+ data[i].humidityMax +'</td>'+
                              '<td>'+ data[i].humidityMin +'</td>'+
                              '<td>'+ data[i].humidityAvg +'</td>'+
                          </s:if>
						  <s:if test="#session.config.showTempMed == true && #session.config.showTempEnv == true">
						      '<td>'+ data[i].tempDevMax +'</td>'+
						      '<td>'+ data[i].tempDevMin +'</td>'+						      
						      '<td>'+ data[i].tempDevAvg +'</td>'+
							</s:if>
						      '<td><span class="label '+ alertLabel +'"><i class="'+ alertIcon +'"></i>&nbsp;'+ alert +'</span></td>'+
					      '</tr>');					  
				   }
			    }
			   $('#ajaxLoading').css('display', 'none');
		   });
		});
		});
	</script>
</body>
<!-- END BODY -->
</html>