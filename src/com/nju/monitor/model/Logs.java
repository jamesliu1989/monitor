package com.nju.monitor.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Logs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "logs", catalog = "lam")
public class Logs implements java.io.Serializable {

	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4630690407222297625L;
	private Integer id;
	private String userName;
	private Timestamp logDate;
	private String logContent;

	// Constructors

	/** default constructor */
	public Logs() {
	}

	/** full constructor */
	public Logs(String userName, Timestamp logDate, String logContent) {
		this.userName = userName;
		this.logDate = logDate;
		this.logContent = logContent;
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

	@Column(name = "userName", nullable = false, length = 32)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	@Column(name = "logDate", nullable = false)
	public Timestamp getLogDate() {
		return this.logDate;
	}

	public void setLogDate(Timestamp logDate) {
		this.logDate = logDate;
	}

	@Column(name = "logContent", nullable = false, length = 50)
	public String getLogContent() {
		return this.logContent;
	}

	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}

}