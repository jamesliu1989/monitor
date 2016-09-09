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
	<title>无线测温监测系统 | 区域报警参数设置</title>
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
	<link rel="stylesheet" href="media/css/jquery-ui.min.css" />
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="media/image/favicon.ico" />
<style type="text/css">
.table thead tr th {
	color: #666;
	font-size: 10px;
	background-color: #DDD;
	border-left: 1px solid #D3CFCF;
	border-top: 1px solid #D3CFCF;
	vertical-align: middle;
	text-align: center;
}

.table tbody tr td {
	font-size: 10px;
}

#iput {
	width: 46px !important;
	height: 30px;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(6, 3, 0); notification()">

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
							无线测温监测系统 <small>区域报警参数设置</small>
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
							<li><a href="#">区域报警参数设置</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          				
				<div class="row-fluid">
					<div class="span12">
						<form id="reportForm" class="form-inline" action="areaAction_areaAlertParameter">						
							<label class="control-label">控制器号：</label> 
							<select id="ctrlerNo_s" style="width:80px;height:28px;" name="ctrlerNo">
								<option value="-1">选择</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="control-label">区域名称：</label> 
							<select id="areaName_s"
								style="width:100px;height:28px;" name="areaNo">
								<option value="-1">全部区域</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary" id="subbtn" onclick="return slect_check()">
								<i class="icon-search icon-white"></i>&nbsp;查询
							</button>
						</form>
					</div>
				</div> 
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption"><i class="icon-edit"></i>区域报警参数</div>
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
								<div class="clearfix"></div>
								<table class="table table-striped table-hover table-bordered" id="sample_editable_1">
									<thead>
										<tr>
										    <th rowspan="2">序号</th>
											<th rowspan="2">区域名称</th>
											<th rowspan="2">节点数量</th>
											<th colspan="3">介质</th>
										    <th colspan="3">环境</th>
											<th rowspan="2">湿度上限（%RH）</th>
										    <th rowspan="2" style="max-width:40px;">单支温差（℃）</th>
											<th rowspan="2" style="max-width:40px;">温度均差（℃）</th>
											<th rowspan="2" style="max-width:40px;">电压（V）</th>
											<th rowspan="2" style="max-width:40px;">信号（dB）</th>
											<th rowspan="2">类型</th>
											<th rowspan="2">修改</th>
										</tr>
										<tr>
											<th>温度上限（℃）</th>
											<th>温升上限(℃/分)</th>
											<th>极均上限（℃）</th>
											<th>温度上限（℃）</th>
											<th>温升上限(℃/分)</th>
											<th>极均上限（℃）</th>
										</tr>
									</thead>
									<tbody>
								<s:iterator value="%{alertParameters}" id="pm" status="st">
										<tr>
										    <td>${st.index+1}</td>
											<td id="area">${pm.areaNo}</td>
											<td>${pm.activeNodeNum}/${pm.nodeNum}</td>
											<td>${pm.tempMedMax}</td>
											<td>${pm.tempMedRate}</td>
											<td>${pm.tempMedDevAbs}</td>

											<td>${pm.tempEnvMax}</td>
											<td>${pm.tempEnvRate}</td>
											<td>${pm.tempEnvDevAbs}</td>

											<td>${pm.humidityMax}</td>

                                            <td>${pm.tempDevAbs}</td>
                                            <td>${pm.tempAvgDevAbs}</td>
                                            <td>${pm.minBatteryVol}</td>
                                            <td>${pm.minWirelessSig}</td>
                                            <input type="hidden" value="${pm.id}">
                                         <s:if test="#pm.type == 1">
                                            <td><span class="label label-warning">预警</span></td>
                                         </s:if>
                                         <s:else>
                                             <td><span class="label label-important">报警</span></td>
                                         </s:else>																						
											<td><a class="edit" href="javascript:;"><span class="label label-success">修改</span></a></td>
										</tr>
								</s:iterator>
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
	<script src="media/js/jquery-ui.min.js" type="text/javascript"></script>
	<script>
		function slect_check(){
			if($('#ctrlerNo_s').val() == -1){
				alert("请选择控制器号！");
				return false
			}
		}
	    function print(){
	    	$('.table').jqprint();
	    }
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
	                jqTds[3].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[3] + '">';
	                jqTds[4].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[4] + '">';
	                jqTds[5].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[5] + '">';
	                jqTds[6].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[6] + '">';
	                jqTds[7].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[7] + '">';
	                jqTds[8].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[8] + '">';
	                jqTds[9].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[9] + '">';
	                jqTds[10].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[10] + '">';
	                jqTds[11].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[11] + '">';
	                jqTds[12].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[12] + '">';
					jqTds[13].innerHTML = '<input type="text" id="iput" class="m-wrap small" value="' + aData[13] + '">';
	                jqTds[15].innerHTML = '<span class="label label-success"><a class="edit" href="">保存</a></span>&nbsp&nbsp<a class="cancel" href=""><span class="label label-warning">取消</span></a>';
	                
	     		   $(".small").spinner({
	     			  step: 0.1,
				      numberFormat: "n"
	     		   });
	            }

	            function saveRow(oTable, nRow) {
	                var jqInputs = $('input', nRow);
	                oTable.fnUpdate(jqInputs[0].value, nRow, 3, false);
	                oTable.fnUpdate(jqInputs[1].value, nRow, 4, false);
	                oTable.fnUpdate(jqInputs[2].value, nRow, 5, false);
	                oTable.fnUpdate(jqInputs[3].value, nRow, 6, false);
	                oTable.fnUpdate(jqInputs[4].value, nRow, 7, false);
	                oTable.fnUpdate(jqInputs[5].value, nRow, 8, false);	                
	                oTable.fnUpdate(jqInputs[6].value, nRow, 9, false);
	                oTable.fnUpdate(jqInputs[7].value, nRow, 10, false);
	                oTable.fnUpdate(jqInputs[8].value, nRow, 11, false);
	                oTable.fnUpdate(jqInputs[9].value, nRow, 12, false);
					oTable.fnUpdate(jqInputs[10].value, nRow, 13, false);
	                oTable.fnUpdate('<a class="edit" href=""><span class="label label-success">修改</span></a>', nRow, 15, false);
	                oTable.fnDraw();
	            }

	            function cancelEditRow(oTable, nRow) {
	                var jqInputs = $('input', nRow);
	                oTable.fnUpdate(jqInputs[0].value, nRow, 3, false);
	                oTable.fnUpdate(jqInputs[1].value, nRow, 4, false);
	                oTable.fnUpdate(jqInputs[2].value, nRow, 5, false);
	                oTable.fnUpdate(jqInputs[3].value, nRow, 6, false);
	                oTable.fnUpdate(jqInputs[4].value, nRow, 7, false);
	                oTable.fnUpdate(jqInputs[5].value, nRow, 8, false);
	                oTable.fnUpdate(jqInputs[6].value, nRow, 9, false);
	                oTable.fnUpdate(jqInputs[7].value, nRow, 10, false);
	                oTable.fnUpdate(jqInputs[8].value, nRow, 11, false);
	                oTable.fnUpdate(jqInputs[9].value, nRow, 12, false);
					oTable.fnUpdate(jqInputs[10].value, nRow, 13, false);
	                oTable.fnUpdate('<a class="edit" href=""><span class="label label-success">修改</span></a>', nRow, 15, false);
	                oTable.fnDraw();
	            }

	            var oTable = $('#sample_editable_1').dataTable({
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
	                        'aTargets': [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	                    }
	                ]
	            });

	            var nEditing = null;

