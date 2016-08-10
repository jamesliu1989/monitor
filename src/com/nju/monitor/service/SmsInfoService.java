package com.nju.monitor.service;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.nju.monitor.daoImpl.SmsHistoryDAO;
import com.nju.monitor.daoImpl.SmsInfoDAOImpl;
import com.nju.monitor.model.SmsHistory;
import com.nju.monitor.model.SmsInfo;

@Component
public class SmsInfoService {
	
	private SmsInfoDAOImpl smsInfoDAO;
	private SmsHistoryDAO smsHistoryDAO;
	
	public SmsInfoDAOImpl getSmsInfoDAO() {
		return smsInfoDAO;
	}
    @Resource
	public void setSmsInfoDAO(SmsInfoDAOImpl smsInfoDAO) {
		this.smsInfoDAO = smsInfoDAO;
	}    
	public SmsHistoryDAO getSmsHistoryDAO() {
		return smsHistoryDAO;
	}
	@Resource
	public void setSmsHistoryDAO(SmsHistoryDAO smsHistoryDAO) {
		this.smsHistoryDAO = smsHistoryDAO;
	}
	
	public SmsInfo getSmsTemplate() {
		return smsInfoDAO.findSmsInfoById(1);
	}
	public SmsInfo getSmsTemplateType() {
		return smsInfoDAO.findSmsInfoById(2);
	}
	public void updateSmsTemplate(SmsInfo smsTemplate) {
		smsTemplate.setId(1);
		smsInfoDAO.updateSmsInfo(smsTemplate);		
	}
	public void updateSmsTemplateType(SmsInfo smsTemplateType) {
		smsTemplateType.setId(2);
		smsInfoDAO.updateSmsInfo(smsTemplateType);		
	}
	
	public List<SmsHistory> querySmsHistory(int page, Timestamp startTime, Timestamp endTime){
		return smsHistoryDAO.findByTime(page, startTime, endTime);
	}
	public long querySmsHistoryCount(Timestamp startTime, Timestamp endTime) {
		return smsHistoryDAO.findByTimeCount(startTime, endTime);
	}

}
