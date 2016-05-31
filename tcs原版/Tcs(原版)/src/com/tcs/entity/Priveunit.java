package com.tcs.entity;

import java.util.HashSet;
import java.util.Set;

public class Priveunit {
	private int priveunitId;// 单位ID
	private String priveunitName;// 单位名称
	private Set<Service> service = new HashSet<Service>();
	public Priveunit(int priveunitId, String priveunitName, Set<Service> service) {
		super();
		this.priveunitId = priveunitId;
		this.priveunitName = priveunitName;
		this.service = service;
	}
	public Priveunit() {
		super();
	}
	public int getPriveunitId() {
		return priveunitId;
	}
	public void setPriveunitId(int priveunitId) {
		this.priveunitId = priveunitId;
	}
	public String getPriveunitName() {
		return priveunitName;
	}
	public void setPriveunitName(String priveunitName) {
		this.priveunitName = priveunitName;
	}
	public Set<Service> getService() {
		return service;
	}
	public void setService(Set<Service> service) {
		this.service = service;
	}
}