/* 	            $('#sample_editable_1 a.delete').live('click', function (e) {
	                e.preventDefault();

	                if (confirm("确定要删除该区域吗 ?") == false) {
	                    return;
	                }

	                var nRow = $(this).parents('tr')[0];
	                oTable.fnDeleteRow(nRow);
	                alert("删除成功!)");
	            }); */

	            $('#sample_editable_1 a.cancel').live('click', function (e) {
	                e.preventDefault();
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
	                     var inputs = $('input', nRow);
	                     var areaNo = $('#area', nRow).text();
	                     var url = "json/areaAction_updateAreaAlertParameter";
	                    $.post(url, {
	                    	'alertParameter.areaNo':areaNo,
	                    	
	                    	'alertParameter.tempMedMax':inputs[0].value,
	                    	'alertParameter.tempMedRate':inputs[1].value,
	                    	'alertParameter.tempMedDevAbs':inputs[2].value,
	                    	
	                    	'alertParameter.tempEnvMax':inputs[3].value,
	                    	'alertParameter.tempEnvRate':inputs[4].value,	                    	
	                    	'alertParameter.tempEnvDevAbs':inputs[5].value,

							'alertParameter.humidityMax':inputs[6].value,

	                    	'alertParameter.tempDevAbs':inputs[7].value,
	                    	'alertParameter.tempAvgDevAbs':inputs[8].value,
	                    	'alertParameter.minBatteryVol':inputs[9].value,
	                    	'alertParameter.minWirelessSig':inputs[10].value,
	                    	'alertParameter.id':inputs[11].value
	                    	},
	                    	function(data){
	                    	if(data==1){
	                    		saveRow(oTable, nEditing);		                   
	    	                    nEditing = null;	                    
	    	                    alert("更新成功!");
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
		   
		   var ctrlerNo = '${ctrlerNo}';
		   var areaNo = '${areaNo}';
		   //获取控制器选择框类容 
		   $.post('json/areaAction_getAllCtrlerNo','',function(data){		   
				  if(data.length>0){
					 var options;
				     for(var i=0;i<data.length;i++){
					   options +='<option value="'+data[i]+'">C'+data[i]+'</option>';
				     }
				     $('#ctrlerNo_s').append(options);
				     if(ctrlerNo != ''){
					       $('#ctrlerNo_s').val(ctrlerNo);
					       getAreas(ctrlerNo);
					   }
				  };
		   });

		   //获取区域选择框类容 
		   function getAreas(ctrlerNo){
			   $('#areaName_s').html('');
			   $('#areaName_s').append('<option value="-1">全部区域</option>');
			   $.post('json/areaAction_areaConfig', {ctrlerNo:ctrlerNo} ,function(data){
					  if(data.length>0){
						 var options = "";
					     for(var i=0;i<data.length;i++){
						   options +='<option value="'+data[i][0]+'">'+data[i][1]+'</option>';
					     }				     
					     $('#areaName_s').append(options);
					       if(areaNo != ''){
					    	   $('#areaName_s').val(areaNo);
					       }
					  }
			   }); 
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