package com.tcs.dao;

import java.util.List;

import com.tcs.entity.FacilitatorType;

public interface FacilitatorTypeDAO {
	//获取所有类别
	public List<FacilitatorType> getType();
	
	public FacilitatorType getTypeById(int id);
	
	public boolean addFacilitatorType(FacilitatorType type);
	
	public boolean updateFacilitatorType(FacilitatorType type);
	
	public boolean deleteFacilitatorType(FacilitatorType type);
	
}
