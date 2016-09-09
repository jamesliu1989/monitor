package com.nju.monitor.action;


import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.AreaAlertInfo;
import com.nju.monitor.model.AreaAlertParameter;
import com.nju.monitor.model.AreaInfo;
import com.nju.monitor.service.AlertService;
import com.nju.monitor.service.AreaParameterService;
import com.nju.monitor.service.AreaService;
import com.opensymphony.xwork2.ActionSupport;
@Component
@Scope("prototype")
public class AlertAction extends ActionSupport implements ServletRequestAware, ServletResponseAware{


	
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private AlertService alertService;

	//用户各种类型json数据传递
	private int result;	//0:失败，1：成功		
	private Map<String, Object> dataMap;
	private List<Object> dataList;
		
	//用户前后台传值
	private int id;
	private int page = 0;
	private int pre;
	private int next;
	private int pageNum;
	private int ctrlerNo;
	private String areaNo;
	private String nodeNo;
	private Timestamp startTime;
	private Timestamp endTime;
	private List<AreaAlertInfo> alerts;
	private int range;  //0:显示未处理，1：显示所有
	

	/**
	 * 获取未处理报警
	 * @return
	 */
	public String getUnRead(){
		alerts = alertService.findUnRead();
		ctrlerNo = -1;
		areaNo = "-1";
		nodeNo = "-1";
		return "alertView";
	}
	
	/**
	 * 解除报警
	 */
	public String relieveAlert(){
		result = alertService.relieveAlert(id);
		return "JSON1";
	}

	/**
	 * 解除所有报警
	 */
	public String relieveAlertByNodeNo(){
		result = alertService.relieveAlertByNodeNo(nodeNo);
		return "JSON1";
	}
	
	public String getUnReadByNodeTime(){
		if(nodeNo.equals("-1")){
			alerts = alertService.findUnReadByArea(page, areaNo, startTime, endTime, range);
			//第一页为0， 向上取整
			pageNum = new Double(Math.ceil(alertService.findUnReadByAreaCount(areaNo, startTime, endTime, range)/10.0)).intValue();
		}else {
			alerts = alertService.findUnReadByNodeTime(page, nodeNo, startTime, endTime, range);
			//第一页为0， 向上取整
			pageNum = new Double(Math.ceil((double)alertService.findUnReadByNodeTimeCount(page, nodeNo, startTime, endTime, range)/10.0)).intValue();
		}
		return "alertView";
	}
	
	/**
	 * 获取最近一小时报警信息
	 * @return
	 */
	public String getLatestUnRead(){
		List<AreaAlertInfo> alerts = alertService.findLatestUnRead();
		long alertNum = alertService.findUnReadCount();
		dataMap = new HashMap<String, Object>();
		dataMap.put("alertNum", alertNum);
		dataMap.put("alerts", alerts);
		return "JSON3";
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
	public AlertService getAlertService() {
		return alertService;
	}
	@Resource
	public void setAlertService(AlertService alertService) {
		this.alertService = alertService;
	}
	public List<Object> getDataList() {
		return dataList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	public List<AreaAlertInfo> getAlerts() {
		return alerts;
	}

	public void setAlerts(List<AreaAlertInfo> alerts) {
		this.alerts = alerts;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPre() {
		if(page == 0){
			this.pre = 0;
		}else {
			this.pre = page - 1;
		}
		return pre;
	}

	public int getNext() {
		if(page == pageNum){
			this.next = page;
		}else {
			this.next = page + 1;
		}
		return next;
	}

	public int getPageNum() {
		int pNums = new Double(Math.ceil((double)page/10)*10).intValue();  //最大显示页数
		if(pNums == 0){
			return (pageNum < 10 ? pageNum : 10);
		}else if(pageNum < pNums){
			return pageNum;
		}else {
			return pNums;
		}
		
	}

	public String getNodeNo() {
		return nodeNo;
	}

	public void setNodeNo(String nodeNo) {
		this.nodeNo = nodeNo;
	}

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public int getCtrlerNo() {
		return ctrlerNo;
	}

	public void setCtrlerNo(int ctrlerNo) {
		this.ctrlerNo = ctrlerNo;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}
	
	
}
