package com.nju.monitor.dao;

import com.nju.monitor.model.User;


public interface AdminLoginDAO {

	public abstract int login(String userName,String password);
	public abstract int userLogin(String userName,String password);
	public abstract User getAdmin(String userName);
}
