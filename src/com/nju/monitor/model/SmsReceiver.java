package com.nju.monitor.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;


/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user", catalog = "monitor")
public class SmsReceiver implements java.io.Serializable {

	// Fields
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7120924753850162031L;
	/**
	 * 
	 */
	private Integer id;
	private String name;
	private String phone;
	private Integer active = 1;   //0：禁用， 1：激活
	private Integer flag;         //0：普通用户，1：一般管理员，2：超级管理员
	private Integer smsReceive;         //0：不接收，1：接收

	// Constructors

	/** default constructor */
	public SmsReceiver() {
	}

	/** minimal constructor */
	public SmsReceiver(String name,  String phone,
			Integer active, Integer flag, Integer smsReceive) {
		this.name = name;
		this.phone = phone;
		this.active = active;
		this.flag = flag;
		this.smsReceive = smsReceive;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "phone", length = 11)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "active", nullable = false)
	public Integer getActive() {
		return this.active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}
	
	@Column(name = "flag", nullable = false)
	public Integer getFlag() {
		return this.flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
	@Column(name = "smsReceive")
	public Integer getSmsReceive() {
		return smsReceive;
	}

	public void setSmsReceive(Integer smsReceive) {
		this.smsReceive = smsReceive;
	}
}