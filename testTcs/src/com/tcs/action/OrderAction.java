package com.tcs.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.opensymphony.xwork2.ModelDriven;
import com.tcs.dao.CompanyDAO;
import com.tcs.dao.MessageDAO;
import com.tcs.dao.OrderDAO;
import com.tcs.dao.ServiceDAO;
import com.tcs.dao.ServiceTypeDAO;
import com.tcs.dao.UserDAO;
import com.tcs.daoimpl.CompanyDAOImpl;
import com.tcs.daoimpl.MessageDAOImpl;
import com.tcs.daoimpl.OrderDAOImpl;
import com.tcs.daoimpl.ServiceDAOImpl;
import com.tcs.daoimpl.ServiceTypeDAOImpl;
import com.tcs.daoimpl.UserDAOImpl;
import com.tcs.entity.Company;
import com.tcs.entity.Order;
import com.tcs.entity.Service;
import com.tcs.entity.ServiceType;
import com.tcs.entity.User;

public class OrderAction extends SuperAction implements ModelDriven<Order> {
	private static final long serialVersionUID = 1L;

	Order order = new Order();

	OrderDAO odao = new OrderDAOImpl();
	UserDAO udao = new UserDAOImpl();
	CompanyDAO cdao = new CompanyDAOImpl();
	ServiceTypeDAO sdao = new ServiceTypeDAOImpl();
	ServiceDAO serdao = new ServiceDAOImpl();

	int orderid;
	static int rows = 10;
	int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	// 获取公司全部订单
	public String selectComAllOrder() {
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		if (page == 0) {
			page = 1;
		}
		Company com = new Company();
		if (session.getAttribute("loginCompany") != null) {
			com = (Company) session.getAttribute("loginCompany");
		} else if (request.getAttribute("company") != null) {
			com = (Company) request.getAttribute("company");
		} else {
			com = cdao.getCompanyById(Integer.valueOf(request
					.getParameter("companyId")));
		}
		int counts = odao.selectComAllOrderCounts(com, key);
		List<Order> orderlist = odao.selectComAllOrder(com, page, rows, key);
		if (orderlist != null) {
			request.setAttribute("company", com);
			request.setAttribute("orderlist", orderlist);
			request.setAttribute("page", page);
			request.setAttribute("counts", counts);
			request.setAttribute("key", key);
			return "selectcomallorder_success";
		} else {
			this.addFieldError("error", "未知原因错误！请稍后再试");
			return "selectcomallorder_failure";
		}
	}

	// 获取用户全部订单
	public String selectUserAllOrder() {
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		if (page == 0) {
			page = 1;
		}
		User user = (User) session.getAttribute("loginUser");
		int counts = odao.selectUserAllOrderCounts(user, key);
		List<Order> list = odao.selectUserAllOrder(user, page, rows, key);
		if (list != null) {
			request.setAttribute("orderList", list);
			request.setAttribute("page", page);
			request.setAttribute("counts", counts);
			request.setAttribute("key", key);
			return "selectuserallorder_success";
		} else {
			this.addFieldError("error", "未知原因错误，稍后再试");
			return "selectuserallorder_failure";
		}
	}

	public String selectAllOrder() {
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		if (page == 0) {
			page = 1;
		}
		int counts = odao.selectAllOrderCounts(key);
		List<Order> list = odao.selectAllOrder(page, rows, key);
		request.setAttribute("orderlist", list);
		request.setAttribute("page", page);
		request.setAttribute("counts", counts);
		request.setAttribute("key", key);
		return "selectallorder_success";

	}

	// 系统设置确认收货
	public String isOrderOk() {
		Company com = new Company();
		com = (Company) session.getAttribute("loginCompany");
		odao.isOrderOk(com);
		return "isorderok_success";
	}
	//公司接单
	public String orderComToDo() {
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		if (odao.orderComToDO(orderid)) {
			request.setAttribute("key", key);
			return "ordercomtodo_success";
		} else {
			this.addFieldError("error", "未知原因错误！请稍后再试");
			return "ordercomtodo_failure";
		}
	}
	//公司开始服务
	public String orderComStart() {
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		if (odao.orderComStart(orderid)) {
			request.setAttribute("key", key);
			return "ordercomstart_success";
		} else {
			this.addFieldError("error", "未知原因错误！请稍后再试");
			return "ordercomstart_failure";
		}
	}
	// 公司设置服务完成
	public String orderComOK() {
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		if (odao.orderComOk(orderid)) {
			request.setAttribute("key", key);
			return "ordercomok_success";
		} else {
			this.addFieldError("error", "未知原因错误！请稍后再试");
			return "ordercomok_failure";
		}
	}

	// 用户确认完成
	public String orderUserOK() {
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		if (odao.orderUserOk(orderid)) {
			request.setAttribute("key", key);
			return "orderuserok_success";
		} else {
			this.addFieldError("error", "未知原因错误！请稍后再试");
			return "orderuserok_failure";
		}
	}

	public String addOrder() {
		Service s = serdao.getService(Integer.valueOf(request
				.getParameter("serviceId")));
		Company c = new Company();
		c.setCompanyId(Integer.valueOf(request.getParameter("companyId")));
		float Cost = s.getServiceprice()
				* Integer.valueOf(request.getParameter("theNumOfOrder"));
		order.setOrder_user((User) session.getAttribute("loginUser"));
		order.setOrder_company(c);
		order.setOrder_service(s);
		order.setOrderCost(Cost);
		order.setOrderStage(-1);
		order.setOrderNum(getOrderNum());
		order.setOrderServiceAmount(Integer.valueOf(request
				.getParameter("theNumOfOrder")));
		order.setOrderTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));
		int startTime = Integer.valueOf(request.getParameter("starttime"));
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Calendar c1 = Calendar.getInstance();
	    c1.add(Calendar.DAY_OF_MONTH, startTime);
		order.setOrderStartTime(sf.format(c1.getTime()));
		if (odao.addOrder(order)) {
			return "addOrder_success";
		} else {
			this.addFieldError("error", "未知原因错误！请稍后再试");
			return "addOrder_failure";
		}
	}

	public String deleteOrder(){
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		request.setAttribute("key", key);
		order = odao.getOrder(order.getOrderId());
		if(odao.deleteOrder(order)){
			MessageDAO mdao = new MessageDAOImpl();
			if(session.getAttribute("loginUser")!=null){
				mdao.sendMessageWantTODelete(order);
			}else{
				mdao.sendMessageToUserWantToDelete(order);
			}
			return "deleteOrder_success";
			
		} else {
			this.addFieldError("error", "未知原因错误！请稍后再试");
			return "deleteOrder_failure";
		}
	}
	
	public String getOrderNum() {
		String formatDate = new SimpleDateFormat("yyMMddHHmmss")
				.format(new Date());
		int random = new Random().nextInt(10000);
		return formatDate + random;
	}
	
	public String pay() {
		order = odao.getOrder(order.getOrderId());
		request.setAttribute("order", order);
		return "pay_success";
	}
	
	public String orderPaySuccess(){
		if (odao.orderPaySuccess(orderid)) {
			MessageDAO mdao = new MessageDAOImpl();
			order = odao.getOrder(orderid);
			mdao.sendMessageToComUPS(order);
			return "orderpay_success";
		} else {
			this.addFieldError("error", "未知原因错误！请稍后再试");
			return "orderpay_failure";
		}
	}

	@Override
	public Order getModel() {
		return this.order;
	}

}
