package com.tcs.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tcs.dao.FacilitatorTypeDAO;
import com.tcs.dao.HibernateSessionFactory;
import com.tcs.entity.FacilitatorType;

public class FacilitatorTypeDAOImpl implements FacilitatorTypeDAO{
	@SuppressWarnings("unchecked")
	@Override
	public List<FacilitatorType> getType() {
		List<FacilitatorType> list = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from FacilitatorType order by facilitatorTypeId desc";
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
	public FacilitatorType getTypeById(int id) {
		Session session = HibernateSessionFactory.getSession();
		try {
			FacilitatorType type = (FacilitatorType) session.get(FacilitatorType.class, id);
			return type;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean addFacilitatorType(FacilitatorType type) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.save(type);
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
	public boolean updateFacilitatorType(FacilitatorType type) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.update(type);
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
	public boolean deleteFacilitatorType(FacilitatorType type) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.delete(type);
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
