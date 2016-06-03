package com.tcs.daoimpl;

import java.text.DecimalFormat;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tcs.dao.CompanyDAO;
import com.tcs.dao.HibernateSessionFactory;
import com.tcs.entity.Company;

public class CompanyDAOImpl implements CompanyDAO {
	@SuppressWarnings("unchecked")
	@Override
	public boolean companyRegister(Company com) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			String hql = "from Company where companyAccount = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, com.getCompanyAccount());
			List<Company> list = query.list();
			if (list==null||list.size() == 0) {
				com.setCompanyStage(0);
				session.save(com);
				ts.commit();
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Company> companyLogin(Company com) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "";
		try {
			hql = "from Company where companyAccount=? and companyPwd=?";
			Query query = session.createQuery(hql);
			query.setParameter(0, com.getCompanyAccount());
			query.setParameter(1, com.getCompanyPwd());
			List<Company> list = query.list();
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

	@SuppressWarnings("rawtypes")
	@Override
	public boolean companyEmail(Company com) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String email = com.getCompanyEmail();
			String hql = "from Company where companyEmail = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, email);
			List list = query.list();
			if (list.size() != 0) {
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

	@SuppressWarnings("rawtypes")
	@Override
	public Company getCompanyGrade(Company com) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Company c = null;
		try {
			String sql = "select avg(commentGrade) from comment where comment_companyId = "
					+ com.getCompanyId();
			List query = session.createSQLQuery(sql).list();
			if (query.get(0) != null) {
				float grade = Float.valueOf(query.get(0).toString());
				DecimalFormat df   =new DecimalFormat("#.00");  
				c = (Company) session.get(Company.class, com.getCompanyId());
				c.setCompanyGrade(Float.valueOf(df.format(grade)));
				session.update(c);
				ts.commit();
				return c;
			} else {
				c = (Company) session.get(Company.class, com.getCompanyId());
				return c;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean companyUpdate(Company com) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.update(com);
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
	public Company getCompanyById(int id) {
		Session session = HibernateSessionFactory.getSession();
		try {
			Company com = (Company) session.get(Company.class, id);
			return com;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public int getCompanyCounts(String key,int tage) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Company";
			if(tage==0){
				hql = "from Company where companyName like ? order by companyId desc";
			}else if(tage==1){
				hql = "from Company where companyName like ? and companyGrade > 0 order by companyGrade desc";
			}else if(tage==2){
				hql = "from Company where companyName like ? and companyGrade > 0 order by companyGrade";
			}else if(tage==3){
				hql = "from Company where companyName like ? and companyStage = 0";
			}else if(tage==4){
				hql = "from Company where companyName like ? and companyGrade > 0 and companyGrade < 2";
			}
			Query query = session.createQuery(hql);
			query.setParameter(0, "%"+key+"%");
			List list = query.list();
			if(list.size()>0){
				return list.size();
			}else{
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public List<Company> getAllCompany(int page,int rows,String key,int tage) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "";
			if(tage==0){
				hql = "from Company where companyName like ? order by companyId desc";
			}else if(tage==1){
				hql = "from Company where companyName like ? and companyGrade > 0 order by companyGrade desc";
			}else if(tage==2){
				hql = "from Company where companyName like ? and companyGrade > 0 order by companyGrade";
			}else if(tage==3){
				hql = "from Company where companyName like ? and companyStage = 0";
			}else if(tage==4){
				hql = "from Company where companyName like ? and companyGrade > 0 and companyGrade < 2";
			}
			Query query = session.createQuery(hql);
			query.setParameter(0, "%"+key+"%");
			query.setMaxResults(rows);
			query.setFirstResult(rows * (page - 1));
			List<Company> list = query.list();
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
	public boolean companyBindEmail(Company com) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.update(com);
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
	public Company getCompanyByAcc(String acc) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Company where companyAccount = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, acc);
			List<Company> list = query.list();
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
