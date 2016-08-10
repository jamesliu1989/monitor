package com.nju.monitor.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Transient;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * RegularData entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "regular_data", catalog = "monitor")
public class RegularData implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 5067343976451320551L;
	private Integer id;
	private Integer ctrlerNo;
	private String nodeNo;
	private Double tempMed;
	private Double tempEnv;
	private Double humidity;
	private Integer smogAlert;
	private Double batteryVol;
	private Integer wirelessSig;
	private Timestamp collectTime;
	
	//区域描述，非数据库字段，用于节点一览显示
	private String nodeDesc;
	
	//非db字段
	private Integer status;

	// Constructors

	/** default constructor */
	public RegularData() {
	}

	/** minimal constructor */
	public RegularData(Integer ctrlerNo, String nodeNo, Timestamp collectTime) {
		this.ctrlerNo = ctrlerNo;
		this.nodeNo = nodeNo;
		this.collectTime = collectTime;
	}

	/** full constructor */
	public RegularData(Integer ctrlerNo, String nodeNo, Double tempMed,
			Double tempEnv, Double humidity, Integer smogAlert, Double batteryVol,
			Integer wirelessSig, Timestamp collectTime) {
		this.ctrlerNo = ctrlerNo;
		this.nodeNo = nodeNo;
		this.tempMed = tempMed;
		this.tempEnv = tempEnv;
		this.humidity = humidity;
		this.smogAlert = smogAlert;
		this.batteryVol = batteryVol;
		this.wirelessSig = wirelessSig;
		this.collectTime = collectTime;
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

	@Column(name = "CTRLER_NO", nullable = false)
	public Integer getCtrlerNo() {
		return this.ctrlerNo;
	}

	public void setCtrlerNo(Integer ctrlerNo) {
		this.ctrlerNo = ctrlerNo;
	}

	@Column(name = "NODE_NO", nullable = false)
	public String getNodeNo() {
		return this.nodeNo;
	}

	public void setNodeNo(String nodeNo) {
		this.nodeNo = nodeNo;
	}

	@Column(name = "TEMP_MED", precision = 22, scale = 0)
	public Double getTempMed() {
		return this.tempMed;
	}

	public void setTempMed(Double tempMed) {
		this.tempMed = tempMed;
	}

	@Column(name = "TEMP_ENV", precision = 22, scale = 0)
	public Double getTempEnv() {
		return this.tempEnv;
	}

	public void setTempEnv(Double tempEnv) {
		this.tempEnv = tempEnv;
	}
	
	@Column(name = "HUMIDITY", precision = 22, scale = 0)
	public Double getHumidity() {
		return humidity;
	}

	public void setHumidity(Double humidity) {
		this.humidity = humidity;
	}

	@Column(name = "SMOG_ALERT")
	public Integer getSmogAlert() {
		return this.smogAlert;
	}

	public void setSmogAlert(Integer smogAlert) {
		this.smogAlert = smogAlert;
	}

	@Column(name = "BATTERY_VOL", precision = 22, scale = 0)
	public Double getBatteryVol() {
		return this.batteryVol;
	}

	public void setBatteryVol(Double batteryVol) {
		this.batteryVol = batteryVol;
	}

	@Column(name = "WIRELESS_SIG")
	public Integer getWirelessSig() {
		return this.wirelessSig;
	}

	public void setWirelessSig(Integer wirelessSig) {
		this.wirelessSig = wirelessSig;
	}

	@Column(name = "COLLECT_TIME", nullable = false, length = 19)
	public Timestamp getCollectTime() {
		return this.collectTime;
	}

	public void setCollectTime(Timestamp collectTime) {
		this.collectTime = collectTime;
	}
	@Transient
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	@Transient
	public String getNodeDesc() {
		return nodeDesc;
	}

	public void setNodeDesc(String nodeDesc) {
		this.nodeDesc = nodeDesc;
	}
	
	

}