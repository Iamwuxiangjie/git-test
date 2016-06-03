package com.tcs.dao;

import java.util.List;

import com.tcs.entity.Company;

public interface CompanyDAO {
	//获取公司评分并刷新
	public Company getCompanyGrade(Company com);
	//注册
	public boolean companyRegister(Company com);
	//公司登陆
	public List<Company> companyLogin(Company com);
	//公司信息更新
	public boolean companyUpdate(Company com);
	//填写邮箱
	public boolean companyEmail(Company com);
	
	public Company getCompanyByAcc(String acc);
	
	public boolean companyBindEmail(Company com);
	
	public Company getCompanyById(int id);
	
	public int getCompanyCounts(String key,int tage);
	
	public List<Company> getAllCompany(int page,int rows,String key,int tage);
}
