<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>无线测温监测系统 | 历史数据曲线</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
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
    <link rel="stylesheet" type="text/css" href="highcharts/css/bootstrap-datetimepicker.min.css"/>
    <!-- END PAGE LEVEL SCRIPTS -->
    <link rel="shortcut icon" href="media/image/favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="menuSelect(4, 0, 0); notification()">

<!-- BEGIN HEADER -->
<%@include file="header.jsp" %>
<!-- END HEADER -->

<!-- BEGIN CONTAINER -->
<div class="page-container row-fluid">

    <!-- BEGIN SIDEBAR -->

    <!-- END SIDEBAR -->
    <%@include file="sidebar.jsp" %>
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
                        无线测温监测系统
                        <small>历史曲线</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="index.html">首页</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">历史数据</a></li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN CHART PORTLETS-->
            <div class="row-fluid">
                <div class="span12">
                    <div class="form-inline">
                        <label class="control-label">控制器号：</label>
                        <select id="ctrlerNo_s" style="width:80px;height:28px;" name="ctrlerNo">
                            <option value="-1">选择</option>
                        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="control-label">区域名称：</label> <select id="areaName_s"
                                                                           style="width:100px;height:28px;"
                                                                           name="subId">
                        <option value="-1">选择区域</option>
                    </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="control-label">节点编号：</label> <select id="nodeNo_s"
                                                                           style="width:100px;height:28px;"
                                                                           name="subId">
                        <option value="-1">选择节点</option>
                    </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-primary" id="subbtn" onclick="javascript:chartQuery()">
                            <i class="icon-search icon-white"></i>&nbsp;查询
                        </button>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12 form-inline">
                    <label class="control-label">起止时间：</label>
                    <div class="input-append date" id="startDate"
                         style="padding-right: 15px;">
                        <input size="16" type="text" readonly
                               style="width:160px;height:28px;" id="sdate" name="startTime">
                        <span class="add-on" style="height: 18px;"><i class="icon-calendar"></i></span>
                    </div>
                    至
                    <div class="input-append date" id="endDate"
                         style="padding-left: 15px;">
                        <input size="16" type="text" readonly
                               style="width:160px;height:28px;" id="edate" name="endTime">
                        <span class="add-on" style="height: 18px;"><i class="icon-calendar"></i></span>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12 form-inline">
                    <div class="controls">
                            <label class="checkbox inline">
                                <input type="checkbox" checked value="" id="tempMed_c"> 介质温度
                            </label>
                            <label class="checkbox inline">
                                <input type="checkbox" checked value="" id="areaTempMedAvg_c"> 区域介质均温
                            </label>

                            <label class="checkbox inline">
                                <input type="checkbox" checked value="" id="tempEnv_c"> 环境温度
                            </label>
                            <label class="checkbox inline">
                                <input type="checkbox" checked value="" id="areaTempEnvAvg_c"> 区域环境均温
                            </label>
                            <label class="checkbox inline">
                                <input type="checkbox" checked value="" id="humidity_c"> 湿度
                            </label>
                            <label class="checkbox inline">
                                <input type="checkbox" checked value="" id="areaHumidityAvg_c"> 区域湿度均值
                            </label>

                        <label class="checkbox inline">
                            <input type="checkbox" checked value="" id="batteryVol_c"> 电池电压
                        </label>
                        <label class="checkbox inline">
                            <input type="checkbox" checked value="" id="wirelessSig_c"> 无线信号
                        </label>
                        <label class="checkbox inline">
                            <input type="checkbox" checked value="" id="smogAlert_c"> 烟雾报警
                        </label>
                    </div>
                </div>
            </div>
            <div class="row-fluid" style="padding-top:14px">
                <div class="span12">
                    <!-- BEGIN INTERACTIVE CHART PORTLET-->
                    <div class="portlet box red">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-reorder"></i>历史曲线</div>
                            <div class="actions" style="margin-top:10px;">
                                <div class="btn-group">
                                    <a class="btn green" onclick="javascript:print();">
                                        <i class="icon-print"></i> 打印
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div id="container" style="height: 460px; min-width: 310px"></div>
                        </div>
                    </div>

                    <!-- END INTERACTIVE CHART PORTLET-->
                </div>
            </div>

            <!-- END CHART PORTLETS-->
            <!-- END PAGE CONTENT-->
        </div>
        <!-- HERE WILL BE LOADED AN AJAX CONTENT -->
        <div id="ajaxLoading"
             style="display: none; z-index: 1011; position: absolute; padding: 2px; margin: 0px; width: 30%; top: 55%; left: 490px; text-align: center; color: rgb(0, 0, 0); border: none; cursor: wait;">
            <img src="./media/image/ajax-loading.gif">
        </div>
        <!-- BEGIN PAGE CONTAINER-->
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
<script type="text/javascript" src="highcharts/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="highcharts/js/jquery.scrollUp.min.js"></script>
<script type="text/javascript" src="highcharts/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="highcharts/js/setup.js"></script>
<!--[if lt IE 9]>
<script src="media/js/excanvas.min.js"></script>
<script src="media/js/respond.min.js"></script>
<![endif]-->
<script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="media/js/jquery.blockui.min.js" type="text/javascript"></script>
<script src="media/js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="media/js/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="highcharts/js/highstock.js" type="text/javascript"></script>
<script src="highcharts/js/exporting.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="media/js/app.js"></script>
<script src="media/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="media/js/jquery.jqprint-0.3.js" type="text/javascript"></script>
<script>
    function print() {
        $('#container').jqprint();
    }
    jQuery(document).ready(function () {
        // initiate layout and plugins
        App.init();

        $.post('json/areaAction_getAllCtrlerNo', '', function (data) {
            if (data.length > 0) {
                var options = "";
                for (var i = 0; i < data.length; i++) {
                    options += '<option value="' + data[i] + '">C' + data[i] + '</option>';
                }
                $('#ctrlerNo_s').append(options);
            }
        });

        //获取节点选择框类容
        function getNodes(areaNo) {
            $('#nodeNo_s').html('');
            $('#nodeNo_s').append('<option value="-1">选择节点</option>');
            $.post('json/nodeAction_nodeNo', {areaNo: areaNo}, function (data) {
                if (data.length > 0) {
                    var options = "";
                    for (var i = 0; i < data.length; i++) {
                        options += '<option value="' + data[i] + '">' + data[i] + '</option>';
                    }
                    $('#nodeNo_s').append(options);
                }
            });
        }

        //area事件绑定
        $('#areaName_s').change(function () {
            getNodes(this.value);
        });

        //获取区域选择框类容
        function getAreas(ctrlerNo) {
            $('#areaName_s').html('');
            $('#areaName_s').append('<option value="-1">全部区域</option>');
            $.post('json/areaAction_areaConfig', {ctrlerNo: ctrlerNo}, function (data) {
                if (data.length > 0) {
                    var options = "";
                    for (var i = 0; i < data.length; i++) {
                        options += '<option value="' + data[i][0] + '">' + data[i][1] + '</option>';
                    }
                    $('#areaName_s').append(options);
                }
            });
        }

        //area事件绑定
        $('#ctrlerNo_s').change(function () {
            getAreas(this.value);
        });

        //曲线类型选择
        $('#tempMed_c').click(function () {
            //如果是选中
            if (this.checked) {
                chart.series[0].show();
            } else {
                chart.series[0].hide();
            }
        });
        $('#areaTempMedAvg_c').click(function () {
            //如果是选中
            if (this.checked) {
                chart.series[1].show();
            } else {
                chart.series[1].hide();
            }
        });
        $('#tempEnv_c').click(function () {
            //如果是选中
            if (this.checked) {
                chart.series[2].show();
            } else {
                chart.series[2].hide();
            }
        });
        $('#areaTempEnvAvg_c').click(function () {
            //如果是选中
            if (this.checked) {
                chart.series[3].show();
            } else {
                chart.series[3].hide();
            }
        });
        $('#humidity_c').click(function () {
            //如果是选中
            if (this.checked) {
                chart.series[4].show();
            } else {
                chart.series[4].hide();
            }
        });
        $('#areaHumidityAvg_c').click(function () {
            //如果是选中
            if (this.checked) {
                chart.series[5].show();
            } else {
                chart.series[5].hide();
            }
        });

        $('#batteryVol_c').click(function () {
            //如果是选中
            if (this.checked) {
                chart.series[6].show();
            } else {
                chart.series[6].hide();
            }
        });
        $('#wirelessSig_c').click(function () {
            //如果是选中
            if (this.checked) {
                chart.series[7].show();
            } else {
                chart.series[7].hide();
            }
        });
        $('#smogAlert_c').click(function () {
            //如果是选中
            if (this.checked) {
                chart.series[8].show();
            } else {
                chart.series[8].hide();
            }
        });

    });

    //highstocks
    var chart; // 全局变量
    Highcharts.setOptions({
        global: {useUTC: false},
        lang: {
            months: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月',
                '九月', '十月', '十一月', '十二月'],
            shortMonths: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月',
                '九月', '十月', '十一', '十二'],
            weekdays: ['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']
        }
    });

    var seriesOptions = [], names = ['介质温度', '区域介质均温', '环境温度', '区域环境均温', '湿度', '区域湿度均值', '电池电压', '无线信号', '烟雾报警'];
    function chartQuery() {

        var areaNo = $('#areaName_s').val();
        var nodeNo = $('#nodeNo_s').val();
        var startTime = $('#sdate').val();
        var endTime = $('#edate').val();

        if (nodeNo == -1) {
            alert("请选择正确的节点编号！");
            return;
        }
        if (startTime == "" || endTime == "" || startTime >= endTime) {
            alert("请选择正确的起止时间！");
            return;
        }


        var c_tm = $('#tempMed_c').is(':checked');
        var c_te = $('#tempEnv_c').is(':checked');
        var c_hu = $('#humidity_c').is(':checked');
        var c_sa = $('#smogAlert_c').is(':checked');
        var c_bv = $('#batteryVol_c').is(':checked');
        var c_ws = $('#wirelessSig_c').is(':checked');
        var c_atma = $('#areaTempMedAvg_c').is(':checked');
        var c_atea = $('#areaTempEnvAvg_c').is(':checked');
        var c_ahua = $('#areaHumidityAvg_c').is(':checked');

        $('#ajaxLoading').css('display', 'block');  //显示loading图片
        $.getJSON('json/regularDataAction_queryByTime', {
            areaNo: areaNo,
            nodeNo: nodeNo,
            startTime: startTime,
            endTime: endTime
        }, function (data) {
            if (data) {
                seriesOptions[0] = {
                    name: names[0],
                    yAxis: 0,
                    data: data.tempMed,
                    visible: c_tm,
                };

                seriesOptions[1] = {
                    name: names[1],
                    yAxis: 0,
                    data: data.areaTempMedAvg,
                    visible: c_atma
                };

                seriesOptions[2] = {
                    name: names[2],
                    yAxis: 0,
                    data: data.tempEnv,
                    visible: c_te
                };

                seriesOptions[3] = {
                    name: names[3],
                    yAxis: 0,
                    data: data.areaTempEnvAvg,
                    visible: c_atea
                };

                seriesOptions[4] = {
                    name: names[4],
                    yAxis: 3,
                    data: data.humidity,
                    visible: c_hu
                };

                seriesOptions[5] = {
                    name: names[5],
                    yAxis: 3,
                    data: data.areaHumidityAvg,
                    visible: c_ahua
                };

                seriesOptions[6] = {
                    name: names[6],
                    yAxis: 1,
                    data: data.batteryVol,
                    visible: c_bv
                };

                seriesOptions[7] = {
                    name: names[7],
                    yAxis: 2,
                    data: data.wirelessSig,
                    visible: c_ws
                };

                seriesOptions[8] = {
                    name: names[8],
                    yAxis: 2,
                    data: data.smogAlert,
                    visible: c_sa
                 };

                // As we're loading the data asynchronously, we don't know what order it will arrive. So
                // we keep a counter and create the chart when all the data is loaded.
                $('#ajaxLoading').css('display', 'none');   //隐藏loading图片
                createChart();
            } else {
                $('#ajaxLoading').css('display', 'none');   //隐藏loading图片
                alert("加载出错！");
            }

        });
    }
    // create the chart when all data is loaded
    function createChart() {
        if (chart != null) {
            chart.destroy();
        }
        /* 			chart = $('#container')
         .highcharts('StockChart',
         { */
        chart = new Highcharts.StockChart({
            chart: {
                renderTo: 'container'
            },

            rangeSelector: {
                enabled: false
            },

            navigator: {
                enabled: true
            },

            scrollbar: {
                enabled: true
            },

            credits: {
                enabled: true
            },

            xAxis: {
                dateTimeLabelFormats: {
                    millisecond: '%H:%M:%S.%L',
                    second: '%H:%M:%S',
                    minute: '%H:%M',
                    hour: '%H:%M',
                    day: '%e. %b',
                    week: '%e. %b',
                    month: '%b \'%y',
                    year: '%Y'
                }
            },

            yAxis: [
                {
                    title: {
                        text: '温度(℃)'
                    },
//                    min: -40,
//                    max: 130,
                    opposite: false,
                    labels: {
                        formatter: function () {
                            return (this.value > 0 ? '+'
                                            : '')
                                    + this.value + '℃';
                        }
                    },
                    plotLines: [{
                        value: 0,
                        width: 2,
                        dashStyle: 'dash',
                        color: 'silver'
                    }]
                },
                {
                    title: {
                        text: '电压(V)'
                    },
                    min: 1,
                    max: 10,
                    labels: {
                        formatter: function () {
                            return (this.value > 0 ? '+'
                                            : '')
                                    + this.value + 'V';
                        }
                    },
                    plotLines: [{
                        value: 0,
                        width: 2,
                        dashStyle: 'dash',
                        color: 'silver'
                    }]
                },
                {
                    title: {
                        text: '信号(dB)'
                    },
                    min: 1,
                    max: 10,
                    labels: {
                        formatter: function () {
                            return (this.value > 0 ? '+'
                                            : '')
                                    + this.value + 'dB';
                        }
                    },
                    plotLines: [{
                        value: 10,
                        width: 2,
                        dashStyle: 'dash',
                        color: 'silver'
                    }]
                },
                {
                    title: {
                        text: '湿度(%RH)'
                    },
                    min: 0,
                    max: 100,
                    opposite: false,
                    labels: {
                        formatter: function () {
                            return (this.value > 0 ? '+'
                                            : '')
                                    + this.value + '%RH';
                        }
                    },
                    plotLines: [{
                        value: 10,
                        width: 2,
                        dashStyle: 'dash',
                        color: 'silver'
                    }]
                }],

            tooltip: {
                pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b><br/>',
                valueDecimals: 1,
                //valueSuffix : '℃',
            },

            series: seriesOptions
        });
    }
</script>
<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>