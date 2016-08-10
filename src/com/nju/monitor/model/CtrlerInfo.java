package com.nju.monitor.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * CtrlerInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ctrler_info", catalog = "monitor")
public class CtrlerInfo implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 4355244407169846324L;
	private Integer id;
	private Integer ctrlerNo;
	private Integer nodeNum;
	private String ctrlerDesc = "";
	private Integer status;

	// Constructors

	/** default constructor */
	public CtrlerInfo() {
	}

	/** full constructor */
	public CtrlerInfo(Integer ctrlerNo, Integer nodeNum, String ctrlerDesc, Integer status) {
		this.ctrlerNo = ctrlerNo;
		this.nodeNum = nodeNum;
		this.ctrlerDesc = ctrlerDesc;
        this.status = status;
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

	@Column(name = "NODE_NUM", nullable = false)
	public Integer getNodeNum() {
		return this.nodeNum;
	}

	public void setNodeNum(Integer nodeNum) {
		this.nodeNum = nodeNum;
	}
	@Column(name = "CTRLER_DESC")
	public String getCtrlerDesc() {
		return ctrlerDesc;
	}

	public void setCtrlerDesc(String ctrlerDesc) {
		this.ctrlerDesc = ctrlerDesc;
	}

    @Column(name = "STATUS")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}