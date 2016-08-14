package com.nju.monitor.daoImpl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.RegularData;

/**
 * A data access object (DAO) providing persistence and search support for
 * RegularData entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.nju.monitor.model.RegularData
 * @author MyEclipse Persistence Tools
 */

@Component("RegularDataDAO")
public class RegularDataDAO{
	private static final Logger log = LoggerFactory.getLogger(RegularDataDAO.class);
	
	
	// property constants
	public static final String CTRLER_NO = "ctrlerNo";
	public static final String NODE_NO = "nodeNo";
	public static final String TEMP_MED = "tempMed";
	public static final String TEMP_ENV = "tempEnv";
	public static final String SMOG_ALERT = "smogAlert";
	public static final String BATTERY_VOL = "batteryVol";
	public static final String WIRELESS_SIG = "wirelessSig";
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(RegularData transientInstance) {
		log.debug("saving RegularData instance");
		try {
			sessionFactory.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(RegularData persistentInstance) {
		log.debug("deleting RegularData instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public List findByTime(String nodeNo, Timestamp startTime, Timestamp endTime) {
		try {
			String queryString = "from RegularData where nodeNo = ? and collectTime between ? and ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, nodeNo);
			queryObject.setParameter(1, startTime);
			queryObject.setParameter(2, endTime);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by time failed", re);
			throw re;
		}
	}
	
	/**
	 * 通过nodeNO找到最新一条数据
	 * @param nodeNo
	 * @return
	 */
	public RegularData findLatestByNodeNo(Object nodeNo) {
		try {
			String queryString = "from RegularData where nodeNo = ? order by collectTime desc";
			Query query = sessionFactory.getCurrentSession().createQuery(queryString);
			return (RegularData) query.setParameter(0, nodeNo)
			                          .setMaxResults(1)
			                          .uniqueResult();
		} catch (RuntimeException re) {
			log.error("find by time failed", re);
			throw re;
		}
	}
	
	/**
	 * 通过nodeNO找到最新二条数据
	 * @param nodeNo
	 * @return
	 */
	public List<RegularData> findLatest2ByNodeNo(Object nodeNo) {
		try {
			String queryString = "from RegularData where nodeNo = ? order by collectTime desc";
			Query query = sessionFactory.getCurrentSession().createQuery(queryString);
			return  query.setParameter(0, nodeNo)
			              .setMaxResults(2)
			              .list();
		} catch (RuntimeException re) {
			log.error("find by time failed", re);
			throw re;
		}
	}

	public int deleteByCtrlerNo(int ctrlerNo){
		try {
			String queryString = "delete from RegularData where ctrlerNo = :ctrlerNo";
			int result = sessionFactory.getCurrentSession()
					.createQuery(queryString)
					.setInteger("ctrlerNo", ctrlerNo)
					.executeUpdate();
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public RegularData findById(java.lang.Integer id) {
		log.debug("getting RegularData instance with id: " + id);
		try {
			RegularData instance = (RegularData) sessionFactory.getCurrentSession().get(
					"com.nju.monitor.model.RegularData", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<RegularData> findByExample(RegularData instance) {
		log.debug("finding RegularData instance by example");
		try {
			List<RegularData> results = (List<RegularData>) sessionFactory.getCurrentSession()
					.createCriteria("com.nju.monitor.model.RegularData")
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
		log.debug("finding RegularData instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from RegularData as model where model."
					+ propertyName + "= ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<RegularData> findByCtrlerNo(Object ctrlerNo) {
		return findByProperty(CTRLER_NO, ctrlerNo);
	}

	public List<RegularData> findByNodeNo(Object nodeNo) {
		return findByProperty(NODE_NO, nodeNo);
	}
	
	public List<RegularData> findByTempMed(Object tempMed) {
		return findByProperty(TEMP_MED, tempMed);
	}

	public List<RegularData> findByTempEnv(Object tempEnv) {
		return findByProperty(TEMP_ENV, tempEnv);
	}

	public List<RegularData> findBySmogAlert(Object smogAlert) {
		return findByProperty(SMOG_ALERT, smogAlert);
	}

	public List<RegularData> findByBatteryVol(Object batteryVol) {
		return findByProperty(BATTERY_VOL, batteryVol);
	}

	public List<RegularData> findByWirelessSig(Object wirelessSig) {
		return findByProperty(WIRELESS_SIG, wirelessSig);
	}

	public List findAll() {
		log.debug("finding all RegularData instances");
		try {
			String queryString = "from RegularData";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public RegularData merge(RegularData detachedInstance) {
		log.debug("merging RegularData instance");
		try {
			RegularData result = (RegularData) sessionFactory.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(RegularData instance) {
		log.debug("attaching dirty RegularData instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(RegularData instance) {
		log.debug("attaching clean RegularData instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}