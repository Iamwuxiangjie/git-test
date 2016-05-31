package com.tcs.entity;

public class Top {
	private int order_serviceId;
	private int order_companyId;
	private int counts;
	private float money;
	private String serviceName;
	private String companyName;

	public Top(int order_serviceId, int order_companyId, int counts,
			float money, String serviceName, String companyName) {
		super();
		this.order_serviceId = order_serviceId;
		this.order_companyId = order_companyId;
		this.counts = counts;
		this.money = money;
		this.serviceName = serviceName;
		this.companyName = companyName;
	}

	public Top() {
		super();
	}

	public int getOrder_serviceId() {
		return order_serviceId;
	}

	public void setOrder_serviceId(int order_serviceId) {
		this.order_serviceId = order_serviceId;
	}

	public int getOrder_companyId() {
		return order_companyId;
	}

	public void setOrder_companyId(int order_companyId) {
		this.order_companyId = order_companyId;
	}

	public int getCounts() {
		return counts;
	}

	public void setCounts(int counts) {
		this.counts = counts;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

}
