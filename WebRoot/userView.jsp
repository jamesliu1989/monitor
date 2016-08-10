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
	<title>无线测温监测系统 | 用户管理</title>
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
	<link href="media/css/login.css" rel="stylesheet" type="text/css"/>
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
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(7, 2, 0); notification()">

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
							无线测温监测系统 <small>用户管理</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.html">首页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">系统相关</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="#">用户管理</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN BORDERED TABLE PORTLET-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption"><i class="icon-user"></i>用户信息</div>
								<div class="actions">	
								   <div class="btn-group">
										<a class="btn green" href="#register_modal" data-toggle="modal">
										<i class="icon-plus"></i> 添加用户
										</a>
									</div>		
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
											<th>序号</th>
											<th>用户名</th>
											<th>姓名</th>
											<th>电话号码</th>
											<th>电子邮箱</th>
											<th>注册日期</th>
											<th>系统角色</th>
											<th>状态</th>
											<th>编辑</th>
											<th>删除</th>
										</tr>
									</thead>
									<tbody>
									<s:iterator value="%{users}" id="u">
										<tr>
											<td>${u.id}</td>
											<td>${u.userName}</td>
											<td>${u.name}</td>
											<td>${u.phone}</td>
											<td>${u.email}</td>
											<td><fmt:formatDate value="${u.regDate}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											<td><s:if test="#u.flag==0">普通用户</s:if><s:elseif test="#u.flag==1">一般管理员</s:elseif><s:else>超级管理员</s:else></td>
											<td><s:if test="#u.active==0">停用</s:if><s:else>正常</s:else></td>
											<td><a href="#edit_modal" data-toggle="modal" onclick="userEdit(this)"><span class="label label-success">编辑</span></a></td>
											<td><a onclick="deleteConfirm(this, ${u.id})"><span class="label label-important">删除</span></a></td>
										</tr>
									</s:iterator>	
									</tbody>
								</table>
								<div class="row-fluid">
								    <div class="span6">
								        <!-- <div class="dataTables_info" id="sample_1_info">Showing 1 to 10 of 43 entries</div> -->
								    </div>
								    <div class="span6">
								      <div class="dataTables_paginate paging_bootstrap pagination">
								       <ul>
								          <li class="prev disabled"><a href="#">← <span class="hidden-480">上一页</span></a></li>
								          <li class="active"><a href="#">1</a></li>
								          <li><a href="#">2</a></li>
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
				
				<!-- BEGIN REGISTRATION FORM -->
	  <div id="register_modal" class="modal hide fade" novalidate="novalidate">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 class="">添加新用户</h3>
	      </div>
	     <form class="register-form" action="" novalidate="novalidate">
	      <div class="modal-body">
			<p>用户基本信息：</p>			
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="用户名" name="user.userName" id="regUserName" style="width:289px; height:34px;">
					<span class="required">*</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i>
						<input class="m-wrap placeholder-no-fix" type="password" id="register_password" placeholder="密码" name="user.passWord" style="width:289px; height:34px;">
					<span class="required">*</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">再次输入密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-ok"></i>
						<input class="m-wrap placeholder-no-fix" type="password" placeholder="再次输入密码" name="rpassword" style="width:289px; height:34px;">
					<span class="required">*</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">姓名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="姓名" name="user.name"  id="regName"style="width:289px; height:34px;">
                        <span class="required">*</span>					
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">电话号码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-phone"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="电话号码" name="user.phone"  id="regPhone"style="width:289px; height:34px;">
					    <span class="required">*</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">电子邮件</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="电子邮件" name="user.email"  id="regEmail" style="width:289px; height:34px;">
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label">&nbsp;系统角色：</label>
				<div class="controls">
					<select class="small m-wrap" name="user.flag" id="regFlag">
					    <option value="0" selected = "selected">普通用戶</option>
						<option value="1">一般管理員</option>	
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
				<button type="submit" id="register-submit-btn" class="btn green btn-primary">提交</button>
		</div>
		</form>
	</div>
	<!-- END REGISTRATION FORM -->
	<!-- BEGIN USER-EDIT FORM -->
    <div id="edit_modal" class="modal hide fade" novalidate="novalidate">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 class="">用户资料修改</h3>
	      </div>
	     <form class="edit-form" action="userAction_userEdit" method="post">
	       <input type="hidden" name="user.id">
	      <div class="modal-body">
			<p>用户基本信息：</p>			
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="用户名" name="user.userName" disabled style="width:289px; height:34px;">
					<span class="required">*</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i>
						<input class="m-wrap placeholder-no-fix" type="password" id="register_password" placeholder="密码" name="user.passWord" style="width:289px; height:34px;">
					<span class="required">密码为空表示无需修改！</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">姓名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user'"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="姓名" name="user.name"  style="width:289px; height:34px;">
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">电话号码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-phone"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="电话号码" name="user.phone"  style="width:289px; height:34px;">
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">电子邮件</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="电子邮件" name="user.email"  style="width:289px; height:34px;">
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label">&nbsp;系统角色：</label>
				<div class="controls">
					<select class="small m-wrap" name="user.flag">											
					</select>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">状态</label>
				<div class="controls">
					<label class="radio">
						  <input type="radio" name="user.active" value="1">启用
					</label>
					<label class="radio">
						  <input type="radio" name="user.active" value="0">停用
					</label>
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
	<script src="media/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="media/js/app.js"></script>      
	<script src="media/js/jquery.jqprint-0.3.js" type="text/javascript"></script>      
	<script>
	    function print(){
	    	$('.table').jqprint();
	    }
	//删除用户
	function deleteConfirm(obj, id){	
 		if(confirm("确定删除该用户吗？")){	
			
	 		$.post('userAction_deleteUser',{userId:id},function(data){
				if(1 == data){
					$(obj).parent().parent().remove();
					alert("删除成功！");
				}else{
					alert("删除失败,无此权限！");
				}
			}); 
		} 
	}
	//修改用户信息
	function userEdit(obj){
		var tr = $(obj).parent().parent();
 		$(".edit-form input[name='user.id']").val(tr.children(':eq(0)').text());
		$(".edit-form input[name='user.userName']").val(tr.children(':eq(1)').text());
		$(".edit-form input[name='user.name']").val(tr.children(':eq(2)').text());
		$(".edit-form input[name='user.phone']").val(tr.children(':eq(3)').text());
		$(".edit-form input[name='user.email']").val(tr.children(':eq(4)').text());
		if(tr.children(':eq(6)').text() == '普通用户'){
			$(".edit-form select[name='user.flag']").html('<option value="0" selected = "selected">普通用戶</option><option value="1">一般管理員</option>');	
			$(".edit-form select[name='user.flag']").val(0);
		}else if(tr.children(':eq(6)').text() == '一般管理员'){
			$(".edit-form select[name='user.flag']").html('<option value="0" selected = "selected">普通用戶</option><option value="1">一般管理員</option>');	
			$(".edit-form select[name='user.flag']").val(1);
		}else{
			$(".edit-form select[name='user.flag']").html('<option value="2">超级管理員</option>');
			$(".edit-form select[name='user.flag']").val(2);
		}		
		if(tr.children(':eq(7)').text() == '正常'){
			$(".edit-form input[name='user.active']:eq(1)").parent('span').removeClass('checked');
			$(".edit-form input[name='user.active']:eq(0)").parent('span').addClass('checked');
			$(".edit-form input[name='user.active']:eq(0)").attr("checked",'checked');
		}else{
			$(".edit-form input[name='user.active']:eq(0)").parent('span').removeClass('checked');
			$(".edit-form input[name='user.active']:eq(1)").parent('span').addClass('checked');
			$(".edit-form input[name='user.active']:eq(1)").attr("checked",'checked');
		}

	}
	
	var Login = function () {
	    
	    return {
	        //main function to initiate the module
	        init: function () {

	        	  $('.register-form').validate({
	  	            errorElement: 'label', //default input error message container
	  	            errorClass: 'help-inline', // default input error message class
	  	            focusInvalid: false, // do not focus the last invalid input
	  	            ignore: "",
	  	            rules: {
	  	                'user.userName': {
	  	                    required: true
	  	                },
	  	                'user.passWord': {
	  	                    required: true
	  	                },
	  	                rpassword: {
	  	                    equalTo: "#register_password"
	  	                },
	  	                'user.name': {
	  	                    required: true,
	  	                },
	  	                'user.phone': {
	  	                    required: true
	  	                },
	  	                'user.email': {
	  	                    required: false,
	  	                    email: true
	  	                }	  	                
	  	            },

		            messages: {
		            	'user.userName': {
		                    required: "用户名不能为空！"
		                },
		                'user.passWord': {
		                    required: "密码不能为空！"
		                },
		                rpassword: {
		                	equalTo: "两次输入不一致！"
		                },
		                'user.name': {
		                    required: "姓名不能为空！"
		                },
		                'user.phone': {
		                    required: "电话不能为空！"
		                },
		                'user.email': {
		                	email: "电子邮件格式不合法！"
		                }
		            },
		            
	  	            invalidHandler: function (event, validator) { //display error alert on form submit   

	  	            },

	  	            highlight: function (element) { // hightlight error inputs
	  	                $(element)
	  	                    .closest('.control-group').addClass('error'); // set error class to the control group
	  	            },

	  	            success: function (label) {
	  	                label.closest('.control-group').removeClass('error');
	  	                label.remove();
	  	            },

	  	            errorPlacement: function (error, element) {
	  	               error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	  	            },
	  	            
	  	            submitHandler: function (form) {
	  	            	var userName = $('#regUserName').val();
	  	            	var passWord = $('#register_password').val();
	  	            	var name = $('#regName').val();
	  	            	var phone = $('#regPhone').val();
	  	            	var email = $('#regEmail').val();
	  	            	var flag = $('#regFlag').val();
	  	                $.post('userAction_register',{'user.userName':userName,'user.passWord':passWord,'user.name':name,'user.phone':phone,'user.email':email,'user.flag':flag},
	  	                	  function(data){
	  	                	if(data == 0){
	  	                		alert("添加失败，用户已存在！");
	  	                	}else if(data == 1){
	  	                		$('#register_modal').modal('hide');
	  	                		window.location.href = "userAction_userView";
	  	                	}else{
	  	                		alert("添加失败，系统错误");
	  	                	}
	  	                });
	  	            }
	  	        });
	          }
	    
	      };
	      
	  }();
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();
		   Login.init();
		});
	</script>
</body>
<!-- END BODY -->
</html>