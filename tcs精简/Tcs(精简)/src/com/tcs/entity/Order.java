package com.tcs.entity;

import java.io.Serializable;

public class Order implements Serializable {
	private static final long serialVersionUID = 1L;
	private int orderId;// 订单ID
	private User order_user;// 用户ID，外键
	private Service order_service;// 产品ID，外键
	private Company order_company;// 公司ID，外键
	private String orderNum;// 订单号
	private String orderTime;// 下单时间
	private String orderStartTime;// 开始时间
	private int orderServiceAmount;// 购买次数
	private int orderStage;// 订单状态
	private float orderCost;// 订单金额
	private String orderComEndTime;// 公司确认完成时间
	private String orderEndTime;// 订单完成时间
	public Order(int orderId, User order_user, Service order_service,
			Company order_company, String orderNum, String orderTime,
			String orderStartTime, int orderServiceAmount, int orderStage,
			float orderCost, String orderComEndTime, String orderEndTime) {
		super();
		this.orderId = orderId;
		this.order_user = order_user;
		this.order_service = order_service;
		this.order_company = order_company;
		this.orderNum = orderNum;
		this.orderTime = orderTime;
		this.orderStartTime = orderStartTime;
		this.orderServiceAmount = orderServiceAmount;
		this.orderStage = orderStage;
		this.orderCost = orderCost;
		this.orderComEndTime = orderComEndTime;
		this.orderEndTime = orderEndTime;
	}
	public Order() {
		super();
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public User getOrder_user() {
		return order_user;
	}
	public void setOrder_user(User order_user) {
		this.order_user = order_user;
	}
	public Service getOrder_service() {
		return order_service;
	}
	public void setOrder_service(Service order_service) {
		this.order_service = order_service;
	}
	public Company getOrder_company() {
		return order_company;
	}
	public void setOrder_company(Company order_company) {
		this.order_company = order_company;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public String getOrderStartTime() {
		return orderStartTime;
	}
	public void setOrderStartTime(String orderStartTime) {
		this.orderStartTime = orderStartTime;
	}
	public int getOrderServiceAmount() {
		return orderServiceAmount;
	}
	public void setOrderServiceAmount(int orderServiceAmount) {
		this.orderServiceAmount = orderServiceAmount;
	}
	public int getOrderStage() {
		return orderStage;
	}
	public void setOrderStage(int orderStage) {
		this.orderStage = orderStage;
	}
	public float getOrderCost() {
		return orderCost;
	}
	public void setOrderCost(float orderCost) {
		this.orderCost = orderCost;
	}
	public String getOrderComEndTime() {
		return orderComEndTime;
	}
	public void setOrderComEndTime(String orderComEndTime) {
		this.orderComEndTime = orderComEndTime;
	}
	public String getOrderEndTime() {
		return orderEndTime;
	}
	public void setOrderEndTime(String orderEndTime) {
		this.orderEndTime = orderEndTime;
	}

}
