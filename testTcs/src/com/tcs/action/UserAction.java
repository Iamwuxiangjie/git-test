package com.tcs.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import com.tcs.dao.UserDAO;
import com.tcs.daoimpl.UserDAOImpl;
import com.tcs.email.Email;
import com.tcs.entity.Company;
import com.tcs.entity.User;

public class UserAction extends SuperAction implements ModelDriven<User> {
	private static final long serialVersionUID = 1L;
	User user = new User();
	UserDAO udao = new UserDAOImpl();
	File img;
	String fileName;

	public void setImg(File img) {
		this.img = img;
	}

	public String getFileName() {
		return fileName;
	}

	// 获取图片名称（包括后缀名）
	public void setImgFileName(String fileName) {
		this.fileName = fileName;
	}
	//用户注册
	public String register() {
		String provinces = request.getParameter("provinces");
		String city = request.getParameter("city");
		user.setUserAddress(provinces+" "+city);
		if(udao.register(user)){
			session.setAttribute("loginUser", user);
			return "register_success";
		}else{
			this.addFieldError("accountOrPwdError", "账号已被注册");
			request.setAttribute("registermsg", user);
			return "register_failure";
		}
	}
	//用户登录
	public String login() {
		user.setUserAccount((String)request.getAttribute("userAccount"));
		user.setUserPwd((String)request.getAttribute("userPwd"));
		List<User> list = udao.userLogin(user);
		if (list != null) {
			session.setAttribute("loginUser", list.get(0));
			return "login_success";
		} else {
			this.addFieldError("accountOrPwdError", "用户名或密码错误");
			return "login_failure";
		}
	}
	//验证邮箱
	public String email() {
		User u = (User) session.getAttribute("loginUser");
		u.setUserEmail(user.getUserEmail());
		if (udao.email(u)) {
			session.setAttribute("userEmail", user.getUserEmail());
			return "email_success";
		} else {
			this.addFieldError("error", "该邮箱已被注册！");
			return "email_failure";
		}
	}
	
	public String sendEmailToBind(){
		String userEmail = (String) session.getAttribute("userEmail");
		try {
			String  rd = Email.sendEmailToBind(userEmail,0);
			session.setAttribute("rd", rd);
		} catch (Exception e) {
			this.addFieldError("error", "邮箱发送错误");
			return "sendemailtobind_failure";
		}
		return "sendemailtobind_success";
	}
	
	public String bindEmail(){
		String vc = request.getParameter("verification");
		if(session.getAttribute("rd").equals(vc)){
			user = (User) session.getAttribute("loginUser");
			user.setUserEmail((String)session.getAttribute("userEmail"));
			if(udao.userBindEmail(user)){
				session.removeAttribute("companyEmail");
				session.removeAttribute("rd");
				session.setAttribute("loginUser", user);
				return "bindemail_success";
			}else{
				this.addFieldError("Error", "未知错误，请稍后再试");
				return "bindemail_failure";
			}
		}else{
			this.addFieldError("Error", "验证码错误");
			return "bindemail_failure";
		}
	}
	
	
	//实名认证
	public String realName() {
		User u = (User) session.getAttribute("loginUser");
		u.setUserRealName(user.getUserRealName());
		u.setUserIDCardNum(user.getUserIDCardNum());
		if (udao.updateUser(u)) {
			session.setAttribute("loginUser", u);
			return "realName_success";
		} else {
			this.addFieldError("error", "未知错误，请稍后再试");
			return "realName_failure";
		}

	}
	
	public String rePwd(){
		user = (User) session.getAttribute("loginUser");
		if(user.getUserPwd().equals(request.getParameter("oldpwd"))){
			user.setUserPwd(request.getParameter("newpwd"));
		}else{
			this.addFieldError("pwderror", "旧密码错误，请重新输入");
			return "repwd_failure";
		}
		if(udao.updateUser(user)){
			session.removeAttribute("loginUser");
			return "repwd_success";
		}else{
			return "repwd_failure";
		}
	}
	
	//上传用户头像
	public String upload() {
		// 得到当前web工程下的/upload目录的在本机的绝对路径
		String root = ServletActionContext.getServletContext().getRealPath(
				"/uploadImg");
		// 重命名上传文件
		if(fileName==null){
			return "upload_failure";
		}
		String targetFileName = generateFileName(fileName);
		// 在指定目录创建文件
		File target = new File(root, targetFileName);
		try {
			InputStream is = new FileInputStream(img);// 获取输入流
			OutputStream os = new FileOutputStream(target);// 设置输出流
			byte[] buffer = new byte[1024];// 设置每次输出大小
			int length = 0;
			while ((length = is.read(buffer)) > 0) {
				os.write(buffer, 0, length);// 输出图片信息至指定文件夹
			}
			is.close();
			os.close();
			user = (User) session.getAttribute("loginUser");
			String oldImg = user.getUserImg();
			user.setUserImg("uploadImg/" + targetFileName);
			if (udao.updateUser(user)) {
				new File(ServletActionContext.getServletContext().getRealPath(
						"/")
						+ oldImg).delete();// 若曾经有图片，则删除旧图片
				session.setAttribute("loginUser", user);
				return "upload_success";
			} else {
				this.addFieldError("unknow", "未知错误，稍后再试");
				return "upload_failure";
			}
		} catch (FileNotFoundException e1) {
			this.addFieldError("FileNotFoundException", e1.toString());
			return "upload_failure";
		} catch (IOException e2) {
			this.addFieldError("IOException", e2.toString());
			return "upload_failure";
		}
	}
	//更新信息
	public String update() {
		User u = (User) session.getAttribute("loginUser");
		u.setUserName(user.getUserName());
		u.setUserPhone(user.getUserPhone());
		String provinces = request.getParameter("provinces");
		String city = request.getParameter("city");
		u.setUserAddress(provinces+" "+city);
		u.setUserAddress2(user.getUserAddress2());
		u.setUserLike(request.getParameter("serviceTypeName"));
		if (udao.updateUser(u)) {
			session.setAttribute("loginUser", u);
			return "update_success";
		} else {
			this.addFieldError("error", "未知原因错误，稍后再试");
			return "update_failure";
		}
	}
	//重命名图片名
	public String generateFileName(String fileName) {
		String temp = "user";
		String formatDate = new SimpleDateFormat("yyMMddHHmmss")
				.format(new Date());
		int random = new Random().nextInt(10000);
		int position = fileName.lastIndexOf(".");
		String extension = fileName.substring(position);
		return temp + formatDate + random + extension;
	}
	//刷新页面
	public String refresh() {
		user = (User) session.getAttribute("loginUser");
		List<User> list = udao.userLogin(user);
		if (list != null) {
			session.setAttribute("loginUser", list.get(0));
			return "refresh_success";
		} else {
			this.addFieldError("unknow", "未知错误，稍后再试");
			return "refresh_failure";
		}
	}
	//退出登录
	public String logout() {
		if (session.getAttribute("loginUser") != null) {
			session.removeAttribute("loginUser");
		}
		return "logout_success";
	}

	public User getModel() {
		return this.user;
	}
}
