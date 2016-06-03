package com.tcs.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tcs.dao.HibernateSessionFactory;
import com.tcs.dao.UserDAO;
import com.tcs.entity.Company;
import com.tcs.entity.User;

public class UserDAOImpl implements UserDAO {
	@SuppressWarnings("unchecked")
	@Override
	public List<User> userLogin(User user) {
		String hql = "";
		Session session = HibernateSessionFactory.getSession();
		try {
			hql = "from User where userAccount=? and userPwd=?";
			Query query = session.createQuery(hql);
			query.setParameter(0, user.getUserAccount());
			query.setParameter(1, user.getUserPwd());
			List<User> list = query.list();
			if (list.size() > 0) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}

	}
	@Override
	public boolean updateUser(User user) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.update(user);
			ts.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	@SuppressWarnings({ "unused", "rawtypes" })
	@Override
	public boolean register(User user) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			String hql = "from User where userAccount = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, user.getUserAccount());
			List list = query.list();
			if(list.size()!=0){
				return false;
			}else{
				session.save(user);
				ts.commit();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	@SuppressWarnings("rawtypes")
	@Override
	public boolean email(User user) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String email = user.getUserEmail();
			String hql = "from User where userEmail = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, email);
			List list = query.list();
			if (list.size()!=0) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	@Override
	public User getUserById(int id) {
		Session session = HibernateSessionFactory.getSession();
		try {
			User u = (User) session.get(User.class, id);
			return u;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	@Override
	public boolean userBindEmail(User user) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.update(user);
			ts.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	@Override
	public User getUserByAcc(String acc) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from User where userAccount = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, acc);
			List<User> list = query.list();
			if(list.size()>0){
				return list.get(0);
			}else{
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
}
