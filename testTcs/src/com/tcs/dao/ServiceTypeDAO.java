package com.tcs.dao;

import java.util.List;

import com.tcs.entity.ServiceType;

public interface ServiceTypeDAO {
	public List<ServiceType> getServiceType();
	
	public ServiceType getServiceTypeById(int id);
	
	public int getServiceTypeIdByName(String typeName);
	
	public boolean updateServiceType(ServiceType type);
	
	public boolean addServiceType(ServiceType type);
	
	public boolean deleteServiceType(ServiceType type);
}
