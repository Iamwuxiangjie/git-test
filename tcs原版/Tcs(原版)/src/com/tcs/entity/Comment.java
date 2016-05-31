package com.tcs.entity;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment implements Serializable,Comparable<Comment> {
	private static final long serialVersionUID = 1L;
	private int commentId;// 评价ID
	private User comment_user;// 用户ID，外键
	private Company comment_company;// 公司ID，外键
	private Service comment_service;// 产品ID,外键
	private String commentCont;// 用户评语
	private String commentTime;// 评价时间
	private int commentGrade;// 评价星级
	public Comment(int commentId, User comment_user, Company comment_company,
			Service comment_service, String commentCont, String commentTime,
			int commentGrade) {
		super();
		this.commentId = commentId;
		this.comment_user = comment_user;
		this.comment_company = comment_company;
		this.comment_service = comment_service;
		this.commentCont = commentCont;
		this.commentTime = commentTime;
		this.commentGrade = commentGrade;
	}
	public Comment() {
		super();
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public User getComment_user() {
		return comment_user;
	}
	public void setComment_user(User comment_user) {
		this.comment_user = comment_user;
	}
	public Company getComment_company() {
		return comment_company;
	}
	public void setComment_company(Company comment_company) {
		this.comment_company = comment_company;
	}
	public Service getComment_service() {
		return comment_service;
	}
	public void setComment_service(Service comment_service) {
		this.comment_service = comment_service;
	}
	public String getCommentCont() {
		return commentCont;
	}
	public void setCommentCont(String commentCont) {
		this.commentCont = commentCont;
	}
	public String getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}
	public int getCommentGrade() {
		return commentGrade;
	}
	public void setCommentGrade(int commentGrade) {
		this.commentGrade = commentGrade;
	}
	@Override
	public int compareTo(Comment o) {
		if(this.getDateByStr(this.commentTime).after(this.getDateByStr(o.getCommentTime()))){
			return -1;
		}
		return 1;
	}
	
	public Date getDateByStr(String time){
		try {
			return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(time);
		} catch (ParseException e) {
			return new Date();
		}
	}
}
