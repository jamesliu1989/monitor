package com.nju.monitor.action;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nju.monitor.model.*;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.service.AreaParameterService;
import com.nju.monitor.service.AreaService;
import com.nju.monitor.service.NodeService;
import com.opensymphony.xwork2.ActionSupport;
@Component
@Scope("prototype")
public class AreaAction extends ActionSupport implements ServletRequestAware, ServletResponseAware{

	
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private AreaService areaService;
	private NodeService nodeService;
	private AreaParameterService areaParamaterService;

	//用户各种类型json数据传递
	private long result;	//0:失败，1：成功		
	private Map<String, Object> dataMap;
	private List<Object> dataList;
		
	//用户前后台传值
	private AreaInfo areaInfo;
	private int id;
	private int ctrlerNo;
	private String areaNo;
	private int nodeNum;
	private String ctrlerDesc;
	private Integer ctrlerStatus;
	private AreaAlertParameter alertParameter;
	private List<AreaAlertParameter> alertParameters;
	
    /**
     * 显示区域管理信息
     */
	public String areaConfig(){
		dataList = areaService.getName(ctrlerNo);
		return "JSON";
	}
	public String getAllArea(){
		dataList = areaService.findAll(ctrlerNo);
		return "JSON";
	}
	//用于自动添加分区名
	public String getAreaNum(){
		//减掉未分区域
		result = areaService.getAreaNum(ctrlerNo) - 1;
		return "JSON3";
	}
    /**
     * 显示控制器管理信息
     */
	public String ctrlerConfig(){
		dataList = areaService.findAllCtrler();
		return "JSON";
	}
	
	public String updateCtrlerConfig(){
		result = areaService.updateCtrlerDesc(ctrlerNo, ctrlerDesc, ctrlerStatus);
		return "JSON3";
	}
	//删除控制器，将删除所有节点信息
	public String deleteCtrlerConfig(){
		User sessionUser = (User) request.getSession().getAttribute("user");
		//只有一般管理员以上可以删除
		if( sessionUser != null && sessionUser.getFlag() >= 1) {
			result = areaService.deleteCtrler(ctrlerNo);
		}else{
			result = -1;
		}
		return "JSON3";
	}
	public String addCtrlerConfig(){
		result = areaService.addCtrler(new CtrlerInfo(ctrlerNo, nodeNum, ctrlerDesc, ctrlerStatus));
		//生成控制器未分区域
		String defaultAreaNo = "C"+ctrlerNo+"-未分区域";
		areaService.add(new AreaInfo(defaultAreaNo, "未分区域", ctrlerNo, "未分区域"));
		//未分区域添加默认报警参数
		areaParamaterService.add(new AreaAlertParameter(defaultAreaNo, 1));
		areaParamaterService.add(new AreaAlertParameter(defaultAreaNo, 2));
		//自动添加节点
		for(int i = 0; i<nodeNum; i++){
			String nodeNo = "C"+ctrlerNo+"-"+i;
			String nodeName = "节点"+i;
		   nodeService.add(new NodeInfo(nodeNo, nodeName, defaultAreaNo, ctrlerNo));
		}
		return "JSON3";
	}
		
	public String updateAreaConfig(){
		areaService.update(areaInfo);
		result = 1;
		return "JSON3";
	}
	public String deleteAreaConfig(){
		result = areaService.delete(id);
		return "JSON3";
	}
	
	public String addAreaConfig(){
		result = areaService.add(areaInfo);
/*		//自动添加节点（已移动至addAtrlerConfig）
		long exitNodeNum = nodeService.getExitNodeNum(areaInfo.getCtrlerNo());
		int cNo = areaInfo.getCtrlerNo();
		for(int i = 0;i<areaInfo.getNodeNum();i++){
			String nodeNo = "C"+cNo+"-"+(i+exitNodeNum);
			String nodeName = "节点"+(i+exitNodeNum);
		   nodeService.add(new NodeInfo(nodeNo, nodeName, areaInfo.getAreaNo(), cNo));
		}*/
		//添加报警参数
		areaParamaterService.add(new AreaAlertParameter(areaInfo.getAreaNo(), 1));
		areaParamaterService.add(new AreaAlertParameter(areaInfo.getAreaNo(), 2));
		return "JSON3";
	}
	
	
	public String getAllCtrlerNo(){
		dataList = areaService.findAllCtrlerNo();
		return "JSON";
	}
	/**
	 * 区域监测信息
	 * @return
	 */
	public String areasView(){
		if(ctrlerNo != -1){
		   dataList = areaService.areasView(ctrlerNo);
		}
		return "JSON";
	}
	/**
	 * 更新区域报警参数
	 * @return
	 */
	public String updateAreaAlertParameter(){
		result = areaParamaterService.updateParameter(alertParameter);
		return "JSON3";
	}
	
	/**
	 * 根据控区域号获取所有报警参数
	 * @return
	 */
	public String areaAlertParameter(){
		if(areaNo != null)
		   alertParameters = areaParamaterService.findAll(ctrlerNo, areaNo);
		return "areaPrmConfig";
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
	    this.request = request;	
	}
	public NodeService getNodeService() {
		return nodeService;
	}
    @Resource
	public void setNodeService(NodeService nodeService) {
		this.nodeService = nodeService;
	}
	
	public long getResult() {
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
	public AreaService getAreaService() {
		return areaService;
	}
	@Resource
	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
	}

	public AreaParameterService getAreaParamaterService() {
		return areaParamaterService;
	}
    @Resource
	public void setAreaParamaterService(AreaParameterService areaParamaterService) {
		this.areaParamaterService = areaParamaterService;
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

	public AreaAlertParameter getAlertParameter() {
		return alertParameter;
	}

	public void setAlertParameter(AreaAlertParameter alertParameter) {
		this.alertParameter = alertParameter;
	}

	public List<AreaAlertParameter> getAlertParameters() {
		return alertParameters;
	}
	public void setCtrlerNo(int ctrlerNo) {
		this.ctrlerNo = ctrlerNo;
	}

	public int getCtrlerNo() {
		return ctrlerNo;
	}
	public int getNodeNum() {
		return nodeNum;
	}
	public void setNodeNum(int nodeNum) {
		this.nodeNum = nodeNum;
	}
	public AreaInfo getAreaInfo() {
		return areaInfo;
	}
	public void setAreaInfo(AreaInfo areaInfo) {
		this.areaInfo = areaInfo;
	}
	public String getCtrlerDesc() {
		return ctrlerDesc;
	}
	public void setCtrlerDesc(String ctrlerDesc) {
		this.ctrlerDesc = ctrlerDesc;
	}

	public Integer getCtrlerStatus() {
		return ctrlerStatus;
	}

	public void setCtrlerStatus(Integer ctrlerStatus) {
		this.ctrlerStatus = ctrlerStatus;
	}
}
