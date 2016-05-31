package com.tcs.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class ServiceType implements Serializable{
	private int serviceTypeId;
	private String serviceTypeName;
	private Set<Service> service = new HashSet<Service>();
	public ServiceType(int serviceTypeId, String serviceTypeName,
			Set<Service> service) {
		super();
		this.serviceTypeId = serviceTypeId;
		this.serviceTypeName = serviceTypeName;
		this.service = service;
	}
	public ServiceType() {
		super();
	}
	public int getServiceTypeId() {
		return serviceTypeId;
	}
	public void setServiceTypeId(int serviceTypeId) {
		this.serviceTypeId = serviceTypeId;
	}
	public String getServiceTypeName() {
		return serviceTypeName;
	}
	public void setServiceTypeName(String serviceTypeName) {
		this.serviceTypeName = serviceTypeName;
	}
	public Set<Service> getService() {
		return service;
	}
	public void setService(Set<Service> service) {
		this.service = service;
	}
	
}
