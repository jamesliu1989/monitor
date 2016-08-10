package com.nju.monitor.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Transient;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * NodeInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "node_info", catalog = "monitor")
public class NodeInfo implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -2272196144945513995L;
	private Integer id;
	private String nodeNo;
	private String nodeName;
	private Integer ctrlerNo;
	private String areaNo;
	private String areaName;
	private String areaDesc;
	private String nodeDesc = "";
	private Integer status = 0;
	private Integer alert = 0;  //区域报警：0：无报警，1：温度报警，2：温差报警，3：烟雾报警

	// Constructors

	/** default constructor */
	public NodeInfo() {
	}

	/** minimal constructor */
	public NodeInfo(String nodeNo, String nodeName, String areaNo,
			Integer ctrlerNo) {
		this.nodeNo = nodeNo;
		this.nodeName = nodeName;
		this.areaNo = areaNo;
		this.ctrlerNo = ctrlerNo;
	}

	/** full constructor */
	public NodeInfo(String nodeNo, String nodeName, String areaNo,
			Integer ctrlerNo, String nodeDesc) {
		this.nodeNo = nodeNo;
		this.nodeName = nodeName;
		this.areaNo = areaNo;
		this.ctrlerNo = ctrlerNo;
		this.nodeDesc = nodeDesc;
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

	@Column(name = "NODE_NO", nullable = false, length = 20)
	public String getNodeNo() {
		return this.nodeNo;
	}

	public void setNodeNo(String nodeNo) {
		this.nodeNo = nodeNo;
	}

	@Column(name = "NODE_NAME", nullable = false, length = 32)
	public String getNodeName() {
		return this.nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	@Column(name = "AREA_NO", nullable = false, length = 20)
	public String getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	@Column(name = "CTRLER_NO", nullable = false)
	public Integer getCtrlerNo() {
		return this.ctrlerNo;
	}

	public void setCtrlerNo(Integer ctrlerNo) {
		this.ctrlerNo = ctrlerNo;
	}

	@Column(name = "NODE_DESC", length = 100)
	public String getNodeDesc() {
		return this.nodeDesc;
	}

	public void setNodeDesc(String nodeDesc) {
		this.nodeDesc = nodeDesc;
	}

	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	@Column(name = "ALERT")
	public Integer getAlert() {
		return alert;
	}

	public void setAlert(Integer alert) {
		this.alert = alert;
	}
    @Transient
	public String getAreaDesc() {
		return areaDesc;
	}

	public void setAreaDesc(String areaDesc) {
		this.areaDesc = areaDesc;
	}
	 @Transient
	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	

}