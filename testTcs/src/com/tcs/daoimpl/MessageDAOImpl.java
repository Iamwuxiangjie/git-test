package com.tcs.daoimpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tcs.dao.HibernateSessionFactory;
import com.tcs.dao.MessageDAO;
import com.tcs.entity.Admin;
import com.tcs.entity.Company;
import com.tcs.entity.Message;
import com.tcs.entity.Order;
import com.tcs.entity.User;

public class MessageDAOImpl implements MessageDAO {
	@Override
	public boolean sendComMessageToAdmin(Message msg) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			msg.setMessageTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
					.format(new Date()));
			msg.setMessageStage(0);
			session.save(msg);
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
	public void sendMessage(List<Admin> adminlist, Company com) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Message message = new Message();
			message.setMessageToCompany(com);
			message.setMessageTitle("系统提示");
			message.setMessageBody("您的公司评价分数已经低于2分警戒线。请尽快提升评分！");
			message.setMessageTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
					.format(new Date()));
			message.setMessageStage(0);
			session.save(message);
			for (int i = 0; i < adminlist.size(); i++) {
				session.save(new Message(adminlist.get(i),
						new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
								.format(new Date()), "系统提示", "服务公司"
								+ com.getCompanyName()
								+ "，其评价分数已经低于2分警戒线。请注意观察！", 0));
			}
			ts.commit();
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean readMessage(List<Integer> idlist) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			for (int i = 0; i < idlist.size(); i++) {
				Message msg = (Message) session.get(Message.class,
						idlist.get(i));
				msg.setMessageStage(1);
				session.update(msg);
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

	@Override
	public boolean deleteMessage(List<Integer> idlist) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			for (int i = 0; i < idlist.size(); i++) {
				Message msg = (Message) session.get(Message.class,
						idlist.get(i));
				session.delete(msg);
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

	public List<Message> getAdminUnreadMessage(Admin admin) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Message where messageToAdmin = ? and messageStage = 0 order by messageId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, admin);
			List<Message> list = query.list();
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
	
	public List<Message> getAdminReadMessage(Admin admin, int page, int rows,String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Message where messageToAdmin = ? and messageStage = 1 and messageTitle like ? order by messageId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, admin);
			query.setParameter(1, "%"+key+"%");
			query.setMaxResults(rows);
			query.setFirstResult(rows * (page - 1));
			List<Message> list = query.list();
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
	
	
	public int getAdminReadMessageCount(Admin admin,String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Message where messageToAdmin = ? and messageStage = 1 and messageTitle like ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, admin);
			query.setParameter(1, "%"+key+"%");
			List<Message> list = query.list();
			if (list.size() > 0) {
				return list.size();
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getCompanyUnreadMessage(Company com) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Message where messageToCompany = ? and messageStage = 0 order by messageId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, com);
			List<Message> list = query.list();
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getCompanyReadMessage(Company com, int page, int rows,String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Message where messageToCompany = ? and messageStage = 1 and messageTitle like ? order by messageId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, com);
			query.setParameter(1, "%"+key+"%");
			query.setMaxResults(rows);
			query.setFirstResult(rows * (page - 1));
			List<Message> list = query.list();
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

	@SuppressWarnings("unchecked")
	public int getCompanyReadMessageCount(Company com,String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Message where messageToCompany = ? and messageStage = 1 and messageTitle like ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, com);
			query.setParameter(1, "%"+key+"%");
			List<Message> list = query.list();
			if (list.size() > 0) {
				return list.size();
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getUserUnreadMessage(User user) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Message where messageToUser = ? and messageStage = 0 order by messageId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, user);
			List<Message> list = query.list();
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getUserReadMessage(User user, int page, int rows,String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Message where messageToUser = ? and messageStage = 1 and messageTitle like ? order by messageId desc";
			Query query = session.createQuery(hql);
			query.setParameter(0, user);
			query.setParameter(1, "%"+key+"%");
			query.setMaxResults(rows);
			query.setFirstResult(rows * (page - 1));
			List<Message> list = query.list();
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

	@SuppressWarnings("unchecked")
	@Override
	public int getUserReadMessageCount(User user,String key) {
		Session session = HibernateSessionFactory.getSession();
		try {
			String hql = "from Message where messageToUser = ? and messageStage = 1 and messageTitle like ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, user);
			query.setParameter(1, "%"+key+"%");
			List<Message> list = query.list();
			if (list.size() > 0) {
				return list.size();
			} else {
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
	public Message getMessageById(int id) {
		Session session = HibernateSessionFactory.getSession();
		try {
			Message m = (Message) session.get(Message.class, id);
			return m;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean sendMessageToPeople(Message msg) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			msg.setMessageTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			session.save(msg);
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

	public void sendMessageWantTODelete(Order order) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Message message = new Message();
			message.setMessageToCompany(order.getOrder_company());
			message.setMessageTitle("系统提示");
			message.setMessageBody("用户订单："+order.getOrderNum()+" 创建时间："+order.getOrderTime()+" \n用户:"+order.getOrder_user().getUserName()+" 于"+new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
			.format(new Date())+"取消订单，请留意，以免造成不必要的麻烦！");
			message.setMessageTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
					.format(new Date()));
			message.setMessageStage(0);
			session.save(message);
			ts.commit();
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public void sendMessageToUserWantToDelete(Order order) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Message message = new Message();
			message.setMessageToUser(order.getOrder_user());
			message.setMessageTitle("系统提示");
			message.setMessageBody("用户订单："+order.getOrderNum()+" 创建时间："+order.getOrderTime()+" \n服务商:"+order.getOrder_company().getCompanyName()+" 于"+new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
			.format(new Date())+"取消订单，请谅解！\n请选购其他商品，谢谢！");
			message.setMessageTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
					.format(new Date()));
			message.setMessageStage(0);
			session.save(message);
			ts.commit();
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public void sendMessageToComUPS(Order order) {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			Message message = new Message();
			message.setMessageToCompany(order.getOrder_company());
			message.setMessageTitle("系统提示");
			message.setMessageBody("用户订单："+order.getOrderNum()+" 创建时间："+order.getOrderTime()+" \n用户:"+order.getOrder_user().getUserName()+" 于"+new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
			.format(new Date())+"付款成功！\n 亲，快去接单准备服务吧！");
			message.setMessageTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
					.format(new Date()));
			message.setMessageStage(0);
			session.save(message);
			ts.commit();
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

}
