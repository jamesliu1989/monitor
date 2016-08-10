package com.nju.monitor.service;
import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.dao.AdminLoginDAO;
import com.nju.monitor.model.User;


@Component
public class AdminLoginService 
{
	private AdminLoginDAO adminLoginDAO;

	public int adminLogin(String userName,String password)
	{
		return adminLoginDAO.login(userName, password);
	}
	public int userLogin(String userName,String password)
	{
		return adminLoginDAO.userLogin(userName, password);
	}
	public User getAdmin(String userName)
	{
		return adminLoginDAO.getAdmin(userName);
	}
	public void exit(String name)
	{
		return;
	}
	
	public AdminLoginDAO getAdminLoginDAO() {
		return adminLoginDAO;
	}
    @Resource
	public void setAdminLoginDAO(AdminLoginDAO adminLoginDAO) {
		this.adminLoginDAO = adminLoginDAO;
	}
	
	
	
	

}
