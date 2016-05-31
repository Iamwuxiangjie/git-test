package com.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.tcs.dao.HibernateSessionFactory;
import com.tcs.entity.Admin;
import com.tcs.entity.Comment;
import com.tcs.entity.Company;
import com.tcs.entity.FacilitatorType;
import com.tcs.entity.Order;
import com.tcs.entity.Priveunit;
import com.tcs.entity.Service;
import com.tcs.entity.ServiceType;
import com.tcs.entity.User;

public class DBtest {
	@Test
	public void dbTest() {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		ts.commit();
		//util.closeSession(session);
	}

	@Test
	public void testAdminRegister() {
		Admin ad = new Admin();
		ad.setAdminAccount("a123");
		ad.setAdminName("管理小张");
		ad.setAdminPhone("1110");
		ad.setAdminPwd("123456");
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		session.save(ad);
		ts.commit();
		//util.closeSession(session);
	}

	@Test
	public void testAdminAddFacil() {
		FacilitatorType fa = new FacilitatorType();
		fa.setFacilitatorTypeName("清洁");
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		session.save(fa);
		ts.commit();
		//util.closeSession(session);
	}
	
	@Test
	public void testAdminAddPriveunit() {
		Priveunit pu1 = new Priveunit();
		pu1.setPriveunitName("次");
		
		Priveunit pu2 = new Priveunit();
		pu2.setPriveunitName("次/小时");
		
		Priveunit pu3 = new Priveunit();
		pu3.setPriveunitName("次/天");
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		session.save(pu1);
		session.save(pu2);
		session.save(pu3);
		ts.commit();
		//util.closeSession(session);
	}
	
	@Test
	public void testAdminAddServiceType() {
		ServiceType s1 = new ServiceType();
		s1.setServiceTypeName("高空保洁");
		ServiceType s2 = new ServiceType();
		s2.setServiceTypeName("开荒保洁");
		ServiceType s3 = new ServiceType();
		s3.setServiceTypeName("玻璃清洗");
		ServiceType s4 = new ServiceType();
		s4.setServiceTypeName("抽油烟机清洗");
		ServiceType s5 = new ServiceType();
		s5.setServiceTypeName("地板打蜡");
		ServiceType s6 = new ServiceType();
		s6.setServiceTypeName("除尘除螨");
		ServiceType s7 = new ServiceType();
		s7.setServiceTypeName("甲醛检测");
		ServiceType s8 = new ServiceType();
		s8.setServiceTypeName("老人护理");
		ServiceType s9 = new ServiceType();
		s9.setServiceTypeName("月嫂");
		
		
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		session.save(s1);
		session.save(s2);
		session.save(s3);
		session.save(s4);
		session.save(s5);
		session.save(s6);
		session.save(s7);
		session.save(s8);
		session.save(s9);
		ts.commit();
		//util.closeSession(session);
	}

	@Test
	public void testUserRegister() {
		User user = new User();
		user.setUserAccount("qq111");
		user.setUserAddress("浙江省杭州市下沙区");
		user.setUserAddress2("水利水电");
		user.setUserBirthday("2016-5-18");
		user.setUserName("小王");
		user.setUserSex("男");
		user.setUserPhone("110");
		user.setUserPwd("123456");

		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		session.save(user);
		ts.commit();
		//util.closeSession(session);
	}

	@Test
	public void testCompanyRegister() {
		Company com = new Company();
		com.setCompanyAccount("a123");
		com.setCompanyPwd("123456");
		com.setCompanyName("家政服务公司1号");
		com.setCompanyAddress("浙江省杭州市下沙区");
		com.setCompanyAddress2("下沙街道");
		com.setCompanyGrade(4);
		com.setCompanyServiceScope("浙江省杭州市下沙区");
		com.setCompanyPhone("110");
		com.setCompanyStage(0);

		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		FacilitatorType fa = (FacilitatorType) session.get(
				FacilitatorType.class, 1);
		com.setCompany_facilitatorType(fa);
		session.save(com);
		ts.commit();
		//util.closeSession(session);
	}

	@Test
	public void testCompanyStrat() {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		String hql = "from Company com where com.companyStage=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, 0);
		List<Company> list = query.list();
		// ts.commit();
		for (Company company : list) {
			System.out.println(company.getCompanyName());
			if (company.getCompanyId() == 1) {
				company.setCompanyStage(1);
				session.update(company);
				ts.commit();
			}
		}
		//util.closeSession(session);
	}

	@Test
	public void testCompanyAddService() {
		Service se = new Service();
		
		se.setServiceName("洗厕所");
		se.setServiceprice(100);
		se.setServiceStage(1);
		
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		
		Priveunit pu = (Priveunit) session.get(Priveunit.class, 1);
		Company com = (Company) session.get(Company.class, 1);
		ServiceType serviceType = (ServiceType) session.get(ServiceType.class, 1);
		
		se.setService_priveunit(pu);
		se.setService_company(com);
		se.setService_serviceType(serviceType);
		session.save(se);
		ts.commit();
		//util.closeSession(session);
	}

	@Test
	public void testBuyService() {
		Order or = new Order();
		or.setOrderNum("1131556");
		or.setOrderTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));

		Date date = new Date();
		date.setDate(date.getDate() + 2);

		or.setOrderStartTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(date));
		or.setOrderServiceAmount(2);
		or.setOrderStage(0);

		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Company com = (Company) session.get(Company.class, 1);
		User user = (User) session.get(User.class, 1);
		Service se = (Service) session.get(Service.class, 1);
		or.setOrder_company(com);
		or.setOrder_service(se);
		or.setOrder_user(user);
		or.setOrderCost(se.getServiceprice() * 2);

		session.save(or);
		ts.commit();
	}

	@Test
	public void testFinishOrder2() throws ParseException {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Company com = (Company) session.get(Company.class, 1);
		Order or = (Order) session.get(Order.class, 1);

		Date date = new Date();
		String d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		or.setOrderComEndTime(d1);

		Date date2 = new Date();
		date2.setDate(date.getDate() + 10);

		Date date3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(d1);
		if ((date2.getTime() - date3.getTime()) / (3600 * 24 * 1000) >= 10) {
			or.setOrderStage(1);
			or.setOrderEndTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date2));
			session.update(or);
			ts.commit();
		}
		//util.closeSession(session);
	}

	@Test
	public void testComment() {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Order or = (Order) session.get(Order.class, 1);

		if (or.getOrderStage() == 1) {
			Comment comm = new Comment();
			comm.setCommentCont("非常好！");
			comm.setCommentTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date()));
			comm.setCommentGrade(4);

			User user = (User) session.get(User.class, or.getOrder_user()
					.getUserId());
			Company com = (Company) session.get(Company.class, or
					.getOrder_company().getCompanyId());
			Service se = (Service) session.get(Service.class, or
					.getOrder_service().getServiceId());

			comm.setComment_company(com);
			comm.setComment_service(se);
			comm.setComment_user(user);
			
			session.save(comm);
			ts.commit();
			//util.closeSession(session);
		}
	}
}
