package com.nju.monitor.aop;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.aspectj.lang.JoinPoint;

import com.nju.monitor.model.Logs;

public class AdminAOP 
{
	private SessionFactory sessionFactory;
	
	public void loginSuccess(JoinPoint point)
	{
		Logs logs=new Logs();
		
		Object[] args=point.getArgs();
		if(args!=null)
			logs.setUserName((String)args[0]);
		logs.setLogContent((String)args[0]+"，成功登陆系统");
		Session session=sessionFactory.getCurrentSession();
		session.save(logs);
	}
		
	public void exitSuccess(JoinPoint point)
	{
		Logs logs=new Logs();
		Object[] args=point.getArgs();
		if(args!=null)
			logs.setUserName((String)args[0]);
		logs.setLogContent((String)args[0]+"，退出系统");
		Session session=sessionFactory.getCurrentSession();
		session.save(logs);
	}
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	

}
