package com.tcs.action;

import java.util.Random;

import com.tcs.dao.CompanyDAO;
import com.tcs.dao.UserDAO;
import com.tcs.daoimpl.CompanyDAOImpl;
import com.tcs.daoimpl.UserDAOImpl;
import com.tcs.email.Email;
import com.tcs.entity.Company;
import com.tcs.entity.User;

public class PersonAction extends SuperAction {
	private static final long serialVersionUID = 1L;
	private String account;
	private String pwd;
	private String person;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	// 登录，获取登录角色并转移登录方法
	public String login() {
		if (person.equals("user")) {
			request.setAttribute("userAccount", account);
			request.setAttribute("userPwd", pwd);
			return "user_login";
		} else {
			request.setAttribute("companyAccount", account);
			request.setAttribute("companyPwd", pwd);
			return "company_login";
		}
	}

	// 转接到用户注册
	public String register() {
		if(request.getParameter("square-radio").equals("user")){
			return "user_register";
		}else{
			return "company_register";
		}
	}

	public String forgetpwd() {
		if (person.equals("user")) {
			String acc = request.getParameter("acc");
			UserDAO udao = new UserDAOImpl();
			User u = udao.getUserByAcc(acc);
			if (u != null) {
				session.setAttribute("user", u);
				return "userforget_success";
			} else {
				this.addFieldError("error", "账号错误");
				return "forget_failure";
			}
		} else {
			String acc = request.getParameter("acc");
			CompanyDAO cdao = new CompanyDAOImpl();
			Company c = cdao.getCompanyByAcc(acc);
			if (c != null) {
				session.setAttribute("company", c);
				return "companyforget_success";
			} else {
				this.addFieldError("error", "账号错误");
				return "forget_failure";
			}
		}
	}

	public String toEmailBack() {
		User u = (User) session.getAttribute("user");
		Company c = (Company) session.getAttribute("company");
		String personEmail = null;
		if (u != null) {
			personEmail = u.getUserEmail();
		} else if(c != null){
			personEmail = c.getCompanyEmail();
		}
		String email = request.getParameter("email");
		if (personEmail != null) {
			if (email.equals(personEmail)) {
				try {
					String rd = Email.sendEmailToBind(personEmail, 1);
					session.setAttribute("rd", rd);
					return "toemailback_success";
				} catch (Exception e1) {
					this.addFieldError("error", "邮箱发送错误");
					return "toemailback_failure";
				}
			} else {
				this.addFieldError("error", "绑定邮箱错误！");
				return "toemailback_failure";
			}
		} else {
			this.addFieldError("error", "您未绑定邮箱，暂无方式找回密码");
			return "toemailback_failure";
		}
	}
	
	public String rePwd(){
		String vc = request.getParameter("verification");
		User u = (User) session.getAttribute("user");
		Company c = (Company) session.getAttribute("company");
		if(session.getAttribute("rd").equals(vc)){
			if(u!=null){
				int random = new Random().nextInt(1000000);
				String rd = String.valueOf(random);
				u.setUserPwd(rd);
				request.setAttribute("repwd", rd);
				session.removeAttribute("user");
				session.removeAttribute("rd");
				UserDAO udao = new UserDAOImpl();
				udao.updateUser(u);
				return "repwd_success";
			}else if(c!=null){
				int random = new Random().nextInt(1000000);
				String rd = String.valueOf(random);
				c.setCompanyPwd(rd);
				request.setAttribute("repwd", rd);
				session.removeAttribute("company");
				session.removeAttribute("rd");
				CompanyDAO cdao = new CompanyDAOImpl();
				cdao.companyUpdate(c);
				return "repwd_success";
			}
			this.addFieldError("Error", "未知错误，请稍后再试");
			return "repwd_failure";
		}else{
			this.addFieldError("Error", "验证码错误");
			return "repwd_failure";
		}
	}

}
