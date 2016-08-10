package com.nju.monitor.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ReportDailyNode entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "report_daily_area", catalog = "monitor")
public class ReportMonthArea implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -4420759212098297540L;
	private Integer id;
	private String areaNo;
	private Double tempMedMax;
	private Double tempMedMin;
	private Double tempMedAvg;
	private Double tempEnvMax;
	private Double tempEnvMin;
	private Double tempEnvAvg;
	private Double tempDevAbs;
	private Double humidityMax;
	private Double humidityMin;
	private Double humidityAvg;
	private Integer smogAlert;
	private Double batteryVol;
	private Integer wirelessSig;
	private Integer status;
	private Integer alert;
	private String monthOfYear;

	// Constructors

	/** default constructor */
	public ReportMonthArea() {
	}

	/** minimal constructor */
	public ReportMonthArea(String areaNo, String monthYear) {
		this.areaNo= areaNo;
		this.monthOfYear = monthYear;
	}

	/** full constructor */
	public ReportMonthArea(String areaNo, Double tempMedMax, Double tempMedMin,
			Double tempMedAvg, Double tempEnvMax, Double tempEnvMin,
			Double tempEnvAvg, Double tempDevAbs, Double humidityMax,
			Double humidityMin, Double humidityAvg,Integer smogAlert,
			Double batteryVol, Integer wirelessSig, Integer status,
			Integer alert, String monthYear) {
		this.areaNo = areaNo;
		this.tempMedMax = tempMedMax;
		this.tempMedMin = tempMedMin;
		this.tempMedAvg = tempMedAvg;
		this.tempEnvMax = tempEnvMax;
		this.tempEnvMin = tempEnvMin;
		this.tempEnvAvg = tempEnvAvg;
		this.tempDevAbs = tempDevAbs;
		this.humidityMax = humidityMax;
		this.humidityMin = humidityMin;
		this.humidityAvg = humidityAvg;
		this.smogAlert = smogAlert;
		this.batteryVol = batteryVol;
		this.wirelessSig = wirelessSig;
		this.status = status;
		this.alert = alert;
		this.monthOfYear = monthYear;
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

	@Column(name = "TEMP_MED_MAX", precision = 22, scale = 0)
	public Double getTempMedMax() {
		return this.tempMedMax;
	}
	public void setTempMedMax(Double tempMedMax) {
		this.tempMedMax = tempMedMax;
	}

	@Column(name = "TEMP_MED_MIN", precision = 22, scale = 0)
	public Double getTempMedMin() {
		return this.tempMedMin;
	}

	public void setTempMedMin(Double tempMedMin) {
		this.tempMedMin = tempMedMin;
	}

	@Column(name = "TEMP_MED_AVG", precision = 22, scale = 0)
	public Double getTempMedAvg() {
		return this.tempMedAvg;
	}

	public void setTempMedAvg(Double tempMedAvg) {
		this.tempMedAvg = tempMedAvg;
	}

	@Column(name = "TEMP_ENV_MAX", precision = 22, scale = 0)
	public Double getTempEnvMax() {
		return this.tempEnvMax;
	}

	public void setTempEnvMax(Double tempEnvMax) {
		this.tempEnvMax = tempEnvMax;
	}

	@Column(name = "TEMP_ENV_MIN", precision = 22, scale = 0)
	public Double getTempEnvMin() {
		return this.tempEnvMin;
	}

	public void setTempEnvMin(Double tempEnvMin) {
		this.tempEnvMin = tempEnvMin;
	}

	@Column(name = "TEMP_ENV_AVG", precision = 22, scale = 0)
	public Double getTempEnvAvg() {
		return this.tempEnvAvg;
	}

	public void setTempEnvAvg(Double tempEnvAvg) {
		this.tempEnvAvg = tempEnvAvg;
	}

	@Column(name = "TEMP_DEV_ABS", precision = 22, scale = 0)
	public Double getTempDevAbs() {
		return this.tempDevAbs;
	}

	public void setTempDevAbs(Double tempDevAbs) {
		this.tempDevAbs = tempDevAbs;
	}

	@Column(name = "HUMIDITY_MAX", precision = 22, scale = 0)
	public Double getHumidityMax() {
		return humidityMax;
	}

	public void setHumidityMax(Double humidityMax) {
		this.humidityMax = humidityMax;
	}

	@Column(name = "HUMIDITY_MIN", precision = 22, scale = 0)
	public Double getHumidityMin() {
		return humidityMin;
	}

	public void setHumidityMin(Double humidityMin) {
		this.humidityMin = humidityMin;
	}

	@Column(name = "HUMIDITY_AVG", precision = 22, scale = 0)
	public Double getHumidityAvg() {
		return humidityAvg;
	}

	public void setHumidityAvg(Double humidityAvg) {
		this.humidityAvg = humidityAvg;
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

	@Column(name = "STATUS")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "ALERT")
	public Integer getAlert() {
		return this.alert;
	}

	public void setAlert(Integer alert) {
		this.alert = alert;
	}

	@Column(name = "month_of_year", nullable = false, length = 10)
	public String getMonthOfYear() {
		return this.monthOfYear;
	}

	public void setMonthOfYear(String monthOfYear) {
		this.monthOfYear = monthOfYear;
	}

}