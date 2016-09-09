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
	<title>无线测温监测系统 | 区域管理</title>
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
<body class="page-header-fixed" onload="menuSelect(6, 2, 0); notification()">

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
							<li><a href="#">区域管理</a></li>
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
								<div class="caption"><i class="icon-edit"></i>区域信息</div>
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
											<th>控制器号</th>
											<th>区域名称</th>
											<th>节点数量(在线/总数)</th>
											<th>区域描述</th>
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
	    function showArea(e){
	    	$.post('json/areaAction_getAreaNum',{ctrlerNo:e.value},
	    			function(data){
	    		$('input', $(e).parent().parent())[1].value = '分区'+(data+1);
	    	});
	    }
	var inserting = false;
	var options = "";
	var oTable = null;
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
	                if(aData[0] == ''){  //add
	                   jqTds[0].innerHTML = '<input id="newId" type="hidden" value="">';
	                   jqTds[1].innerHTML = '<select style="width: 100px;" onchange="showArea(this);"><option value="-1">选择</option>'+ options +'</select>';
	                   jqTds[2].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[2] + '" style="height: 30px;">';
	                }else{   //edit 
	                   jqTds[2].innerHTML = '<input type="text" readonly class="m-wrap small" value="' + aData[2] + '" style="height: 30px;">';                 
	                   jqTds[6].innerHTML = '<a class="cancel" href=""><span class="label label-important">取消</span></a>';
	                }
	                
	                jqTds[4].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[4] + '" style="height: 30px;">';	                
	                jqTds[5].innerHTML = '<span class="label label-warning"><a class="edit" href="">保存</a></span>';
	            }

	            function saveRow(oTable, nRow) {
	                var jqInputs = $('input', nRow);
	                var selects = $('select', nRow);
	                if(selects[0] != null){
	                	oTable.fnUpdate('C'+selects[0].value, nRow, 1, false);
	                }
	                //oTable.fnUpdate($('td', nRow)[0].innerHTML, nRow, 0, false);
	                oTable.fnUpdate(jqInputs[1].value, nRow, 2, false);
	                oTable.fnUpdate(jqInputs[2].value, nRow, 4, false);
	                oTable.fnUpdate('<a class="edit" href=""><span class="label label-success">编辑</span></a>', nRow, 5, false);
	                oTable.fnUpdate('<a class="delete" href=""><span class="label label-important">删除</span></a>', nRow, 6, false);
	                oTable.fnDraw();
	                inserting = false;
	            }

	            function cancelEditRow(oTable, nRow) {
	                var jqInputs = $('input', nRow);
	                var selects = $('select', nRow);
	                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
	                oTable.fnUpdate(selects[0].value, nRow, 1, false);
	                oTable.fnUpdate(jqInputs[1], nRow, 2, false);
	                oTable.fnUpdate(jqInputs[2].value, nRow, 4, false);
	                oTable.fnUpdate('<a class="edit" href=""><span class="label label-success">编辑</span></a>', nRow, 5, false);
	                oTable.fnDraw();
	            }

	            oTable = $('#sample_editable_1').dataTable({
	            	"bFilter": false,
	            	"bInfo": false,
	            	"bPaginate" : false,
	            	//"bRetrieve": true,
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
	            $('#sample_editable_1_new').unbind('click').click(function (e) {
	            	if(inserting){
	            		return;
	            	}
	            	inserting = true;
	                e.preventDefault();
	                var aiNew = oTable.fnAddData(['','','','','','', '<a class="cancel" data-mode="new" href=""><span class="label label-important">取消</span></a>']);
	                var nRow = oTable.fnGetNodes(aiNew[0]);
	                editRow(oTable, nRow);
	                nEditing = nRow;
	            });

	            $('#sample_editable_1 a.delete').die().live('click', function (e) {
	                e.preventDefault();

	                if (confirm("确定要删除该区域吗 ?") == false) {
	                    return;
	                }
	                var nRow = $(this).parents('tr')[0];
	                var inputs = $('input', nRow);
                    var id = inputs[0].value;
	                	$.post('json/areaAction_deleteAreaConfig',{id:id},function(data){
		                	if(data==1){		                		
		    	                oTable.fnDeleteRow(nRow);
		    	                alert("删除成功!");
		                	}else if(data == -1){
								alert("未分区域无法删除!");
							}else{
		                		alert("删除失败!");
		                	}
		                });               	                
	            });

	            $('#sample_editable_1 a.cancel').die().live('click', function (e) {
	                e.preventDefault();
	                inserting = false;
	                if ($(this).attr("data-mode") == "new") {
	                    var nRow = $(this).parents('tr')[0];
	                    oTable.fnDeleteRow(nRow);
	                } else {
	                    restoreRow(oTable, nEditing);	                    
	                }
	                nEditing = null;
	            });

	            $('#sample_editable_1 a.edit').die().live('click', function (e) {
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
	                     var inputs = $('input', nRow);  
	                     var selects = $('select', nRow);
	                     var tds = $('td', nRow);
	                     var id = inputs[0].value;
	                     var ctrlerNo;
	                     if(selects[0] != null){
	                       ctrlerNo = selects[0].value;
	                     }else{
	                       ctrlerNo = tds[1].innerHTML.substring(1);
	                     }
	                     var areaName = inputs[1].value;
	                     var areaNo = 'C'+ctrlerNo+'-'+areaName;	                     
	                     var areaDesc = inputs[2].value;
	                     var url;
	                     if(id == ''){
	                    	 url = "json/areaAction_addAreaConfig";
	                     }else{
	                    	 url = "json/areaAction_updateAreaConfig";
	                     }
	                    $.post(url, {'areaInfo.id':id, 
	                    	         'areaInfo.ctrlerNo':ctrlerNo,
	                    	         'areaInfo.areaNo':areaNo,
	                    	         'areaInfo.areaName':areaName,
	                    	         'areaInfo.areaDesc':areaDesc},function(data){
	                    	if(data){		                   
	    	                    nEditing = null;	    	                    
	    	                    inserting = false;
	    	                    alert("更新成功!");
	    	                    $('#subbtn').click();  //刷新页面
	                    	}else{
	                    		alert("更新失败!");	                    		
	                    	}
	                    });
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
		   TableEditable.init();
		   
			$('#subbtn').click(function(){
				var ctrlerNo = $('#ctrlerNo_s').val();
				$("#sample_editable_1 tbody").empty();
				   $.post('json/areaAction_getAllArea', {ctrlerNo:ctrlerNo}, function(data){
						  if(data.length>0){
						   for(var i=0;i<data.length;i++){
							$("#sample_editable_1 tbody").append(
							'<tr>'+
								'<td>'+(i+1)+'<input type="hidden" value="'+ data[i]['id'] +'"></td>'+
								'<td class="center">C'+data[i]['ctrlerNo']+'</td>'+
								'<td class="center">'+data[i]['areaName']+'</td>'+
								'<td class="center">'+data[i]['activeNodeNum']+'/'+data[i]['nodeNum']+'</td>'+
								'<td class="center">'+data[i]['areaDesc']+'</td>'+
								'<td><a class="edit" href="javascript:;"><span class="label label-success">编辑</span></a></td>'+
								'<td><a class="delete" href="javascript:;"><span class="label label-important">删除</span></a></td>'+
							'</tr>');
						   };
							if(oTable != null){
								oTable.fnClearTable(false);
								oTable.fnDestroy();
							}
						   TableEditable.init();
						  };
					   });	
				});
			
			   //获取控制器选择框类容 
			   $.post('json/areaAction_getAllCtrlerNo','',function(data){
					  if(data.length>0){
					     for(var i=0;i<data.length;i++){
						   options +='<option value="'+data[i]+'">C'+data[i]+'</option>';
					     }
					     $('#ctrlerNo_s').append(options);
					  };
			   });
		});

	</script>
</body>
<!-- END BODY -->
</html>