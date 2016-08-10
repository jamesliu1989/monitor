package com.nju.monitor.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * AreaAlertParameter entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "area_alert_parameter", catalog = "monitor")
public class AreaAlertParameter implements java.io.Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 7561491039025725976L;
	

	// Fields
	private Integer id;
	private String areaNo;
	private long nodeNum;
	private long ActiveNodeNum = 0;   //活动节点数
	private Double tempMedMax = 0.0;
	private Double tempMedRate = 0.0;
	private Double tempMedDevAbs = 0.0;
	private Double tempEnvMax = 0.0;
	private Double tempEnvRate = 0.0;
	private Double tempEnvDevAbs = 0.0;
	private Double humidityMax = 0.0;
	private Double tempDevAbs = 0.0;
	private Double tempAvgDevAbs = 0.0;
	private Double minBatteryVol = 0.0;
	private Double minWirelessSig = 0.0;
	private Integer type;

	// Constructors

	/** default constructor */
	public AreaAlertParameter() {
	}

	/** minimal constructor */
	public AreaAlertParameter(String areaNo, Integer type) {
		this.areaNo = areaNo;
		this.type = type;
	}

	/** full constructor */
	public AreaAlertParameter(String areaNo, Double tempMedMax,
			Double tempMedRate, Double tempMedDevAbs, Double tempEnvMax,
			Double tempEnvRate, Double tempEnvDevAbs, Double tempDevAbs,
			Double tempAvgDevAbs, Double minBatteryVol, Double minWirelessSig, Integer type) {
		this.areaNo = areaNo;
		this.tempMedMax = tempMedMax;
		this.tempMedRate = tempMedRate;
		this.tempMedDevAbs = tempMedDevAbs;
		this.tempEnvMax = tempEnvMax;
		this.tempEnvRate = tempEnvRate;
		this.tempEnvDevAbs = tempEnvDevAbs;
		this.tempDevAbs = tempDevAbs;
		this.tempAvgDevAbs = tempAvgDevAbs;
		this.minBatteryVol = minBatteryVol;
		this.minWirelessSig = minWirelessSig;
		this.type = type;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}	

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "AREA_NO", updatable = false, unique = true, nullable = false, length = 20)
	public String getAreaNo() {
		return this.areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	@Column(name = "TEMP_MED_MAX", precision = 22, scale = 0)
	public Double getTempMedMax() {
		return this.tempMedMax;
	}

	public void setTempMedMax(Double tempMedMax) {
		this.tempMedMax = tempMedMax;
	}

	@Column(name = "TEMP_MED_RATE", precision = 22, scale = 0)
	public Double getTempMedRate() {
		return this.tempMedRate;
	}

	public void setTempMedRate(Double tempMedRate) {
		this.tempMedRate = tempMedRate;
	}

	@Column(name = "TEMP_MED_DEV_ABS", precision = 22, scale = 0)
	public Double getTempMedDevAbs() {
		return this.tempMedDevAbs;
	}

	public void setTempMedDevAbs(Double tempMedDevAbs) {
		this.tempMedDevAbs = tempMedDevAbs;
	}

	@Column(name = "TEMP_ENV_MAX", precision = 22, scale = 0)
	public Double getTempEnvMax() {
		return this.tempEnvMax;
	}

	public void setTempEnvMax(Double tempEnvMax) {
		this.tempEnvMax = tempEnvMax;
	}

	@Column(name = "TEMP_ENV_RATE", precision = 22, scale = 0)
	public Double getTempEnvRate() {
		return this.tempEnvRate;
	}

	public void setTempEnvRate(Double tempEnvRate) {
		this.tempEnvRate = tempEnvRate;
	}

	@Column(name = "TEMP_ENV_DEV_ABS", precision = 22, scale = 0)
	public Double getTempEnvDevAbs() {
		return this.tempEnvDevAbs;
	}

	public void setTempEnvDevAbs(Double tempEnvDevAbs) {
		this.tempEnvDevAbs = tempEnvDevAbs;
	}

	@Column(name = "TEMP_DEV_ABS", precision = 22, scale = 0)
	public Double getTempDevAbs() {
		return this.tempDevAbs;
	}

	public void setTempDevAbs(Double tempDevAbs) {
		this.tempDevAbs = tempDevAbs;
	}

	@Column(name = "TEMP_AVG_DEV_ABS", precision = 22, scale = 0)
	public Double getTempAvgDevAbs() {
		return this.tempAvgDevAbs;
	}

	public void setTempAvgDevAbs(Double tempAvgDevAbs) {
		this.tempAvgDevAbs = tempAvgDevAbs;
	}
	@Column(name = "HUMIDITY_MAX", precision = 22, scale = 0)
	public Double getHumidityMax() {
		return humidityMax;
	}

	public void setHumidityMax(Double humidityMax) {
		this.humidityMax = humidityMax;
	}
	@Column(name = "MIN_BATTERY_VOL", precision = 22, scale = 0)
	public Double getMinBatteryVol() {
		return this.minBatteryVol;
	}

	public void setMinBatteryVol(Double minBatteryVol) {
		this.minBatteryVol = minBatteryVol;
	}
	@Column(name = "MIN_WIRELESS_SIG", precision = 22, scale = 0)
	public Double getMinWirelessSig() {
		return minWirelessSig;
	}

	public void setMinWirelessSig(Double minWirelessSig) {
		this.minWirelessSig = minWirelessSig;
	}

	@Column(name = "TYPE", updatable = false)
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	@Transient
	public long getNodeNum() {
		return nodeNum;
	}

	public void setNodeNum(long nodeNum) {
		this.nodeNum = nodeNum;
	}
	@Transient
	public long getActiveNodeNum() {
		return ActiveNodeNum;
	}

	public void setActiveNodeNum(long activeNodeNum) {
		ActiveNodeNum = activeNodeNum;
	}
		

}