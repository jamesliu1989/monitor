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
	<title>无线测温监测系统 | 系统设置</title>
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
	<link rel="stylesheet" type="text/css" href="highcharts/css/bootstrap-datetimepicker.min.css" />
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="media/image/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(7, 1, 0); notification()">

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
						<h3 class="page-title">
							无线测温监测系统
							 <small>系统设置</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.jsp">首页</a> 
								<span class="icon-angle-right"></span>
							</li>
							<li>
								<a href="#">系统相关</a>
								<span class="icon-angle-right"></span>
							</li>
							<li><a href="#">系统设置</a></li>
						</ul>
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN SAMPLE FORM PORTLET-->   
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption"><i class="icon-reorder"></i>系统参数</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<div action="#" class="form-horizontal">
								<h3 class="form-section">控制器设置</h3>
								<div class="row-fluid">
								  <div class="span4">
											<div class="control-group">
												<label class="control-label">COM端口：</label>
												<div class="controls">
													<select id="comPort" class="span10 m-wrap"  tabindex="1">
														<option value="-1">选择COM端口</option>
														<option value="COM1">COM1</option>
														<option value="COM2">COM2</option>
														<option value="COM3">COM3</option>
														<option value="COM4">COM4</option>
														<option value="COM5">COM5</option>
														<option value="COM6">COM6</option>
														<option value="COM7">COM7</option>
														<option value="COM8">COM8</option>
														<option value="COM9">COM9</option>
													</select>
												</div>
											</div>
								</div>
								 <div class="span4">
									<div class="control-group">
												<label class="control-label">波特率：</label>
												<div class="controls">
													<select id="baudRate" class="span10 m-wrap" tabindex="1">
														<option value="-1">选择波特率...</option>
														<option value="110">110</option>
														<option value="300">300</option>
														<option value="600">600</option>
														<option value="1200">1200</option>														
														<option value="2400">2400</option>
														<option value="4800">4800</option>
														<option value="9600">9600</option>													
														<option value="14400">14400</option>
														<option value="19200">19200</option>														
														<option value="38400">38400</option>
														<option value="56000">56000</option>
														<option value="57600">57600</option>
														<option value="115200">115200</option>
														<option value="128000">128000</option>
														<option value="256000">256000</option>														
													</select>
												</div>
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label">数据采集周期:</label>
										<div class="controls">
											<input class="span6 m-wrap" id="collectCycle" type="text"/>
											<span class="help-inline">/分钟</span>
										</div>
									</div>
								</div>
							</div>
							<h3 class="form-section">短信设备设置</h3>
								<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
										<label class="control-label">短信功能：</label>
										<div class="controls">
											<label class="checkbox inline">
												<input type="checkbox" value="" id="smsAlert"> 启用短信报警发送
											</label>
										</div>
									</div>
								  </div>

								  <div class="span4">
											<div class="control-group">
												<label class="control-label">短信猫COM端口：</label>
												<div class="controls">
													<select id="smsComPort" class="span10 m-wrap"  tabindex="1">
														<option value="-1">选择COM端口</option>
														<option value="COM1">COM1</option>
														<option value="COM2">COM2</option>
														<option value="COM3">COM3</option>
														<option value="COM4">COM4</option>
														<option value="COM5">COM5</option>
														<option value="COM6">COM6</option>
														<option value="COM7">COM7</option>
														<option value="COM8">COM8</option>
														<option value="COM9">COM9</option>
													</select>
												</div>
											</div>
								</div>
								 <div class="span4">
									<div class="control-group">
												<label class="control-label">短信猫波特率：</label>
												<div class="controls">
													<select id="smsBaudRate" class="span10 m-wrap" tabindex="1">
														<option value="-1">选择波特率...</option>
														<option value="110">110</option>
														<option value="300">300</option>
														<option value="600">600</option>
														<option value="1200">1200</option>														
														<option value="2400">2400</option>
														<option value="4800">4800</option>
														<option value="9600">9600</option>													
														<option value="14400">14400</option>
														<option value="19200">19200</option>														
														<option value="38400">38400</option>
														<option value="56000">56000</option>
														<option value="57600">57600</option>
														<option value="115200">115200</option>
														<option value="128000">128000</option>
														<option value="256000">256000</option>														
													</select>
												</div>
									</div>
								</div>
							</div>
