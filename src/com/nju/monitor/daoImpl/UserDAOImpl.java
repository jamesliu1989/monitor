package com.nju.monitor.daoImpl;

import java.security.MessageDigest;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.nju.monitor.dao.UserDAO;
import com.nju.monitor.model.SmsReceiver;
import com.nju.monitor.model.User;

@Component("userDAO")
public class UserDAOImpl implements UserDAO {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public int checkUser(String userName) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) as count from User where userName=:userName";
		Query query = session.createQuery(hql);
		query.setString("userName", userName);
		int count = ((Number) query.iterate().next()).intValue();
		return count;
	}

	/**
	 * 用户登录 1.正确；2.用户名错误；3.密码错误
	 */
	@Override
	public int login(String userName, String password) {
		int flag = 0;
		password = getMD5Str(password);
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User where userName=:userName";
		Query query = session.createQuery(hql);
		query.setString("userName", userName);
		List<User> list = query.list();
		if (list == null || 0 == list.size())
			flag = 2;
		else {
			String pw = list.get(0).getPassWord();
			if (pw.equals(password))
				flag = 1;
			else
				flag = 3;
		}
		return flag;
	}

	/**
	 * MD5 加密
	 */
	private String getMD5Str(String password) {
		MessageDigest messageDigest = null;

		try {
			messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.reset();
			messageDigest.update(password.getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		byte[] byteArray = messageDigest.digest();
		StringBuffer md5StrBuff = new StringBuffer();
		for (int i = 0; i < byteArray.length; i++) {
			if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
				md5StrBuff.append("0").append(
						Integer.toHexString(0xFF & byteArray[i]));
			else
				md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
		}
		return md5StrBuff.toString();
	}

	@Override
	public int insertUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		user.setPassWord(getMD5Str(user.getPassWord())); // MD5加密
		session.save(user);
		return 1;
	}

	@Override
	public int updateUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		if (user.getPassWord() != null && !user.getPassWord().equals("")) { // 如果同时修改密码
			String hql = "update User set passWord=:passWord, name=:name, phone=:phone, email=:email, active=:active, flag=:flag where id=:id";
			query = session.createQuery(hql);
			query.setString("passWord", getMD5Str(user.getPassWord()));
		} else {
			String hql = "update User set name=:name, phone=:phone, email=:email, active=:active, flag=:flag where id=:id";
			query = session.createQuery(hql);
		}
		query.setString("name", user.getName());
		query.setString("phone", user.getPhone());
		query.setString("email", user.getEmail());
		query.setInteger("active", user.getActive());
		query.setInteger("flag", user.getFlag());
		query.setInteger("id", user.getId());
		return query.executeUpdate();
	}

	// 密码重置
	@Override
	public int reSetPwd(Integer id, String passWord) {
		int result = 0;
		Session session = sessionFactory.getCurrentSession();
		String hql = "update User set passWord=:passWord where id=:id";
		Query query = session.createQuery(hql);
		query.setString("passWord", getMD5Str(passWord));
		query.setInteger("id", id);
		result = query.executeUpdate();
		return result;
	}

	@Override
	public User findUserByName(String userName) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User where userName=:userName";
		Query query = session.createQuery(hql);
		query.setString("userName", userName);
		return (User) query.list().get(0);
	}

	@Override
	public User findUserById(Integer userId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User where id=:id";
		Query query = session.createQuery(hql);
		query.setInteger("id", userId);
		return (User) query.list().get(0);
	}

	@Override
	public int changePwd(Integer id, String curpwd, String newpwd) {
		User user = findUserById(id);
		if (user.getPassWord().equals(getMD5Str(curpwd))) {
			return reSetPwd(id, newpwd); // 0：系统错误，1：成功
		} else {
			return 2; // 2：当前密码错误
		}

	}

	@Override
	public List<String> findAdmin() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select userName from User where flag>0";
		return session.createQuery(hql).list();
	}

	@Override
	public List<User> findAll() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User";
		return session.createQuery(hql).list();
	}

	@Override
	public int deleteById(Integer userId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "delete User where id=:userId";
		Query query = session.createQuery(hql);
		query.setInteger("userId", userId);
		int result = query.executeUpdate();
		return result;
	}

	@Override
	public List<SmsReceiver> findAllSmsReceiver() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from SmsReceiver where active = 1";
		Query query = session.createQuery(hql);
		return query.list();
	}

	// 更改接收人
	@Override
	public void updateReceiver(List<Integer> idList) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update User set smsReceive = 0";
		Query query = session.createQuery(hql);
		query.executeUpdate();
		if (idList != null) {
			hql = "update User set smsReceive = 1 where id in (:idList)";
			query = session.createQuery(hql);
			query.setParameterList("idList", idList);
			query.executeUpdate();
		}

	}

}
