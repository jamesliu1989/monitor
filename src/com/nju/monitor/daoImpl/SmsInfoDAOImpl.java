package com.nju.monitor.daoImpl;


import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.SmsInfo;

@Component("smsInfoDAO")
public class SmsInfoDAOImpl{

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public SmsInfo findSmsInfoById(int id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from SmsInfo where id=:id";
		Query query = session.createQuery(hql);
		query.setInteger("id", id);
		return (SmsInfo) query.list().get(0);
	}

	public void updateSmsInfo(SmsInfo smsInfo) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(smsInfo);		
	}
}
