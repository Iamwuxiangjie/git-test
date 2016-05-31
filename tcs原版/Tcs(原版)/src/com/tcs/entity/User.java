package com.tcs.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private int userId;// 用户ID
	private String userAccount;// 用户账号
	private String userName;// 用户昵称
	private String userPwd;// 用户密码
	private String userRealName;// 用户真实姓名
	private String userIDCardNum;// 用户身份证号
	private String userSex;// 用户性别
	private String userBirthday;// 用户生日
	private String userPhone;// 用户电话
	private String userImg;// 用户头像
	private String userAddress;// 用户地址
	private String userAddress2;// 用户详细地址
	private String userEmail;// 用户邮箱
	private String userLike;// 用户喜好
	private Set<Comment> comment = new HashSet<Comment>();// 评价，一对多
	private Set<Order> order = new HashSet<Order>();// 订单，一对多
	private Set<Message> messageTo = new HashSet<Message>();
	private Set<Message> messageFrom = new HashSet<Message>();

	public User(int userId, String userAccount, String userName,
			String userPwd, String userRealName, String userIDCardNum,
			String userSex, String userBirthday, String userPhone,
			String userImg, String userAddress, String userAddress2,
			String userEmail, String userLike, Set<Comment> comment,
			Set<Order> order, Set<Message> messageTo, Set<Message> messageFrom) {
		super();
		this.userId = userId;
		this.userAccount = userAccount;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userRealName = userRealName;
		this.userIDCardNum = userIDCardNum;
		this.userSex = userSex;
		this.userBirthday = userBirthday;
		this.userPhone = userPhone;
		this.userImg = userImg;
		this.userAddress = userAddress;
		this.userAddress2 = userAddress2;
		this.userEmail = userEmail;
		this.userLike = userLike;
		this.comment = comment;
		this.order = order;
		this.messageTo = messageTo;
		this.messageFrom = messageFrom;
	}

	public User() {
		super();
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public String getUserIDCardNum() {
		return userIDCardNum;
	}

	public void setUserIDCardNum(String userIDCardNum) {
		this.userIDCardNum = userIDCardNum;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserAddress2() {
		return userAddress2;
	}

	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserLike() {
		return userLike;
	}

	public void setUserLike(String userLike) {
		this.userLike = userLike;
	}

	public Set<Comment> getComment() {
		return comment;
	}

	public void setComment(Set<Comment> comment) {
		this.comment = comment;
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
