package com.nju.monitor.action;


import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nju.monitor.util.Variables;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.RegularData;
import com.nju.monitor.service.NodeService;
import com.nju.monitor.service.RegularDataService;
import com.opensymphony.xwork2.ActionSupport;

/*
 * @date 2015-06-27
 * @author James Liu
 */


@Component
@Scope("prototype")
public class RegularDataAction extends ActionSupport implements ServletRequestAware, ServletResponseAware{

	
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private RegularDataService regularDataService;
	private NodeService nodeService;

	//用户各种类型json数据传递
	
	private int result;	//0:失败，1：成功	   //JSON1
	private List<Object> dataList;         //JSON2
	private Map<String, Object> dataMap;   //JSON3
	
	
	//用户前后台传值
	private Timestamp startTime;
	private Timestamp endTime;
	private String nodeNo;
	private int ctrlerNo;
	private String areaNo;
	
	/**
	 * 历史曲线
	 * @return
	 */
	public String queryByTime(){
		List<RegularData> regularDatas = regularDataService.queryByTime(nodeNo, startTime, endTime);
		List<Object> tempMedList = new ArrayList<Object>();
		List<Object> tempEnvList = new ArrayList<Object>();
		List<Object> humidityList = new ArrayList<Object>();
		List<Object> smogAlertList = new ArrayList<Object>();
		List<Object> batteryVolList = new ArrayList<Object>();
		List<Object> wirelessSigList = new ArrayList<Object>();
		for(RegularData regData : regularDatas){
			long collectTime = regData.getCollectTime().getTime();
			//介质温度
			if(regData.getTempMed() != Variables.ERROR_TMP) {
				List<Object> objs1 = new ArrayList<Object>();
				objs1.add(collectTime);
				objs1.add(regData.getTempMed());
				tempMedList.add(objs1);
			}
			//环境温度
			if(regData.getTempEnv() != Variables.ERROR_TMP) {
				List<Object> objs2 = new ArrayList<Object>();
				objs2.add(collectTime);
				objs2.add(regData.getTempEnv());
				tempEnvList.add(objs2);
			}
			//湿度
			if(regData.getHumidity() != Variables.ERROR_HU) {
				List<Object> objs8 = new ArrayList<Object>();
				objs8.add(collectTime);
				objs8.add(regData.getHumidity());
				humidityList.add(objs8);
			}
			//烟雾报警
			List<Object> objs3 = new ArrayList<Object>();
			objs3.add(collectTime);
			objs3.add(regData.getSmogAlert());
			smogAlertList.add(objs3);
			//电池电压
			List<Object> objs4 = new ArrayList<Object>();
			objs4.add(collectTime);
			objs4.add(regData.getBatteryVol());
			batteryVolList.add(objs4);
			//无线信号
			List<Object> objs5 = new ArrayList<Object>();
			objs5.add(collectTime);
			objs5.add(regData.getWirelessSig());
			wirelessSigList.add(objs5);
		}
		dataMap = new HashMap<String, Object>();
		dataMap.put("tempMed", tempMedList);
		dataMap.put("tempEnv", tempEnvList);
		dataMap.put("humidity", humidityList);
		dataMap.put("smogAlert", smogAlertList);
		dataMap.put("batteryVol", batteryVolList);
		dataMap.put("wirelessSig", wirelessSigList);
		
		//如果是具体区域，则要获取区域平均介质与环境温度曲线
		if(!areaNo.equals("-1")){
			List<Object> areaTempMedAvgList = new ArrayList<Object>();
			List<Object> areaTempEnvAvgList = new ArrayList<Object>();
			List<Object> areaHumidityAvgList = new ArrayList<Object>();
			List<String> nodes = nodeService.getNodeNoByArea(areaNo);
			DecimalFormat df =new DecimalFormat("#####0.0");
			
			List<List<RegularData>> areaRegList = new ArrayList<List<RegularData>>();
			//获取每个节点的曲线数据
			for(String nodeNo : nodes){
				areaRegList.add(regularDataService.queryByTime(nodeNo, startTime, endTime));				
			}
			//生成区域平均温度曲线
			for (int i = 0; i < regularDatas.size(); i++) {
				//计算区域曲线各点均值
				double tempMedSum = 0.0, tempEnvSum = 0.0, humiditySum = 0.0;
				//有效数量
				int tmCount = 0, teCount = 0, huCount = 0;
				for (List<RegularData> areaReg : areaRegList) {
					if (i < areaReg.size()) {
						if (areaReg.get(i) != null) {
							if(areaReg.get(i).getTempMed() != null && areaReg.get(i).getTempMed() != Variables.ERROR_TMP) {
								tempMedSum += areaReg.get(i).getTempMed();
							}else{
								tmCount--;
							}
							if(areaReg.get(i).getTempEnv() != null && areaReg.get(i).getTempEnv() != Variables.ERROR_TMP) {
								tempEnvSum += areaReg.get(i).getTempEnv();
							}else {
								teCount--;
							}
							if(areaReg.get(i).getHumidity() != null && areaReg.get(i).getHumidity() != Variables.ERROR_HU) {
								humiditySum += areaReg.get(i).getHumidity();
							}else{
								huCount--;
							}
						}

					}
				}
				long collectTime = regularDatas.get(i).getCollectTime().getTime();
				List<Object> objs6 = new ArrayList<Object>();
				objs6.add(collectTime);
				if (nodes.size() + tmCount == 0) {
					objs6.add(0);
				} else {
					objs6.add(Double.parseDouble(df.format(tempMedSum/(nodes.size() + tmCount))));
				}
				areaTempMedAvgList.add(objs6);

				List<Object> objs7 = new ArrayList<Object>();
				objs7.add(collectTime);
				if (nodes.size() + teCount == 0) {
					objs7.add(0);
				}else {
					objs7.add(Double.parseDouble(df.format(tempEnvSum / (nodes.size() + teCount))));
				}
				areaTempEnvAvgList.add(objs7);

				List<Object> objs9 = new ArrayList<Object>();
				objs9.add(collectTime);
				if (nodes.size() + huCount == 0) {
					objs9.add(0);
				} else {
					objs9.add(Double.parseDouble(df.format(humiditySum / (nodes.size() + huCount))));
				}
				areaHumidityAvgList.add(objs9);
			}
			dataMap.put("areaTempMedAvg", areaTempMedAvgList);
			dataMap.put("areaTempEnvAvg", areaTempEnvAvgList);
			dataMap.put("areaHumidityAvg", areaHumidityAvgList);
		}
		return "JSON3";
	}
	
	/**
	 * 节点一览
	 * @return
	 */
	public String nodesView(){
		dataList = regularDataService.nodesView(ctrlerNo, areaNo);
		return "JSON2";
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

	public RegularDataService getRegularDataService() {
		return regularDataService;
	}
	@Resource
	public void setRegularDataService(RegularDataService regularDataService) {
		this.regularDataService = regularDataService;
	}
	public NodeService getNodeService() {
		return nodeService;
	}
    @Resource
	public void setNodeService(NodeService nodeService) {
		this.nodeService = nodeService;
	}

	public List<Object> getDataList() {
		return dataList;
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
	public String getNodeNo() {
		return nodeNo;
	}
	public void setNodeNo(String nodeNo) {
		this.nodeNo = nodeNo;
	}

	public int getCtrlerNo() {
		return ctrlerNo;
	}

	public void setCtrlerNo(int ctrlerNo) {
		this.ctrlerNo = ctrlerNo;
	}

	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}


}