<%--							<h3 class="form-section">其他参数设置</h3>
								<div class="row-fluid">
								  <div class="span6">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">系统功能：</label>
										<div class="controls">
											<label class="checkbox inline">
												<input type="checkbox" value="" id="showTempMed"> 介质温度
											</label>
											<label class="checkbox inline">
												<input type="checkbox" value="" id="showTempEnv"> 环境温度
											</label>
											<label class="checkbox inline">
												<input type="checkbox" value="" id="showHumidity"> 湿度
											</label>
											<label class="checkbox inline">
												<input type="checkbox" value="" id="showSmogAlert"> 烟雾报警
											</label>
										</div>
			                         </div>
								</div>--%>
<!--								 <div class="span6">
									<div class="control-group">
												<label class="control-label">端口：</label>
												<div class="controls">
												<input class="span6 m-wrap" id="port_number" type="text">
												</div>
									</div>
								</div> -->
							</div>
									<div class="form-actions">
										<button class="btn blue" onclick="updateConfig()">保存</button>
										<button type="button" class="btn">取消</button>
									</div>
								</div>
								<!-- END FORM-->       
							</div>
						</div>
						<!-- END SAMPLE FORM PORTLET-->
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
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="media/js/app.js"></script> 
	<script src="media/js/jquery.validate.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
	
	    function updateConfig(){
			var comPort = $('#comPort').val();
			var baudRate = $('#baudRate').val();
			var collectCycle = $('#collectCycle').val();
			var smsComPort = $('#smsComPort').val();
			var smsBaudRate = $('#smsBaudRate').val();

			var showTempMed = $('#showTempMed').is(':checked');
			var showTempEnv = $('#showTempEnv').is(':checked');
			var showHumidity = $('#showHumidity').is(':checked');
			var showSmogAlert = $('#showSmogAlert').is(':checked');
			var smsAlert = $('#smsAlert').is(':checked');

			if(comPort == '-1'){
				alert("请选择端口号!");
				return;
			}
			if(baudRate == '-1'){
				alert("请选择波特率!");
				return;
			}
			if(smsComPort == '-1'){
				alert("请选择短信端口号!");
				return;
			}
			if(smsBaudRate == '-1'){
				alert("请选择短信波特率!");
				return;
			}
	    	$.post('json/systemAction_updateConfig',
	    			{'config.comPort':comPort,
	    		     'config.baudRate':baudRate,
	    		     'config.smsComPort':smsComPort,
	    		     'config.smsBaudRate':smsBaudRate,
	    		     'config.collectCycle':collectCycle,
/*					 'config.showTempMed':showTempMed,
					 'config.showTempEnv':showTempEnv,
	    		     'config.showHumidity':showHumidity,
					 'config.showSmogAlert':showSmogAlert,*/
					 'config.smsAlert':smsAlert
	    		     },
	        function(data){
	    		if(data){
                     alert("参数更新成功!");
	    		}else{
	    			 alert("参数更新失败!");
	    		}
	    	});
	    }
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();
		 		   
	    	$.post('json/systemAction_getSystemConfig','',function(data){
	    		if(data){
	    			var config = data.config;
	    			$('#comPort').val(config.comPort);
	    			$('#baudRate').val(config.baudRate);
	    			$('#collectCycle').val(config.collectCycle);	  
	    			$('#smsComPort').val(config.smsComPort);
	    			$('#smsBaudRate').val(config.smsBaudRate);
					$('#smsAlert').val(config.smsAlert);
/*					if(config.showTempMed == 1){
						$('#showTempMed').attr('checked', true);
						$('#showTempMed').parents('.checkbox').find('span').addClass('checked');
					}
					if(config.showTempEnv == 1){
						$('#showTempEnv').attr('checked', true);
						$('#showTempEnv').parents('.checkbox').find('span').addClass('checked');
					}
	    			if(config.showHumidity == 1){
						$('#showHumidity').attr('checked', true);
						$('#showHumidity').parents('.checkbox').find('span').addClass('checked');
	    			}
					if(config.showSmogAlert == 1){
						$('#showSmogAlert').attr('checked', true);
						$('#showSmogAlert').parents('.checkbox').find('span').addClass('checked');
					}*/
					if(config.smsAlert == 1){
						$('#smsAlert').attr('checked', true);
						$('#smsAlert').parents('.checkbox').find('span').addClass('checked');
					}
	    			
	    		}
	    	});
		});		
	</script>
	<!-- END JAVASCRIPTS -->   
</body>
<!-- END BODY -->
</html>