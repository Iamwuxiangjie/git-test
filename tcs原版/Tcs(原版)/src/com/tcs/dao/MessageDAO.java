package com.tcs.dao;

import java.util.List;

import com.tcs.entity.Admin;
import com.tcs.entity.Company;
import com.tcs.entity.Message;
import com.tcs.entity.Order;
import com.tcs.entity.User;

public interface MessageDAO {
	//公司发送信息给管理员
	public boolean sendComMessageToAdmin(Message msg);
	//系统发送信息给公司及管理员
	public void sendMessage(List<Admin> adminlist,Company com);
	
	public void sendMessageWantTODelete(Order order);
	//根据id设置已读信息
	public boolean readMessage(List<Integer> idlist);
	//根据id删除信息
	public boolean deleteMessage(List<Integer> idlist);
	
	public List<Message> getAdminUnreadMessage(Admin admin);
	
	public List<Message> getAdminReadMessage(Admin admin,int page,int rows,String key);
	
	public int getAdminReadMessageCount(Admin admin,String key);
	//获取公司未读信息
	public List<Message> getCompanyUnreadMessage(Company com);
	//获取公司已读信息
	public List<Message> getCompanyReadMessage(Company com,int page,int rows,String key);
	
	public int getCompanyReadMessageCount(Company com,String key);
	//获取用户未读信息
	public List<Message> getUserUnreadMessage(User user);
	//获取用户已读信息
	public List<Message> getUserReadMessage(User user,int page, int rows,String key);
	
	public int getUserReadMessageCount(User user,String key);
	
	public Message getMessageById(int id);
	
	public boolean sendMessageToPeople(Message msg);
}
