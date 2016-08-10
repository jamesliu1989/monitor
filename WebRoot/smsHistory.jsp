<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
	<title>无线测温监测系统 | 短信发送</title>
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
<body class="page-header-fixed" onload="menuSelect(8, 1, 0); notification()">

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
							无线测温监测系统 <small>短信发送</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.html">首页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">短信发送</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="#">发送记录</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->  
				<form action="smsAction_querySmsHistory"> 
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
							<button type="submit" class="btn btn-primary" id="subbtn" style="margin-left: 40px;">
								<i class="icon-search icon-white"></i>&nbsp;查询
							</button>
						</div>
					</div>
				</div>
				</form>       
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN BORDERED TABLE PORTLET-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption"><i class="icon-envelope"></i>发送历史</div>
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
											<th style="width: 30px;">序号</th>
											<th style="width: 50px;">收信人</th>
											<th style="width: 150px;">收信号码</th>
											<th>内容</th>
											<th>发送时间</th>
										</tr>
									</thead>
									<tbody>
									<s:iterator value="%{smsList}" id="sms" status="st">
									<tr>
									    <td>${page*10 + st.index+1 }</td>
									    <td>${sms.smsReceiver }</td>
									    <td>${sms.smsRecvPhone }</td>
									    <td>${sms.smsContent }</td>
									    <td><fmt:formatDate value="${sms.smsSendTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									</tr>
									</s:iterator>
									</tbody>
								</table>
								<div class="row-fluid">
								    <div class="span12">
								      <div class="dataTables_paginate paging_bootstrap pagination">
								       <ul>
								       <s:if test="%{page != 0}">
								          <li class="prev"><a href="smsAction_querySmsHistory?page=${page -1}&startTime=<fmt:formatDate value="${startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&endTime=<fmt:formatDate value="${endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>"><span class="hidden-480">上一页</span></a></li>
								       </s:if>                                                        
								       <s:if test="%{next != 0}">
								          <li class="next"><a href="smsAction_querySmsHistory?page=${page + 1}&startTime=<fmt:formatDate value="${startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>&endTime=<fmt:formatDate value="${endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>"><span class="hidden-480">下一页</span></a></li>
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
	    
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();	
		   
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
		});
	</script>
</body>
<!-- END BODY -->
</html>