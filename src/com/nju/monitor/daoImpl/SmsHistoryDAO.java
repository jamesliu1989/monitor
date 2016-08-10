package com.nju.monitor.daoImpl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.enterprise.inject.New;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.SmsHistory;

/**
 * A data access object (DAO) providing persistence and search support for
 * SmsHistory entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.nju.monitor.model.SmsHistory
 * @author MyEclipse Persistence Tools
 */

@Component("SmsHistoryDAO")
public class SmsHistoryDAO{
	private static final Logger log = LoggerFactory
			.getLogger(SmsHistoryDAO.class);
	// property constants
	public static final String SMS_RECEIVER = "smsReceiver";
	public static final String SMS_RECV_PHONE = "smsRecvPhone";
	public static final String SMS_CONTENT = "smsContent";
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * 按时间分页查询
	 * @param page
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<SmsHistory> findByTime(int page, Timestamp startTime, Timestamp endTime) {
		try {
			if(startTime==null && endTime==null){
				String queryString = "from SmsHistory order by smsSendTime desc";
				return sessionFactory.getCurrentSession().createQuery(queryString)
						.setFirstResult(page*10)
						.setMaxResults(10)
						.list();
			}else if(startTime == null){
				String queryString = "from SmsHistory where smsSendTime >= ? order by smsSendTime desc";
				return sessionFactory.getCurrentSession().createQuery(queryString)
						.setParameter(0, startTime)
						.setFirstResult(page*10)
						.setMaxResults(10)
						.list();
			}else {
				String queryString = "from SmsHistory where smsSendTime between ? and ? order by smsSendTime desc";
				return sessionFactory.getCurrentSession().createQuery(queryString)
						.setParameter(0, startTime)
						.setParameter(1, endTime)
						.setFirstResult(page*10)
						.setMaxResults(10)
						.list();
			}			
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public long findByTimeCount(Timestamp startTime, Timestamp endTime) {
		try {
			if(startTime==null && endTime==null){
				String queryString = "select count(id) from SmsHistory order by smsSendTime desc";
				return (long) sessionFactory.getCurrentSession().createQuery(queryString)
						.uniqueResult();
			}else if(startTime == null){
				String queryString = "select count(id) from SmsHistory where smsSendTime between ? and ? order by smsSendTime desc";
				return (long) sessionFactory.getCurrentSession().createQuery(queryString)
						.setParameter(0, startTime)
						.setParameter(1, new Timestamp(System.currentTimeMillis()))
						.uniqueResult();
			}else {
				String queryString = "select count(id) from SmsHistory where smsSendTime between ? and ? order by smsSendTime desc";
				return (long) sessionFactory.getCurrentSession().createQuery(queryString)
						.setParameter(0, startTime)
						.setParameter(1, endTime)
						.uniqueResult();
			}			
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public void save(SmsHistory transientInstance) {
		log.debug("saving SmsHistory instance");
		try {
			sessionFactory.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SmsHistory persistentInstance) {
		log.debug("deleting SmsHistory instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SmsHistory findById(java.lang.Integer id) {
		log.debug("getting SmsHistory instance with id: " + id);
		try {
			SmsHistory instance = (SmsHistory) sessionFactory.getCurrentSession().get(
					"com.nju.monitor.model.SmsHistory", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<SmsHistory> findByExample(SmsHistory instance) {
		log.debug("finding SmsHistory instance by example");
		try {
			List<SmsHistory> results = (List<SmsHistory>) sessionFactory.getCurrentSession()
					.createCriteria("com.nju.monitor.model.SmsHistory")
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
		log.debug("finding SmsHistory instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from SmsHistory as model where model."
					+ propertyName + "= ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<SmsHistory> findBySmsReceiver(Object smsReceiver) {
		return findByProperty(SMS_RECEIVER, smsReceiver);
	}

	public List<SmsHistory> findBySmsRecvPhone(Object smsRecvPhone) {
		return findByProperty(SMS_RECV_PHONE, smsRecvPhone);
	}

	public List<SmsHistory> findBySmsContent(Object smsContent) {
		return findByProperty(SMS_CONTENT, smsContent);
	}

	public List findAll() {
		log.debug("finding all SmsHistory instances");
		try {
			String queryString = "from SmsHistory";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SmsHistory merge(SmsHistory detachedInstance) {
		log.debug("merging SmsHistory instance");
		try {
			SmsHistory result = (SmsHistory) sessionFactory.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SmsHistory instance) {
		log.debug("attaching dirty SmsHistory instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SmsHistory instance) {
		log.debug("attaching clean SmsHistory instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

}