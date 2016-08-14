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
	<title>无线测温系统 | 用户登录</title>
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
	<link href="media/css/login.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="media/image/favicon.ico" />
<style>
.caption{
  font-size: 30px;
  font-weight: 200;
  line-height: 1.25;
  font-family: "Helvetica Neue",Helvetica,Arial,"Hiragino Sans GB","Hiragino Sans GB W3","Microsoft YaHei UI","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;
  color: #fff;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
	<!-- BEGIN LOGO -->
	<div class="logo">
		<!-- <img src="media/image/logo-big.png" alt="" />  -->
		<h3><span class="caption">无线测温监测系统</span></h3>
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form class="form-vertical login-form" action="userAction_login" method="post">
			<h3 class="form-title">用户登录</h3>
			<div class="alert alert-error hide">
				<button class="close" data-dismiss="alert"></button>
				<span>请输入用户名、密码.</span>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="用户名" name="userName" style="height: 34px;"/>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i>
						<input class="m-wrap placeholder-no-fix" type="password" placeholder="密码" name="passWord" style="height: 34px;"/>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<label class="checkbox">
				<input type="checkbox" name="remember" value="1"/> 记住密码
				</label>
				<button type="submit" class="btn green pull-right">
				登录 <i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
			<%--<div class="forget-password">--%>
				<%--<h4>忘记密码 ?</h4>--%>
				<%--<p>--%>
					<%--点击 <a href="javascript:;" class="" id="forget-password">这里</a>--%>
					<%--联系系统管理员找回密码.--%>
				<%--</p>--%>
			<%--</div>--%>
		</form>
		<!-- END LOGIN FORM -->        
		<!-- BEGIN FORGOT PASSWORD FORM -->
		<div class="form-vertical forget-form">
			<h3 class="">忘记密码 ?</h3>
			<p>Enter your e-mail address below to reset your password.</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="Email" name="email" style="height: 34px;"/>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="button" id="back-btn" class="btn">
				<i class="m-icon-swapleft"></i> Back
				</button>
				<button type="submit" class="btn green pull-right">
				Submit <i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
		</div>
		<!-- END FORGOT PASSWORD FORM -->
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN COPYRIGHT -->
	<div class="copyright">
		Copyright &copy; 2016- 无线测温监控系统
	</div>
	<!-- END COPYRIGHT -->
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
	<script src="media/js/jquery.validate.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="media/js/app.js" type="text/javascript"></script>    
	<!-- END PAGE LEVEL SCRIPTS --> 
	<script>
	var Login = function () {
	    
	    return {
	        //main function to initiate the module
	        init: function () {
	        	
	           $('.login-form').validate({
		            errorElement: 'label', //default input error message container
		            errorClass: 'help-inline', // default input error message class
		            focusInvalid: false, // do not focus the last invalid input
		            rules: {
		                username: {
		                    required: true
		                },
		                password: {
		                    required: true
		                },
		                remember: {
		                    required: false
		                }
		            },

		            messages: {
		                username: {
		                    required: "用户名不能为空！"
		                },
		                password: {
		                    required: "密码不能为空！"
		                }
		            },

		            invalidHandler: function (event, validator) { //display error alert on form submit   
		                $('.alert-error', $('.login-form')).show();
		            },

		            highlight: function (element) { // hightlight error inputs
		                $(element).closest('.control-group').addClass('error'); // set error class to the control group
		            },

		            success: function (label) {
		                label.closest('.control-group').removeClass('error');
		                label.remove();
		            },

		            errorPlacement: function (error, element) {
		                error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
		            },
                    
		            submitHandler: function (form) {
		            	var userName = $('.login-form input[name=userName]').val();
		            	var passWord= $('.login-form input[name=passWord]').val();
		            	$.post('userAction_login', {userName:userName, passWord:passWord}, function(data){
		            		if(data == 0){
		            			alert("用户名或密码错误！");
		            		}else if(data == 1){
								alert("该用户已被停用！");
							}else{
								window.location.href = "index.jsp"
							};
		            	});
		            }
		        });

		        $('.login-form input').keypress(function (e) {
		            if (e.which == 13) {
		                if ($('.login-form').validate().form()) {
			            	var userName = $('.login-form input[name=userName]').val();
			            	var passWord= $('.login-form input[name=passWord]').val();
			            	$.post('userAction_login', {userName:userName, passWord:passWord}, function(data){
			            		if(data == 0){
			            			alert("用户名或密码错误！");
			            		}else{
			            			window.location.href = "index.jsp";
			            		}
			            	});
		                }
		                return false;
		            }
		        });
		     
	        }

	    };

	}();
		jQuery(document).ready(function() {     
		  App.init();
		  Login.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>