package com.nju.monitor.action;


import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.SmsHistory;
import com.nju.monitor.model.SmsInfo;
import com.nju.monitor.service.SmsInfoService;
import com.nju.monitor.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class SmsAction extends ActionSupport implements ServletRequestAware, ServletResponseAware{

	
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private UserService userService;
	private SmsInfoService smsInfoService;

	//用户各种类型json数据传递
	private int result;	//0:失败，1：成功		
	private Map<String, Object> dataMap;
	private List<Object> dataList;
		
	//用户前后台传值
	private int id;
	private int page = 0;
	private int next;

	private Timestamp startTime;
	private Timestamp endTime;
	
	private List<SmsHistory> smsList;
	
	private List<Integer> receiverId;   //用于接收保存接收人时的id
	private int fakeSubmit = 1;   //假提交，用户防止所有接收人unchecked情况下的bug
	
	private SmsInfo smsTemplate;
	private SmsInfo smsTemplateType;
	
	/**
	 * 获取所有接收人列表
	 * @return
	 */
	public String getAllReceiver(){
		dataList = userService.getSmsReceiver();
		return "JSON2";
	}
	
	/**
	 * 保存接收人
	 */
	public String updateReceiver(){
		if(fakeSubmit == 0){
		    userService.updateReceiver(receiverId);
		}
		return smsInfo();
	}
	
	/**
	 * 更新短信模板
	 */
	public String updateTemplate(){
		smsInfoService.updateSmsTemplate(smsTemplate);
		smsInfoService.updateSmsTemplateType(smsTemplateType);
		return smsInfo();
	}
	
	/**
	 * 显示短信模板
	 */
	public String smsInfo(){
		smsTemplate = smsInfoService.getSmsTemplate();
		smsTemplateType = smsInfoService.getSmsTemplateType();
		return "info";
	}
	
	/**
	 * 发送记录
	 * @return
	 */
	public String querySmsHistory(){
		smsList = smsInfoService.querySmsHistory(page, startTime, endTime);
		//第一页为0， 向下取整
		//pageNum = new Double(Math.floor((double)smsInfoService.querySmsHistoryCount(startTime, endTime)/10)).intValue();
		if(smsList.size() == 10){
			next = 1;
		}else {
			next = 0;
		}
		return "history";
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
	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	public SmsInfoService getSmsInfoService() {
		return smsInfoService;
	}

	@Resource
	public void setSmsInfoService(SmsInfoService smsInfoService) {
		this.smsInfoService = smsInfoService;
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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getNext() {
		return next;
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

	public List<Integer> getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(List<Integer> receiverId) {
		this.receiverId = receiverId;
	}

	public int getFakeSubmit() {
		return fakeSubmit;
	}

	public void setFakeSubmit(int fakeSubmit) {
		this.fakeSubmit = fakeSubmit;
	}

	public SmsInfo getSmsTemplate() {
		return smsTemplate;
	}

	public SmsInfo getSmsTemplateType() {
		return smsTemplateType;
	}

	public void setSmsTemplate(SmsInfo smsTemplate) {
		this.smsTemplate = smsTemplate;
	}

	public void setSmsTemplateType(SmsInfo smsTemplateType) {
		this.smsTemplateType = smsTemplateType;
	}

	public List<SmsHistory> getSmsList() {
		return smsList;
	}

	public void setSmsList(List<SmsHistory> smsList) {
		this.smsList = smsList;
	}	
	
	
}
