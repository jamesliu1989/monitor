package com.nju.monitor.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.daoImpl.NodeInfoDAO;
import com.nju.monitor.model.NodeInfo;

@Component
public class NodeService 
{
	private NodeInfoDAO nodeInfoDAO;

	public int delete(String nodeNO){
		return nodeInfoDAO.deleteByNo(nodeNO);
	}
	
	public void update(NodeInfo nodeInfo){
		nodeInfoDAO.attachDirty(nodeInfo);
	}
	public int updateNode(NodeInfo nodeInfo){
		return nodeInfoDAO.updateNode(nodeInfo);
	}
	
	public void add(NodeInfo nodeInfo){
		nodeInfoDAO.save(nodeInfo);
	}
	
	public List getNodeNoByArea(String areaNo) {
		return nodeInfoDAO.findActiveNodeNoByArea(areaNo);		
	}
	
	public List getNodeNo() {
		return nodeInfoDAO.findAllActiveNodeNo();		
	}
	public long getExitNodeNum(int ctrlerNo) {		
		return nodeInfoDAO.findExitNodeNum(ctrlerNo);
	}
	public List findByCtrlerNo(int ctrlerNo){
		return nodeInfoDAO.findByCtrlerNo(ctrlerNo);
	}
	
	public List findByAreaNo(String areaNo){
		return nodeInfoDAO.findByAreaNo(areaNo);
	}
	
	public NodeInfoDAO getNodeInfoDAO() {
		return nodeInfoDAO;
	}
	@Resource
	public void setNodeInfoDAO(NodeInfoDAO nodeInfoDAO) {
		this.nodeInfoDAO = nodeInfoDAO;
	}



}
