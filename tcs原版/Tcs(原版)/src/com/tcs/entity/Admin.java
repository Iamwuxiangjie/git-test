package com.tcs.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Admin implements Serializable {
	private static final long serialVersionUID = 1L;
	private int adminId;// 管理员ID
	private String adminAccount;// 管理员账号
	private String adminName;// 管理员昵称
	private String adminPwd;// 管理员密码
	private String adminImg;// 管理员头像
	private String adminPhone;// 管理员电话
	private Set<Message> messageTo = new HashSet<Message>();
	private Set<Message> messageFrom = new HashSet<Message>();

	public Admin(int adminId, String adminAccount, String adminName,
			String adminPwd, String adminImg, String adminPhone,
			Set<Message> messageTo, Set<Message> messageFrom) {
		super();
		this.adminId = adminId;
		this.adminAccount = adminAccount;
		this.adminName = adminName;
		this.adminPwd = adminPwd;
		this.adminImg = adminImg;
		this.adminPhone = adminPhone;
		this.messageTo = messageTo;
		this.messageFrom = messageFrom;
	}

	public Admin() {
		super();
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getAdminAccount() {
		return adminAccount;
	}

	public void setAdminAccount(String adminAccount) {
		this.adminAccount = adminAccount;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public String getAdminImg() {
		return adminImg;
	}

	public void setAdminImg(String adminImg) {
		this.adminImg = adminImg;
	}

	public String getAdminPhone() {
		return adminPhone;
	}

	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}

	public Set<Message> getMessageTo() {
		return messageTo;
	}

	public void setMessageTo(Set<Message> messageTo) {
		this.messageTo = messageTo;
	}

	public Set<Message> getMessageFrom() {
		return messageFrom;
	}

	public void setMessageFrom(Set<Message> messageFrom) {
		this.messageFrom = messageFrom;
	}

}
