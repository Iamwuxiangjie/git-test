package com.tcs.dao;

import java.util.List;

import com.tcs.entity.Company;
import com.tcs.entity.Order;
import com.tcs.entity.Top;
import com.tcs.entity.User;

public interface OrderDAO {
	//查询所有订单
	public List<Order> selectComAllOrder(Company com,int page,int rows,String key);
	
	public int selectComAllOrderCounts(Company com,String key);
	//公司确认完成订单
	public boolean orderComOk(int id);
	
	public boolean orderUserOk(int id);
	//系统确认完成订单
	public boolean isOrderOk(Company com);
	
	public List<Order> selectUserAllOrder(User user,int page,int rows,String key);
	
	public int selectUserAllOrderCounts(User user,String key);
	
	public List<Order> selectAllOrder(int page,int rows,String key);
	
	public int selectAllOrderCounts(String key);
	
	public Order getOrder(int id);
	
	public boolean addOrder(Order order);
	
	public boolean deleteOrder(Order order);
	
	public List<Top> getTopList();
}
