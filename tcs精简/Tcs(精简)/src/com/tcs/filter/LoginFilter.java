package com.tcs.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.entity.User;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
		FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		// 获得用户请求的URI
		String path = servletRequest.getRequestURI();
		if (path.indexOf("login.jsp") > -1||path.indexOf("/web") > -1) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		if ((path.indexOf("/user") > -1)&&session.getAttribute("loginUser") != null) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}else if ((path.indexOf("/admin") > -1)) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}else if ((path.indexOf("/company") > -1)&&session.getAttribute("loginCompany") != null) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}else{
			servletResponse.sendRedirect("/testTcs/web/index.jsp");
			return;
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
