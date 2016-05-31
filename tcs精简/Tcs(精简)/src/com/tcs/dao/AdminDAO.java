package com.tcs.dao;

import java.util.List;

import com.tcs.entity.Admin;

public interface AdminDAO {
	//获取所有管理员昵称
	public List<Admin> getAllAdmin();
	
	public Admin getAdminById(int id);
	
	public List<Admin> adminLogin(Admin admin);
	
	public boolean adminUpdate(Admin admin);
}
