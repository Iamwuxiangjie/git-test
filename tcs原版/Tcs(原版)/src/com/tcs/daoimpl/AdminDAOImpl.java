package com.tcs.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tcs.dao.AdminDAO;
import com.tcs.dao.HibernateSessionFactory;
import com.tcs.entity.Admin;

public class AdminDAOImpl implements AdminDAO{
	@SuppressWarnings("unchecked")
	@Override
	public List<Admin> getAllAdmin() {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Admin";
			List<Admin> list = session.createQuery(hql).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	@Override
	public Admin getAdminById(int id) {
		Session session = HibernateSessionFactory.getSession();
		try {
			Admin a = (Admin) session.get(Admin.class, id);
			return a;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	@Override
	public List<Admin> adminLogin(Admin admin) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Admin where adminAccount = ? and adminPwd = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, admin.getAdminAccount());
			query.setParameter(1, admin.getAdminPwd());
			List list = query.list();
			if(list.size()>0){
				return list;
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
	@Override
	public boolean adminUpdate(Admin admin) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.update(admin);
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
}
