package com.nju.monitor.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.daoImpl.AreaAlertParameterDAO;
import com.nju.monitor.daoImpl.AreaInfoDAO;
import com.nju.monitor.daoImpl.NodeInfoDAO;
import com.nju.monitor.model.AreaAlertParameter;
import com.nju.monitor.model.AreaInfo;

@Component
public class AreaParameterService 
{

	private AreaInfoDAO areaInfoDAO;
	private NodeInfoDAO nodeInfoDAO;
	private AreaAlertParameterDAO alertParameterDAO;

	/**
	 * 更新区域报警参数
	 * @param alertParameter
	 * @return
	 */
	public int updateParameter(AreaAlertParameter alertParameter) {
		return alertParameterDAO.attachDirty(alertParameter);
	}
	public List<AreaAlertParameter> findAll(int ctrlerNo, String areaNo){
		List<AreaAlertParameter> alertParameters = alertParameterDAO.findAllByAreaNo(ctrlerNo, areaNo);
		for(AreaAlertParameter aap : alertParameters){
			//未分区域单独设置
			if(areaNo.contains("未分")){
				aap.setNodeNum(1);
			}else {
				AreaInfo area = (AreaInfo) areaInfoDAO.findByAreaNo(aap.getAreaNo()).get(0);				
				aap.setNodeNum(nodeInfoDAO.findNodeNum(aap.getAreaNo()));
				aap.setActiveNodeNum(nodeInfoDAO.findActiveNodeNum(aap.getAreaNo()));
			}
		}
		return alertParameters;
	}
	
	/**
	 * 更新areaName
	 * @param areaName
	 * @return
	 */
	public int updateAreaName(String areaName){
		return alertParameterDAO.updateAreaName(areaName);
	}
	/**
	 * 添加新参数记录
	 * @param areaAlertParameter
	 */
	public void add(AreaAlertParameter areaAlertParameter) {
		alertParameterDAO.save(areaAlertParameter);		
	}
	
	public AreaInfoDAO getAreaInfoDAO() {
		return areaInfoDAO;
	}
	@Resource
	public void setAreaInfoDAO(AreaInfoDAO areaInfoDAO) {
		this.areaInfoDAO = areaInfoDAO;
	}
	public NodeInfoDAO getNodeInfoDAO() {
		return nodeInfoDAO;
	}
	@Resource
	public void setNodeInfoDAO(NodeInfoDAO nodeInfoDAO) {
		this.nodeInfoDAO = nodeInfoDAO;
	}
	public AreaAlertParameterDAO getAlertParameterDAO() {
		return alertParameterDAO;
	}
	@Resource
	public void setAlertParameterDAO(AreaAlertParameterDAO alertParameterDAO) {
		this.alertParameterDAO = alertParameterDAO;
	}
}
