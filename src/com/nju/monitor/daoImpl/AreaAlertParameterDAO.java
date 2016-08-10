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

import com.nju.monitor.model.AreaAlertParameter;

/**
 * A data access object (DAO) providing persistence and search support for
 * AreaAlertParameter entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.nju.monitor.model.AreaAlertParameter
 * @author MyEclipse Persistence Tools
 */
@Component("AreaAlertParameterDAO")
public class AreaAlertParameterDAO{
	private static final Logger log = LoggerFactory
			.getLogger(AreaAlertParameterDAO.class);
	// property constants
	public static final String AREA_NO = "areaNo";
	public static final String TEMP_MED_MAX = "tempMedMax";
	public static final String TEMP_MED_MIN = "tempMedMin";
	public static final String TEMP_MED_DEV_ABS = "tempMedDevAbs";
	public static final String TEMP_MED_RATE = "tempMedRate";
	public static final String MED_DEV = "medDev";
	public static final String TEMP_ENV_MAX = "tempEnvMax";
	public static final String TEMP_ENV_MIN = "tempEnvMin";
	public static final String TEMP_ENV_DEV_ABS = "tempEnvDevAbs";
	public static final String TEMP_ENV_RATE = "tempEnvRate";
	public static final String ENV_DEV = "envDev";
	public static final String MIN_BATTERY_VOL = "minBatteryVol";

	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public void save(AreaAlertParameter transientInstance) {
		log.debug("saving AreaAlertParameter instance");
		try {
			sessionFactory.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(AreaAlertParameter persistentInstance) {
		log.debug("deleting AreaAlertParameter instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AreaAlertParameter findById(java.lang.Integer id) {
		log.debug("getting AreaAlertParameter instance with id: " + id);
		try {
			AreaAlertParameter instance = (AreaAlertParameter) sessionFactory.getCurrentSession()
					.get("com.nju.monitor.model.AreaAlertParameter", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public int updateAreaName(String areaName){
		try {
			String queryString = "update AreaAlertParameter set areaName = ? where areaName = ?";
			int result = sessionFactory.getCurrentSession()
					     .createQuery(queryString)
					     .setString(0, areaName)
					     .setString(1, areaName)
					     .executeUpdate();
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List<AreaAlertParameter> findByExample(AreaAlertParameter instance) {
		log.debug("finding AreaAlertParameter instance by example");
		try {
			List<AreaAlertParameter> results = (List<AreaAlertParameter>) sessionFactory.getCurrentSession()
					.createCriteria("com.nju.monitor.model.AreaAlertParameter")
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
		log.debug("finding AreaAlertParameter instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from AreaAlertParameter as model where model."
					+ propertyName + "= ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<AreaAlertParameter> findByAreaNo(Object areaNo) {
		return findByProperty(AREA_NO, areaNo);
	}

	public List<AreaAlertParameter> findByTempMedMax(Object tempMedMax) {
		return findByProperty(TEMP_MED_MAX, tempMedMax);
	}

	public List<AreaAlertParameter> findByTempMedMin(Object tempMedMin) {
		return findByProperty(TEMP_MED_MIN, tempMedMin);
	}

	public List<AreaAlertParameter> findByTempMedDevAbs(Object tempMedDevAbs) {
		return findByProperty(TEMP_MED_DEV_ABS, tempMedDevAbs);
	}

	public List<AreaAlertParameter> findByTempMedRate(Object tempMedRate) {
		return findByProperty(TEMP_MED_RATE, tempMedRate);
	}

	public List<AreaAlertParameter> findByMedDev(Object medDev) {
		return findByProperty(MED_DEV, medDev);
	}

	public List<AreaAlertParameter> findByTempEnvMax(Object tempEnvMax) {
		return findByProperty(TEMP_ENV_MAX, tempEnvMax);
	}

	public List<AreaAlertParameter> findByTempEnvMin(Object tempEnvMin) {
		return findByProperty(TEMP_ENV_MIN, tempEnvMin);
	}

	public List<AreaAlertParameter> findByTempEnvDevAbs(Object tempEnvDevAbs) {
		return findByProperty(TEMP_ENV_DEV_ABS, tempEnvDevAbs);
	}

	public List<AreaAlertParameter> findByTempEnvRate(Object tempEnvRate) {
		return findByProperty(TEMP_ENV_RATE, tempEnvRate);
	}

	public List<AreaAlertParameter> findByEnvDev(Object envDev) {
		return findByProperty(ENV_DEV, envDev);
	}

	public List<AreaAlertParameter> findByMinBatteryVol(Object minBatteryVol) {
		return findByProperty(MIN_BATTERY_VOL, minBatteryVol);
	}

	public List findAll() {
		log.debug("finding all AreaAlertParameter instances");
		try {
			String queryString = "from AreaAlertParameter";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAllByAreaNo(int ctrlerNo, String areaNo) {
		log.debug("finding all AreaAlertParameter instances");
		String queryString;
		try {
			//所有
		  if(ctrlerNo == -1){
				queryString = "from AreaAlertParameter order by areaNo asc";
				return sessionFactory.getCurrentSession().createQuery(queryString).list();
		  }else if(areaNo.equals("-1")){
			queryString = "from AreaAlertParameter where areaNo like :areaNo";
			return sessionFactory.getCurrentSession().createQuery(queryString)
					.setParameter("areaNo", "C"+ctrlerNo+"-%").list();
		  }else {
			queryString = "from AreaAlertParameter where areaNo = ?";
			return sessionFactory.getCurrentSession().createQuery(queryString)
						.setString(0, areaNo).list();
		  }			
			
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public AreaAlertParameter merge(AreaAlertParameter detachedInstance) {
		log.debug("merging AreaAlertParameter instance");
		try {
			AreaAlertParameter result = (AreaAlertParameter) sessionFactory.getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public int attachDirty(AreaAlertParameter instance) {
		log.debug("attaching dirty AreaAlertParameter instance");
		int result = 0;
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
			result = 1;
		} catch (RuntimeException re) {
			result = 0;
			log.error("attach failed", re);
			throw re;
		}
		return result;
	}

	public void attachClean(AreaAlertParameter instance) {
		log.debug("attaching clean AreaAlertParameter instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}