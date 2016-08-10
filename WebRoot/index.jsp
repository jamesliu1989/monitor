<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>无线测温监测系统 | 首页</title>
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
	<link rel="shortcut icon" href="media/image/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(1, 0, 0); notification()">
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
							无线测温监测系统 <small></small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.jsp">首页</a> 
							</li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="tiles">
					<div class="tile double-down bg-blue">
					<a href="alertAction_getUnRead">
						<div class="tile-body">
							<i class="icon-bell"></i>
						</div>
						<div class="tile-object">
							<div class="name">
								报警通知
							</div>
							<div class="number">
								
							</div>
						</div>
						</a>
					</div>
					<div class="tile bg-green">
					 <a href="nodeDailyReport.jsp">
						<div class="tile-body">
							<i class="icon-calendar"></i>
						</div>
						<div class="tile-object">
							<div class="name">
								报表
							</div>
							<div class="number">
								
							</div>
						</div>
						</a>
					</div>
<!-- 					<div class="tile double selected bg-blue">
						<div class="corner"></div>
						<div class="check"></div>
						<div class="tile-body">
							<h4>support@metronic.com</h4>
							<p>Re: Metronic v1.2 - Project Update!</p>
							<p>24 March 2013 12.30PM confirmed for the project plan update meeting...</p>
						</div>
						<div class="tile-object">
							<div class="name">
								<i class="icon-envelope"></i>
							</div>
							<div class="number">
								14
							</div>
						</div>
					</div> -->
					<div class="tile bg-red">
					  <a href="userAction_userView">
						<div class="corner"></div>
						<div class="tile-body">
							<i class="icon-user"></i>
						</div>
						<div class="tile-object">
							<div class="name">
								用户管理
							</div>
							<div class="number">
								
							</div>
						</div>
						</a>
					</div>
					<div class="tile bg-yellow">
					 <a href="areaConfig.jsp">
						<div class="tile-body">
							<i class="icon-sitemap"></i>
						</div>
						<div class="tile-object">
							<div class="name">
								区域相关
							</div>
							<div class="number">
								
							</div>
						</div>
						</a>
					</div>
<!-- 					<div class="tile image selected">
						<div class="tile-body">
							<img src="media/image/image2.jpg" alt="">
						</div>
						<div class="tile-object">
							<div class="name">
								Media
							</div>
						</div>
					</div> -->
					<div class="tile bg-green">
					  <a href="nodesView.jsp">
						<div class="tile-body">
							<i class="icon-comments-alt"></i>
						</div>
						<div class="tile-object">
							<div class="name">
								节点信息
							</div>
							<div class="number">
								
							</div>
						</div>
						</a>
					</div>
					<div class="tile bg-blue">
					   <a href="smsHistory.jsp">
						<div class="tile-body">
							<i class="icon-envelope"></i>
						</div>
						<div class="tile-object">
							<div class="name">
								短信发送
							</div>
							<div class="number">
								
							</div>
						</div>
						</a>
					</div>
					<div class="tile bg-green">
					  <a href="charts.jsp">
						<div class="tile-body">
							<i class="icon-bar-chart"></i>
						</div>
						<div class="tile-object">
							<div class="name">
								历史数据
							</div>
							<div class="number">
							</div>
						</div>
						</a>
					</div>
					<div class="tile bg-purple">
					 <a href="areaView.jsp">
						<div class="tile-body">
							<i class="icon-globe"></i>
						</div>
						<div class="tile-object">
							<div class="name">
								区域监测
							</div>
							<div class="number">
								
							</div>
						</div>
						</a>
					</div>
					<div class="tile bg-yellow">
					  <a href="systemConfig.jsp">
						<div class="corner"></div>
						<div class="check"></div>
						<div class="tile-body">
							<i class="icon-cogs"></i>
						</div>
						<div class="tile-object">
							<div class="name">
								系统设置
							</div>
						</div>
						</a>
					</div>
					<%--<div class="tile bg-purple">--%>
						<%--<div class="tile-body">--%>
							<%--<i class="icon-fire"></i>--%>
						<%--</div>--%>
						<%--<div class="tile-object">--%>
							<%--<div class="name">--%>
								<%--消防报警--%>
							<%--</div>--%>
							<%--<div class="number">--%>
								<%----%>
							<%--</div>--%>
						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
				<br>
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
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>