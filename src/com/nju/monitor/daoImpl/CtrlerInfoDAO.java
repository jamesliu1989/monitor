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

import com.nju.monitor.model.CtrlerInfo;

/**
 * A data access object (DAO) providing persistence and search support for
 * CtrlerInfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.nju.monitor.model.CtrlerInfo
 * @author MyEclipse Persistence Tools
 */
@Component("CtrlerInfoDAO")
public class CtrlerInfoDAO{
	private static final Logger log = LoggerFactory
			.getLogger(CtrlerInfoDAO.class);
	private SessionFactory sessionFactory;
	// property constants
	public static final String CTRLER_NO = "ctrlerNo";
	public static final String NODE_NUM = "nodeNum";

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public int save(CtrlerInfo transientInstance) {
		log.debug("saving CtrlerInfo instance");
		try {
			sessionFactory.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		return transientInstance.getId();
	}

	public void delete(CtrlerInfo persistentInstance) {
		log.debug("deleting CtrlerInfo instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CtrlerInfo findById(java.lang.Integer id) {
		log.debug("getting CtrlerInfo instance with id: " + id);
		try {
			CtrlerInfo instance = (CtrlerInfo) sessionFactory.getCurrentSession().get(
					"com.nju.monitor.model.CtrlerInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<CtrlerInfo> findByExample(CtrlerInfo instance) {
		log.debug("finding CtrlerInfo instance by example");
		try {
			List<CtrlerInfo> results = (List<CtrlerInfo>) sessionFactory.getCurrentSession()
					.createCriteria("com.nju.monitor.model.CtrlerInfo")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public int updateCtrlerDesc(int ctrlerNo, String ctrlerDesc, Integer status){
		try {
			String queryString = "update CtrlerInfo set ctrlerDesc = ?, status = ? where ctrlerNo = ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setString(0, ctrlerDesc)
					.setInteger(1, status)
			.setInteger(2, ctrlerNo);
			return queryObject.executeUpdate();
		} catch (RuntimeException re) {
			log.error("update ctrler failed", re);
			throw re;
		}
	}
	
	public int deleteCtrler(int ctrlerNo){
		try {
			String queryString = "delete CtrlerInfo where ctrlerNo = ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setInteger(0, ctrlerNo);
			return queryObject.executeUpdate();
		} catch (RuntimeException re) {
			log.error("delete ctrler failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding CtrlerInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CtrlerInfo as model where model."
					+ propertyName + "= ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<CtrlerInfo> findByCtrlerNo(Object ctrlerNo) {
		return findByProperty(CTRLER_NO, ctrlerNo);
	}

	public List<CtrlerInfo> findByNodeNum(Object nodeNum) {
		return findByProperty(NODE_NUM, nodeNum);
	}

	public List findAll() {
		log.debug("finding all CtrlerInfo instances");
		try {
			String queryString = "from CtrlerInfo order by ctrlerNo asc";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAllNo() {
		log.debug("finding all CtrlerInfo instances");
		try {
			String queryString = "select ctrlerNo from CtrlerInfo order by ctrlerNo asc";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CtrlerInfo merge(CtrlerInfo detachedInstance) {
		log.debug("merging CtrlerInfo instance");
		try {
			CtrlerInfo result = (CtrlerInfo) sessionFactory.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CtrlerInfo instance) {
		log.debug("attaching dirty CtrlerInfo instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CtrlerInfo instance) {
		log.debug("attaching clean CtrlerInfo instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}