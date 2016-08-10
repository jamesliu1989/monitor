$(function() {
	// 时间选择器
	$.fn.datetimepicker.dates['zh-CN'] = {
		days : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日" ],
		daysShort : [ "周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日" ],
		daysMin : [ "日", "一", "二", "三", "四", "五", "六", "日" ],
		months : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月",
				"十一月", "十二月" ],
		monthsShort : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月",
				"十月", "十一月", "十二月" ],
		today : "今日",
		suffix : [],
		meridiem : [ "上午", "下午" ]
	};
	$('#startDate').datetimepicker({
		format : 'yyyy-mm-dd hh:00:00',
		language : 'zh-CN',
		weekStart : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 1,
		forceParse : 0,
		pickerPosition : 'bottom-left'
	});
	$('#endDate').datetimepicker({
		format : 'yyyy-mm-dd hh:59:59',
		language : 'zh-CN',
		weekStart : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 1,
		forceParse : 0,
		pickerPosition : 'bottom-left'
	});

	// 时间粒度选择绑定
	$('#timeinterval').bind("change", function() {
		$('#startDate').datetimepicker('remove');
		$('#endDate').datetimepicker('remove');
		// $('#sdate').val('');
		// $('#edate').val('');
		var type = $('#timeinterval').val();
		if (type == "hour") { // 设为小时视图
			// $('#sdate').val($('#sdate').val().substring(0,10));
			$('#startDate').datetimepicker({
				format : 'yyyy-mm-dd hh:00:00',
				language : 'zh-CN',
				weekStart : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 1,
				forceParse : 0,
				pickerPosition : 'bottom-left'
			});
			$('#endDate').datetimepicker({
				format : 'yyyy-mm-dd hh:59:59',
				language : 'zh-CN',
				weekStart : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 1,
				forceParse : 0,
				pickerPosition : 'bottom-left'
			});
		} else if (type == "day") {
			$('#startDate').datetimepicker({
				format : 'yyyy-mm-dd 00:00:00',
				language : 'zh-CN',
				weekStart : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0,
				pickerPosition : 'bottom-left'
			});
			$('#endDate').datetimepicker({
				format : 'yyyy-mm-dd 23:59:59',
				language : 'zh-CN',
				weekStart : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0,
				pickerPosition : 'bottom-left'
			});
		} else if (type == "month") {
			$('#startDate').datetimepicker({
				format : 'yyyy-mm-01 00:00:00',
				language : 'zh-CN',
				weekStart : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 3,
				minView : 3,
				forceParse : 0,
				pickerPosition : 'bottom-left'
			});
			$('#endDate').datetimepicker({
				format : 'yyyy-mm-31 23:59:59',
				language : 'zh-CN',
				weekStart : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 3,
				minView : 3,
				forceParse : 0,
				pickerPosition : 'bottom-left'
			});
		} else if (type == "year") {
			$('#startDate').datetimepicker({
				format : 'yyyy-01-01 00:00:00',
				language : 'zh-CN',
				weekStart : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 4,
				minView : 4,
				forceParse : 0,
				pickerPosition : 'bottom-left'
			});
			$('#endDate').datetimepicker({
				format : 'yyyy-12-31 23:59:59',
				language : 'zh-CN',
				weekStart : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 4,
				minView : 4,
				forceParse : 0,
				pickerPosition : 'bottom-left'
			});
		}
	});
});
