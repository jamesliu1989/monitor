package com.nju.monitor.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * AreaAlertInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "area_alert_info", catalog = "monitor")
public class AreaAlertInfo implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -7520579361870212547L;
	private Integer id;
	private String areaNo;
	private String nodeNo;
	private Integer alertProperty;
	private String alertType;
	private Double alertValue;
	private String alertMeasurement;
	private Timestamp alertTime;
	private String alertRemarks;
	private boolean isRead;
	private String type;   //报警映射类型， TYPE1， TYPE2，.....TYPE12

	// Constructors

	/** default constructor */
	public AreaAlertInfo() {
	}

	/** minimal constructor */
	public AreaAlertInfo(String areaNo, String nodeNo, Integer alertProperty,
			String alertType, Double alertValue, Timestamp alertTime) {
		this.areaNo = areaNo;
		this.nodeNo = nodeNo;
		this.alertProperty = alertProperty;
		this.alertType = alertType;
		this.alertValue = alertValue;
		this.alertTime = alertTime;
	}

	/** full constructor */
	public AreaAlertInfo(String areaNo, String nodeNo, Integer alertProperty,
			String alertType, Double alertValue, String alertMeasurement,
			Timestamp alertTime, String alertRemarks) {
		this.areaNo = areaNo;
		this.nodeNo = nodeNo;
		this.alertProperty = alertProperty;
		this.alertType = alertType;
		this.alertValue = alertValue;
		this.alertMeasurement = alertMeasurement;
		this.alertTime = alertTime;
		this.alertRemarks = alertRemarks;
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

	@Column(name = "AREA_NO", nullable = false, length = 20)
	public String getAreaNo() {
		return this.areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	@Column(name = "NODE_NO", nullable = false, length = 20)
	public String getNodeNo() {
		return this.nodeNo;
	}

	public void setNodeNo(String nodeNo) {
		this.nodeNo = nodeNo;
	}

	@Column(name = "ALERT_PROPERTY", nullable = false)
	public Integer getAlertProperty() {
		return this.alertProperty;
	}

	public void setAlertProperty(Integer alertProperty) {
		this.alertProperty = alertProperty;
	}

	@Column(name = "ALERT_TYPE", nullable = false, length = 20)
	public String getAlertType() {
		return this.alertType;
	}

	public void setAlertType(String alertType) {
		this.alertType = alertType;
	}

	@Column(name = "ALERT_VALUE", nullable = false, precision = 22, scale = 0)
	public Double getAlertValue() {
		return this.alertValue;
	}

	public void setAlertValue(Double alertValue) {
		this.alertValue = alertValue;
	}

	@Column(name = "ALERT_MEASUREMENT", length = 20)
	public String getAlertMeasurement() {
		return this.alertMeasurement;
	}

	public void setAlertMeasurement(String alertMeasurement) {
		this.alertMeasurement = alertMeasurement;
	}

	@Column(name = "ALERT_TIME", nullable = false, length = 19)
	public Timestamp getAlertTime() {
		return this.alertTime;
	}

	public void setAlertTime(Timestamp alertTime) {
		this.alertTime = alertTime;
	}

	@Column(name = "ALERT_REMARKS", length = 20)
	public String getAlertRemarks() {
		return this.alertRemarks;
	}

	public void setAlertRemarks(String alertRemarks) {
		this.alertRemarks = alertRemarks;
	}
	@Column(name = "IS_READ")
	public boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(boolean isRead) {
		this.isRead = isRead;
	}

	@Column(name = "TYPE")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}