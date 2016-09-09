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
	<link rel="stylesheet" type="text/css" href="highcharts/css/bootstrap-datetimepicker.min.css" />
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="media/image/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(8, 2, 0); notification()">

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
							 <small>短信发送</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.jsp">首页</a> 
								<span class="icon-angle-right"></span>
							</li>
							<li>
								<a href="#">短信发送</a>
								<span class="icon-angle-right"></span>
							</li>
							<li><a href="#">发送设置</a></li>
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
								<div class="caption"><i class="icon-reorder"></i>短信参数</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<form class="form-horizontal" action="smsAction_updateTemplate" method="post">
								<h3 class="form-section">短信模板</h3>
								<div class="row-fluid">
								  <div class="span12">
											<div class="control-group">
												<label class="control-label">模板内容：</label>
												<div class="controls">
													<textarea class="span10 m-wrap" id="smsTemplate" name="smsTemplate.smsTemplate" tabindex="1">${smsTemplate.smsTemplate}</textarea>
												</div>
											</div>
								</div>
								<div class="row-fluid">
								<div class="span10">
											<div class="control-group">
												<label class="control-label">可选关键字：</label>											
											    <div class="controls">
											         <button class="btn blue kword" type="button" style="margin-bottom: 5px;">#区域名称#</button>
											         <button class="btn blue kword" type="button" style="margin-bottom: 5px;">#区域描述#</button>
											         <button class="btn blue kword" type="button" style="margin-bottom: 5px;">#节点名称#</button>
											         <button class="btn blue kword" type="button" style="margin-bottom: 5px;">#节点描述#</button>
											         <button class="btn blue kword" type="button" style="margin-bottom: 5px;">#时间#</button>
											         <button class="btn blue kword" type="button" style="margin-bottom: 5px;">#报警级别#</button>
											         <button class="btn blue kword" type="button" style="margin-bottom: 5px;">#报警类别#</button>
											         <button class="btn blue kword" type="button" style="margin-bottom: 5px;">#当前值#</button>
											         <button class="btn blue kword" type="button" style="margin-bottom: 5px;">#设定值#</button>
											    </div>
											</div>
								</div>
								</div>
								<div class="row-fluid">
								<div class="span10">
								     <div class="controls">
										<span class="btn red" id="smsPreview">预览</span>
									 </div>
								</div>
								</div>
							</div>
							<h3 class="form-section">报警类别</h3>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">温度采集异常：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input type="radio" name="smsTemplateType.type1" value="0" <s:if test="%{smsTemplateType.type1==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input type="radio" name="smsTemplateType.type1" value="1" <s:if test="%{smsTemplateType.type1==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type1" type="text" value="${smsTemplate.type1}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">介质温度报警上限：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type2" value="0" <s:if test="%{smsTemplateType.type2==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type2" value="1" <s:if test="%{smsTemplateType.type2==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type2" type="text" value="${smsTemplate.type2}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">介质温升速率：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type3" value="0" <s:if test="%{smsTemplateType.type3==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type3" value="1" <s:if test="%{smsTemplateType.type3==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type3" type="text" value="${smsTemplate.type3}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">介温极均差值：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type4" value="0" <s:if test="%{smsTemplateType.type4==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type4" value="1" <s:if test="%{smsTemplateType.type4==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type4" type="text" value="${smsTemplate.type4}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">环境温度报警上限：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type5" value="0" <s:if test="%{smsTemplateType.type5==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type5" value="1" <s:if test="%{smsTemplateType.type5==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type5" type="text" value="${smsTemplate.type5}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">环境温升速率：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type6" value="0" <s:if test="%{smsTemplateType.type6==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type6" value="1" <s:if test="%{smsTemplateType.type6==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type6" type="text" value="${smsTemplate.type6}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">环温极均差值：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type7" value="0" <s:if test="%{smsTemplateType.type7==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type7" value="1" <s:if test="%{smsTemplateType.type7==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type7" type="text" value="${smsTemplate.type7}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">单支温度：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type8" value="0" <s:if test="%{smsTemplateType.type8==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type8" value="1" <s:if test="%{smsTemplateType.type8==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type8" type="text" value="${smsTemplate.type8}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">温度均差：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type9" value="0" <s:if test="%{smsTemplateType.type9==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type9" value="1" <s:if test="%{smsTemplateType.type9==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type9" type="text" value="${smsTemplate.type9}">	
												</div>
									</div>
								</div>
							</div>
									<div class="row-fluid">
										<div class="span4">
											<div class="control-group">
												<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
												<label class="control-label">湿度采集异常：</label>
												<div class="controls">
													<label class="radio">
														<input type="radio" name="smsTemplateType.type13" value="0" <s:if test="%{smsTemplateType.type13==0}">checked</s:if>>停用
													</label>
													<label class="radio">
														<input type="radio" name="smsTemplateType.type13" value="1" <s:if test="%{smsTemplateType.type13==1}">checked</s:if>>启用
													</label>
												</div>
											</div>
										</div>
										<div class="span8">
											<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
													<input class="span6 m-wrap" name="smsTemplate.type13" type="text" value="${smsTemplate.type13}">
												</div>
											</div>
										</div>
									</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">湿度上限：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type10" value="0" <s:if test="%{smsTemplateType.type10==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type10" value="1" <s:if test="%{smsTemplateType.type10==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type10" type="text" value="${smsTemplate.type10}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">电压下限：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type11" value="0" <s:if test="%{smsTemplateType.type11==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type11" value="1" <s:if test="%{smsTemplateType.type11==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type11" type="text" value="${smsTemplate.type11}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								  <div class="span4">
									<div class="control-group">
				                       <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				                       <label class="control-label">无线信号：</label>
				                       <div class="controls">
					                     <label class="radio">
						                      <input id="showHumidity0" type="radio" name="smsTemplateType.type12" value="0" <s:if test="%{smsTemplateType.type12==0}">checked</s:if>>停用
					                     </label>
					                     <label class="radio">
						                      <input id="showHumidity1" type="radio" name="smsTemplateType.type12" value="1" <s:if test="%{smsTemplateType.type12==1}">checked</s:if>>启用
					                     </label>
				                        </div>
			                         </div>
								</div>
 								 <div class="span8">
									<div class="control-group">
												<label class="control-label">内容措辞：</label>
												<div class="controls">
												<input class="span6 m-wrap" name="smsTemplate.type12" type="text" value="${smsTemplate.type12}">	
												</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span4">
									<div class="control-group">
										<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
										<label class="control-label">烟雾报警：</label>
										<div class="controls">
											<label class="radio">
												<input id="showHumidity0" type="radio" name="smsTemplateType.type14" value="0" <s:if test="%{smsTemplateType.type14==0}">checked</s:if>>停用
											</label>
											<label class="radio">
												<input id="showHumidity1" type="radio" name="smsTemplateType.type14" value="1" <s:if test="%{smsTemplateType.type14==1}">checked</s:if>>启用
											</label>
										</div>
									</div>
								</div>
								<div class="span8">
									<div class="control-group">
										<label class="control-label">内容措辞：</label>
										<div class="controls">
											<input class="span6 m-wrap" name="smsTemplate.type14" type="text" value="${smsTemplate.type14}">
										</div>
									</div>
								</div>
							</div>
							<h3 class="form-section">其他设置</h3>														
								<div class="row-fluid">
								  <div class="span4">
											<div class="control-group">
												<label class="control-label">短信接收：</label>
												<div class="controls">
													<a href="#edit_modal" data-toggle="modal" onclick="receiver_setting()"><span class="btn green">接收人设定</span></a>
												</div>
											</div>
								</div>
							</div>
									<div class="form-actions">
										<button class="btn blue" onclick="updateConfig()">保存</button>
										<button type="button" class="btn">取消</button>
									</div>
								</form>
								<!-- END FORM-->       
							</div>
						</div>
						<!-- END SAMPLE FORM PORTLET-->
					</div>
				  </div>


	<!-- BEGIN USER-EDIT FORM -->
    <div id="edit_modal" class="modal hide fade" novalidate="novalidate">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 class="">短信接收人设定</h3>
	      </div>
	     <form class="sms-receiver-form" action="smsAction_updateReceiver" method="post">
	      <div class="modal-body">			
	      
	      
<div class="row-fluid">
					<div class="span12">

						<!-- BEGIN EXAMPLE TABLE PORTLET-->

						<div class="portlet box light-grey">

							<div class="portlet-title">

								<div class="caption"><i class="icon-user"></i>接送人选择：</div>

							</div>

							<div class="portlet-body">

								<div id="sample_1_wrapper" class="dataTables_wrapper form-inline">
								
                              <table class="table table-striped table-bordered table-hover dataTable" id="sms_table">

									<thead>

										<tr>
										    <th style="width: 24px;">
										        <input type="checkbox" class="group-checkable">
										        <input type="hidden" name="fakeSubmit" value="0">
										    </th>
										    <th  style="width: 160px;">用户名</th>
										    <th  style="width: 170px;">电话</th>
										    <th  style="width: 220px;">权限</th>
										    <th  style="width: 250px;">备注</th>
									   </tr>

									</thead>
								
								<tbody></tbody>
									</table>
								</div>

							</div>

						</div>

						<!-- END EXAMPLE TABLE PORTLET-->

					</div>

				</div>

		</div>
		<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
				<button type="submit" id="register-submit-btn" class="btn green btn-primary">保存</button>
		</div>
		</form>
	</div>
	<!-- END USER-EDIT FORM -->

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
	
	$(function() {  
	    /*  在textarea处插入文本--Start */  
	    (function($) {  
	        $.fn.extend({  
	                    insertContent : function(myValue, t) {  
	                        var $t = $(this)[0];  
	                        if (document.selection) { // ie  
	                            this.focus();  
	                            var sel = document.selection.createRange();  
	                            sel.text = myValue;  
	                            this.focus();  
	                            sel.moveStart('character', -l);  
	                            var wee = sel.text.length;  
	                            if (arguments.length == 2) {  
	                                var l = $t.value.length;  
	                                sel.moveEnd("character", wee + t);  
	                                t <= 0 ? sel.moveStart("character", wee - 2 * t  
	                                        - myValue.length) : sel.moveStart(  
	                                        "character", wee - t - myValue.length);  
	                                sel.select();  
	                            }  
	                        } else if ($t.selectionStart || $t.selectionStart == '0') {  
	                            var startPos = $t.selectionStart;  
	                            var endPos = $t.selectionEnd;  
	                            var scrollTop = $t.scrollTop;  
	                            $t.value = $t.value.substring(0, startPos)  
	                                    + myValue  
	                                    + $t.value.substring(endPos,  
	                                            $t.value.length);  
	                            this.focus();  
	                            $t.selectionStart = startPos + myValue.length;  
	                            $t.selectionEnd = startPos + myValue.length;  
	                            $t.scrollTop = scrollTop;  
	                            if (arguments.length == 2) {  
	                                $t.setSelectionRange(startPos - t,  
	                                        $t.selectionEnd + t);  
	                                this.focus();  
	                            }  
	                        } else {  
	                            this.value += myValue;  
	                            this.focus();  
	                        }  
	                    }  
	                });  
	    })(jQuery);  
	    /* 在textarea处插入文本--Ending */  
	});

	//接收人设定
	function receiver_setting(){
		$('#sms_table tbody').html('');
    	$.post('json/smsAction_getAllReceiver',
    			{},
        function(data){
    		if(data){
    			for(var i =0; i<data.length; i++){
    				var flag, check = '';
    				if(data[i].flag == 0){
    					flag = '普通用户';
    				}else if(data[i].flag == 1){
    					flag = '一般管理员';
    				}else{
    					flag = '超级管理员';
    				}
    				if(data[i].smsReceive == 1){
    					check = 'checked';
    				}
    				$('#sms_table tbody').append(
					'<tr><td><input type="checkbox" class="checkboxes" name="receiverId" value="'+ data[i].id +'"'+ check +'></td>'+

					'<td>'+data[i].name+'</td>'+

					'<td>'+data[i].phone+'</td>'+

					'<td>'+flag+'</td>'+

					'<td></td></tr>');
    			}
    		}
    	});
	}
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();	   
		 		   	    	
	    	$('.kword').bind("click", function(){
	    		$('#smsTemplate').insertContent(this.innerHTML);
	    	});
	    	
	    	$('.group-checkable').bind("click", function(){
	    		if(this.checked){
	    			$('#sms_table tbody input').attr('checked', true);
	    		}else{
	    			$('#sms_table tbody input').removeAttr("checked");
	    		}
	    	});
	    	
	    	$('#smsPreview').bind("click", function(){
	    		var cont = $('#smsTemplate').val();    	
	    		cont = cont.replace('#区域名称#', '区域');
	    		cont = cont.replace('#区域描述#', '区域描述');
	    		cont = cont.replace('#节点名称#', '节点');
	    		cont = cont.replace('#节点描述#', '节点描述');
	    		cont = cont.replace('#时间#', '2015年1月1日 10时10分10秒');
	    		cont = cont.replace('#报警级别#', '预报警');
	    		cont = cont.replace('#报警类别#', '环境温度已超上限');
	    		cont = cont.replace('#当前值#', '60℃');
	    		cont = cont.replace('#设定值#', '56℃');
	    		alert(cont);
	    	});
		});		
	</script>
	<!-- END JAVASCRIPTS -->   
</body>
<!-- END BODY -->
</html>