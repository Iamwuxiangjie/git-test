package com.tcs.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tcs.dao.HibernateSessionFactory;
import com.tcs.dao.PriveunitDAO;
import com.tcs.entity.Priveunit;

public class PriveunitDAOImpl implements PriveunitDAO{
	@SuppressWarnings("unchecked")
	@Override
	public List<Priveunit> getPriveunit() {
		List<Priveunit> list = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Priveunit";
			Query query = session.createQuery(hql);
			list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return list;
		}finally{
			HibernateSessionFactory.closeSession();
		}
		
	}
	@Override
	public Priveunit getPriveunitById(int id) {
		Session session = HibernateSessionFactory.getSession();
		try {
			Priveunit p = (Priveunit) session.get(Priveunit.class, id);
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}
	@Override
	public boolean updatePriveunit(Priveunit p) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.update(p);
			ts.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}
	@Override
	public boolean addPriveunit(Priveunit p) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.save(p);
			ts.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}
	@Override
	public boolean deletePriveunit(Priveunit p) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.delete(p);
			ts.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}

}
