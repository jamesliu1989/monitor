package com.nju.monitor.action;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.ReportDailyArea;
import com.nju.monitor.model.ReportDailyNode;
import com.nju.monitor.model.ReportMonthArea;
import com.nju.monitor.model.ReportMonthNode;
import com.nju.monitor.service.ReportService;
import com.opensymphony.xwork2.ActionSupport;
@Component
@Scope("prototype")
public class ReportAction extends ActionSupport implements ServletRequestAware, ServletResponseAware{

	
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ReportService reportService;

	//用户各种类型json数据传递
	
	private int result;	//0:失败，1：成功	   //JSON1
	private List<Object> dataList;         //JSON2
	private Map<String, Object> dataMap;   //JSON3
	
	
	//用户前后台传值
	private int ctrlerNo = -1;
	private String areaNo;
	private String nodeNo;
	private String month;
	private String year;
	private List<ReportDailyNode> reportDailyNodes;
	private List<ReportDailyArea> reportDailyAreas;
	private List<ReportMonthNode> reportMonthNodes;
	private List<ReportMonthArea> reportMonthAreas;
	

	//获取节点日报表
	public String nodeDailyReport(){
		if(!nodeNo.equals("-1")){
		   reportDailyNodes = reportService.nodeDailyReport(nodeNo, month);
		}
		return "nodeDailyReport";
	}
	
	//获取区域日报表
	public String areaDailyReport(){
		if(!areaNo.equals("-1")){
		   reportDailyAreas = reportService.areaDailyReport(areaNo, month);
		}
		return "areaDailyReport";
	}
	
	//获取节点月报表
	public String nodeMonthReport(){
		if(!nodeNo.equals("-1")){
		   reportMonthNodes = reportService.nodeMonthReport(nodeNo, year);
		}
		return "nodeMonthReport";
	}
	
	//获取区域月报表
	public String areaMonthReport(){
		if(!areaNo.equals("-1")){
		  reportMonthAreas = reportService.areaMonthReport(areaNo, year);
		}
		return "areaMonthReport";
	}
	
    @Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
	    this.request = request;	
	}
	
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}


	public List<Object> getDataList() {
		return dataList;
	}
	public ReportService getReportService() {
		return reportService;
	}
	@Resource
	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}

	public String getNodeNo() {
		return nodeNo;
	}

	public void setNodeNo(String nodeNo) {
		this.nodeNo = nodeNo;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public List<ReportDailyNode> getReportDailyNodes() {
		return reportDailyNodes;
	}

	public void setReportDailyNodes(List<ReportDailyNode> reportDailyNodes) {
		this.reportDailyNodes = reportDailyNodes;
	}
	
	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	public List<ReportDailyArea> getReportDailyAreas() {
		return reportDailyAreas;
	}

	public void setReportDailyAreas(List<ReportDailyArea> reportDailyAreas) {
		this.reportDailyAreas = reportDailyAreas;
	}

	public List<ReportMonthNode> getReportMonthNodes() {
		return reportMonthNodes;
	}

	public void setReportMonthNodes(List<ReportMonthNode> reportMonthNodes) {
		this.reportMonthNodes = reportMonthNodes;
	}

	public List<ReportMonthArea> getReportMonthAreas() {
		return reportMonthAreas;
	}

	public void setReportMonthAreas(List<ReportMonthArea> reportMonthAreas) {
		this.reportMonthAreas = reportMonthAreas;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public int getCtrlerNo() {
		return ctrlerNo;
	}

	public void setCtrlerNo(int ctrlerNo) {
		this.ctrlerNo = ctrlerNo;
	}

}
