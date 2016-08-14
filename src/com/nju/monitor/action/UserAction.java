package com.nju.monitor.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nju.monitor.model.SystemConfig;
import com.nju.monitor.service.SystemService;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nju.monitor.model.User;
import com.nju.monitor.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@Component
@Scope("prototype")
public class UserAction extends ActionSupport implements ServletRequestAware, ServletResponseAware{

	
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private SystemService systemService;
	private User user;
	private List<User> users;
	private String userName;
	private String passWord;
	private Integer userId;
	private String curpwd;
	private String newpwd;
	private String code;
	private int result;	//1.正确; 2.用户名不存在;3.密码不正确;4.普通用户，权限不够;5.验证码错误
		
	private Map<String, Object> dataMap;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	/**
	 * 用户登录
	 * @return
	 * @throws IOException 
	 */
	public String login() throws IOException
	{
		result = userService.login(userName, passWord);
		if (1 == result) {
			User loginUser = userService.findUserByName(userName);
			if(loginUser.getActive() == 1){
				SystemConfig config = systemService.findConfig();
				ActionContext.getContext().getSession().put("user", loginUser);
				ActionContext.getContext().getSession().put("config", config);
				return "SUCCESS";
			}else{
				PrintWriter out=response.getWriter();
				out.print(1);
				out.flush();
				return null;
			}

		}else {
			PrintWriter out=response.getWriter();
			out.print(0);
			out.flush();
			return null;
		}	
		
	}
	/**
	 * 登录退出
	 * @return
	 */
	public String exit()
	{
		User loginUser = (User)ActionContext.getContext().getSession().get("user");
		if(loginUser != null){	
			ActionContext.getContext().getSession().put("user", null);
			ActionContext.getContext().getSession().remove("user");
			userService.exit(loginUser.getUserName());
		}
		return "LOGOUT";
	}
	/**
	 * *********仅测试使用**********
	 * 异步检测用户名是否已经注册
	 * @return 该用户注册的用户个数
	 * @throws Exception
	 */
	@Deprecated
	public String checkName() throws Exception
	{
		int result=userService.checkUser(user.getUserName());
		PrintWriter out=response.getWriter();
		out.print(result);
		out.flush();
		return null;
	}
	public void loginCheck() throws IOException{
		int status = 0;
		User sessionUser = (User) request.getSession().getAttribute("user");
		if(sessionUser!=null){
			status = 1;
		}
		PrintWriter out=response.getWriter();
		out.print(status);
		out.flush();
	}
	/**
	 * 异步注册用户
	 * @return 0.用户名不可用
	 * @return 1.插入成功
	 * @return 2.用户名可用，但插入失败
	 * @throws Exception
	 */
	public void register() throws Exception
	{
		int checkResult = userService.checkUser(user.getUserName());
		PrintWriter out=response.getWriter();
		if(checkResult==1){
			out.print(0);    //代表用户名不可用
			out.flush();
		}else{
		  int insertResult = userService.createUser(user);
		  if(insertResult==1){
		      out.print(1);     //代表插入成功
		      out.flush();
		  }else{
			  out.print(2);   //代表用户名可用，但插入失败
			  out.flush(); 
		  }
		}
	}
	
	/**
	 * 用户一览
	 * @return
	 */
	public String userView(){
		User sessionUser = (User) request.getSession().getAttribute("user");
		if(sessionUser.getFlag() != 0){
			users = userService.findAll();
			return "USERVIEW";
		}else{
			return "ERROR";
		}
	}
	
	/**
	 * 删除用户
	 * @return
	 * @throws IOException 
	 */
	public void deleteUser() throws IOException{
		User sessionUser = (User) request.getSession().getAttribute("user");
		User delUser = userService.findUserById(userId);
		int result = 0;          //0:失败，1：成功v
		//只有一般管理员以上可以删除，且该管理员权限大于待删用户权限
		if( sessionUser != null && sessionUser.getFlag() >= 1 && sessionUser.getFlag() > delUser.getFlag()){
			result = userService.deleteUser(userId);
		}
		PrintWriter out = response.getWriter();
		out.print(result);    
		out.flush();
	}
	
	/**
	 * 修改用户信息，用于管理员修改
	 * @return
	 */
	public String userEdit(){
		User sessionUser = (User) request.getSession().getAttribute("user");
		User delUser = userService.findUserById(user.getId());
		if(sessionUser == null){
			return "FAIL";
		}
		//一般管理员以上权限可以修改,且该管理员权限大于待修改用户权限,超级管理员可做任意修改
		if(user != null && (sessionUser.getFlag() >= 1 && sessionUser.getFlag() > delUser.getFlag()) || sessionUser.getFlag()==2){  
		  userService.updateUser(user);
		}
		user = null;
		users = userService.findAll();
		return "USERVIEW";
	}
	
	/**
	 * 修改用户信息,用于用户自己修改
	 * @return
	 * @throws IOException 
	 */
	public void userSelfEdit() throws IOException{
		User sessionUser = (User) request.getSession().getAttribute("user");
		int result = 0;
		if(user != null){
			sessionUser.setPassWord(null);  //密码不做修改
			sessionUser.setName(user.getName());
			sessionUser.setPhone(user.getPhone());
			sessionUser.setEmail(user.getEmail());
		    result = userService.updateUser(sessionUser);
		}
		PrintWriter out = response.getWriter();
		out.print(result);    
		out.flush();
	}
	
	/**
	 * 密码修改 
	 * @return null 
	 * @throws IOException 
	 * 		   
	 */
	public void changePwd() throws IOException{
		User sessionUser = (User)request.getSession().getAttribute("user");
		//0：系统错误，1：成功 ,2：当前密码错误
		int result = userService.changePwd(sessionUser.getId(), curpwd, newpwd);
		PrintWriter out = response.getWriter();
		out.print(result);    
		out.flush();  		
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setCurpwd(String curpwd) {
		this.curpwd = curpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	public int getResult() {
		return result;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<User> getUsers() {
		return users;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
	    this.request = request;	
	}

	@Resource
	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}
}
