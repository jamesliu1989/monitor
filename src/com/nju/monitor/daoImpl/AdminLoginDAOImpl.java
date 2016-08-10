package com.nju.monitor.daoImpl;


import java.security.MessageDigest;
import java.util.List;

import javax.annotation.Resource;





import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;





import com.nju.monitor.dao.AdminLoginDAO;
import com.nju.monitor.model.User;

@Component("adminLoginDAO")
public class AdminLoginDAOImpl implements AdminLoginDAO {

	private SessionFactory sessionFactory;
	
	/**
	 * 管理员登陆
	 * //1.正确; 2.用户名不存在;3.密码不正确;4.普通用户，权限不够;5.验证码错误
	 */
	
	@Override
	public int login(String userName, String password)
	{
		int flag=0;
		password=getMD5Str(password);
		Session session=sessionFactory.getCurrentSession();
		String hql="from User where userName=:name";
		Query query=session.createQuery(hql);
		query.setString("name", userName);
		List<User> list=query.list();
		if(list==null || 0==list.size())
			flag=2;
		else
		{
			String pw=list.get(0).getPassWord();
			if(pw.equals(password))
			{
				int fg=list.get(0).getFlag();
				if(fg==0)
					flag=4;
				else 
					flag=1;
			}
			else 
				flag=3;
		}
		return flag;
	}
	@Override
	public User getAdmin(String userName) {

		Session session=sessionFactory.getCurrentSession();
		String hql="from User where userName=:name";
		Query query=session.createQuery(hql);
		query.setString("name", userName);
		List<User> list=query.list();
		return list.get(0);
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * 用户登录
	 * 1.正确；2.用户名错误；3.密码错误
	 */
	@Override
	public int userLogin(String userName, String password) {
		int flag=0;
		password=getMD5Str(password);
		Session session=sessionFactory.getCurrentSession();
		String hql="from User where userName=:name";
		Query query=session.createQuery(hql);
		query.setString("name", userName);
		List<User> list=query.list();
		if(list==null || 0==list.size())
			flag=2;
		else
		{
			String pw=list.get(0).getPassWord();
			if(pw.equals(password))			
				flag=1;
			else 
				flag=3;
		}
		return flag;
	} 
	/** 
     * MD5 加密 
     */  
    private String getMD5Str(String password) 
    {  
        MessageDigest messageDigest = null;  
  
        try {  
            messageDigest = MessageDigest.getInstance("MD5");  
            messageDigest.reset();  
            messageDigest.update(password.getBytes("UTF-8"));  
        } 
        catch (Exception e) 
        {  
          e.printStackTrace();  
        }  
        byte[] byteArray = messageDigest.digest();  
        StringBuffer md5StrBuff = new StringBuffer();  
        for (int i = 0; i < byteArray.length; i++) {              
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)  
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));  
            else  
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));  
        }  
        return md5StrBuff.toString();  
    }
}

