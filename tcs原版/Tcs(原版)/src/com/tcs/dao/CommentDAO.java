package com.tcs.dao;

import java.util.List;

import com.tcs.entity.Comment;
import com.tcs.entity.Company;
import com.tcs.entity.Order;
import com.tcs.entity.User;

public interface CommentDAO {
	//查询所有评价
	public List<Comment> selectComAllComment(Company com,int page,int rows);
	
	public int selectComAllCommentCounts(Company com);
	
	public List<Comment> selectUserAllComment(User user,int page,int rows);
	
	public int selectUserAllCommentCounts(User user);
	
	public boolean CommentOK(Comment comm,Order order);
	
	public Comment getComment(int id);

}
