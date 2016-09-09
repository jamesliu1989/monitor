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
	<title>无线测温监测系统 | 区域节点管理</title>
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
	<link rel="stylesheet" type="text/css" href="media/css/select2_metro.css" />
	<link rel="stylesheet" href="media/css/DT_bootstrap.css" />
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="media/image/favicon.ico" />
<style type="text/css">
.table thead tr th{
  color: #666;
  background-color: #DDD;
  }
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(6, 4, 0); notification()">

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
							无线测温监测系统 <small>区域节点管理</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.html">首页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">区域相关</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="#">区域节点管理</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT--> 
				<div class="row-fluid">
					<div class="span12">
						<div id="reportForm" class="form-inline">						
							<label class="control-label">控制器号：</label> 
							<select id="ctrlerNo_s" style="width:80px;height:28px;" name="ctrlerNo">
								<option value="-1">全部</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="control-label">区域名称：</label> 
							<select id="areaName_s"
								style="width:100px;height:28px;" name="areaNo">
								<option value="-1">选择区域</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary" id="subbtn">
								<i class="icon-search icon-white"></i>&nbsp;查询
							</button>
						</div>
					</div>
				</div>  
								         				
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption"><i class="icon-edit"></i>控制器C${ctrlerNO}区域节点信息</div>
								<input type="hidden" value="" id="cNO">
								<div class="actions" style="margin-top:10px;">
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
<!-- 								<div class="clearfix">
									<div class="btn-group">
										<button id="sample_editable_1_new" class="btn green">
										添加&nbsp;<i class="icon-plus"></i>
										</button>
									</div>
								</div> -->
								<table class="table table-hover table-bordered" id="sample_editable_1">
									<thead>
										<tr>
											<th>序号</th>
											<th>节点编号</th>
											<th>节点名称</th>
											<th>节点描述</th>
											<th>状态</th>
											<th>编辑</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
						<!-- END EXAMPLE TABLE PORTLET-->
					</div>
				</div> 
				
	<div id="edit_modal" class="modal hide fade" novalidate="novalidate">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 class="">节点信息修改</h3>
	      </div>
	      <div class="modal-body">
			<p><i class="icon-list"></i>&nbsp;节点编号：</p>			
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">节点编号</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-edit"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="节点编号" name="nodeInfo.nodeNo" disabled style="width:289px; height:34px;">
					<span class="required">*</span>
					</div>
				</div>
			</div>
			<p><i class="icon-globe"></i>&nbsp;节点名称：</p>	
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">节点名称</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-edit"></i>
						<input class="m-wrap placeholder-no-fix" type="text" placeholder="节点名称" name="nodeInfo.nodeName" style="width:289px; height:34px;">
					<span class="required">*</span>
					</div>
				</div>
			</div>
			<p><i class="icon-file"></i>&nbsp;节点描述：</p>	
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">节点描述</label>
				<div class="controls">
					<div class="input-icon left">
						<textarea  class="m-wrap placeholder-no-fix" rows="2" placeholder="节点描述" name="nodeInfo.nodeDesc" style="width:289px;"></textarea>
					<span class="required">*</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label"><i class="icon-globe"></i>&nbsp;所属区域：</label>
				<div class="controls">
					<select id="edit-areaNo" class="small m-wrap" name="nodeInfo.areaNo">											
					</select>
				</div>
			</div>
			<p><i class="icon-plane"></i>&nbsp;状态：</p>	
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">状态</label>
				<div class="controls">
					<label class="radio">
						  <input type="radio" name="nodeInfo.status" value="1">启用
					</label>
					<label class="radio">
						  <input type="radio" name="nodeInfo.status" value="0">停用
					</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
				<button id="register-submit-btn" class="btn green btn-primary" onclick="nodeSave();">保存</button>
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
	<script type="text/javascript" src="media/js/select2.min.js"></script>
	<script type="text/javascript" src="media/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="media/js/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="media/js/app.js"></script>  
	<script src="media/js/jquery.validate.min.js" type="text/javascript"></script> 
	<script src="media/js/jquery.jqprint-0.3.js" type="text/javascript"></script>      
	<script>
	    function print(){
	    	$('.table').jqprint();
	    }
	    	
	  function nodeEdit(e){	   
		  var tr = $(e).parent().parent();
		  
		  var areaNo = $('input', tr)[0].value;
		  var nodeNo = tr.children(':eq(1)').text();
		  var nodeName = tr.children(':eq(2)').text();
		  var nodeDesc = tr.children(':eq(3)').text();
		  var status = tr.children(':eq(4)').text();
		  var ctrlerNo = nodeNo.substring(1, nodeNo.indexOf('-'));
		  //更新区域选择栏
	      $.post('json/areaAction_areaConfig', {ctrlerNo:ctrlerNo} ,function(data){
			  if(data.length>0){
				 var options = "";
			     for(var i=0;i<data.length;i++){
				   options +='<option value="'+data[i][0]+'">'+data[i][1]+'</option>';
			     }				     
			     $('#edit-areaNo').empty();
			     $('#edit-areaNo').append(options);
			     $('#edit-areaNo').val(areaNo);
			  }
	      }); 

		  $("#edit_modal input[name='nodeInfo.nodeNo']").val(nodeNo);
		  $("#edit_modal input[name='nodeInfo.nodeName']").val(nodeName);
		  $("#edit_modal input[name='nodeInfo.nodeDesc']").val(nodeDesc);
			if(status == '启用'){
				$("#edit_modal input[name='nodeInfo.status']:eq(1)").parent('span').removeClass('checked');
				$("#edit_modal input[name='nodeInfo.status']:eq(0)").parent('span').addClass('checked');
				$("#edit_modal input[name='nodeInfo.status']:eq(0)").attr("checked",'checked');
			}else{
				$("#edit_modal input[name='nodeInfo.status']:eq(0)").parent('span').removeClass('checked');
				$("#edit_modal input[name='nodeInfo.status']:eq(1)").parent('span').addClass('checked');
				$("#edit_modal input[name='nodeInfo.status']:eq(1)").attr("checked",'checked');
			}
	  };
	  
	  function nodeSave(){
		  
		  var areaNo = $("#edit_modal select[name='nodeInfo.areaNo']").val();
		  var nodeNo = $("#edit_modal input[name='nodeInfo.nodeNo']").val();
		  var nodeName = $("#edit_modal input[name='nodeInfo.nodeName']").val();
		  var nodeDesc = $("#edit_modal textarea[name='nodeInfo.nodeDesc']").val();
		  var status = $("#edit_modal input[name='nodeInfo.status']:checked").val();
		  
          $.post('json/nodeAction_updateNode', {
        	 'nodeInfo.areaNo':areaNo,
        	 'nodeInfo.nodeNo':nodeNo,
 	         'nodeInfo.nodeName':nodeName,
 	         'nodeInfo.nodeDesc':nodeDesc,
 	         'nodeInfo.status':status,
 	          },function(data){
 	              if(data==1){	
 	            	   $('#edit_modal').modal('hide');
 	            	   $('#subbtn').click();
                       alert("更新成功!");
 	              }else{
 		               alert("更新失败!");	                    		
 	              }
          }); 
	   }
	  
	  function nodeDelete(e){
          if (confirm("确定要删除该区域吗 ?") == false) {
              return;
          }
		  var tr = $(e).parent().parent();	  
		  var nodeNo = tr.children(':eq(1)').text();
      	$.post('json/nodeAction_deleteNode',{nodeNo:nodeNo},function(data){
          	if(data==1){		                		
	                alert("删除成功!");
          	}else{
          		alert("删除失败!");
          	}
          });
	  };
	
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();
		  
		   //获取控制器选择框类容 
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
			})

	  
	  $('#subbtn').click(function(){			
		   $("#sample_editable_1 tbody").html('');
		   var ctrlerNo = $('#ctrlerNo_s').val();
		  if(ctrlerNo == null || ctrlerNo == '-1'){
		  	alert('请选择控制器号！');
		  	return;
		  }
		   $('#cNO').val(ctrlerNo);  //保存到隐藏域，提交时使用
		   var areaNo = $('#areaName_s').val();
		   $(".caption").html('<i class="icon-edit"></i>控制器C'+ ctrlerNo +'-区域节点信息');
		   //获取数据
		   $.post('json/nodeAction_nodeView',{ctrlerNo:ctrlerNo,areaNo:areaNo},function(data){
			   if (data.length > 0) {
				   //按区域循环
				   var index = 1;
				   for (var j = 0; j < data.length; j++) {
					   if (data[j].length > 0) {
						   $("#sample_editable_1 tbody").append(
								   '<tr id="desc" style="color:#666;background-color: #D4E7F9;">' +
								   '<td colspan="2"><i class="icon-globe"></i>&nbsp;控制器-区域：' + data[j][0].areaNo + '</td>' +
								   '<td colspan="4"><i class="icon-edit"></i>&nbsp;区域描述：' + data[j][0].areaDesc + '</td>' +
								   '</tr>');
						   for (var i = 0; i < data[j].length; i++) {
							   var status = data[j][i].status;
							   if (status == '0') {
								   status = '停用';
							   } else {
								   status = '启用';
							   }
							   $("#sample_editable_1 tbody").append(
									   '<tr>' +
									   '<td>' + (index++) + '<input type="hidden" value="' + data[j][i].areaNo + '"></td>' +
									   '<td>' + data[j][i].nodeNo + '</td>' +
									   '<td>' + data[j][i].nodeName + '</td>' +
									   '<td>' + data[j][i].nodeDesc + '</td>' +
									   '<td>' + status + '</td>' +
									   '<td><a class="edit" href="#edit_modal" data-toggle="modal" onclick="nodeEdit(this)"><span class="label label-success">编辑</span></a></td>' +
									   //'<td><a class="delete" href="javascript:;" onclick="nodeDelete(this)">删除</a></td>'+
									   '</tr>');
						   }
					   }
				   }
			   } else {
				   alert('无节点信息');
			   }
		   });
		   
	  });

			   //获取区域选择框类容 
			   function getAreas(ctrlerNo){
				   $('#areaName_s').html('');
				   $('#areaName_s').append('<option value="-1">全部区域</option>');
				   if(ctrlerNo != '-1'){
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
			   }
			 //area事件绑定 
		   $('#ctrlerNo_s').change(function(){			   			   
			   getAreas(this.value);
		   });
		});
	</script>
</body>
<!-- END BODY -->
</html>