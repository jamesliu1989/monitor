<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="navbar-inner">
			<div class="container-fluid">
				<!-- BEGIN LOGO -->
<%--				<a class="brand" href="index.jsp">
				<img src="media/image/logo.png" alt="logo" />
				</a>--%>
				<!-- END LOGO -->
				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
				<a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
				    <img src="media/image/menu-toggler.png" alt="" />
				</a>
				<!-- END RESPONSIVE MENU TOGGLER -->            
				<!-- BEGIN TOP NAVIGATION MENU -->              
				<ul class="nav pull-right">
					<!-- BEGIN NOTIFICATION DROPDOWN -->   
					<li class="dropdown" id="header_notification_bar">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-warning-sign"></i>
						<span class="badge"></span>
						</a>
						<ul id="notificationBar" class="dropdown-menu extended notification" style="width: 383px !important">														
						</ul>
					</li>
					<!-- END NOTIFICATION DROPDOWN -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img alt="" src="media/image/avatar_small.png" />
						<span class="username">${user.userName}</span>
						<i class="icon-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#user_edit_modal" data-toggle="modal" onclick="userEditValidate.init()"><i class="icon-user"></i> 用户资料</a></li>
							<li class="divider"></li>
							<li><a href="userAction_exit"><i class="icon-key"></i> 安全退出</a></li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
				<!-- END TOP NAVIGATION MENU --> 
			</div>
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	
		<!-- BEGIN USER-EDIT FORM -->
    <div id="user_edit_modal" class="modal hide fade tabbable tabbable-custom tabbable-full-width" novalidate="novalidate">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 class="">用户资料</h3>
	      </div>
	      <ul class="nav nav-tabs">
               <li class="active"><a href="#tab_1" data-toggle="tab"><i class="icon-user"></i>基本资料</a></li>
               <li class=""><a href="#tab_2" data-toggle="tab"><i class="icon-lock"></i>安全信息</a></li>
          </ul>
  <div class="tab-content">
     <div class="tab-pane row-fluid active" id="tab_1">
	     <form class="user_edit-form1" action="user_edit-form1" novalidate="novalidate">
	      <div class="modal-body">
			<p>用户基本信息：</p>			
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="用户名" name="user.userName" value="${user.userName}" disabled style="width:289px; height:34px;">
					<span class="required">*</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">姓名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-phone"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="姓名" name="user.name"  value="${user.name}" style="width:289px; height:34px;">
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
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="电话号码" name="user.phone"  value="${user.phone}" style="width:289px; height:34px;">
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">电子邮件</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="电子邮件" name="user.email"  value="${user.email}" style="width:289px; height:34px;">
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="权限" value="<s:if test="#session.user.flag == 0">普通用戶</s:if><s:elseif test="#session.user.flag == 1">一般管理員</s:elseif><s:else>超级管理員</s:else>" disabled style="width:289px; height:34px;">
					</div>
				</div>

			</div>
		</div>
		<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
				<button type="submit" id="register-submit-btn" class="btn green btn-primary">保存</button>
		</div>
		</form>
	  </div>
	  <div class="tab-pane row-fluid" id="tab_2">
	     <form class="user_edit-form2" action="user_edit-form2">
	      <div class="modal-body">
			<p>密码修改：</p>			
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">当前密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i>
						<input class="m-wrap placeholder-no-fix" type="password" placeholder="当前密码" name="curpwd" style="width:289px; height:34px;">
					<span class="required">*</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">新密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i>
						<input class="m-wrap placeholder-no-fix" type="password" id="edit_password" placeholder="新密码" name="newpwd" style="width:289px; height:34px;">
					<span class="required">*</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">再次输入密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-ok"></i>
						<input class="m-wrap placeholder-no-fix" type="password" id="re_password" placeholder="再次输入密码" name="rpassword" style="width:289px; height:34px;">
					<span class="required">*</span>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
				<button type="submit" id="register-submit-btn" class="btn green btn-primary">保存</button>
		</div>
		</form>
		</div>
	</div>
</div>
	<!-- END USER-EDIT FORM -->
<script src="media/js/header.js" type="text/javascript"></script>  
<script>

	function getNotice() {
		$.post('json/alertAction_getLatestUnRead',
						{},
						function(data) {
							if (data) {
								$('#notificationBar').html('');
								$('.badge').text(data.alertNum);
								$('#notificationBar').append(
										"<li><p>一小时内有 " + data.alerts.length
												+ " 项新报警通知!</p></li>");
								var labelColor = "label-warning";
								for (var i = 0; i < data.alerts.length; i++) {
									if (data.alerts[i].alertProperty == 2) {
										labelColor = "label-important";
									}
									$('#notificationBar')
											.append(
													"<li>"
															+ "<a href='#'>"
															+ "<span class='label "+labelColor+"'><i class='icon-bolt'></i></span>节点："
															+ data.alerts[i][2]
															+ ", "
															+ data.alerts[i][4]
															+ "<span class='time'>, "
															+ data.alerts[i][7]
																	.substring(11)
															+ "</span>"
															+ "</a></li>");
								}
								$('#notificationBar')
										.append(
												"<li class='external'><a href='alertAction_getUnRead'>查看所有报警信息 <i class='m-icon-swapright'></i></a></li>");
							}
						});
	}
	function notification() {
		setInterval(getNotice(), 5 * 60000); //间隔五分钟刷新一次
	}
</script>