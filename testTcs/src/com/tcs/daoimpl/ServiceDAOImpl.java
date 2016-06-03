package com.tcs.daoimpl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.tcs.dao.HibernateSessionFactory;
import com.tcs.dao.ServiceDAO;
import com.tcs.entity.Comment;
import com.tcs.entity.Company;
import com.tcs.entity.Service;
import com.tcs.entity.ServiceType;

public class ServiceDAOImpl implements ServiceDAO {

	@Override
	public boolean addService(Service s) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.save(s);
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
	public List<Service> selectComService(Company com, int page, int rows,
			String key) {
		Session session = HibernateSessionFactory.getSession();
		try {

			String hql = "from Service where service_company = ? and serviceName like ? order by serviceId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, com);
			query.setParameter(1, "%" + key + "%");
			query.setMaxResults(rows);
			query.setFirstResult(rows * (page - 1));
			List<Service> list = query.list();
			for (int i = 0; i < list.size(); i++) {
				int count = 0;
				float sum = 0;
				if (list.get(i).getComment().size() > 0) {
					for (Comment comm : list.get(i).getComment()) {
						sum += comm.getCommentGrade();
						count++;
					}
					DecimalFormat df   =new DecimalFormat("#.00");
					list.get(i).setServiceGrade(Float.valueOf(df.format(sum / count)));
				} else {
					list.get(i).setServiceGrade(0);
				}
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean updownService(int id, int operand) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Service s = (Service) session.get(Service.class, id);
			s.setServiceStage(operand);
			session.update(s);
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
	public boolean updateService(Service s) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.update(s);
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
	public Service getService(int id) {
		Session session = HibernateSessionFactory.getSession();
		Service s = null;
		try {
			s = (Service) session.get(Service.class, id);
			
			Set<Comment> set = s.getComment();
			if (set.size() > 0) {
				int count = 0;
				float sum = 0;
				for (Comment comm : s.getComment()) {
					sum += comm.getCommentGrade();
					count++;
				}
				DecimalFormat df   =new DecimalFormat("#.00");
				s.setServiceGrade(Float.valueOf(df.format(sum / count)));
			} else {
				s.setServiceGrade(0);
			}
			
			return s;
		} catch (Exception e) {
			e.printStackTrace();
			return s;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean delete(int id) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Service s = (Service) session.get(Service.class, id);
			session.delete(s);
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
	public int selectComServiceCounts(Company com, String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Service where service_company = ? and serviceName like ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, com);
			query.setParameter(1, "%" + key + "%");
			return query.list().size();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public List<Service> selectAllService(int page, int rows, boolean flag1,
			String likename, boolean flag2, String liketype, boolean flag3,
			String add) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		List<Service> list = null;
		List<Service> newlist = null;
		try {
			Criteria cri = session.createCriteria(Service.class);
			cri.add(Restrictions.eq("serviceStage", 1));
			if (flag1) {
				cri.add(Restrictions.like("serviceName", likename,
						MatchMode.ANYWHERE));
			}
			if (flag2) {
				ServiceType type = new ServiceType();
				type.setServiceTypeId(Integer.parseInt(liketype));
				cri.add(Restrictions.eq("service_serviceType", type));
			}
			if (page != 0) {
				cri.setFirstResult(rows * (page - 1));
				cri.setMaxResults(rows);
			}
			list = cri.list();
			if (flag3) {
				newlist = new ArrayList<Service>();
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getService_company()
							.getCompanyServiceScope().trim().equals(add))
						newlist.add(list.get(i));
				}
			} else {
				newlist = list;
			}
			for (int i = 0; i < newlist.size(); i++) {
				int count = 0;
				float sum = 0;
				if (newlist.get(i).getComment().size() > 0) {
					for (Comment comm : newlist.get(i).getComment()) {
						sum += comm.getCommentGrade();
						count++;
					}
					DecimalFormat df   =new DecimalFormat("#.00");
					newlist.get(i).setServiceGrade(Float.valueOf(df.format(sum / count)));
				} else {
					newlist.get(i).setServiceGrade(0);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return newlist;
	}

	public long theNumOfService(boolean flag1, String likename, boolean flag2,
			String liketype, boolean flag3, String add) {
		Session session = HibernateSessionFactory.getSession();
		long result = 0;
		try {
			Criteria cri = session.createCriteria(Service.class);
			if (flag1) {
				cri.add(Restrictions.like("serviceName", likename,
						MatchMode.ANYWHERE));
			}
			if (flag2) {
				ServiceType type = new ServiceType();
				type.setServiceTypeId(Integer.parseInt(liketype));
				cri.add(Restrictions.eq("service_serviceType", type));
			}
			cri.setProjection(Projections.rowCount());
			result = (Long) cri.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return result;
	}

	public long theNumOfServices(boolean flag1, String likename, boolean flag2,
			String liketype, boolean flag3, String add) {
		long result = this.theNumOfService(flag1, likename, flag2, liketype,
				flag3, add);
		if (flag3) {
			List<Service> li = this.selectAllService(1, (int) result, flag1,
					likename, flag2, liketype, flag3, add);
			return (long) li.size();
		}
		return result;
	}

	@Override
	public Map<String, Float> getPriceByTypeId(int typeid) {
		Session session = HibernateSessionFactory.getSession();
		Map<String, Float> map = new HashMap<String, Float>();
		try {
			String sql = "select avg(serviceprice) from service where service_serviceTypeId = "
					+ typeid;
			List temp = session.createSQLQuery(sql).list();
			float avg = 0;
			if (temp.get(0) != null) {
				avg = Float.valueOf(temp.get(0).toString());
			}
			sql = "select Max(serviceprice) from service where service_serviceTypeId = "
					+ typeid;
			temp = session.createSQLQuery(sql).list();
			float max = 0;
			if (temp.get(0) != null) {
				max = Float.valueOf(temp.get(0).toString());
			}

			sql = "select Min(serviceprice) from service where service_serviceTypeId = "
					+ typeid;
			temp = session.createSQLQuery(sql).list();
			float min = 0;
			if (temp.get(0) != null) {
				min = Float.valueOf(temp.get(0).toString());
			}
			map.put("avg", avg);
			map.put("max", max);
			map.put("min", min);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	public List<Object> getService(int id, int page, int rows) {
		Session session = HibernateSessionFactory.getSession();
		Service s = null;
		List<Object> li = null;
		try {
			s = (Service) session.get(Service.class, id);	
			Set<Comment> set = s.getComment();
			if (set.size() > 0) {
				int count = 0;
				float sum = 0;
				for (Comment comm : s.getComment()) {
					sum += comm.getCommentGrade();
					count++;
				}
				DecimalFormat df   =new DecimalFormat("#.00");
				s.setServiceGrade(Float.valueOf(df.format(sum / count)));
			} else {
				s.setServiceGrade(0);
			}
			Object[] sers = s.getComment().toArray();
			Arrays.sort(sers);
			Set<Comment> comments = new TreeSet<Comment>();
			List<Object> list = Arrays.asList(sers);
			int themaxpage = sers.length % rows == 0 ? sers.length / rows
					: sers.length / rows + 1;
			int start = (page - 1) * rows;
			for (int a = start; a < (page * rows > sers.length ? sers.length
					: page * rows); a++) {
				comments.add((Comment) list.get(a));
			}
			s.setComment(comments);
			li = new ArrayList<Object>();
			li.add(s);
			li.add(themaxpage);
			return li;
		} catch (Exception e) {
			e.printStackTrace();
			return li;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
}
