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

import com.nju.monitor.model.ReportDailyNode;

/**
 * A data access object (DAO) providing persistence and search support for
 * ReportDailyNode entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.nju.monitor.model.ReportDailyNode
 * @author MyEclipse Persistence Tools
 */
@Component("ReportDailyNodeDAO")
public class ReportDailyNodeDAO{
	private static final Logger log = LoggerFactory
			.getLogger(ReportDailyNodeDAO.class);
	// property constants
	public static final String NODE_NO = "nodeNo";
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
	
	public void save(ReportDailyNode transientInstance) {
		log.debug("saving ReportDailyNode instance");
		try {
			sessionFactory.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ReportDailyNode persistentInstance) {
		log.debug("deleting ReportDailyNode instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}



	public ReportDailyNode findById(java.lang.Integer id) {
		log.debug("getting ReportDailyNode instance with id: " + id);
		try {
			ReportDailyNode instance = (ReportDailyNode) sessionFactory.getCurrentSession().get(
					"com.nju.monitor.model.ReportDailyNode", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<ReportDailyNode> findAllByMonth(String nodeNo, String month){
		try {
			String queryString = "from ReportDailyNode where nodeNo = ? and monthOfYear = ? order by dayOfYear asc";
			Query query = sessionFactory.getCurrentSession().createQuery(queryString);
			query.setParameter(0, nodeNo);
			query.setParameter(1, month);
			return query.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public int deleteNodeReportByCtrlerNo(int ctrlerNo) {
		try {
			String queryString = "delete from ReportDailyNode where nodeNo like :ctrlerNo";
			Query query = sessionFactory.getCurrentSession().createQuery(queryString);
			query.setParameter("ctrlerNo", "C" + ctrlerNo +"-%");
			return query.executeUpdate();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public int checkByNodeNoByDayOfYear(String nodeNo, String dayOfYear){
		try {
			String queryString = "SELECT COUNT(*) from ReportDailyNode where nodeNo = ? and dayOfYear = ?";
			Query query = sessionFactory.getCurrentSession().createQuery(queryString);
			query.setParameter(0, nodeNo);
			query.setParameter(1, dayOfYear);
			return ((Long)query.uniqueResult()).intValue();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List<ReportDailyNode> findByExample(ReportDailyNode instance) {
		log.debug("finding ReportDailyNode instance by example");
		try {
			List<ReportDailyNode> results = (List<ReportDailyNode>) sessionFactory.getCurrentSession()
					.createCriteria("com.nju.monitor.model.ReportDailyNode")
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
		log.debug("finding ReportDailyNode instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ReportDailyNode as model where model."
					+ propertyName + "= ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<ReportDailyNode> findByNodeNo(Object nodeNo) {
		return findByProperty(NODE_NO, nodeNo);
	}

	public List<ReportDailyNode> findByTempMedMax(Object tempMedMax) {
		return findByProperty(TEMP_MED_MAX, tempMedMax);
	}

	public List<ReportDailyNode> findByTempMedMin(Object tempMedMin) {
		return findByProperty(TEMP_MED_MIN, tempMedMin);
	}

	public List<ReportDailyNode> findByTempMedAvg(Object tempMedAvg) {
		return findByProperty(TEMP_MED_AVG, tempMedAvg);
	}

	public List<ReportDailyNode> findByTempEnvMax(Object tempEnvMax) {
		return findByProperty(TEMP_ENV_MAX, tempEnvMax);
	}

	public List<ReportDailyNode> findByTempEnvMin(Object tempEnvMin) {
		return findByProperty(TEMP_ENV_MIN, tempEnvMin);
	}

	public List<ReportDailyNode> findByTempEnvAvg(Object tempEnvAvg) {
		return findByProperty(TEMP_ENV_AVG, tempEnvAvg);
	}

	public List<ReportDailyNode> findByTempDevAbs(Object tempDevAbs) {
		return findByProperty(TEMP_DEV_ABS, tempDevAbs);
	}

	public List<ReportDailyNode> findBySmogAlert(Object smogAlert) {
		return findByProperty(SMOG_ALERT, smogAlert);
	}

	public List<ReportDailyNode> findByBatteryVol(Object batteryVol) {
		return findByProperty(BATTERY_VOL, batteryVol);
	}

	public List<ReportDailyNode> findByWirelessSig(Object wirelessSig) {
		return findByProperty(WIRELESS_SIG, wirelessSig);
	}

	public List<ReportDailyNode> findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List<ReportDailyNode> findByAlert(Object alert) {
		return findByProperty(ALERT, alert);
	}

	public List<ReportDailyNode> findByDayOfYear(Object dayOfYear) {
		return findByProperty(DAY_OF_YEAR, dayOfYear);
	}

	public List<ReportDailyNode> findByMonthYear(Object monthYear) {
		return findByProperty(MONTH_YEAR, monthYear);
	}

	public List findAll() {
		log.debug("finding all ReportDailyNode instances");
		try {
			String queryString = "from ReportDailyNode";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ReportDailyNode merge(ReportDailyNode detachedInstance) {
		log.debug("merging ReportDailyNode instance");
		try {
			ReportDailyNode result = (ReportDailyNode) sessionFactory.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ReportDailyNode instance) {
		log.debug("attaching dirty ReportDailyNode instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ReportDailyNode instance) {
		log.debug("attaching clean ReportDailyNode instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}


}