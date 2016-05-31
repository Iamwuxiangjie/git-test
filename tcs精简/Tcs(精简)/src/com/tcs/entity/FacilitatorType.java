package com.tcs.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class FacilitatorType implements Serializable {
	private static final long serialVersionUID = 1L;
	private int facilitatorTypeId;// 类别ID
	private String facilitatorTypeName;// 类别名称
	private String facilitatorTypeExplain;// 类别说明
	private Set<Company> company = new HashSet<Company>();// 公司表，一对多

	public FacilitatorType(int facilitatorTypeId, String facilitatorTypeName,
			String facilitatorTypeExplain, Set<Company> company) {
		super();
		this.facilitatorTypeId = facilitatorTypeId;
		this.facilitatorTypeName = facilitatorTypeName;
		this.facilitatorTypeExplain = facilitatorTypeExplain;
		this.company = company;
	}

	public FacilitatorType() {
		super();
	}

	public int getFacilitatorTypeId() {
		return facilitatorTypeId;
	}

	public void setFacilitatorTypeId(int facilitatorTypeId) {
		this.facilitatorTypeId = facilitatorTypeId;
	}

	public String getFacilitatorTypeName() {
		return facilitatorTypeName;
	}

	public void setFacilitatorTypeName(String facilitatorTypeName) {
		this.facilitatorTypeName = facilitatorTypeName;
	}

	public String getFacilitatorTypeExplain() {
		return facilitatorTypeExplain;
	}

	public void setFacilitatorTypeExplain(String facilitatorTypeExplain) {
		this.facilitatorTypeExplain = facilitatorTypeExplain;
	}

	public Set<Company> getCompany() {
		return company;
	}

	public void setCompany(Set<Company> company) {
		this.company = company;
	}

}
