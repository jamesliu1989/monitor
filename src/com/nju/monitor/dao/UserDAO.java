package com.nju.monitor.dao;

import java.util.List;

import com.nju.monitor.model.SmsReceiver;
import com.nju.monitor.model.User;

public interface UserDAO {

	public abstract int checkUser(String userName);
	public abstract int insertUser(User user);
    public abstract int updateUser(User user);
    public abstract User findUserByName(String userName);
    public abstract int reSetPwd(Integer id,String passWord);
    public abstract int changePwd(Integer id,String curpwd,String newpwd);
	public abstract List<String> findAdmin();
	public abstract int login(String userName,String password);
	public abstract List<User> findAll();
	public abstract int deleteById(Integer userId);
	public abstract User findUserById(Integer userId);
	public abstract List<SmsReceiver> findAllSmsReceiver();
	public abstract void updateReceiver(List<Integer> receiverId);
}
