package com.nju.monitor.service;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.nju.monitor.util.Variables;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.daoImpl.NodeInfoDAO;
import com.nju.monitor.daoImpl.RegularDataDAO;
import com.nju.monitor.daoImpl.ReportDailyAreaDAO;
import com.nju.monitor.daoImpl.ReportDailyNodeDAO;
import com.nju.monitor.model.NodeInfo;
import com.nju.monitor.model.RegularData;
import com.nju.monitor.model.ReportDailyArea;
import com.nju.monitor.model.ReportDailyNode;
import com.nju.monitor.model.ReportMonthArea;
import com.nju.monitor.model.ReportMonthNode;


@Component
public class ReportService 
{
    private ReportDailyNodeDAO reportDailyNodeDAO;
    private ReportDailyAreaDAO reportDailyAreaDAO;
    private RegularDataDAO regularDataDAO;
    private NodeInfoDAO nodeInfoDAO;
    
    private static DecimalFormat df =new DecimalFormat("#####0.0");
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM");
    private static SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
	/**
	 * 节点日报
	 * @return
	 */
	public List<ReportDailyNode> nodeDailyReport(String nodeNo, String month){	
		Date now = new Date();
		String today = sdf.format(now);
		String monthOfYear = sdf1.format(now);
		List<ReportDailyNode> reportDailyNodes = reportDailyNodeDAO.findAllByMonth(nodeNo, month);
		//如果查询月份为本月，可能当天报表还未出，则生成临时记录
        if(month.equals(monthOfYear)){      	
        	ReportDailyNode reportDailyNode = new ReportDailyNode();   
        	reportDailyNode.setSmogAlert(1);
        	Timestamp startTime = null, endTime = null;
			try {
				startTime = new Timestamp(sdf2.parse(today+" 00:00:00").getTime());
				endTime = new Timestamp(sdf2.parse(today+" 23:59:59").getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
        	List<RegularData> dataList = regularDataDAO.findByTime(nodeNo, startTime, endTime);
            List<NodeInfo> nodeInfos = nodeInfoDAO.findByNodeNo(nodeNo);           
			double tempMedMax = 0.0, tempMedMin = 0.0, tempMedSum = 0.0, tempEnvMax = 0.0, tempEnvMin = 0.0, tempEnvSum = 0.0, humidityMax = 0.0, humidityMin = 0.0, humiditySum = 0.0;
			int count = 0, tmCount = 0, teCount = 0, huCount = 0; //use for error data condition;;
			for (RegularData data : dataList) {
				if(data != null){					
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
					
					if(data.getSmogAlert() == 0){
						reportDailyNode.setSmogAlert(0);
					}
					//如果是最后一条记录
					if(count == dataList.size()-1){						
						reportDailyNode.setBatteryVol(data.getBatteryVol());
						reportDailyNode.setWirelessSig(data.getWirelessSig());							                       
					}					
					count ++;
				}				
			}
			//如果该天节点信息不存在，则状态置为0
            if(nodeInfos != null && nodeInfos.size() > 0){
            	reportDailyNode.setStatus(nodeInfos.get(0).getStatus());	
            	reportDailyNode.setAlert(nodeInfos.get(0).getAlert());
            }else {
            	reportDailyNode.setStatus(0);
            	reportDailyNode.setAlert(0);
			}
			reportDailyNode.setNodeNo(nodeNo);
			reportDailyNode.setTempMedMax(tempMedMax);
			reportDailyNode.setTempMedMin(tempMedMin);
			reportDailyNode.setTempMedAvg((tempMedSum==0) ? 0.0 : Double.parseDouble(df.format(tempMedSum/(count + tmCount))));
			reportDailyNode.setTempEnvMax(tempEnvMax);
			reportDailyNode.setTempEnvMin(tempEnvMin);
			reportDailyNode.setTempEnvAvg((tempEnvSum==0) ? 0.0 : Double.parseDouble(df.format(tempEnvSum/(count + teCount))));
			reportDailyNode.setHumidityMax(humidityMax);
			reportDailyNode.setHumidityMin(humidityMin);
			reportDailyNode.setHumidityAvg((humiditySum==0) ? 0.0 : Double.parseDouble(df.format(humiditySum/(count + huCount))));
			reportDailyNode.setTempDevAbs(Double.parseDouble(df.format(Math.abs(reportDailyNode.getTempMedAvg()-reportDailyNode.getTempEnvAvg()))));
			reportDailyNode.setDayOfYear(today);
			reportDailyNode.setMonthOfYear(today.substring(0, 7));
			
			reportDailyNodes.add(reportDailyNode);			
        }	
		return reportDailyNodes;
	}
    
	/**
	 * 获取或生成区域日报
	 * @param areaName
	 * @param month
	 * @return
	 */
	public List<ReportDailyArea> areaDailyReport(String areaNo, String month) {
		Date now = new Date();
		String today = sdf.format(now);
		String monthOfYear = sdf1.format(now);
		List<ReportDailyArea> reportDailyAreas = reportDailyAreaDAO.findAllByMonth(areaNo, month);		
		//如果查询的是本月，可能当天报表还未出，则生成临时记录
        if(month.equals(monthOfYear)){
        	ReportDailyArea reportDailyArea = new ReportDailyArea();
            //初始化报警参数
        	reportDailyArea.setSmogAlert(1);
        	reportDailyArea.setStatus(1);
        	reportDailyArea.setAlert(0);
        	Timestamp startTime = null, endTime = null;
			try {
				startTime = new Timestamp(sdf2.parse(today+" 00:00:00").getTime());
				endTime = new Timestamp(sdf2.parse(today+" 23:59:59").getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
        	List<NodeInfo> nodeList = nodeInfoDAO.findActiveNodeByArea(areaNo);    
			double tempMedMax = 0.0, tempMedMin = 0.0, tempMedSum = 0.0, tempEnvMax = 0.0, tempEnvMin = 0.0, tempEnvSum = 0.0, humidityMax = 0.0, humidityMin = 0.0, humiditySum = 0.0;
			int count = 0, tmCount = 0, teCount = 0, huCount = 0; //use for error data condition;;;
			double batteryVol = 0.0;
			int wirelessSig = 0;
		for(NodeInfo node: nodeList){
			List<RegularData> dataList = regularDataDAO.findByTime(node.getNodeNo(), startTime, endTime); 
			for (RegularData data : dataList) {
				if(data != null){					
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
					
					//有一个报警，则总体报警
					if(data.getSmogAlert() == 0){
						reportDailyArea.setSmogAlert(0);
					}
					
					count ++;
					batteryVol = data.getBatteryVol();
					wirelessSig = data.getWirelessSig();
				}
				//有一个离线，则总体离线
				if(node.getStatus() == 0){
					 reportDailyArea.setStatus(0);
				}
				//有一个报警，则总体报警
				if(node.getAlert() != 0){
			    	reportDailyArea.setAlert(node.getAlert());
				}
			}
		}
		    reportDailyArea.setBatteryVol(batteryVol);
		    reportDailyArea.setWirelessSig(wirelessSig);
			reportDailyArea.setAreaNo(areaNo);
			reportDailyArea.setTempMedMax(tempMedMax);
			reportDailyArea.setTempMedMin(tempMedMin);
			reportDailyArea.setTempMedAvg((tempMedSum==0) ? 0.0 : Double.parseDouble(df.format(tempMedSum/(count + tmCount))));
			reportDailyArea.setTempEnvMax(tempEnvMax);
			reportDailyArea.setTempEnvMin(tempEnvMin);
			reportDailyArea.setTempEnvAvg((tempEnvSum==0) ? 0.0 : Double.parseDouble(df.format(tempEnvSum/(count + teCount))));
			reportDailyArea.setHumidityMax(humidityMax);
			reportDailyArea.setHumidityMin(humidityMin);
			reportDailyArea.setHumidityAvg((humiditySum==0) ? 0.0 : Double.parseDouble(df.format(humiditySum/(count + huCount))));
			reportDailyArea.setTempDevAbs(Double.parseDouble(df.format(Math.abs(reportDailyArea.getTempMedAvg()-reportDailyArea.getTempEnvAvg()))));
			reportDailyArea.setDayOfYear(today);
			reportDailyArea.setMonthOfYear(today.substring(0, 7));
			
			reportDailyAreas.add(reportDailyArea);		
        }	
		return reportDailyAreas;
	}
	/**
	 * 节点月报
	 * @param nodeNo
	 * @param year
	 * @return
	 */
	public List<ReportMonthNode> nodeMonthReport(String nodeNo, String year) {
		List<ReportMonthNode> reportMonthNodes = new ArrayList<ReportMonthNode>();
		for(int i = 1 ; i<=12; i++){
			String month = null;
			if(i<10){
				month = year+"-0"+i;
			}else {
				month = year+"-"+i;
			}
		   List<ReportDailyNode> reportDailyNodes = reportDailyNodeDAO.findAllByMonth(nodeNo, month);
		    ReportMonthNode reportMonthNode = new ReportMonthNode();
		    reportMonthNode.setSmogAlert(1);
		    reportMonthNode.setStatus(1);
			reportMonthNode.setAlert(0);
		    double tempMedMax = 0.0, tempMedMin = 0.0, tempMedSum = 0.0, tempEnvMax = 0.0, tempEnvMin = 0.0, tempEnvSum = 0.0, humidityMax = 0.0, humidityMin = 0.0, humiditySum = 0.0;
			int count = 0;
		   for(ReportDailyNode rn : reportDailyNodes){
				if(rn != null){					
					double tmMax = (rn.getTempMedMax() == null) ? 0 : rn.getTempMedMax();
					double tmMin = (rn.getTempMedMin() == null) ? 0 : rn.getTempMedMin();
					double teMax = (rn.getTempEnvMax() == null) ? 0 : rn.getTempEnvMax();
					double teMin = (rn.getTempEnvMin() == null) ? 0 : rn.getTempEnvMin();
					double huMax = (rn.getHumidityMax() == null) ? 0 : rn.getHumidityMax();
					double huMin = (rn.getHumidityMin() == null) ? 0 : rn.getHumidityMin();
					//最小值初始化
					if(count==0){
						tempMedMin = tmMin;
						tempEnvMin = teMin;
						humidityMin = huMin;
					}					
					if(tmMax > tempMedMax){
						tempMedMax = tmMax;
					}
					if(tmMin < tempMedMin){
						tempMedMin = tmMin;
					}
					if(teMax > tempEnvMax){
						tempEnvMax = teMax;
					}
					if(teMin < tempEnvMin){
						tempEnvMin = teMin;
					}
					if(huMax > humidityMax){
						humidityMax = huMax;
					}
					if(huMin < humidityMin){
						humidityMin = huMin;
					}
					tempMedSum += (rn.getTempMedAvg() == null) ? 0 : rn.getTempMedAvg();
					tempEnvSum += (rn.getTempEnvAvg() == null) ? 0 : rn.getTempEnvAvg();
					humiditySum += (rn.getHumidityAvg() == null) ? 0 : rn.getHumidityAvg();
					
					if(rn.getSmogAlert() == 0){
						reportMonthNode.setSmogAlert(0);
					}
					if(rn.getStatus() == 0){
						reportMonthNode.setStatus(0);
					}
					if(rn.getAlert() != 0){
						reportMonthNode.setAlert(rn.getAlert());
					}
					
					//如果是最后一条记录
					if(count == reportDailyNodes.size()-1){
						reportMonthNode.setNodeNo(rn.getNodeNo());						
						reportMonthNode.setBatteryVol(rn.getBatteryVol());
						reportMonthNode.setWirelessSig(rn.getWirelessSig());												
					}					
					count ++;
				}
		   }		   
		   reportMonthNode.setTempMedMax(tempMedMax);
		   reportMonthNode.setTempMedMin(tempMedMin);
		   reportMonthNode.setTempMedAvg((tempMedSum==0) ? 0.0 : Double.parseDouble(df.format(tempMedSum/count)));
		   reportMonthNode.setTempEnvMax(tempEnvMax);
		   reportMonthNode.setTempEnvMin(tempEnvMin);
		   reportMonthNode.setTempEnvAvg((tempEnvSum==0) ? 0.0 : Double.parseDouble(df.format(tempEnvSum/count)));
		   reportMonthNode.setHumidityMax(humidityMax);
		   reportMonthNode.setHumidityMin(humidityMin);
		   reportMonthNode.setHumidityAvg((humiditySum==0) ? 0.0 :Double.parseDouble(df.format(humiditySum/count)));
		   reportMonthNode.setTempDevAbs(Double.parseDouble(df.format(Math.abs(reportMonthNode.getTempMedAvg()-reportMonthNode.getTempEnvAvg()))));
		   reportMonthNode.setMonthOfYear(month);
			
		   reportMonthNodes.add(reportMonthNode);	
		}
		return reportMonthNodes;
	}
    
	/**
	 * 区域月报
	 * @param areaName
	 * @param year
	 * @return
	 */
	public List<ReportMonthArea> areaMonthReport(String areaNo, String year) {
		List<ReportMonthArea> reportMonthAreas = new ArrayList<ReportMonthArea>();
	
        for(int i = 1 ; i<=12; i++){
			String month = null;
			if(i<10){
				month = year+"-0"+i;
			}else {
				month = year+"-"+i;
			}
			
			List<ReportDailyArea> reportDailyAreas = reportDailyAreaDAO.findAllByMonth(areaNo, month);
		    ReportMonthArea reportMonthArea = new ReportMonthArea();
		    reportMonthArea.setSmogAlert(1);
			reportMonthArea.setStatus(1);
			reportMonthArea.setAlert(0);
		    double tempMedMax = 0.0, tempMedMin = 0.0, tempMedSum = 0.0, tempEnvMax = 0.0, tempEnvMin = 0.0, tempEnvSum = 0.0, humidityMax = 0.0, humidityMin = 0.0, humiditySum = 0.0;
			int count = 0;
		   for(ReportDailyArea rn : reportDailyAreas){
				if(rn != null){
					double tmMax = (rn.getTempMedMax() == null) ? 0 : rn.getTempMedMax();
					double tmMin = (rn.getTempMedMin() == null) ? 0 : rn.getTempMedMin();
					double teMax = (rn.getTempEnvMax() == null) ? 0 : rn.getTempEnvMax();
					double teMin = (rn.getTempEnvMin() == null) ? 0 : rn.getTempEnvMin();
					double huMax = (rn.getHumidityMax() == null) ? 0 : rn.getHumidityMax();
					double huMin = (rn.getHumidityMin() == null) ? 0 : rn.getHumidityMin();
					//最小值初始化
					if(count==0){
						tempMedMin = tmMin;
						tempEnvMin = teMin;
						humidityMin = huMin;
					}				
					if(tmMax > tempMedMax){
						tempMedMax = tmMax;
					}
					if(tmMin < tempMedMin){
						tempMedMin = tmMin;
					}
					if(teMax > tempEnvMax){
						tempEnvMax = teMax;
					}
					if(teMin < tempEnvMin){
						tempEnvMin = teMin;
					}
					if(huMax > humidityMax){
						humidityMax = huMax;
					}
					if(huMin < humidityMin){
						humidityMin = huMin;
					}
					tempMedSum += (rn.getTempMedAvg() == null) ? 0 : rn.getTempMedAvg();
					tempEnvSum += (rn.getTempEnvAvg() == null) ? 0 : rn.getTempEnvAvg();
					humiditySum += (rn.getHumidityAvg() == null) ? 0 : rn.getHumidityAvg();
					
					if(rn.getSmogAlert() ==0) {
						reportMonthArea.setSmogAlert(0);
					}
					if(rn.getStatus() == 0){
						reportMonthArea.setStatus(0);
					}
					if(rn.getAlert() != 1){
						reportMonthArea.setAlert(rn.getAlert());
					}
					//如果是最后一条记录
					if(count == reportDailyAreas.size()-1){
						reportMonthArea.setAreaNo(rn.getAreaNo());
						reportMonthArea.setBatteryVol(rn.getBatteryVol());
						reportMonthArea.setWirelessSig(rn.getWirelessSig());
					}					
					count ++;
				}
		   }		   
		   reportMonthArea.setTempMedMax(tempMedMax);
		   reportMonthArea.setTempMedMin(tempMedMin);
		   reportMonthArea.setTempMedAvg((tempMedSum==0) ? 0.0 : Double.parseDouble(df.format(tempMedSum/count)));
		   reportMonthArea.setTempEnvMax(tempEnvMax);
		   reportMonthArea.setTempEnvMin(tempEnvMin);
		   reportMonthArea.setTempEnvAvg((tempEnvSum==0) ? 0.0 : Double.parseDouble(df.format(tempEnvSum/count)));
		   reportMonthArea.setHumidityMax(humidityMax);
		   reportMonthArea.setHumidityMin(humidityMin);
		   reportMonthArea.setHumidityAvg((humiditySum==0) ? 0.0 : Double.parseDouble(df.format(humiditySum/count)));
		   reportMonthArea.setTempDevAbs(Double.parseDouble(df.format(Math.abs(reportMonthArea.getTempMedAvg()-reportMonthArea.getTempEnvAvg()))));
		   reportMonthArea.setMonthOfYear(month);
			
		   reportMonthAreas.add(reportMonthArea);	
		}
		return reportMonthAreas;
	}
	
	public ReportDailyNodeDAO getReportDailyNodeDAO() {
		return reportDailyNodeDAO;
	}
    @Resource
	public void setReportDailyNodeDAO(ReportDailyNodeDAO reportDailyNodeDAO) {
		this.reportDailyNodeDAO = reportDailyNodeDAO;
	}
	public RegularDataDAO getRegularDataDAO() {
		return regularDataDAO;
	}
    @Resource
	public void setRegularDataDAO(RegularDataDAO regularDataDAO) {
		this.regularDataDAO = regularDataDAO;
	}
	public NodeInfoDAO getNodeInfoDAO() {
		return nodeInfoDAO;
	}
	@Resource
	public void setNodeInfoDAO(NodeInfoDAO nodeInfoDAO) {
		this.nodeInfoDAO = nodeInfoDAO;
	}

	public ReportDailyAreaDAO getReportDailyAreaDAO() {
		return reportDailyAreaDAO;
	}
	@Resource
	public void setReportDailyAreaDAO(ReportDailyAreaDAO reportDailyAreaDAO) {
		this.reportDailyAreaDAO = reportDailyAreaDAO;
	}
}
