package com.nju.monitor.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * 对jsp资源进行访问过滤
 * @author james
 *
 */
public class LoginFilter implements Filter {
	public void destroy() {
		// TODO Auto-generated method stub

	}
    
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String request_uri = req.getRequestURI(); 

		//对登录用户或者media资源放行
		if (req.getSession().getAttribute("user") != null
				|| request_uri.contains("media")){
			filterChain.doFilter(request, response);
		}else {
			req.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}
}
