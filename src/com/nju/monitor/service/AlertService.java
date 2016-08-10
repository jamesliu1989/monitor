package com.nju.monitor.service;


import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.nju.monitor.daoImpl.AreaAlertInfoDAO;
import com.nju.monitor.model.AreaAlertInfo;

@Component
public class AlertService 
{
	private AreaAlertInfoDAO alertInfoDAO;

	
	public List<AreaAlertInfo> findUnRead(){
		return alertInfoDAO.findUnRead();
	}
	
	public long findUnReadCount(){
		return alertInfoDAO.findUnReadCount();
	}
		
	public int relieveAlert(int id) {
		return alertInfoDAO.updateIsRead(id);	
	}
	public List<AreaAlertInfo> findUnReadByArea(int page, String areaNo, Timestamp startTime,Timestamp endTime, int range){
		return alertInfoDAO.findUnReadByArea(page, areaNo, startTime, endTime, range);
	}
	
	public long findUnReadByAreaCount(String areaNo, Timestamp startTime,Timestamp endTime, int range){
		return alertInfoDAO.findUnReadbyAreaCount(areaNo, startTime, endTime, range);
	}
	
	public List<AreaAlertInfo> findUnReadByNodeTime(int page,String nodeNo, Timestamp startTime,Timestamp endTime, int range){
		return alertInfoDAO.findUnReadByNodeTime(page, nodeNo, startTime, endTime, range);
	}
	
	public List<AreaAlertInfo> findLatestUnRead(){
		return alertInfoDAO.findLatestUnRead();
	}
	

	
	public long findUnReadByNodeTimeCount(int page,String nodeNo, Timestamp startTime,Timestamp endTime, int range){
		return alertInfoDAO.findUnReadByNodeTimeCount(page, nodeNo, startTime, endTime, range);
	}
	
	public AreaAlertInfoDAO getAlertInfoDAO() {
		return alertInfoDAO;
	}
    @Resource
	public void setAlertInfoDAO(AreaAlertInfoDAO alertInfoDAO) {
		this.alertInfoDAO = alertInfoDAO;
	}
}
