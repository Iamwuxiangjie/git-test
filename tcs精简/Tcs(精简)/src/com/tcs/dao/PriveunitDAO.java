package com.tcs.dao;

import java.util.List;

import com.tcs.entity.Priveunit;

public interface PriveunitDAO {
	//获取价格单位
	public List<Priveunit> getPriveunit();
	
	public Priveunit getPriveunitById(int id);
	
	public boolean updatePriveunit(Priveunit p);
	
	public boolean addPriveunit(Priveunit p);
	
	public boolean deletePriveunit(Priveunit p);
}
