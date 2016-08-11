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

import com.nju.monitor.model.SystemConfig;

/**
 * A data access object (DAO) providing persistence and search support for
 * SystemConfig entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.nju.monitor.model.SystemConfig
 * @author MyEclipse Persistence Tools
 */
@Component("SystemDAO")
public class SystemDAO{
	private static final Logger log = LoggerFactory.getLogger(SystemDAO.class);
	// property constants
	public static final String COM_PORT = "comPort";
	public static final String BAUD_RATE = "baudRate";
	public static final String COLLECT_CYCLE = "collectCycle";
	public static final String SMS_COM_PORT = "smsComPort";
	public static final String SMS_BAUD_RATE = "smsBaudRate";

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(SystemConfig transientInstance) {
		log.debug("saving SystemConfig instance");
		try {
			sessionFactory.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SystemConfig persistentInstance) {
		log.debug("deleting SystemConfig instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public int update(SystemConfig config){
		log.debug("update SystemConfig");
		try {
			String hql = "update SystemConfig set comPort = ?, baudRate = ?, collectCycle = ?, smsComPort = ?, smsBaudRate = ?, showTempMed = ?, showTempEnv = ?, showHumidity = ?, showSmogAlert = ?, smsAlert = ? where id = 1";
			return sessionFactory.getCurrentSession().createQuery(hql)
					      .setString(0, config.getComPort())
			              .setString(1, config.getBaudRate())
			              .setDouble(2, config.getCollectCycle())
			              .setString(3, config.getSmsComPort())
			              .setString(4, config.getSmsBaudRate())
					      .setBoolean(5, config.getShowTempMed())
					      .setBoolean(6, config.getShowTempEnv())
			              .setBoolean(7, config.getShowHumidity())
					      .setBoolean(8, config.getShowSmogAlert())
					      .setBoolean(9, config.getSmsAlert())
			              .executeUpdate();
		} catch (Exception re) {
			log.error("update failed", re);
			throw re;
		}
	}

	public SystemConfig findById(java.lang.Integer id) {
		log.debug("getting SystemConfig instance with id: " + id);
		try {
			SystemConfig instance = (SystemConfig) sessionFactory.getCurrentSession().get(
					"com.nju.monitor.model.SystemConfig", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<SystemConfig> findByExample(SystemConfig instance) {
		log.debug("finding SystemSystemConfignce by example");
		try {
			List<SystemConfig> results = (List<SystemConfig>) sessionFactory.getCurrentSession()
					.createCriteria("com.nju.monitor.model.SystemConfig")
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
		log.debug("finding SystemConfig instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from SystemConfig as model where model."
					+ propertyName + "= ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<SystemConfig> findByComPort(Object comPort) {
		return findByProperty(COM_PORT, comPort);
	}

	public List<SystemConfig> findByBaudRate(Object baudRate) {
		return findByProperty(BAUD_RATE, baudRate);
	}

	public List<SystemConfig> findByCollectCycle(Object collectCycle) {
		return findByProperty(COLLECT_CYCLE, collectCycle);
	}

	public List findAll() {
		log.debug("finding all SystemConfig instances");
		try {
			String queryString = "from SystemConfig";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public SystemConfig findOne() {
		log.debug("finding all SystemConfig instances");
		try {
			String queryString = "from SystemConfig";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return (SystemConfig) queryObject.uniqueResult();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SystemConfig merge(SystemConfig detachedInstance) {
		log.debug("merging SystemConfig instance");
		try {
			SystemConfig result = (SystemConfig) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SystemConfig instance) {
		log.debug("attaching dirty SystemConfig instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SystemConfig instance) {
		log.debug("attaching clean SystemConfig instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}