package com.tcs.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tcs.dao.HibernateSessionFactory;
import com.tcs.dao.ServiceTypeDAO;
import com.tcs.entity.ServiceType;

public class ServiceTypeDAOImpl implements ServiceTypeDAO{
	@SuppressWarnings("unchecked")
	@Override
	public List<ServiceType> getServiceType() {
		List<ServiceType> list = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from ServiceType order by serviceTypeId desc";
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
	public ServiceType getServiceTypeById(int id) {
		Session session = HibernateSessionFactory.getSession();
		try {
			ServiceType s = (ServiceType) session.get(ServiceType.class, id);
			return s;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}
	@Override
	public boolean updateServiceType(ServiceType type) {
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
	public boolean addServiceType(ServiceType type) {
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
	public int getServiceTypeIdByName(String typeName) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from ServiceType where serviceTypeName = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, typeName);
			List<ServiceType> list = query.list();
			if(list.size()>0){
				return list.get(0).getServiceTypeId();
			}else{
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}
	@Override
	public boolean deleteServiceType(ServiceType type) {
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
