package com.tcs.entity;

public class Message {
	private int messageId;
	private Company messageToCompany;
	private User messageToUser;
	private Admin messageToAdmin;
	private Company messageFromCompany;
	private User messageFromUser;
	private Admin messageFromAdmin;
	private String messageTime;
	private String messageTitle;
	private String messageBody;
	private int messageStage;
	public Message(int messageId, Company messageToCompany, User messageToUser,
			Admin messageToAdmin, Company messageFromCompany,
			User messageFromUser, Admin messageFromAdmin, String messageTime,
			String messageTitle, String messageBody, int messageStage) {
		super();
		this.messageId = messageId;
		this.messageToCompany = messageToCompany;
		this.messageToUser = messageToUser;
		this.messageToAdmin = messageToAdmin;
		this.messageFromCompany = messageFromCompany;
		this.messageFromUser = messageFromUser;
		this.messageFromAdmin = messageFromAdmin;
		this.messageTime = messageTime;
		this.messageTitle = messageTitle;
		this.messageBody = messageBody;
		this.messageStage = messageStage;
	}
	
	public Message(Admin messageToAdmin, String messageTime,
			String messageTitle, String messageBody, int messageStage) {
		super();
		this.messageToAdmin = messageToAdmin;
		this.messageTime = messageTime;
		this.messageTitle = messageTitle;
		this.messageBody = messageBody;
		this.messageStage = messageStage;
	}

	public Message() {
		super();
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public Company getMessageToCompany() {
		return messageToCompany;
	}
	public void setMessageToCompany(Company messageToCompany) {
		this.messageToCompany = messageToCompany;
	}
	public User getMessageToUser() {
		return messageToUser;
	}
	public void setMessageToUser(User messageToUser) {
		this.messageToUser = messageToUser;
	}
	public Admin getMessageToAdmin() {
		return messageToAdmin;
	}
	public void setMessageToAdmin(Admin messageToAdmin) {
		this.messageToAdmin = messageToAdmin;
	}
	public Company getMessageFromCompany() {
		return messageFromCompany;
	}
	public void setMessageFromCompany(Company messageFromCompany) {
		this.messageFromCompany = messageFromCompany;
	}
	public User getMessageFromUser() {
		return messageFromUser;
	}
	public void setMessageFromUser(User messageFromUser) {
		this.messageFromUser = messageFromUser;
	}
	public Admin getMessageFromAdmin() {
		return messageFromAdmin;
	}
	public void setMessageFromAdmin(Admin messageFromAdmin) {
		this.messageFromAdmin = messageFromAdmin;
	}
	public String getMessageTime() {
		return messageTime;
	}
	public void setMessageTime(String messageTime) {
		this.messageTime = messageTime;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getMessageBody() {
		return messageBody;
	}
	public void setMessageBody(String messageBody) {
		this.messageBody = messageBody;
	}
	public int getMessageStage() {
		return messageStage;
	}
	public void setMessageStage(int messageStage) {
		this.messageStage = messageStage;
	}

}
