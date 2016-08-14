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

import com.nju.monitor.model.NodeInfo;

/**
 * A data access object (DAO) providing persistence and search support for
 * NodeInfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.nju.monitor.model.NodeInfo
 * @author MyEclipse Persistence Tools
 */

@Component("NodeInfoDAO")
public class NodeInfoDAO {
	private static final Logger log = LoggerFactory.getLogger(NodeInfoDAO.class);
	
	private SessionFactory sessionFactory;
	// property constants
	public static final String NODE_NO = "nodeNo";
	public static final String NODE_NAME = "nodeName";
	public static final String AREA_NO = "areaNo";
	public static final String CTRLER_NO = "ctrlerNo";
	public static final String NODE_DESC = "nodeDesc";

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void save(NodeInfo transientInstance) {
		log.debug("saving NodeInfo instance");
		try {
			sessionFactory.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public int deleteByNo(String nodeNO){
		try {
			String queryString = "delete from NodeInfo where nodeNO = ?";
			int result = sessionFactory.getCurrentSession()
					     .createQuery(queryString)
					     .setString(0, nodeNO)
					     .executeUpdate();
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public int deleteByCtrlerNo(int ctrlerNo){
		try {
			String queryString = "delete from NodeInfo where ctrlerNo = ?";
			int result = sessionFactory.getCurrentSession()
					     .createQuery(queryString)
					     .setInteger(0, ctrlerNo)
					     .executeUpdate();
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public void delete(NodeInfo persistentInstance) {
		log.debug("deleting NodeInfo instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public NodeInfo findById(java.lang.Integer id) {
		log.debug("getting NodeInfo instance with id: " + id);
		try {
			NodeInfo instance = (NodeInfo) sessionFactory.getCurrentSession().get(
					"com.nju.monitor.model.NodeInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findAllNodeNoByArea(String areaName) {
		List result = null;
		try {
			String queryString = "select nodeNo from NodeInfo where areaName = ?";
			result = sessionFactory.getCurrentSession()
					     .createQuery(queryString)
					     .setParameter(0, areaName).list();			
		} catch (RuntimeException re) {
			throw re;
		}
		return result;
	}
	
	public List findAllActiveNodeNo() {
		List result = null;
		try {
			String queryString = "select nodeNo from NodeInfo where status = 1";
			result = sessionFactory.getCurrentSession()
					     .createQuery(queryString).list();			
		} catch (RuntimeException re) {
			throw re;
		}
		return result;
	}
	
	public List<String> findActiveNodeNoByArea(String areaNo) {
		List result = null;
		try {
			String queryString = "select nodeNo from NodeInfo where areaNo = ? and status = 1";
			result = sessionFactory.getCurrentSession()
					     .createQuery(queryString)
					     .setParameter(0, areaNo).list();			
		} catch (RuntimeException re) {
			throw re;
		}
		return result;
	}
	
	public List<NodeInfo> findActiveNodeByArea(String areaNo) {
		List<NodeInfo> result = null;
		try {
			String queryString = "from NodeInfo where areaNo= ? and status = 1";
			result = sessionFactory.getCurrentSession()
					     .createQuery(queryString)
					     .setParameter(0, areaNo).list();			
		} catch (RuntimeException re) {
			throw re;
		}
		return result;
	}
	
	public List<NodeInfo> findByExample(NodeInfo instance) {
		log.debug("finding NodeInfo instance by example");
		try {
			List<NodeInfo> results = (List<NodeInfo>) sessionFactory.getCurrentSession()
					.createCriteria("com.nju.monitor.model.NodeInfo")
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
		log.debug("finding NodeInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from NodeInfo as model where model."
					+ propertyName + "= ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public long findExitNodeNum(int ctrlerNo) {
		try {
			String queryString = "select count(id) from NodeInfo where ctrlerNo = ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setInteger(0, ctrlerNo);
			return (long) queryObject.uniqueResult();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public long findNodeNum(String areaNo) {
		try {
			String queryString = "select count(id) from NodeInfo where areaNo = ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setString(0, areaNo);
			return (long) queryObject.uniqueResult();
		} catch (RuntimeException re) {
			log.error("find NodeNum failed", re);
			throw re;
		}
	}
	
	public long findActiveNodeNum(String areaNo) {
		try {
			String queryString = "select count(id) from NodeInfo where areaNo = ? and status = 1";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setString(0, areaNo);
			return (long) queryObject.uniqueResult();
		} catch (RuntimeException re) {
			log.error("find NodeNum failed", re);
			throw re;
		}
	}

	
	public int updateNode(NodeInfo nodeInfo) {
		try {
			String queryString = "update NodeInfo set areaNo = ?, nodeName = ?, nodeDesc = ?, status = ? where nodeNo = ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setString(0, nodeInfo.getAreaNo())
			           .setString(1, nodeInfo.getNodeName())
			           .setString(2, nodeInfo.getNodeDesc())
			           .setInteger(3, nodeInfo.getStatus())
			           .setString(4, nodeInfo.getNodeNo());
			           
			return queryObject.executeUpdate();
		} catch (RuntimeException re) {
			log.error("updateNode failed", re);
			throw re;
		}
	}

	public List<NodeInfo> findByNodeNo(Object nodeNo) {
		return findByProperty(NODE_NO, nodeNo);
	}

	public List<NodeInfo> findByNodeName(Object nodeName) {
		return findByProperty(NODE_NAME, nodeName);
	}

	public List<NodeInfo> findByAreaNo(Object areaNo) {
		return findByProperty(AREA_NO, areaNo);
	}

	public List<NodeInfo> findByCtrlerNo(Object ctrlerNo) {
		return findByProperty(CTRLER_NO, ctrlerNo);
	}

	public List<NodeInfo> findByNodeDesc(Object nodeDesc) {
		return findByProperty(NODE_DESC, nodeDesc);
	}

	public List<NodeInfo> findByCtrlerNo(int ctrlerNo) {
		log.debug("finding all NodeInfo instances");
		try {
			String queryString = "from NodeInfo where ctrlerNo = ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString)
					.setInteger(0, ctrlerNo);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/**
	 * 查询所有节点
	 * @param areaNo
	 * @return
	 */
	public List<NodeInfo> findByAreaNo(String areaNo) {
		log.debug("finding all NodeInfo instances");
		try {
			String queryString = "from NodeInfo where areaNo = ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString)
					.setString(0, areaNo);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	/**
	 * 只查询启用节点
	 * @param areaNo
	 * @return
	 */
	public List<NodeInfo> findActiveNodesByAreaNo(String areaNo) {
		log.debug("finding all NodeInfo instances");
		try {
			String queryString = "from NodeInfo where status = 1 and areaNo = ?";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString)
					.setString(0, areaNo);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public NodeInfo merge(NodeInfo detachedInstance) {
		log.debug("merging NodeInfo instance");
		try {
			NodeInfo result = (NodeInfo) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(NodeInfo instance) {
		log.debug("attaching dirty NodeInfo instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(NodeInfo instance) {
		log.debug("attaching clean NodeInfo instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}


	public int updateAreaNo(String areaNo, String newAreaNo) {
		try {
			String queryString = "update NodeInfo set areaNo =:newAreaNo where areaNo =:areaNo";
			Query queryObject = sessionFactory.getCurrentSession().createQuery(queryString);
			queryObject.setString("newAreaNo", newAreaNo)
					.setString("areaNo", areaNo);
			return queryObject.executeUpdate();
		} catch (RuntimeException re) {
			log.error("updateNode failed", re);
			throw re;
		}
	}
}