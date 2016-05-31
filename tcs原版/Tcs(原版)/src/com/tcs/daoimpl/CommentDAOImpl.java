package com.tcs.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tcs.dao.CommentDAO;
import com.tcs.dao.HibernateSessionFactory;
import com.tcs.entity.Comment;
import com.tcs.entity.Company;
import com.tcs.entity.Order;
import com.tcs.entity.User;

public class CommentDAOImpl implements CommentDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> selectComAllComment(Company com,int page,int rows) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Comment where comment_company = ? order by commentId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, com);
			query.setMaxResults(rows);
			query.setFirstResult(rows*(page-1));
			List<Comment> commlist = query.list();
			return commlist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;	
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean CommentOK(Comment comm,Order order) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.save(comm);
			order.setOrderStage(2);
			session.update(order);
			ts.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
			return false;	
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public Comment getComment(int id) {
		Session session = HibernateSessionFactory.getSession();
		try {
			Comment comm = (Comment) session.get(Comment.class, id);
			return comm;
		} catch (Exception e) {
			e.printStackTrace();
			return null;	
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Comment> selectUserAllComment(User user,int page,int rows) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Comment where comment_user = ? order by commentId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, user);
			query.setMaxResults(rows);
			query.setFirstResult(rows*(page-1));
			List<Comment> commlist = query.list();
			return commlist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;	
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public int selectComAllCommentCounts(Company com) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Comment where comment_company = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, com);
			return query.list().size();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;	
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public int selectUserAllCommentCounts(User user) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Comment where comment_user = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, user);
			return query.list().size();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;	
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}
}
