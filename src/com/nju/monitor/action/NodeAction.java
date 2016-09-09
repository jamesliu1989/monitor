package com.nju.monitor.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.AreaInfo;
import com.nju.monitor.model.NodeInfo;
import com.nju.monitor.service.AreaParameterService;
import com.nju.monitor.service.AreaService;
import com.nju.monitor.service.NodeService;
import com.opensymphony.xwork2.ActionSupport;
@Component
@Scope("prototype")
public class NodeAction extends ActionSupport implements ServletRequestAware, ServletResponseAware{

	
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private NodeService nodeService;
	private AreaService areaService;
	private AreaParameterService areaParamaterService;

	//用户各种类型json数据传递
	
	private int result;	//0:失败，1：成功	   //JSON1
	private List<Object> dataList;         //JSON2
	private Map<String, Object> dataMap;   //JSON3
	
	
	//用户前后台传值
	private int id;
	private Integer ctrlerNo;
	private String areaNo;
	private String nodeNO;
	private NodeInfo nodeInfo;
		
    public String nodeView(){
    	dataList = new ArrayList<>();
            if(areaNo != null && areaNo.equals("-1")){
    			List<AreaInfo> areaList = areaService.findAll(ctrlerNo);
    			for(AreaInfo areaInfo : areaList){
        			List<NodeInfo> dataList_t = nodeService.findByAreaNo(areaInfo.getAreaNo());
        			for(NodeInfo node : dataList_t){
        				node.setAreaDesc(areaInfo.getAreaDesc());
        				node.setAreaName(areaInfo.getAreaName());
        			}
        			dataList.add(dataList_t);
    			}
    		}else {
    			AreaInfo areaInfo = areaService.getAreaByCtrlerNoAndNo(ctrlerNo,areaNo);
    			List<NodeInfo> dataList_t = nodeService.findByAreaNo(areaNo);
    			for(NodeInfo node : dataList_t){
    				node.setAreaDesc(areaInfo.getAreaDesc());
    				node.setAreaName(areaInfo.getAreaName());
    			}
    			dataList.add(dataList_t);
			}    	  
    	return "JSON2";
    }
	
    public String nodeNo(){
    	if(areaNo!= null){
    	  if(areaNo.equals("-1")){
    	   dataList = nodeService.getNodeNo();
    	  }else {
    	   dataList = nodeService.getNodeNoByArea(areaNo);
		}
    	}
    	return "JSON2";
    }
/*    public String addNode(){
    	result = 1;
    	nodeService.add(nodeInfo);
    	//如果是节点为未分区域节点，则添加单独报警参数记录
    	if(nodeInfo.getAreaName().startsWith("未分")){
    		areaParamaterService.add(new AreaAlertParameter(nodeInfo.getAreaName()));
    	}
    	return "JSON1";    	
    }*/
    
    public String updateNode(){
    	result = nodeService.updateNode(nodeInfo);      		
    	return "JSON1";    	
    }
    
    public String deleteNode(){
		result = nodeService.delete(nodeNO);
		return "JSON1";
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

	public NodeService getNodeService() {
		return nodeService;
	}
    @Resource
	public void setNodeService(NodeService nodeService) {
		this.nodeService = nodeService;
	}

	public AreaParameterService getAreaParamaterService() {
		return areaParamaterService;
	}
    @Resource
	public void setAreaParamaterService(AreaParameterService areaParamaterService) {
		this.areaParamaterService = areaParamaterService;
	}
    

	public AreaService getAreaService() {
		return areaService;
	}
	@Resource
	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
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

	public NodeInfo getNodeInfo() {
		return nodeInfo;
	}

	public void setNodeInfo(NodeInfo nodeInfo) {
		this.nodeInfo = nodeInfo;
	}

	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	public Integer getCtrlerNo() {
		return ctrlerNo;
	}

	public void setCtrlerNo(Integer ctrlerNo) {
		this.ctrlerNo = ctrlerNo;
	}

	public String getNodeNO() {
		return nodeNO;
	}

	public void setNodeNO(String nodeNO) {
		this.nodeNO = nodeNO;
	}

}
