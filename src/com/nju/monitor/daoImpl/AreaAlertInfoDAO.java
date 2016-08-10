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
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.AreaAlertInfo;

/**
 * A data access object (DAO) providing persistence and search support for
 * AreaAlertInfo entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.nju.monitor.model.AreaAlertInfo
 * @author MyEclipse Persistence Tools
 */
@Component("AreaAlertInfoDAO")
public class AreaAlertInfoDAO {
	private static final Logger log = LoggerFactory
			.getLogger(AreaAlertInfoDAO.class);
	// property constants
	public static final String AREA_NO = "areaNo";
	public static final String NODE_NO = "nodeNo";
	public static final String ALERT_PROPERTY = "alertProperty";
	public static final String ALERT_TYPE = "alertType";
	public static final String ALERT_VALUE = "alertValue";
	public static final String ALERT_MEASUREMENT = "alertMeasurement";
	public static final String ALERT_REMARKS = "alertRemarks";

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(AreaAlertInfo transientInstance) {
		log.debug("saving AreaAlertInfo instance");
		try {
			sessionFactory.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(AreaAlertInfo persistentInstance) {
		log.debug("deleting AreaAlertInfo instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AreaAlertInfo findById(java.lang.Integer id) {
		log.debug("getting AreaAlertInfo instance with id: " + id);
		try {
			AreaAlertInfo instance = (AreaAlertInfo) sessionFactory.getCurrentSession().get(
					"com.nju.monitor.model.AreaAlertInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<AreaAlertInfo> findByExample(AreaAlertInfo instance) {
		log.debug("finding AreaAlertInfo instance by example");
		try {
			List<AreaAlertInfo> results = (List<AreaAlertInfo>) sessionFactory.getCurrentSession()
					.createCriteria("com.nju.monitor.model.AreaAlertInfo")
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
		log.debug("finding AreaAlertInfo instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from AreaAlertInfo as model where model."
					+ propertyName + "= ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List<AreaAlertInfo> findUnRead() {
		try {
			String queryString = "from AreaAlertInfo where isRead = 0 order by alertTime desc";
			Query query = sessionFactory.getCurrentSession().createQuery(queryString);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List<AreaAlertInfo> findUnReadByArea(int page, String areaNo, Timestamp startTime,Timestamp endTime, int range) {
		String  read = (range == 0 ? "isRead = 0 and" : "");
		try {
		if(startTime==null || endTime==null){
			String queryString = "from AreaAlertInfo where "+read+" areaNo = ? order by alertTime desc";
			return sessionFactory.getCurrentSession().createQuery(queryString)
					.setString(0, areaNo)					
					.setFirstResult(page*10)
					.setMaxResults(10)
					.list();
		}else {
			String queryString = "from AreaAlertInfo where "+read+" areaNo = ? and alertTime between ? and ? order by alertTime desc";
			return sessionFactory.getCurrentSession().createQuery(queryString)
					.setString(0, areaNo)
					.setParameter(1, startTime)
					.setParameter(2, endTime)
					.setFirstResult(page*10)
					.setMaxResults(10)
					.list();
		}
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List<AreaAlertInfo> findUnReadByNodeTime(int page,String nodeNo, Timestamp startTime,Timestamp endTime, int range) {
		String  read = (range == 0 ? "isRead = 0 and" : "");
		try {
			if(startTime==null || endTime==null){
				String queryString = "from AreaAlertInfo where "+read+" nodeNo = ? order by alertTime desc";
				return sessionFactory.getCurrentSession().createQuery(queryString)
						.setParameter(0, nodeNo)
						.setFirstResult(page*10)
						.setMaxResults(10)
						.list();
			}else {
				String queryString = "from AreaAlertInfo where "+read+" nodeNo = ? and alertTime between ? and ? order by alertTime desc";
				return sessionFactory.getCurrentSession().createQuery(queryString)
						.setParameter(0, nodeNo)
						.setParameter(1, startTime)
						.setParameter(2, endTime)
						.setFirstResult(page*10)
						.setMaxResults(10)
						.list();
			}

			
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public long findUnReadByNodeTimeCount(int page,String nodeNo, Timestamp startTime,Timestamp endTime, int range) {
		String  read = (range == 0 ? "isRead = 0 and" : "");
		try {
			if(startTime==null || endTime==null){
			String queryString = "select count(id) from AreaAlertInfo where "+read+" nodeNo = ?order by alertTime desc";
			return (long)sessionFactory.getCurrentSession().createQuery(queryString)
					.setParameter(0, nodeNo)
					.uniqueResult();
			}else {
				String queryString = "select count(id) from AreaAlertInfo where "+read+" nodeNo = ? and alertTime between ? and ? order by alertTime desc";
				return (long)sessionFactory.getCurrentSession().createQuery(queryString)
						.setParameter(0, nodeNo)
						.setParameter(1, startTime)
						.setParameter(2, endTime)
						.uniqueResult();
			}
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public long findUnReadbyAreaCount(String areaNo,Timestamp startTime,Timestamp endTime, int range) {
		String  read = (range == 0 ? "isRead = 0 and" : "");
		try {
		  if(startTime==null || endTime==null){
			String queryString = "select count(id) from AreaAlertInfo where "+read+" areaNo = ?";
			return (Long) sessionFactory.getCurrentSession().createQuery(queryString)
					.setString(0, areaNo)
                    .uniqueResult();
		  }else {
				String queryString = "select count(id) from AreaAlertInfo where "+read+" areaNo = ? and alertTime between ? and ?";
				return (Long) sessionFactory.getCurrentSession().createQuery(queryString)
						.setString(0, areaNo)
						.setParameter(1, startTime)
						.setParameter(2, endTime)
	                    .uniqueResult();
		}
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List<AreaAlertInfo> findLatestUnRead() {
		try {
			String sql = "select * from area_alert_info where IS_READ = 0 and ALERT_TIME between DATE_ADD(NOW(), INTERVAL -1 HOUR ) and NOW() order by ALERT_TIME desc";
			Query queryObject = sessionFactory.getCurrentSession().createSQLQuery(sql);
			return queryObject.setMaxResults(10).list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	/**
	 * 解除报警
	 * @param id
	 * @return
	 */
	public int updateIsRead(int id) {
		String hql = "update AreaAlertInfo set isRead = 1 where id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		return query.executeUpdate();
	}
	
	public long findUnReadCount() {
		long count = 0;
		try {
			String queryString = "select count(id) from AreaAlertInfo where isRead = 0";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			count = (Long) queryObject.uniqueResult();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
		return count;
	}
	
	public List<AreaAlertInfo> findByAreaNo(Object areaNo) {
		return findByProperty(AREA_NO, areaNo);
	}

	public List<AreaAlertInfo> findByNodeNo(Object nodeNo) {
		return findByProperty(NODE_NO, nodeNo);
	}

	public List<AreaAlertInfo> findByAlertProperty(Object alertProperty) {
		return findByProperty(ALERT_PROPERTY, alertProperty);
	}

	public List<AreaAlertInfo> findByAlertType(Object alertType) {
		return findByProperty(ALERT_TYPE, alertType);
	}

	public List<AreaAlertInfo> findByAlertValue(Object alertValue) {
		return findByProperty(ALERT_VALUE, alertValue);
	}

	public List<AreaAlertInfo> findByAlertMeasurement(Object alertMeasurement) {
		return findByProperty(ALERT_MEASUREMENT, alertMeasurement);
	}

	public List<AreaAlertInfo> findByAlertRemarks(Object alertRemarks) {
		return findByProperty(ALERT_REMARKS, alertRemarks);
	}

	public List findAll() {
		log.debug("finding all AreaAlertInfo instances");
		try {
			String queryString = "from AreaAlertInfo";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public AreaAlertInfo merge(AreaAlertInfo detachedInstance) {
		log.debug("merging AreaAlertInfo instance");
		try {
			AreaAlertInfo result = (AreaAlertInfo) sessionFactory.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(AreaAlertInfo instance) {
		log.debug("attaching dirty AreaAlertInfo instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(AreaAlertInfo instance) {
		log.debug("attaching clean AreaAlertInfo instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

}