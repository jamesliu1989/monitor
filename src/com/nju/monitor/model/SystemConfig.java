package com.nju.monitor.model;

import com.sun.org.apache.xpath.internal.operations.Bool;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * System entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system", catalog = "monitor")
public class SystemConfig implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -8296827774683138381L;
	private Integer id = 1;
	private String comPort;
	private String baudRate;
	private Double collectCycle;
	private String smsComPort;
	private String smsBaudRate;
	private Boolean smsAlert;


	// Constructors

	/** default constructor */
	public SystemConfig() {
	}

	/** full constructor */
	public SystemConfig(String comPort, String baudRate, Double collectCycle) {
		this.comPort = comPort;
		this.baudRate = baudRate;
		this.collectCycle = collectCycle;
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

	@Column(name = "COM_PORT", nullable = false, length = 20)
	public String getComPort() {
		return this.comPort;
	}

	public void setComPort(String comPort) {
		this.comPort = comPort;
	}

	@Column(name = "BAUD_RATE", nullable = false, length = 20)
	public String getBaudRate() {
		return this.baudRate;
	}

	public void setBaudRate(String baudRate) {
		this.baudRate = baudRate;
	}

	@Column(name = "COLLECT_CYCLE", nullable = false, precision = 22, scale = 0)
	public Double getCollectCycle() {
		return this.collectCycle;
	}

	public void setCollectCycle(Double collectCycle) {
		this.collectCycle = collectCycle;
	}
	
	@Column(name = "SMS_COM_PORT")
	public String getSmsComPort() {
		return smsComPort;
	}

	public void setSmsComPort(String smsComPort) {
		this.smsComPort = smsComPort;
	}
	
	@Column(name = "SMS_BAUD_RATE")
	public String getSmsBaudRate() {
		return smsBaudRate;
	}
	
	public void setSmsBaudRate(String smsBaudRate) {
		this.smsBaudRate = smsBaudRate;
	}

	@Column(name = "SMS_ALERT")
	public Boolean getSmsAlert() {
		return smsAlert;
	}

	public void setSmsAlert(Boolean smsAlert) {
		this.smsAlert = smsAlert;
	}
}