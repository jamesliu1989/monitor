package com.nju.monitor.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Transient;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * AreaInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "area_info", catalog = "monitor")
public class AreaInfo implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -4852219054132117385L;
	private Integer id;
	private String areaNo;
	private String areaName;
	private long nodeNum = 0;
	private long ActiveNodeNum = 0;   //活动节点数
	private Integer ctrlerNo;
	private String areaDesc;
	private Integer alert = 0;  //区域报警。0：无报警，1：温度报警，2：温差报警，3：烟雾报警
	// Constructors

	/** default constructor */
	public AreaInfo() {
	}

	/** minimal constructor */
	public AreaInfo(String areaName, Integer nodeNum) {
		this.areaName = areaName;
		this.nodeNum = nodeNum;
	}

	/** full constructor */
	public AreaInfo(String areaNo, String areaName, Integer ctrlerNo,String areaDesc) {
		this.areaNo = areaNo;
		this.areaName = areaName;
		this.ctrlerNo = ctrlerNo;
		this.areaDesc = areaDesc;
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
		return areaNo;
	}
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	@Column(name = "AREA_NAME", nullable = false, length = 32)
	public String getAreaName() {
		return this.areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	@Column(name = "CTRLER_NO", nullable = false)
	public Integer getCtrlerNo() {
		return this.ctrlerNo;
	}

	public void setCtrlerNo(Integer ctrlerNo) {
		this.ctrlerNo = ctrlerNo;
	}
	
	@Column(name = "AREA_DESC")
	public String getAreaDesc() {
		return areaDesc;
	}

	public void setAreaDesc(String areaDesc) {
		this.areaDesc = areaDesc;
	}
	
	@Column(name = "ALERT")
	public Integer getAlert() {
		return this.alert;
	}

	public void setAlert(Integer alert) {
		this.alert = alert;
	}
	
	@Transient
	public long getNodeNum() {
		return this.nodeNum;
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