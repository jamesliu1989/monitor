package com.nju.monitor.service;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.daoImpl.SystemDAO;
import com.nju.monitor.model.SystemConfig;

@Component
public class SystemService 
{
	private SystemDAO systemDAO;

	public SystemDAO getSystemDAO() {
		return systemDAO;
	}
    @Resource
	public void setSystemDAO(SystemDAO systemDAO) {
		this.systemDAO = systemDAO;
	}
    
    public SystemConfig findConfig(){
    	return systemDAO.findOne();
    }
    
    public void updateConfig(SystemConfig config){
    	systemDAO.update(config);
    }

	
}
