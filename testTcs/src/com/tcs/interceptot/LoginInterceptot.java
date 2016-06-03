package com.tcs.interceptot;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.tcs.entity.User;

public class LoginInterceptot extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		String url = ServletActionContext.getRequest().getRequestURL()
				.toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		if (url.indexOf("login.action") != -1
				|| url.indexOf("logout.action") != -1
				|| url.indexOf("getLikeServices") != -1
				|| url.indexOf("forwardto") != -1
				|| url.indexOf("Register") != -1
				|| url.indexOf("register") != -1
				|| url.indexOf("forgetpwd") != -1
				|| url.indexOf("toEmailBack") != -1
				|| url.indexOf("rePwd") != -1
				|| url.indexOf("admin") != -1) {
			return invocation.invoke();
		} else {
			// 验证Session是否过期
			if (!ServletActionContext.getRequest().isRequestedSessionIdValid()) {
				// session过期,转向session过期提示页,最终跳转至登录页面
				return "toindex";
			} else if (ServletActionContext.getRequest().getSession()
					.getAttribute("loginUser") != null
					&& url.indexOf("/user") != -1) {
				return invocation.invoke();
			} else if (ServletActionContext.getRequest().getSession()
					.getAttribute("loginCompany") != null
					&& url.indexOf("/company") != -1) {
				return invocation.invoke();
			} else if (ServletActionContext.getRequest().getSession()
					.getAttribute("loginAdmin") != null
					&& url.indexOf("/admin") != -1) {
				return invocation.invoke();
			}
		}
		return "toindex";
	}

}
