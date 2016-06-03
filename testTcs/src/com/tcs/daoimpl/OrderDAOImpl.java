package com.tcs.daoimpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;

import com.tcs.dao.HibernateSessionFactory;
import com.tcs.dao.OrderDAO;
import com.tcs.entity.Company;
import com.tcs.entity.Order;
import com.tcs.entity.Top;
import com.tcs.entity.User;

public class OrderDAOImpl implements OrderDAO {
	@SuppressWarnings("unchecked")
	@Override
	public List<Order> selectComAllOrder(Company com, int page, int rows,
			String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Order where order_companyId = ? and orderNum like ? order by orderId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, com);
			query.setParameter(1, "%" + key + "%");
			query.setMaxResults(rows);
			query.setFirstResult(rows * (page - 1));
			List<Order> orderlist = query.list();
			return orderlist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
	@Override
	public boolean orderComToDO(int id) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Order order = (Order) session.get(Order.class, id);
			order.setOrderStage(1);
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
	public boolean orderComStart(int id) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Order order = (Order) session.get(Order.class, id);
			order.setOrderStage(2);
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
	public boolean orderComOk(int id) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Order order = (Order) session.get(Order.class, id);
			order.setOrderComEndTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date()));
			order.setOrderStage(3);
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

	@SuppressWarnings("unchecked")
	@Override
	public boolean isOrderOk(Company com) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			String hql = "from Order where order_company = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, com);
			List<Order> list = query.list();
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getOrderEndTime() != null) {
					continue;
				} else if (list.get(i).getOrderComEndTime() == null) {
					continue;
				} else {
					String date = list.get(i).getOrderComEndTime();
					Date comEndDate = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss").parse(date);
					Date nowDate = new Date();
					if ((nowDate.getTime() - comEndDate.getTime())
							/ (3600 * 24 * 1000) >= 5) {
						list.get(i).setOrderStage(1);
						list.get(i).setOrderEndTime(
								new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
										.format(nowDate));
						session.update(list.get(i));
					}
				}
			}
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> selectUserAllOrder(User user, int page, int rows,
			String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Order where order_user = ? and orderNum like ? order by orderId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, user);
			query.setParameter(1, "%" + key + "%");
			query.setMaxResults(rows);
			query.setFirstResult(rows * (page - 1));
			List<Order> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean orderUserOk(int id) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Order order = (Order) session.get(Order.class, id);
			if (order.getOrderComEndTime() != null) {
				order.setOrderEndTime(new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss").format(new Date()));
			} else {
				order.setOrderComEndTime(new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss").format(new Date()));
				order.setOrderEndTime(new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss").format(new Date()));
			}
			order.setOrderStage(4);
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
	public Order getOrder(int id) {
		Session session = HibernateSessionFactory.getSession();
		try {
			Order order = (Order) session.get(Order.class, id);
			return order;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public int selectComAllOrderCounts(Company com, String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Order where order_companyId = ? and orderNum like ?";
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
	public int selectUserAllOrderCounts(User user, String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Order where order_user = ? and orderNum like ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, user);
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
	public boolean addOrder(Order order) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.save(order);
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
	public int selectAllOrderCounts(String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Order where orderNum like ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, "%" + key + "%");
			return query.list().size();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public List<Order> selectAllOrder(int page, int rows, String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Order where orderNum like ? order by orderId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, "%" + key + "%");
			query.setMaxResults(rows);
			query.setFirstResult(rows * (page - 1));
			List<Order> list = query.list();
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
	public List<Top> getTopList() {
		Session session = HibernateSessionFactory.getSession();
		try {
			String sql = "select order_serviceId, order_companyId, sum(orderServiceAmount) counts, sum(orderCost) money from tb_order  group by order_serviceId   order by sum(orderServiceAmount) desc";
			List list = session.createSQLQuery(sql)
					.addScalar("order_serviceId", StandardBasicTypes.INTEGER)
					.addScalar("order_companyId", StandardBasicTypes.INTEGER)
					.addScalar("counts", StandardBasicTypes.INTEGER)
					.addScalar("money", StandardBasicTypes.FLOAT).list();
			List<Top> toplist = new ArrayList<Top>();
			if (list.size() > 0) {
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object[] objects = (Object[]) iterator.next();
					Top t = new Top();
					t.setOrder_serviceId(Integer.valueOf(objects[0].toString()));
					t.setOrder_companyId(Integer.valueOf(objects[1].toString()));
					t.setCounts(Integer.valueOf(objects[2].toString()));
					t.setMoney(Float.valueOf(objects[3].toString()));
					toplist.add(t);
				}
				return toplist;
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
	public boolean deleteOrder(Order order) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.delete(order);
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
	public boolean orderPaySuccess(int id) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Order order = (Order) session.get(Order.class, id);
			order.setOrderStage(0);
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
