package com.nju.monitor.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.SystemConfig;
import com.nju.monitor.service.SystemService;
import com.opensymphony.xwork2.ActionSupport;
@Component
@Scope("prototype")
public class SystemAction extends ActionSupport implements ServletRequestAware, ServletResponseAware{

	
	private static final long serialVersionUID = 1L;
    
		
	private Map<String, Object> dataMap;
	private Integer result;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private SystemService systemService;	
	private SystemConfig config;
	

	public  String getSystemConfig(){
		SystemConfig config = systemService.findConfig();
		dataMap = new HashMap<String, Object>();
		dataMap.put("config", config);
		return "JSON2";
	}
	
	public String updateConfig(){		
		systemService.updateConfig(config);
		//更新session
		ActionContext.getContext().getSession().put("config", config);
		result = 1;
		return "JSON1";
	}

	public SystemService getSystemService() {
		return systemService;
	}
    @Resource
	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
	    this.request = request;	
	}
	public SystemConfig getConfig() {
		return config;
	}
	public void setConfig(SystemConfig config) {
		this.config = config;
	}
	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public Integer getResult() {
		return result;
	}
}
