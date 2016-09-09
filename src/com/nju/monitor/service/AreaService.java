package com.nju.monitor.service;

import com.nju.monitor.daoImpl.*;
import com.nju.monitor.model.*;
import com.nju.monitor.util.Variables;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class AreaService {
    private RegularDataDAO regularDataDAO;
    private AreaInfoDAO areaInfoDAO;
    private NodeInfoDAO nodeInfoDAO;
    private CtrlerInfoDAO ctrlerInfoDAO;
    private SystemDAO systemDAO;
    private ReportDailyNodeDAO reportDailyNodeDAO;
    private ReportDailyAreaDAO reportDailyAreaDAO;
    private AreaAlertInfoDAO alertInfoDAO;


    public List getName(int ctrlerNo) {
        return areaInfoDAO.getNameAndNo(ctrlerNo);
    }

    public AreaInfo getAreaByCtrlerNoAndNo(int ctrlerNo, String areaNo) {
        return areaInfoDAO.findByCtrlerNoAreaNo(ctrlerNo, areaNo);
    }

    public int updateName(int id, String areaName) {
        return areaInfoDAO.updateNameById(id, areaName);
    }

    public void update(AreaInfo areaInfo) {
        areaInfoDAO.attachDirty(areaInfo);
    }

    public int delete(int id) {
        AreaInfo areaInfo = areaInfoDAO.findById(id);
        if(areaInfo != null){
            if(areaInfo.getAreaName().equals("未分区域")){
                return -1;
            }
            String newAreaNo = "C" + areaInfo.getCtrlerNo()+ "-未分区域";
            nodeInfoDAO.updateAreaNo(areaInfo.getAreaNo(), newAreaNo);
        }
        return areaInfoDAO.deleteById(id);
    }

    public long getAreaNum(int ctrlerNo) {
        return areaInfoDAO.findAreaNum(ctrlerNo);
    }

    public int add(AreaInfo areaInfo) {
        return areaInfoDAO.save(areaInfo);
    }

    //获取区域节点总数
    public long getNodeNum(String areaNo) {
        return nodeInfoDAO.findNodeNum(areaNo);
    }

    //获取区域活动节点总数
    public long getActiveNodeNum(String areaNo) {
        return nodeInfoDAO.findActiveNodeNum(areaNo);
    }

    public List findAll(int ctrlerNo) {
        List<AreaInfo> areaInfos = null;
        if (ctrlerNo == -1) {
            areaInfos = areaInfoDAO.findAll();
        } else {
            areaInfos = areaInfoDAO.findAllByCtrlerNo(ctrlerNo);
        }

        for (AreaInfo area : areaInfos) {
            area.setNodeNum(nodeInfoDAO.findNodeNum(area.getAreaNo()));
            area.setActiveNodeNum(nodeInfoDAO.findActiveNodeNum(area.getAreaNo()));
        }
        return areaInfos;
    }

    public List findAllCtrlerNo() {
        return ctrlerInfoDAO.findAllNo();
    }

    public List findAllCtrler() {
        return ctrlerInfoDAO.findAll();
    }

    public int addCtrler(CtrlerInfo ctrlerInfo) {
        return ctrlerInfoDAO.save(ctrlerInfo);
    }

    public int updateCtrlerDesc(int ctrlerNo, String ctrlerDesc, Integer status) {
        return ctrlerInfoDAO.updateCtrlerDesc(ctrlerNo, ctrlerDesc, status);
    }

    public int deleteCtrler(int ctrlerNo) {
        //删除常规数据
        int r1 = regularDataDAO.deleteByCtrlerNo(ctrlerNo);
        //删除节点日报
        int r2 = reportDailyNodeDAO.deleteNodeReportByCtrlerNo(ctrlerNo);
        //删除节点信息
        int r3 = nodeInfoDAO.deleteByCtrlerNo(ctrlerNo);

        //删除区域报警参数
        int r4 = alertInfoDAO.deleteAlertParaByCtrlerNo(ctrlerNo);
        //删除区域报警信息
        int r5 = alertInfoDAO.deleteAlertInfoByCtrlerNo(ctrlerNo);
        //删除区域日报
        int r6 = reportDailyAreaDAO.deleteAreaReportByCtrlerNo(ctrlerNo);
        //删除区域信息
        int r7 = areaInfoDAO.deleteByCtrlerNo(ctrlerNo);

        //删除控制器信息
        int r8 = ctrlerInfoDAO.deleteCtrler(ctrlerNo);
        return r8;
    }

    public List<Object> areasView(int ctrlerNo) {
        DecimalFormat df = new DecimalFormat("#####0.0");
        List<Object> resultList = new ArrayList<Object>();

        //获取系统采集周期
        double collectCycle = systemDAO.findOne().getCollectCycle();
        //获取所有区域号[0]与名称[1]
        List<Object[]> areaList = areaInfoDAO.getNameAndNo(ctrlerNo);
        for (Object[] area : areaList) {
            Map<String, Object> areaMap = new HashMap<String, Object>();
            areaMap.put("areaName", area[1]);
            areaMap.put("nodeNum", nodeInfoDAO.findNodeNum((String) area[0]));
            areaMap.put("activeNodeNum", nodeInfoDAO.findActiveNodeNum((String) area[0]));

            double tempMedMax = 0.0, tempMedMin = 0.0, tempMedSum = 0.0, tempEnvMax = 0.0, tempEnvMin = 0.0, tempEnvSum = 0.0;
            double humidityMax = 0.0, humidityMin = 0.0, humiditySum = 0.0;
            double deltaMedMax = 0.0, deltaMedMin = 0.0, deltaMedSum = 0.0, deltaEnvMax = 0.0, deltaEnvMin = 0.0, deltaEnvSum = 0.0;
            double tempDevMax = 0.0, tempDevMin = 0.0, tempDevSum = 0.0;
            int count = 0, tmCount = 0, teCount = 0, huCount = 0, tmpDevCount = 0; //use for error data condition;
            int alert = 1;   //0：烟雾报警 1：无烟雾报警
            //拿到各个区域里面最新的实时数据
            List<NodeInfo> nodeInfos = nodeInfoDAO.findByAreaNo(area[0]);
            for (NodeInfo node : nodeInfos) {
                List<RegularData> dataList = regularDataDAO.findLatest2ByNodeNo(node.getNodeNo());
                if (dataList != null && dataList.size() == 2) {
                    RegularData newData = dataList.get(0);
                    RegularData oldData = dataList.get(1);
                    count++;
                    double tm = (newData.getTempMed() == null) ? 0 : newData.getTempMed();
                    double te = (newData.getTempEnv() == null) ? 0 : newData.getTempEnv();
                    double hu = (newData.getHumidity() == null) ? 0 : newData.getHumidity();

                    double dtm = 0.0 , dte = 0.0;
                    if(tm != Variables.ERROR_TMP && oldData.getTempMed() != Variables.ERROR_TMP) {
                        dtm = tm - oldData.getTempMed();
                    }
                    if(te != Variables.ERROR_TMP && oldData.getTempEnv() != Variables.ERROR_TMP) {
                        dte = te - oldData.getTempEnv();
                    }

                    if (tm != Variables.ERROR_TMP) {
                        // 最小值初始化
                        if (count == 0) {
                            tempMedMin = tm;
                            deltaMedMin = dtm;
                        }
                        if (tm > tempMedMax) {
                            tempMedMax = tm;
                        }
                        if (tm < tempMedMin) {
                            tempMedMin = tm;
                        }
                        if (dtm > deltaMedMax) {
                            deltaMedMax = dtm;
                        }
                        if (dtm < deltaMedMin) {
                            deltaMedMin = dtm;
                        }
                        tempMedSum += tm;
                        deltaMedSum += dtm;
                    } else {
                        tmCount--;
                    }

                    if (te != Variables.ERROR_TMP) {
                        if (count == 0) {
                            tempEnvMin = te;
                            deltaEnvMin = dte;
                        }
                        if (te > tempEnvMax) {
                            tempEnvMax = te;
                        }
                        if (te < tempEnvMin) {
                            tempEnvMin = te;
                        }
                        if (dte > deltaEnvMax) {
                            deltaEnvMax = dte;
                        }
                        if (dte < deltaEnvMin) {
                            deltaEnvMin = dte;
                        }
                        tempEnvSum += te;
                        deltaEnvSum += dte;
                    } else {
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

                    if (tm != Variables.ERROR_TMP && te != Variables.ERROR_TMP) {
                        double tmpDev = tm - te;
                        if(tmpDev > tempDevMax){
                            tempDevMax = tmpDev;
                        }
                        if(tmpDev < tempDevMin){
                            tempDevMin = tmpDev;
                        }
                        tempDevSum += tmpDev;
                    }else{
                        tmpDevCount--;
                    }

                    newData.setStatus(node.getStatus());
                    if(newData.getSmogAlert() == 0){
                        alert = 0;
                    }

                }
            }
            areaMap.put("tempMedMax", tempMedMax);
            areaMap.put("tempMedMin", tempMedMin);
            double tempMedAvg = ((tempMedSum == 0) ? 0.0 : tempMedSum / (count + tmCount));
            areaMap.put("tempMedAvg", df.format(tempMedAvg));

            //介质温升
            areaMap.put("deltaMedMax", df.format(deltaMedMax));
            areaMap.put("deltaMedMin", df.format(deltaMedMin));
            double deltaMedAvg = ((deltaMedSum == 0) ? 0.0 : deltaMedSum / (count + tmCount));
            areaMap.put("deltaMedAvg", df.format(deltaMedAvg));
            double deltaMedRate = deltaMedAvg / collectCycle;
            areaMap.put("deltaMedRate", df.format(deltaMedRate));

            areaMap.put("tempEnvMax", tempEnvMax);
            areaMap.put("tempEnvMin", tempEnvMin);
            double tempEnvAvg = ((tempEnvSum == 0) ? 0.0 : tempEnvSum / (count + teCount));
            areaMap.put("tempEnvAvg", df.format(tempEnvAvg));

            //环境温升
            areaMap.put("deltaEnvMax", df.format(deltaEnvMax));
            areaMap.put("deltaEnvMin", df.format(deltaEnvMin));
            double deltaEnvAvg = ((deltaEnvSum == 0) ? 0.0 : deltaEnvSum / (count + teCount));
            areaMap.put("deltaEnvAvg", df.format(deltaEnvAvg));
            double deltaEnvRate = deltaEnvAvg / collectCycle;
            areaMap.put("deltaEnvRate", df.format(deltaEnvRate));

            //湿度
            areaMap.put("humidityMax", humidityMax);
            areaMap.put("humidityMin", humidityMin);
            double humidityAvg = ((humiditySum == 0) ? 0.0 : humiditySum / (count + huCount));
            areaMap.put("humidityAvg", df.format(humidityAvg));

            //节点
            areaMap.put("tempDevMax", df.format(Math.abs(tempDevMax)));
            areaMap.put("tempDevMin", df.format(Math.abs(tempDevMin)));
            areaMap.put("tempDevAvg", df.format(Math.abs(((tempDevSum == 0) ? 0.0 : tempDevSum / (count + tmpDevCount)))));

            areaMap.put("alert", alert);
            resultList.add(areaMap);
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

    public SystemDAO getSystemDAO() {
        return systemDAO;
    }

    @Resource
    public void setSystemDAO(SystemDAO systemDAO) {
        this.systemDAO = systemDAO;
    }

    @Resource
    public void setReportDailyNodeDAO(ReportDailyNodeDAO reportDailyNodeDAO) {
        this.reportDailyNodeDAO = reportDailyNodeDAO;
    }

    @Resource
    public void setReportDailyAreaDAO(ReportDailyAreaDAO reportDailyAreaDAO) {
        this.reportDailyAreaDAO = reportDailyAreaDAO;
    }

    @Resource
    public void setAlertInfoDAO(AreaAlertInfoDAO alertInfoDAO) {
        this.alertInfoDAO = alertInfoDAO;
    }
}
