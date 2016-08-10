package com.nju.monitor.model;

import java.sql.Timestamp;
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
public class User implements java.io.Serializable {

	// Fields
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5879355550874149944L;
	/**
	 * 
	 */
	private Integer id;
	private String userName;
	private String passWord;
	private String name;
	private String email;
	private String phone;
	private Integer active = 1;   //0：禁用， 1：激活
	private Timestamp regDate;
	private Integer flag;         //0：普通用户，1：一般管理员，2：超级管理员
	private Integer smsReceive = 0;         //0：不接收，1：接收

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String passWord, String name, String email, String phone,
			Integer active, Timestamp regDate, Integer flag, Integer smsReceive) {
		this.userName = userName;
		this.passWord = passWord;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.active = active;
		this.regDate = regDate;
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

	@Column(name = "userName", updatable = false, nullable = false, length = 32)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "passWord", nullable = false, length = 32)
	public String getPassWord() {
		return this.passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
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
	
	@Column(name = "regDate", nullable = false)
	public Timestamp getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
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