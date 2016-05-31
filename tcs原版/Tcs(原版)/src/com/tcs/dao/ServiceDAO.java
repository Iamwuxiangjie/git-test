package com.tcs.dao;

import java.util.List;
import java.util.Map;

import com.tcs.entity.Company;
import com.tcs.entity.Service;
import com.tcs.entity.ServiceType;

public interface ServiceDAO {
	//增加服务项目
	public boolean addService(Service s);
	//查询所有服务并结算服务评分
	public List<Service> selectComService(Company com,int page,int rows,String key);
	
	public int selectComServiceCounts(Company com,String key);
	//对服务上下架处理
	public boolean updownService(int id,int operand);
	//根据ID获取服务信息
	public Service getService(int id);
	//修改服务信息
	public boolean updateService(Service s);
	//删除服务
	public boolean delete(int id);
	
	public List<Object> getService(int id,int page,int rows);
	public long theNumOfServices(boolean flag1,String likename,boolean flag2,String liketype,boolean flag3,String add);
	public List<Service> selectAllService(int page,int rows,boolean flag1,String likename,boolean flag2,String liketype,boolean flag3,String add);
	
	public Map<String, Float> getPriceByTypeId(int typeid);
}
