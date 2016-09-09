package com.nju.monitor.service;

import com.nju.monitor.daoImpl.*;
import com.nju.monitor.model.AreaAlertParameter;
import com.nju.monitor.model.AreaInfo;
import com.nju.monitor.model.NodeInfo;
import com.nju.monitor.model.RegularData;
import com.nju.monitor.util.Variables;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * @date 2015-06-27
 * @author James Liu
 */

@Component
public class RegularDataService 
{
	private RegularDataDAO regularDataDAO;
	private AreaInfoDAO areaInfoDAO;
	private NodeInfoDAO nodeInfoDAO;
	private CtrlerInfoDAO ctrlerInfoDAO;
	private AreaAlertParameterDAO alertParameterDAO;
	
	public void update(RegularData regularData){
		regularDataDAO.attachDirty(regularData);
	}
	public void add(RegularData regularData){
		regularDataDAO.save(regularData);
	}
	public List findAll(){
		return regularDataDAO.findAll();
	}
	
    /*
     * 按节点查询历史曲线信息
     */
	public List<RegularData> queryByTime(String nodeNo, Timestamp startTime, Timestamp endTime){
		return regularDataDAO.findByTime(nodeNo, startTime, endTime);
	}
	
	/**
	 * 节点一览
	 * @return
	 */
	public List<Object> nodesView(int ctrlerNo, String areaNo){
		DecimalFormat df =new DecimalFormat("#####0.0");
		List<Object> resultList = new ArrayList<Object>();
		List<AreaInfo> areaList = null;
		//获取所有控制器所有区域
		if(ctrlerNo == -1  && areaNo.equals("-1")){
			areaList = areaInfoDAO.findAll();
		}
		//获取某控制器所有区域
		else if(areaNo.equals("-1")){
			areaList = areaInfoDAO.findAllByCtrlerNo(ctrlerNo);
		}
		//获取某控制器，某区域
		else {
			areaList = areaInfoDAO.findByAreaNo(areaNo);
		}
		for(AreaInfo area : areaList){
			Map<String, Object> areaMap = new HashMap<String, Object>();
			areaMap.put("areaNo", area.getAreaNo());
			areaMap.put("areaDesc", area.getAreaDesc());
			areaMap.put("nodeNum", nodeInfoDAO.findNodeNum(area.getAreaNo()));
			areaMap.put("activeNodeNum", nodeInfoDAO.findActiveNodeNum(area.getAreaNo()));
			
			List<AreaAlertParameter> alertParameters =  alertParameterDAO.findByAreaNo(area.getAreaNo());

		if(alertParameters != null && alertParameters.size()==2){
			//报警提示
			areaMap.put("medTempPreAlert", alertParameters.get(0).getTempMedMax());
			areaMap.put("medTempAlert", alertParameters.get(1).getTempMedMax());
			
			areaMap.put("envTempPreAlert", alertParameters.get(0).getTempEnvMax());
			areaMap.put("envTempAlert", alertParameters.get(1).getTempEnvMax());
			
			areaMap.put("humidityPreAlert", alertParameters.get(0).getHumidityMax());
			areaMap.put("humidityAlert", alertParameters.get(1).getHumidityMax());
			
			areaMap.put("batteryVolPreAlert", alertParameters.get(0).getMinBatteryVol());
			areaMap.put("batteryVolAlert", alertParameters.get(1).getMinBatteryVol());
			
			areaMap.put("wirelessSigPreAlert", alertParameters.get(0).getMinWirelessSig());
			areaMap.put("wirelessSigAlert", alertParameters.get(1).getMinWirelessSig());
		}
			
			List<RegularData> nodes = new ArrayList<RegularData>();
			double tempMedMax = 0.0, tempMedMin = 0.0, tempMedSum = 0.0, tempEnvMax = 0.0, tempEnvMin = 0.0, tempEnvSum = 0.0;
			double humidityMax = 0.0, humidityMin = 0.0, humiditySum = 0.0;
			int count = 0, tmCount = 0, teCount = 0, huCount = 0; //use for error data condition;
			//这里只获取了所有在线节点 2015-11-04修改
			for (NodeInfo node : nodeInfoDAO.findActiveNodesByAreaNo(area.getAreaNo())) {
				RegularData data = regularDataDAO.findLatestByNodeNo(node.getNodeNo());
				if(data != null){
					count ++;
					double tm = data.getTempMed();
					double te = data.getTempEnv();
					double hu = data.getHumidity();

					if (tm != Variables.ERROR_TMP) {
						// 最小值初始化
						if (count == 0) {
							tempMedMin = tm;
						}
						if (tm > tempMedMax) {
							tempMedMax = tm;
						}
						if (tm < tempMedMin) {
							tempMedMin = tm;
						}
						tempMedSum += tm;
					}else{
						tmCount--;
					}

					if (te != Variables.ERROR_TMP) {
						if (count == 0) {
							tempEnvMin = te;
						}
						if (te > tempEnvMax) {
							tempEnvMax = te;
						}
						if (te < tempEnvMin) {
							tempEnvMin = te;
						}
						tempEnvSum += te;
					}else{
						teCount--;
					}

					if (hu != Variables.ERROR_HU) {
						if (count == 0) {
							humidityMin = hu;
						}
						if (hu > humidityMax) {
							humidityMax = hu;
						}
						if (hu < humidityMin) {
							humidityMin = hu;
						}
						humiditySum += hu;
					} else {
						huCount--;
					}
					
					data.setStatus(node.getStatus());
					data.setNodeDesc(node.getNodeDesc());
					nodes.add(data);
				}				
			}
			areaMap.put("tempMedMax", tempMedMax);
			areaMap.put("tempMedMin", tempMedMin);
			areaMap.put("tempMedAvg", (tempMedSum==0) ? 0.0 : df.format(tempMedSum/(count + tmCount)));
			areaMap.put("tempEnvMax", tempEnvMax);
			areaMap.put("tempEnvMin", tempEnvMin);
			areaMap.put("tempEnvAvg", (tempEnvSum==0) ? 0.0 : df.format(tempEnvSum/(count + teCount)));
			
			areaMap.put("humidityMax", humidityMax);
			areaMap.put("humidityMin", humidityMin);
			areaMap.put("humidityAvg", (humiditySum==0) ? 0.0 : df.format(humiditySum/(count + huCount)));
			
			areaMap.put("nodes", nodes);
						
			if(nodes.size() != 0){
		       resultList.add(areaMap);
			}
		}
		return resultList;
	}
	
	public RegularDataDAO getRegularDataDAO() {
		return regularDataDAO;
	}
    @Resource
	public void setRegularDataDAO(RegularDataDAO regularDataDAO) {
		this.regularDataDAO = regularDataDAO;
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
	public CtrlerInfoDAO getCtrlerInfoDAO() {
		return ctrlerInfoDAO;
	}
	@Resource
	public void setCtrlerInfoDAO(CtrlerInfoDAO ctrlerInfoDAO) {
		this.ctrlerInfoDAO = ctrlerInfoDAO;
	}
	public AreaAlertParameterDAO getAlertParameterDAO() {
		return alertParameterDAO;
	}
	@Resource
	public void setAlertParameterDAO(AreaAlertParameterDAO alertParameterDAO) {
		this.alertParameterDAO = alertParameterDAO;
	}
}
