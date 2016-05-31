package com.tcs.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Company implements Serializable {
	private static final long serialVersionUID = 1L;
	private int companyId;// 公司ID
	private FacilitatorType company_facilitatorType;// 服务类别ID，外键
	private String companyName;// 公司名称
	private String companyAccount;// 公司账号
	private String companyPwd;// 公司密码
	private String companyAddress;// 公司地址
	private String companyAddress2;// 公司详细地址
	private String companyServiceScope;// 公司服务范围
	private String companyPhone;// 公司电话
	private String companyEmail;// 公司邮箱
	private String companyLicenseImg;// 公司执照图片
	private String companyImg;// 公司图片
	private String companySummary;// 公司简介
	private int companyStage;// 公司状态
	private float companyGrade;// 公司星级
	private Set<Comment> comment = new HashSet<Comment>();// 评价表，一对多
	private Set<Service> service = new HashSet<Service>();// 产品表，一对多
	private Set<Order> order = new HashSet<Order>();// 订单，一对多
	private Set<Message> messageTo = new HashSet<Message>();// 消息表，一对多
	private Set<Message> messageFrom = new HashSet<Message>();
	public Company(int companyId, FacilitatorType company_facilitatorType,
			String companyName, String companyAccount, String companyPwd,
			String companyAddress, String companyAddress2,
			String companyServiceScope, String companyPhone,
			String companyEmail, String companyLicenseImg, String companyImg,
			String companySummary, int companyStage, float companyGrade,
			Set<Comment> comment, Set<Service> service, Set<Order> order,
			Set<Message> messageTo, Set<Message> messageFrom) {
		super();
		this.companyId = companyId;
		this.company_facilitatorType = company_facilitatorType;
		this.companyName = companyName;
		this.companyAccount = companyAccount;
		this.companyPwd = companyPwd;
		this.companyAddress = companyAddress;
		this.companyAddress2 = companyAddress2;
		this.companyServiceScope = companyServiceScope;
		this.companyPhone = companyPhone;
		this.companyEmail = companyEmail;
		this.companyLicenseImg = companyLicenseImg;
		this.companyImg = companyImg;
		this.companySummary = companySummary;
		this.companyStage = companyStage;
		this.companyGrade = companyGrade;
		this.comment = comment;
		this.service = service;
		this.order = order;
		this.messageTo = messageTo;
		this.messageFrom = messageFrom;
	}
	public Company() {
		super();
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public FacilitatorType getCompany_facilitatorType() {
		return company_facilitatorType;
	}
	public void setCompany_facilitatorType(FacilitatorType company_facilitatorType) {
		this.company_facilitatorType = company_facilitatorType;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyAccount() {
		return companyAccount;
	}
	public void setCompanyAccount(String companyAccount) {
		this.companyAccount = companyAccount;
	}
	public String getCompanyPwd() {
		return companyPwd;
	}
	public void setCompanyPwd(String companyPwd) {
		this.companyPwd = companyPwd;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public String getCompanyAddress2() {
		return companyAddress2;
	}
	public void setCompanyAddress2(String companyAddress2) {
		this.companyAddress2 = companyAddress2;
	}
	public String getCompanyServiceScope() {
		return companyServiceScope;
	}
	public void setCompanyServiceScope(String companyServiceScope) {
		this.companyServiceScope = companyServiceScope;
	}
	public String getCompanyPhone() {
		return companyPhone;
	}
	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}
	public String getCompanyEmail() {
		return companyEmail;
	}
	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}
	public String getCompanyLicenseImg() {
		return companyLicenseImg;
	}
	public void setCompanyLicenseImg(String companyLicenseImg) {
		this.companyLicenseImg = companyLicenseImg;
	}
	public String getCompanyImg() {
		return companyImg;
	}
	public void setCompanyImg(String companyImg) {
		this.companyImg = companyImg;
	}
	public String getCompanySummary() {
		return companySummary;
	}
	public void setCompanySummary(String companySummary) {
		this.companySummary = companySummary;
	}
	public int getCompanyStage() {
		return companyStage;
	}
	public void setCompanyStage(int companyStage) {
		this.companyStage = companyStage;
	}
	public float getCompanyGrade() {
		return companyGrade;
	}
	public void setCompanyGrade(float companyGrade) {
		this.companyGrade = companyGrade;
	}
	public Set<Comment> getComment() {
		return comment;
	}
	public void setComment(Set<Comment> comment) {
		this.comment = comment;
	}
	public Set<Service> getService() {
		return service;
	}
	public void setService(Set<Service> service) {
		this.service = service;
	}
	public Set<Order> getOrder() {
		return order;
	}
	public void setOrder(Set<Order> order) {
		this.order = order;
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
