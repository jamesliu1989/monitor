package com.nju.monitor.service;
import it.sauronsoftware.base64.Base64;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.nju.monitor.dao.UserDAO;
import com.nju.monitor.model.SmsReceiver;
import com.nju.monitor.model.User;

@Component
public class UserService 
{
	private UserDAO userDAO;

	
	public int login(String userName,String password)
	{
		return userDAO.login(userName, password);
	}
	
	public void exit(String name)
	{
		return;
	}
	
	public int checkUser(String userName)
	{
		return userDAO.checkUser(userName);
	}
	
    public int createUser(User user){
    	user.setRegDate(new Timestamp(System.currentTimeMillis()));
    	return userDAO.insertUser(user);
    }

    
    public User findUserByName(String userName){
    	return userDAO.findUserByName(userName);
    }
    
    public User findUserById(Integer userId){
    	return userDAO.findUserById(userId);
    }
    
    public int updateUser(User user){
    	return userDAO.updateUser(user);
    }
    
    public String reSetPwdMail(String activeCode){
		activeCode=Base64.decode(activeCode);
		String userName=activeCode.split("\\|\\$\\%")[0];
		return userName;
    }
    
    public int reSetPwd(Integer id,String passWord){  	
		return userDAO.reSetPwd(id, passWord);   	
    }
    public int changePwd(Integer id,String curpwd,String newpwd){
    	return userDAO.changePwd(id, curpwd, newpwd);
    }
    
    /**
     * 获取所有短信接收者
     * @return
     */
    public List getSmsReceiver(){
    	return userDAO.findAllSmsReceiver();
    }

	public UserDAO getUserDAO() {
		return userDAO;
	}
	@Resource
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public List<User> findAll() {
		List<User> users = userDAO.findAll();
		return users;
	}

	public int deleteUser(Integer userId) {
		return userDAO.deleteById(userId);		
	}

	public void updateReceiver(List<Integer> receiverId) {
		userDAO.updateReceiver(receiverId);		
	}
	

	

}
