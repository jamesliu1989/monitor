package com.nju.monitor.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SmsHistory entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sms_history", catalog = "monitor")
public class SmsHistory implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String smsReceiver;
	private String smsRecvPhone;
	private String smsContent;
	private Timestamp smsSendTime;

	// Constructors

	/** default constructor */
	public SmsHistory() {
	}

	/** minimal constructor */
	public SmsHistory(String smsReceiver, String smsRecvPhone,
			Timestamp smsSendTime) {
		this.smsReceiver = smsReceiver;
		this.smsRecvPhone = smsRecvPhone;
		this.smsSendTime = smsSendTime;
	}

	/** full constructor */
	public SmsHistory(String smsReceiver, String smsRecvPhone,
			String smsContent, Timestamp smsSendTime) {
		this.smsReceiver = smsReceiver;
		this.smsRecvPhone = smsRecvPhone;
		this.smsContent = smsContent;
		this.smsSendTime = smsSendTime;
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

	@Column(name = "SMS_RECEIVER", nullable = false, length = 20)
	public String getSmsReceiver() {
		return this.smsReceiver;
	}

	public void setSmsReceiver(String smsReceiver) {
		this.smsReceiver = smsReceiver;
	}

	@Column(name = "SMS_RECV_PHONE", nullable = false, length = 20)
	public String getSmsRecvPhone() {
		return this.smsRecvPhone;
	}

	public void setSmsRecvPhone(String smsRecvPhone) {
		this.smsRecvPhone = smsRecvPhone;
	}

	@Column(name = "SMS_CONTENT", length = 150)
	public String getSmsContent() {
		return this.smsContent;
	}

	public void setSmsContent(String smsContent) {
		this.smsContent = smsContent;
	}

	@Column(name = "SMS_SEND_TIME", nullable = false, length = 19)
	public Timestamp getSmsSendTime() {
		return this.smsSendTime;
	}

	public void setSmsSendTime(Timestamp smsSendTime) {
		this.smsSendTime = smsSendTime;
	}

}