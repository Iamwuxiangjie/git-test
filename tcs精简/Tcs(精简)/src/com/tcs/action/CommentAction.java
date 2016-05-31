package com.tcs.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.tcs.dao.CommentDAO;
import com.tcs.dao.CompanyDAO;
import com.tcs.dao.OrderDAO;
import com.tcs.dao.ServiceDAO;
import com.tcs.dao.UserDAO;
import com.tcs.daoimpl.CommentDAOImpl;
import com.tcs.daoimpl.CompanyDAOImpl;
import com.tcs.daoimpl.OrderDAOImpl;
import com.tcs.daoimpl.ServiceDAOImpl;
import com.tcs.daoimpl.UserDAOImpl;
import com.tcs.entity.Comment;
import com.tcs.entity.Company;
import com.tcs.entity.Order;
import com.tcs.entity.Service;
import com.tcs.entity.User;

public class CommentAction extends SuperAction implements ModelDriven<Comment> {
	private static final long serialVersionUID = 1L;

	Comment comm = new Comment();

	CommentDAO commdao = new CommentDAOImpl();
	OrderDAO odao = new OrderDAOImpl();
	UserDAO udao = new UserDAOImpl();
	CompanyDAO cdao = new CompanyDAOImpl();
	ServiceDAO sdao = new ServiceDAOImpl();
	
	int orderid;
	static int rows = 10;
	int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	// 查询公司所有评价
	public String selectComAllComment() {
		Company com = (Company) session.getAttribute("loginCompany");// 获取当前公司信息
		int counts = commdao.selectComAllCommentCounts(com);
		List<Comment> commentlist = commdao.selectComAllComment(com,page,rows);// 查询所有评价
		if (commentlist != null) {
			request.setAttribute("commentlist", commentlist);// 将查询结果放入request
			request.setAttribute("page", page);
			request.setAttribute("counts", counts);
			return "selectcomallcomment_success";
		} else {
			return "selectcomallcomment_failure";// 查询失败
		}
	}
	//评价完成
	public String commentOK(){
		Order order = odao.getOrder(orderid);
		comm.setComment_company(order.getOrder_company());
		comm.setComment_service(order.getOrder_service());
		comm.setComment_user(order.getOrder_user());
		comm.setCommentTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		if(commdao.CommentOK(comm,order)){
			request.setAttribute("commtemp", comm);
			return "commentok_success";
		}else{
			this.addFieldError("error", "未知原因评价失败，请稍后再试");
			return "commentok_failure";
		}
	}
	//查询用户全部评价
	public String selectUserAllComment(){
		User user = (User) session.getAttribute("loginUser");// 获取当前用户信息
		int counts = commdao.selectUserAllCommentCounts(user);
		List<Comment> commentlist = commdao.selectUserAllComment(user,page,rows);// 查询所有评价
		if (commentlist != null) {
			request.setAttribute("commentlist", commentlist);// 将查询结果放入request
			request.setAttribute("page", page);
			request.setAttribute("counts", counts);
			return "selectuserallcomment_success";
		} else {
			return "selectuserallcomment_failure";// 查询失败
		}
	}
	//转接数据
	public String temp(){
		request.setAttribute("orderid", orderid);
		return "temp_success";
	}
	@Override
	public Comment getModel() {
		return this.comm;
	}

}
