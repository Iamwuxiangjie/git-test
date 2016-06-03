package com.tcs.dao;

import java.util.List;

import com.tcs.entity.Company;
import com.tcs.entity.User;

public interface UserDAO {

	public List<User> userLogin(User user);
	
	public boolean updateUser(User user);
	
	public boolean register(User user);
	
	public boolean email(User user);
	
	public User getUserByAcc(String acc);
	
	public boolean userBindEmail(User user);
	
	public User getUserById(int id);
}
