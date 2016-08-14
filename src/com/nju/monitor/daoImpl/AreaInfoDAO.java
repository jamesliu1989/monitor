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

import com.nju.monitor.model.AreaInfo;
import com.nju.monitor.model.CtrlerInfo;

/**
 * A data access object (DAO) providing persistence and search support for
 * AreaInfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.nju.monitor.model.AreaInfo
 * @author MyEclipse Persistence Tools
 */
@Component("AreaInfoDAO")
public class AreaInfoDAO{
	private static final Logger log = LoggerFactory.getLogger(AreaInfoDAO.class);
	
	private SessionFactory sessionFactory;
	// property constants
	public static final String AREA_NO = "areaNo";
	public static final String NODE_NUM = "nodeNum";
	public static final String MAX_TEMP_MED = "maxTempMed";
	public static final String MIN_TEMP_MED = "minTempMed";
	public static final String AVG_TEMP_MED = "avgTempMed";
	public static final String MAX_TEMP_ENV = "maxTempEnv";
	public static final String MIN_TEMP_ENV = "minTempEnv";
	public static final String AVG_TEMP_ENV = "avgTempEnv";
	public static final String ALERT = "alert";
	public static final String NODES = "nodes";
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public int save(AreaInfo transientInstance) {
		log.debug("saving AreaInfo instance");
		try {
			sessionFactory.getCurrentSession().save(transientInstance);			
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		return transientInstance.getId();
	}

	public void delete(AreaInfo persistentInstance) {
		log.debug("deleting AreaInfo instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AreaInfo findById(java.lang.Integer id) {
		log.debug("getting AreaInfo instance with id: " + id);
		try {
			AreaInfo instance = (AreaInfo) sessionFactory.getCurrentSession().get(
					"com.nju.monitor.model.AreaInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<AreaInfo> findByExample(AreaInfo instance) {
		log.debug("finding AreaInfo instance by example");
		try {
			List<AreaInfo> results = (List<AreaInfo>) sessionFactory.getCurrentSession()
					.createCriteria("com.nju.iip.model.AreaInfo")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List getNameAndNo(int ctrlerNo){
		try {
			String queryString = "select areaNo, areaName from AreaInfo where ctrlerNo = ? order by areaNo asc";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.setInteger(0, ctrlerNo).list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
		
	public int updateNameById(int id, String areaName){
		try {
			String queryString = "update AreaInfo set areaName = ? where id = ?";
			int result = sessionFactory.getCurrentSession()
					     .createQuery(queryString)
					     .setString(0, areaName)
					     .setInteger(1, id)
					     .executeUpdate();
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public int deleteById(int id){
		try {
			String queryString = "delete from AreaInfo where id = ?";
			int result = sessionFactory.getCurrentSession()
					     .createQuery(queryString)
					     .setInteger(0, id)
					     .executeUpdate();
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public int deleteByCtrlerNo(int ctrlerNo){
		try {
			String queryString = "delete from AreaInfo where ctrlerNo = ?";
			int result = sessionFactory.getCurrentSession()
					     .createQuery(queryString)
					     .setInteger(0, ctrlerNo)
					     .executeUpdate();
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding AreaInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from AreaInfo as model where model."
					+ propertyName + "= ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<AreaInfo> findByAreaNo(Object areaNo) {
		return findByProperty(AREA_NO, areaNo);
	}

	public List<AreaInfo> findByNodeNum(Object nodeNum) {
		return findByProperty(NODE_NUM, nodeNum);
	}

	public List<AreaInfo> findByMaxTempMed(Object maxTempMed) {
		return findByProperty(MAX_TEMP_MED, maxTempMed);
	}

	public List<AreaInfo> findByMinTempMed(Object minTempMed) {
		return findByProperty(MIN_TEMP_MED, minTempMed);
	}

	public List<AreaInfo> findByAvgTempMed(Object avgTempMed) {
		return findByProperty(AVG_TEMP_MED, avgTempMed);
	}

	public List<AreaInfo> findByMaxTempEnv(Object maxTempEnv) {
		return findByProperty(MAX_TEMP_ENV, maxTempEnv);
	}

	public List<AreaInfo> findByMinTempEnv(Object minTempEnv) {
		return findByProperty(MIN_TEMP_ENV, minTempEnv);
	}

	public List<AreaInfo> findByAvgTempEnv(Object avgTempEnv) {
		return findByProperty(AVG_TEMP_ENV, avgTempEnv);
	}

	public List<AreaInfo> findByAlert(Object alert) {
		return findByProperty(ALERT, alert);
	}

	public List<AreaInfo> findByNodes(Object nodes) {
		return findByProperty(NODES, nodes);
	}

	public List findAllByCtrlerNo(int ctrlerNo) {
		log.debug("finding all AreaInfo instances");
		try {
			String queryString = "from AreaInfo where ctrlerNo = ? order by areaNo asc";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString)
					.setInteger(0, ctrlerNo);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAll() {
		log.debug("finding all AreaInfo instances");
		try {
			String queryString = "from AreaInfo order by areaNo asc";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public long findAreaNum(int ctrlerNo) {
		log.debug("finding all AreaInfo instances");
		try {
			String queryString = "select count(id) from AreaInfo where ctrlerNo = ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString)
					.setInteger(0, ctrlerNo);
			return (long) queryObject.uniqueResult();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public AreaInfo findByCtrlerNoAreaNo(int ctrlerNo, String areaNo) {
		log.debug("finding all AreaInfo instances");
		try {
			String queryString = "from AreaInfo where ctrlerNo = ? and areaNo = ?  order by areaNo asc";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString)
					.setInteger(0, ctrlerNo)
					.setString(1, areaNo);
			return (AreaInfo) queryObject.uniqueResult();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public AreaInfo merge(AreaInfo detachedInstance) {
		log.debug("merging AreaInfo instance");
		try {
			AreaInfo result = (AreaInfo) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(AreaInfo instance) {
		log.debug("attaching dirty AreaInfo instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(AreaInfo instance) {
		log.debug("attaching clean AreaInfo instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}


}