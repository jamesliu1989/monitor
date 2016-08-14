package com.nju.monitor.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.ReportDailyArea;

/**
 * A data access object (DAO) providing persistence and search support for
 * ReportDailyArea entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.nju.monitor.model.ReportDailyArea
 * @author MyEclipse Persistence Tools
 */
@Component("ReportDailyAreaDAO")
public class ReportDailyAreaDAO{
	private static final Logger log = LoggerFactory
			.getLogger(ReportDailyAreaDAO.class);
	// property constants
	public static final String AREA_NO = "areaNo";
	public static final String TEMP_MED_MAX = "tempMedMax";
	public static final String TEMP_MED_MIN = "tempMedMin";
	public static final String TEMP_MED_AVG = "tempMedAvg";
	public static final String TEMP_ENV_MAX = "tempEnvMax";
	public static final String TEMP_ENV_MIN = "tempEnvMin";
	public static final String TEMP_ENV_AVG = "tempEnvAvg";
	public static final String TEMP_DEV_ABS = "tempDevAbs";
	public static final String SMOG_ALERT = "smogAlert";
	public static final String BATTERY_VOL = "batteryVol";
	public static final String WIRELESS_SIG = "wirelessSig";
	public static final String STATUS = "status";
	public static final String ALERT = "alert";
	public static final String DAY_OF_YEAR = "dayOfYear";
	public static final String MONTH_YEAR = "monthYear";

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(ReportDailyArea transientInstance) {
		log.debug("saving ReportDailyArea instance");
		try {
			sessionFactory.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ReportDailyArea persistentInstance) {
		log.debug("deleting ReportDailyArea instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ReportDailyArea findById(java.lang.Integer id) {
		log.debug("getting ReportDailyArea instance with id: " + id);
		try {
			ReportDailyArea instance = (ReportDailyArea) sessionFactory.getCurrentSession().get(
					"com.nju.monitor.model.ReportDailyArea", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public int checkByAreaNoByDayOfYear(String areaNo, String dayOfYear){
		try {
			String queryString = "SELECT COUNT(*) from ReportDailyArea where areaNo = ? and dayOfYear = ?";
			Query query = sessionFactory.getCurrentSession().createQuery(queryString);
			query.setParameter(0, areaNo);
			query.setParameter(1, dayOfYear);
			return ((Long)query.uniqueResult()).intValue();
		} catch (RuntimeException re) {
			throw re;
		}
	}



	public int deleteAreaReportByCtrlerNo(int ctrlerNo) {
		try {
			String queryString = "delete from ReportDailyArea where areaNo like :ctrlerNo";
			Query query = sessionFactory.getCurrentSession().createQuery(queryString);
			query.setParameter("ctrlerNo", "C" + ctrlerNo +"-%");
			return query.executeUpdate();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List<ReportDailyArea> findAllByMonth(String areaNo, String month){
		try {
			String queryString = "from ReportDailyArea where areaNo = ? and monthOfYear = ? order by dayOfYear asc";
			Query query = sessionFactory.getCurrentSession().createQuery(queryString);
			query.setParameter(0, areaNo);
			query.setParameter(1, month);
			return query.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List<ReportDailyArea> findByExample(ReportDailyArea instance) {
		log.debug("finding ReportDailyArea instance by example");
		try {
			List<ReportDailyArea> results = (List<ReportDailyArea>) sessionFactory.getCurrentSession()
					.createCriteria("com.nju.monitor.model.ReportDailyArea")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding ReportDailyArea instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ReportDailyArea as model where model."
					+ propertyName + "= ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<ReportDailyArea> findByAreaNo(Object AreaNo) {
		return findByProperty(AREA_NO, AreaNo);
	}

	public List<ReportDailyArea> findByTempMedMax(Object tempMedMax) {
		return findByProperty(TEMP_MED_MAX, tempMedMax);
	}

	public List<ReportDailyArea> findByTempMedMin(Object tempMedMin) {
		return findByProperty(TEMP_MED_MIN, tempMedMin);
	}

	public List<ReportDailyArea> findByTempMedAvg(Object tempMedAvg) {
		return findByProperty(TEMP_MED_AVG, tempMedAvg);
	}

	public List<ReportDailyArea> findByTempEnvMax(Object tempEnvMax) {
		return findByProperty(TEMP_ENV_MAX, tempEnvMax);
	}

	public List<ReportDailyArea> findByTempEnvMin(Object tempEnvMin) {
		return findByProperty(TEMP_ENV_MIN, tempEnvMin);
	}

	public List<ReportDailyArea> findByTempEnvAvg(Object tempEnvAvg) {
		return findByProperty(TEMP_ENV_AVG, tempEnvAvg);
	}

	public List<ReportDailyArea> findByTempDevAbs(Object tempDevAbs) {
		return findByProperty(TEMP_DEV_ABS, tempDevAbs);
	}

	public List<ReportDailyArea> findBySmogAlert(Object smogAlert) {
		return findByProperty(SMOG_ALERT, smogAlert);
	}

	public List<ReportDailyArea> findByBatteryVol(Object batteryVol) {
		return findByProperty(BATTERY_VOL, batteryVol);
	}

	public List<ReportDailyArea> findByWirelessSig(Object wirelessSig) {
		return findByProperty(WIRELESS_SIG, wirelessSig);
	}

	public List<ReportDailyArea> findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List<ReportDailyArea> findByAlert(Object alert) {
		return findByProperty(ALERT, alert);
	}

	public List<ReportDailyArea> findByDayOfYear(Object dayOfYear) {
		return findByProperty(DAY_OF_YEAR, dayOfYear);
	}

	public List<ReportDailyArea> findByMonthYear(Object monthYear) {
		return findByProperty(MONTH_YEAR, monthYear);
	}

	public List findAll() {
		log.debug("finding all ReportDailyArea instances");
		try {
			String queryString = "from ReportDailyArea";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ReportDailyArea merge(ReportDailyArea detachedInstance) {
		log.debug("merging ReportDailyArea instance");
		try {
			ReportDailyArea result = (ReportDailyArea) sessionFactory.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ReportDailyArea instance) {
		log.debug("attaching dirty ReportDailyArea instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ReportDailyArea instance) {
		log.debug("attaching clean ReportDailyArea instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}