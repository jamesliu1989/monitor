package com.nju.monitor.interceptor;

import com.nju.monitor.action.UserAction;
import com.nju.monitor.model.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginCheck extends AbstractInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8129405070376846150L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		User user = (User) actionInvocation.getInvocationContext().getSession().get("user");
		Object action = actionInvocation.getAction();
		if(action instanceof UserAction || user != null){	
			return actionInvocation.invoke();
		}else{
		    return "loginError";
		}
	}
      
}
