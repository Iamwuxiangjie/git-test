package com.tcs.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Service implements Serializable,Comparable<Service> {
	private static final long serialVersionUID = 1L;
	private int serviceId;// 服务产品ID
	private Company service_company;// 公司ID，外键
	private String serviceName;// 服务名称
	private String serviceExplain;// 服务说明
	private String serviceImg;// 服务图片
	private float serviceprice;// 服务价格
	private Priveunit service_priveunit;// 服务价格单位,外键
	private int serviceStage;// 状态
	private float serviceGrade;// 服务星级，不记录数据库
	private ServiceType service_serviceType;// 服务类型表
	private Set<Order> order = new HashSet<Order>();// 订单表。一对多
	private Set<Comment> comment = new HashSet<Comment>();//评价表.一对多
	public Service(int serviceId, Company service_company, String serviceName,
			String serviceExplain, String serviceImg, float serviceprice,
			Priveunit service_priveunit, int serviceStage, float serviceGrade,
			ServiceType service_serviceType, Set<Order> order,
			Set<Comment> comment) {
		super();
		this.serviceId = serviceId;
		this.service_company = service_company;
		this.serviceName = serviceName;
		this.serviceExplain = serviceExplain;
		this.serviceImg = serviceImg;
		this.serviceprice = serviceprice;
		this.service_priveunit = service_priveunit;
		this.serviceStage = serviceStage;
		this.serviceGrade = serviceGrade;
		this.service_serviceType = service_serviceType;
		this.order = order;
		this.comment = comment;
	}
	public Service() {
		super();
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public Company getService_company() {
		return service_company;
	}
	public void setService_company(Company service_company) {
		this.service_company = service_company;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getServiceExplain() {
		return serviceExplain;
	}
	public void setServiceExplain(String serviceExplain) {
		this.serviceExplain = serviceExplain;
	}
	public String getServiceImg() {
		return serviceImg;
	}
	public void setServiceImg(String serviceImg) {
		this.serviceImg = serviceImg;
	}
	public float getServiceprice() {
		return serviceprice;
	}
	public void setServiceprice(float serviceprice) {
		this.serviceprice = serviceprice;
	}
	public Priveunit getService_priveunit() {
		return service_priveunit;
	}
	public void setService_priveunit(Priveunit service_priveunit) {
		this.service_priveunit = service_priveunit;
	}
	public int getServiceStage() {
		return serviceStage;
	}
	public void setServiceStage(int serviceStage) {
		this.serviceStage = serviceStage;
	}
	public float getServiceGrade() {
		return serviceGrade;
	}
	public void setServiceGrade(float serviceGrade) {
		this.serviceGrade = serviceGrade;
	}
	public ServiceType getService_serviceType() {
		return service_serviceType;
	}
	public void setService_serviceType(ServiceType service_serviceType) {
		this.service_serviceType = service_serviceType;
	}
	public Set<Order> getOrder() {
		return order;
	}
	public void setOrder(Set<Order> order) {
		this.order = order;
	}
	public Set<Comment> getComment() {
		return comment;
	}
	public void setComment(Set<Comment> comment) {
		this.comment = comment;
	}
	@Override
	public int compareTo(Service o) {
		if(this.service_serviceType.getServiceTypeId()==o.service_serviceType.getServiceTypeId()){
			return 0;
		}
		return 1;
	}
}
