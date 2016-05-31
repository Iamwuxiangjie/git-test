package com.tcs.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.tcs.dao.AdminDAO;
import com.tcs.dao.CompanyDAO;
import com.tcs.dao.MessageDAO;
import com.tcs.dao.UserDAO;
import com.tcs.daoimpl.AdminDAOImpl;
import com.tcs.daoimpl.CompanyDAOImpl;
import com.tcs.daoimpl.MessageDAOImpl;
import com.tcs.daoimpl.UserDAOImpl;
import com.tcs.entity.Admin;
import com.tcs.entity.Company;
import com.tcs.entity.Message;
import com.tcs.entity.User;

public class MessageAction extends SuperAction implements ModelDriven<Message> {
	private static final long serialVersionUID = 1L;

	Message msg = new Message();

	CompanyDAO cdao = new CompanyDAOImpl();
	AdminDAO adao = new AdminDAOImpl();
	UserDAO udao = new UserDAOImpl();
	MessageDAO mdao = new MessageDAOImpl();
	static int rows = 10;
	int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	String adminName;
	List<Integer> messageidlist;

	public List<Integer> getMessageidlist() {
		return messageidlist;
	}

	public void setMessageidlist(List<Integer> messageidlist) {
		this.messageidlist = messageidlist;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	// 发送邮件给管理员
	public String sendMessageToAdmin() {
		List<Admin> list = adao.getAllAdmin();
		if(session.getAttribute("loginCompany")!=null){
			Company com = (Company) session.getAttribute("loginCompany");
			msg.setMessageFromCompany(com);
		}else if(session.getAttribute("loginUser")!=null){
			User u = (User)session.getAttribute("loginUser");
			msg.setMessageFromUser(u);
		}
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getAdminName().equals(adminName)) {
				msg.setMessageToAdmin(list.get(i));
				if (mdao.sendComMessageToAdmin(msg)) {
					return "sendmessagetoadmin_success";
				} else {
					this.addFieldError("unknow", "未知错误，稍后再试");
					return "sendmessagetoadmin_failure";
				}
			}
		}
		return "sendmessagetoadmin_failure";
	}

	public String selectAdminAllMessage() {
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		try {
			key = new String(key.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (page == 0) {
			page = 1;
		}
		Admin admin = (Admin) session.getAttribute("loginAdmin");
		List<Message> unreadmessagelist = mdao.getAdminUnreadMessage(admin);
		int counts = mdao.getAdminReadMessageCount(admin, key);
		List<Message> readmessagelist = mdao.getAdminReadMessage(admin, page,
				rows, key);
		request.setAttribute("unreadmessage", unreadmessagelist);// 将未读邮件放入request
		request.setAttribute("readmessage", readmessagelist);// 将已读邮件放入request
		request.setAttribute("page", page);
		request.setAttribute("counts", counts);
		request.setAttribute("key", key);
		getAdminUnreadMessagecount();
		return "selectmessage_success";
	}

	public String getAdminUnreadMessagecount() {
		Admin admin = (Admin) session.getAttribute("loginAdmin");
		List<Message> list = mdao.getAdminUnreadMessage(admin);
		if (list != null) {
			session.setAttribute("unreadmessage", list.size());
		} else {
			session.setAttribute("unreadmessage", 0);
		}
		return "getunreadmessagecount_success";
	}

	// 查询公司所有信息
	public String selectComAllMessage() {
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		try {
			key = new String(key.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (page == 0) {
			page = 1;
		}
		Company com = (Company) session.getAttribute("loginCompany");
		List<Message> unreadmessagelist = mdao.getCompanyUnreadMessage(com);
		int counts = mdao.getCompanyReadMessageCount(com, key);
		List<Message> readmessagelist = mdao.getCompanyReadMessage(com, page,
				rows, key);
		request.setAttribute("unreadmessage", unreadmessagelist);// 将未读邮件放入request
		request.setAttribute("readmessage", readmessagelist);// 将已读邮件放入request
		request.setAttribute("page", page);
		request.setAttribute("counts", counts);
		request.setAttribute("key", key);
		getComUnreadMessagecount();
		return "selectmessage_success";
	}

	// 获取公司未读信息个数
	public String getComUnreadMessagecount() {
		Company com = (Company) session.getAttribute("loginCompany");
		List<Message> list = mdao.getCompanyUnreadMessage(com);
		if (list != null) {
			session.setAttribute("unreadmessage", list.size());
		} else {
			session.setAttribute("unreadmessage", 0);
		}
		return "getunreadmessagecount_success";
	}

	// 获取用户全部信息
	public String selectUserAllMessage() {
		String key;
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		} else {
			key = "";
		}
		try {
			key = new String(key.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (page == 0) {
			page = 1;
		}
		User user = (User) session.getAttribute("loginUser");
		List<Message> unreadmessagelist = mdao.getUserUnreadMessage(user);
		int counts = mdao.getUserReadMessageCount(user, key);
		List<Message> readmessagelist = mdao.getUserReadMessage(user, page,
				rows, key);
		request.setAttribute("unreadmessage", unreadmessagelist);// 将未读邮件放入request
		request.setAttribute("readmessage", readmessagelist);// 将已读邮件放入request
		request.setAttribute("page", page);
		request.setAttribute("counts", counts);
		request.setAttribute("key", key);
		getUserUnreadMessagecount();
		return "selectmessage_success";
	}

	// 获取用户未读信息个数
	public String getUserUnreadMessagecount() {
		User user = (User) session.getAttribute("loginUser");
		List<Message> list = mdao.getUserUnreadMessage(user);
		if (list != null) {
			session.setAttribute("unreadmessage", list.size());
		} else {
			session.setAttribute("unreadmessage", 0);
		}
		return "getunreadmessagecount_success";
	}

	// 设置已读
	public String readMessage() {
		if (mdao.readMessage(messageidlist)) {
			// request.setAttribute("key", key);
			return "readmessage_success";
		} else {
			this.addFieldError("unknow", "未知错误，稍后再试");
			return "readmessage_failure";
		}
	}

	// 删除信息
	public String deleteMessage() {
		if (mdao.deleteMessage(messageidlist)) {
			// request.setAttribute("key", key);
			return "deletemessage_success";
		} else {
			this.addFieldError("unknow", "未知错误，稍后再试");
			return "deletemessage_failure";
		}
	}

	// 获取信息接收者
	public String getMessageToPeople() {
		if (request.getParameter("msgid") != null) {
			int msgid = Integer.valueOf(request.getParameter("msgid"));
			msg = mdao.getMessageById(msgid);
			if (msg.getMessageFromAdmin() != null) {
				Admin a = adao.getAdminById(msg.getMessageFromAdmin()
						.getAdminId());
				request.setAttribute("personId", a.getAdminId());
				request.setAttribute("toPerson", 1);
				request.setAttribute("toPersonName", a.getAdminName());
			} else if (msg.getMessageFromUser() != null) {
				User u = udao.getUserById(msg.getMessageFromUser().getUserId());
				request.setAttribute("personId", u.getUserId());
				request.setAttribute("toPerson", 2);
				request.setAttribute("toPersonName", u.getUserName());
			} else if (msg.getMessageFromCompany() != null) {
				Company c = cdao.getCompanyById(msg.getMessageFromCompany()
						.getCompanyId());
				request.setAttribute("personId", c.getCompanyId());
				request.setAttribute("toPerson", 3);
				request.setAttribute("toPersonName", c.getCompanyName());
			}
			return "getmessagetopeople_success";
		}else{
			if(request.getParameter("companyId") != null){
				int companyId = Integer.valueOf(request.getParameter("companyId"));
				Company c = cdao.getCompanyById(companyId);
				request.setAttribute("personId", c.getCompanyId());
				request.setAttribute("toPerson", 3);
				request.setAttribute("toPersonName", c.getCompanyName());
			}else if(request.getParameter("UserId") != null){
				int userId = Integer.valueOf(request.getParameter("userId"));
				User u = udao.getUserById(userId);
				request.setAttribute("personId", u.getUserId());
				request.setAttribute("toPerson", 2);
				request.setAttribute("toPersonName", u.getUserName());
			}else if(request.getParameter("adminId") != null){
				int adminId = Integer.valueOf(request.getParameter("adminId"));
				Admin a = adao.getAdminById(adminId);
				request.setAttribute("personId", a.getAdminId());
				request.setAttribute("toPerson", 1);
				request.setAttribute("toPersonName", a.getAdminName());
			}
			return "getmessagetopeople_success";
		}
	}

	// 通过订单发送信息给用户
	public String orderGetMessageToUser() {
		int userid = Integer.valueOf(request.getParameter("userid"));
		User user = udao.getUserById(userid);
		request.setAttribute("personId", userid);
		request.setAttribute("toPerson", 2);
		request.setAttribute("toPersonName", user.getUserName());
		return "ordergetmessagetouser_success";
	}

	// 通过订单发送信息给商家
	public String orderGetMessageToCom() {
		int comid = Integer.valueOf(request.getParameter("comid"));
		Company com = cdao.getCompanyById(comid);
		request.setAttribute("personId", comid);
		request.setAttribute("toPerson", 3);
		request.setAttribute("toPersonName", com.getCompanyName());
		return "ordergetmessagetocom_success";
	}

	// 发送信息任意一人
	public String sendMessageToPeople() {
		if (request.getParameter("adminId") != null) {
			int id = Integer.valueOf(request.getParameter("adminId"));
			Admin a = adao.getAdminById(id);
			msg.setMessageToAdmin(a);
		} else if (request.getParameter("userId") != null) {
			int id = Integer.valueOf(request.getParameter("userId"));
			User u = udao.getUserById(id);
			msg.setMessageToUser(u);
		} else if (request.getParameter("companyId") != null) {
			int id = Integer.valueOf(request.getParameter("companyId"));
			Company c = cdao.getCompanyById(id);
			msg.setMessageToCompany(c);
		}
		if (session.getAttribute("loginCompany") != null) {
			msg.setMessageFromCompany((Company) session
					.getAttribute("loginCompany"));
		} else if (session.getAttribute("loginUser") != null) {
			msg.setMessageFromUser((User) session.getAttribute("loginUser"));
		} else if (session.getAttribute("loginAdmin") != null) {
			msg.setMessageFromAdmin((Admin) session.getAttribute("loginAdmin"));
		}
		if (mdao.sendMessageToPeople(msg)) {
			return "sendmessagetopeople_success";
		} else {
			this.addFieldError("unknow", "未知错误，稍后再试");
			return "sendmessagetopeople_failure";
		}
	}

	@Override
	public Message getModel() {
		return this.msg;
	}
}
