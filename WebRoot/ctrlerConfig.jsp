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
	<title>无线测温监测系统 | 控制器管理</title>
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
<body class="page-header-fixed" onload="menuSelect(6, 1, 0); notification()">

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
							无线测温监测系统 <small>区域管理</small>
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
							<li><a href="#">控制器管理</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          				
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption"><i class="icon-edit"></i>控制器信息</div>
								<div class="actions" style="margin-top:10px;">
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
								<div class="clearfix">
									<div class="btn-group">
										<button id="sample_editable_1_new" class="btn green">
										添加&nbsp;<i class="icon-plus"></i>
										</button>
									</div>
								</div>
								<table class="table table-striped table-hover table-bordered" id="sample_editable_1">
									<thead>
										<tr>
											<th>序号</th>
											<th>控制器编号</th>
											<th>节点数量</th>
											<th>控制器描述</th>
											<th>状态</th>
											<th>编辑</th>
											<th>删除</th>
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
	    var oTable = null;
	    var inserting = false;
		var hehe;
	var TableEditable = function () {
	    return {
	        //main function to initiate the module
	        init: function () {
	            function restoreRow(oTable, nRow) {
	                var aData = oTable.fnGetData(nRow);
	                var jqTds = $('>td', nRow);

	                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
	                    oTable.fnUpdate(aData[i], nRow, i, false);
	                }

	                oTable.fnDraw();
	            }

	            function editRow(oTable, nRow) {
	                var aData = oTable.fnGetData(nRow);
	                var jqTds = $('>td', nRow);
	                if(aData[0] == ''){    //if new
	                  jqTds[1].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[1] + '" style="height: 30px;">';
	                  jqTds[2].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[2] + '" style="height: 30px;">';
	                }else{
	                  jqTds[6].innerHTML = '<a class="cancel" href=""><span class="label label-success">取消</span></a>';
	                }	
	                jqTds[3].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[3] + '" style="height: 30px;">';
					jqTds[4].innerHTML = '<div class="controls" id="status">' +
							'<label class="radio"><input type="radio" name="status" value="1" checked="checked">启用</label>' +
							'<label class="radio"><input type="radio" name="status" value="0" checked="">停用</label>' +
							'</div>';
					if(aData[4] == '正常' || aData[4] == ''){
						$("#status input[name='status']:eq(1)").parent('span').removeClass('checked');
						$("#status input[name='status']:eq(0)").parent('span').addClass('checked');
						$("#status input[name='status']:eq(0)").attr("checked",'checked');
					}else{
						$("#status input[name='status']:eq(0)").parent('span').removeClass('checked');
						$("#status input[name='status']:eq(1)").parent('span').addClass('checked');
						$("#status input[name='status']:eq(1)").attr("checked",'checked');
					}
	                jqTds[5].innerHTML = '<span class="label label-success"><a class="edit" href="">保存</a></span>';
	            }

	            function saveRow(oTable, nRow, status) {
	                var jqInputs = $('input', nRow);
	                oTable.fnUpdate(jqInputs[0].value, nRow, 3, false);
					oTable.fnUpdate(status == 1 ? '正常' : '已停用', nRow, 4, false);
	                oTable.fnUpdate('<a class="edit" href=""><span class="label label-success">编辑</span></a>', nRow, 5, false);
	                oTable.fnUpdate('<a class="delete" href=""><span class="label label-warning">删除</span></a>', nRow, 6, false);
	                oTable.fnDraw();
	                inserting = false;
	            }

	            function cancelEditRow(oTable, nRow) {
	                var jqInputs = $('input', nRow);
	                oTable.fnUpdate(jqInputs[0].value, nRow, 1, false);
	                oTable.fnUpdate(jqInputs[1].value, nRow, 2, false);
	                oTable.fnUpdate('<a class="edit" href=""><span class="label label-success">编辑</span></a>', nRow, 3, false);
	                oTable.fnDraw();
	            }

	            oTable = $('#sample_editable_1').dataTable({
	            	"bFilter": false,
	            	"bInfo": false,
	            	"bPaginate" : false,
	                // set the initial value
	                "iDisplayLength": 10,
	                "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
	                "oLanguage": {
	                    "sLengthMenu": "_MENU_ 页条数",
	                    "oPaginate": {
	                        "sPrevious": "上一页",
	                        "sNext": "下一页"
	                    }
	                },
	                "aoColumnDefs": [{
	                        'bSortable': false,
	                        'aTargets': [0,1,2,3,4,5,6]
	                    }
	                ]
	            });

	            var nEditing = null;

	            $('#sample_editable_1_new').click(function (e) {
	            	if(inserting){
	            		return;
	            	}
	            	inserting = true;
	                e.preventDefault();
	                var aiNew = oTable.fnAddData(['', '', '','','',
	                        '', '<a class="cancel" data-mode="new" href=""><span class="label label-warning">删除</span></a>'
	                ]);
	                var nRow = oTable.fnGetNodes(aiNew[0]);
	                editRow(oTable, nRow);
	                nEditing = nRow;
	            });

	            $('#sample_editable_1 a.delete').live('click', function (e) {
	                e.preventDefault();

	                if (confirm("确定删除控制器?这将删除控制器下所有节点信息！") == false) {
	                    return;
	                }
	                var nRow = $(this).parents('tr')[0];
	                var ctrlerNo = $('td', nRow)[1].innerHTML.substring(1);
	                	$.post('json/areaAction_deleteCtrlerConfig',{ctrlerNo:ctrlerNo},function(data){
		                	if(data==1){		                		
		    	                oTable.fnDeleteRow(nRow);
		    	                alert("删除成功!");
		                	}else{
		                		alert("删除失败!");
		                	}
		                });               	                
	            });

	            $('#sample_editable_1 a.cancel').live('click', function (e) {
	                e.preventDefault();
	                inserting = false;
	                if ($(this).attr("data-mode") == "new") {
	                    var nRow = $(this).parents('tr')[0];
	                    oTable.fnDeleteRow(nRow);
	                } else {
	                    restoreRow(oTable, nEditing);
	                    nEditing = null;
	                }
	            });

	            $('#sample_editable_1 a.edit').live('click', function (e) {
	                e.preventDefault();

	                /* Get the row as a parent of the link that was clicked on */
	                var nRow = $(this).parents('tr')[0];

	                if (nEditing !== null && nEditing != nRow) {
	                    /* Currently editing - but not this row - restore the old before continuing to edit mode */
	                    restoreRow(oTable, nEditing);
	                    editRow(oTable, nRow);
	                    nEditing = nRow;
	                } else if (nEditing == nRow && this.innerHTML == "保存") {
	                    /* Editing this row and want to save it */	  
	                     var tds = $('td', nRow);
	                     var id = tds[0].innerHTML;
	                     var ctrlerNo, nodeNum, ctrlerDesc, ctrlerStatus;
	                     if(id==''){
		                      ctrlerNo = $('input', tds[1])[0].value;
		                     if(ctrlerNo.startsWith('C')){
		                    	 ctrlerNo = ctrlerNo.substring(1);
		                     }else{
		                    	 alert("控制器号不合法，请以大写字母C开头!");
		                    	 return;
		                     }
		                      nodeNum = $('input', tds[2])[0].value;
		                      ctrlerDesc = $('input', tds[3])[0].value;
							  ctrlerStatus = $("#status input[name='status']:checked").val()
			                  $.post('json/areaAction_addCtrlerConfig', 
			                		  {ctrlerNo:ctrlerNo, nodeNum:nodeNum, ctrlerDesc:ctrlerDesc, ctrlerStatus:ctrlerStatus},
			                		  function(data){
			                    	if(data){		                   
			    	                    nEditing = null;	                    
			    	                    alert("添加成功!");
			    	                    window.location.reload()
			                    	}else{
			                    		alert("添加失败！");	                    		
			                    	}
			                    });
	                     }else{
		                      ctrlerNo = tds[1].innerHTML.substring(1);
			                  ctrlerDesc = $('input', tds[3])[0].value;
							  ctrlerStatus = $("#status input[name='status']:checked").val()
			                    $.post('json/areaAction_updateCtrlerConfig', 
			                    		{ctrlerNo:ctrlerNo, ctrlerDesc:ctrlerDesc, ctrlerStatus:ctrlerStatus},
			                    		function(data){
			                    	if(data){
			                    		saveRow(oTable, nEditing, status);
			    	                    nEditing = null;	                    
			    	                    alert("更新成功!");
			                    	}else{
			                    		alert("更新失败！");	                    		
			                    	}
			                    });
	                     }

	                } else {
	                    /* No edit in progress - let's start one */
	                    editRow(oTable, nRow);
	                    nEditing = nRow;
	                }
	            });
	        }

	    };

	}();
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();

		   $.post('json/areaAction_ctrlerConfig','',function(data){
			  if(data.length>0){
			   for(var i=0;i<data.length;i++){
			   	var status = data[i]['status'];
				   if(status == '0'){
					   status = '已停用';
				   }else{
					   status = '正常';
				   }
				$("#sample_editable_1 tbody").append(
				'<tr>'+
					'<td>'+(i+1)+'</td>'+
					'<td class="center">C'+data[i]['ctrlerNo']+'</td>'+
					'<td class="center">'+data[i]['nodeNum']+'</td>'+
					'<td class="center">'+data[i]['ctrlerDesc']+'</td>'+
				    '<td class="center">'+ status +'</td>'+
					'<td><a class="edit"><span class="label label-success">编辑</span></a></td>'+
					'<td><a class="delete" href="javascript:;"><span class="label label-warning">删除</span></a></td>'+
				'</tr>');
			   }
			   if(oTable == null){
				   TableEditable.init();
			   }			   
			  }else{
				  TableEditable.init();
			  }
		   });	

		});
	</script>
</body>
<!-- END BODY -->
</html>