package com.tcs.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import com.tcs.dao.AdminDAO;
import com.tcs.daoimpl.AdminDAOImpl;
import com.tcs.entity.Admin;
import com.tcs.entity.Company;

public class AdminAction extends SuperAction implements ModelDriven<Admin> {

	private static final long serialVersionUID = 1L;
	Admin admin = new Admin();
	AdminDAO adao = new AdminDAOImpl();
	
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

	// 获取所有管理员昵称
	public String getAllAdminName() {
		List<Admin> list = adao.getAllAdmin();
		List<String> adminName = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			adminName.add(list.get(i).getAdminName());
		}
		request.setAttribute("adminlistname", adminName);
		return "getalladmin_success";
	}

	public String login() {
		List<Admin> list = adao.adminLogin(admin);
		if (list != null) {
			session.setAttribute("loginAdmin", list.get(0));// 登陆成功将信息放入session
			return "login_success";
		} else {
			this.addFieldError("accountOrPwdError", "账号或密码错误");
			return "login_failure";
		}
	}

	public String logout() {
		if (session.getAttribute("loginAdmin") != null) {
			session.removeAttribute("loginAdmin");
		}
		return "logout_success";
	}
	
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
			admin = (Admin) session.getAttribute("loginAdmin");
			String oldImg = admin.getAdminImg();
			admin.setAdminImg("uploadImg/" + targetFileName);
			if (adao.adminUpdate(admin)) {
				new File(ServletActionContext.getServletContext().getRealPath(
						"/")
						+ oldImg).delete();// 若曾经有图片，则删除旧图片
				session.setAttribute("loginAdmin", admin);
				PrintWriter out = response.getWriter();
				out.write("<script>parent.location.href=parent.location.href;</script>");
				out.flush();
				out.close();
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
	
	public String refresh() {
		if(session.getAttribute("loginAdmin")!=null){
			admin = (Admin) session.getAttribute("loginAdmin");
			Admin a = adao.getAdminById(admin.getAdminId());
			if (a != null) {
				session.setAttribute("loginAdmin", a);
				return "refresh_success";
			} else {
				this.addFieldError("unknow", "未知错误，稍后再试");
				return "refresh_failure";
			}	
		}
		else{
			return "logout_success";
		}
	}
	
	public String rePwd(){
		admin = (Admin) session.getAttribute("loginAdmin");
		if(admin.getAdminPwd().equals(request.getParameter("oldpwd"))){
			admin.setAdminPwd(request.getParameter("newpwd"));
		}else{
			this.addFieldError("pwderror", "旧密码错误");
			return "repwd_failure";
		}
		if(adao.adminUpdate(admin)){
			session.removeAttribute("loginAdmin");
			return "repwd_success";
		}else{
			return "repwd_failure";
		}
	}
	
	public String generateFileName(String fileName) {
		String temp = "admin";
		String formatDate = new SimpleDateFormat("yyMMddHHmmss")
				.format(new Date());
		int random = new Random().nextInt(10000);
		int position = fileName.lastIndexOf(".");
		String extension = fileName.substring(position);
		return temp + formatDate + random + extension;
	}
	
	@Override
	public Admin getModel() {
		// TODO Auto-generated method stub
		return this.admin;
	}

}
