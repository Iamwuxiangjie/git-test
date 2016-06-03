package com.tcs.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import com.tcs.dao.AdminDAO;
import com.tcs.dao.CompanyDAO;
import com.tcs.dao.FacilitatorTypeDAO;
import com.tcs.dao.MessageDAO;
import com.tcs.dao.PriveunitDAO;
import com.tcs.daoimpl.AdminDAOImpl;
import com.tcs.daoimpl.CompanyDAOImpl;
import com.tcs.daoimpl.FacilitatorTypeDAOImpl;
import com.tcs.daoimpl.MessageDAOImpl;
import com.tcs.daoimpl.PriveunitDAOImpl;
import com.tcs.email.Email;
import com.tcs.entity.Admin;
import com.tcs.entity.Company;
import com.tcs.entity.FacilitatorType;

public class CompanyAction extends SuperAction implements ModelDriven<Company> {
	private static final long serialVersionUID = 1L;

	Company com = new Company();
	CompanyDAO cdao = new CompanyDAOImpl();
	FacilitatorTypeDAO fdao = new FacilitatorTypeDAOImpl();
	PriveunitDAO pdao = new PriveunitDAOImpl();
	MessageDAO mdao = new MessageDAOImpl();
	AdminDAO adao = new AdminDAOImpl();

	File img;
	String fileName;
	static int rows = 10;

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
	// 公司注册
	public String register() {
		String provinces = request.getParameter("provinces");
		String city = request.getParameter("city");
		com.setCompanyAddress(provinces+" "+city);
		com.setCompanyServiceScope(city);
		if (cdao.companyRegister(com)) {
			session.setAttribute("loginCompany", com);// 注册完成后将公司信息放入session
			return "register_success";
		} else {
			this.addFieldError("companyRegisterError", "账号已被注册！");
			request.setAttribute("registermsg", com);
			return "register_failure";
		}
	}
	// 公司登陆
	public String login() {
		com.setCompanyAccount((String)request.getAttribute("companyAccount"));
		com.setCompanyPwd((String)request.getAttribute("companyPwd"));
		List<Company> list = cdao.companyLogin(com);
		if (list != null) {
			session.setAttribute("loginCompany", list.get(0));// 登陆成功将信息放入session
			return "login_success";
		} else {
			this.addFieldError("accountOrPwdError", "用户名或密码错误");
			return "login_failure";
		}
	}
	// 获取公司评分，过低自动发送系统信息
	public String getGrade() {
		com = (Company) session.getAttribute("loginCompany");
		if (com.getCompanyGrade() < 2 && com.getCompanyGrade() != 0) {
			List<Admin> adminlist = adao.getAllAdmin();
			mdao.sendMessage(adminlist, com);// 判断评分是否低于两分，低于两分则发送系统邮件
		}
		return "getgrade_success";
	}
	// 公司邮箱验证
	public String email() {
		String email = com.getCompanyEmail();
		com = (Company) session.getAttribute("loginCompany");
		com.setCompanyEmail(email);
		if (cdao.companyEmail(com)) {
			session.setAttribute("companyEmail", email);
			return "email_success";
		} else {
			this.addFieldError("emailIsExsist", "该邮箱已经被使用");
			return "email_failure";
		}
	}
	
	public String sendEmailToBind(){
		String companyEmail = (String) session.getAttribute("companyEmail");
		try {
			String  rd = Email.sendEmailToBind(companyEmail,0);
			session.setAttribute("rd", rd);
		} catch (Exception e) {
			this.addFieldError("accountOrPwdError", "邮箱发送错误");
			return "sendemailtobind_failure";
		}
		return "sendemailtobind_success";
	}
	
	public String bindEmail(){
		String vc = request.getParameter("verification");
		if(session.getAttribute("rd").equals(vc)){
			com = (Company) session.getAttribute("loginCompany");
			com.setCompanyEmail((String)session.getAttribute("companyEmail"));
			if(cdao.companyBindEmail(com)){
				session.removeAttribute("companyEmail");
				session.removeAttribute("rd");
				session.setAttribute("loginCompany", com);
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
	
	// 公司简介
	public String summary() {
		String summary = com.getCompanySummary();
		com = (Company) session.getAttribute("loginCompany");
		com.setCompanySummary(summary);
		if (cdao.companyUpdate(com)) {
			session.setAttribute("loginCompany", com);// 更新公司信息并把最新信息放入session
			return "summary_success";
		} else {
			this.addFieldError("unknow", "未知错误，稍后再试");
			return "summary_failure";
		}
	}
	// 设置公司类型
	@SuppressWarnings("unchecked")
	public String setType() {
		List<FacilitatorType> li = (List<FacilitatorType>) session.getAttribute("facilitatorType");	
		for (int i = 0; i < li.size(); i++) {
			if (li.get(i).getFacilitatorTypeName().toString().equals(request.getParameter("facilitatorType"))) {
				com = (Company) session.getAttribute("loginCompany");
				com.setCompany_facilitatorType(li.get(i));
				if (cdao.companyUpdate(com)) {
					session.setAttribute("loginCompany", com);// 设置类型后，将最新公司信息放入session
					return "settype_success";
				} else {
					this.addFieldError("unknow", "未知错误，稍后再试");
					return "settype_failure";
				}
			}
		}
		this.addFieldError("unknow", "未知错误，稍后再试");
		return "settype_failure";
	}
	// 刷新页面
	public String refresh() {
		com = (Company) session.getAttribute("loginCompany");
		Company c = cdao.getCompanyGrade(com);
		if (c != null) {
			session.setAttribute("loginCompany", c);
			return "refresh_success";
		} else {
			this.addFieldError("unknow", "未知错误，稍后再试");
			return "refresh_failure";
		}

	}
	
	public String rePwd(){
		com = (Company) session.getAttribute("loginCompany");
		if(com.getCompanyPwd().equals(request.getParameter("oldpwd"))){
			com.setCompanyPwd(request.getParameter("newpwd"));
		}else{
			this.addFieldError("pwderror", "旧密码错误，请重新输入");
			return "repwd_failure";
		}
		if(cdao.companyUpdate(com)){
			session.removeAttribute("loginCompany");
			return "repwd_success";
		}else{
			return "repwd_failure";
		}
	}
	
	// 退出登录
	public String logout() {
		if (session.getAttribute("loginCompany") != null) {
			session.removeAttribute("loginCompany");
		}
		return "logout_success";
	}
	// 上传公司图片
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
			com = (Company) session.getAttribute("loginCompany");
			String oldImg = com.getCompanyImg();
			com.setCompanyImg("uploadImg/" + targetFileName);
			if (cdao.companyUpdate(com)) {
				new File(ServletActionContext.getServletContext().getRealPath(
						"/")
						+ oldImg).delete();// 若曾经有图片，则删除旧图片
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
	// 上传公司执照
	public String uploadLicenseImg() {
		String root = ServletActionContext.getServletContext().getRealPath(
				"/uploadLicenseImg");
		if(fileName==null){
			return "upload_failure";
		}
		String targetFileName = generateFileName(fileName);
		File target = new File(root, targetFileName);
		try {
			InputStream is = new FileInputStream(img);
			OutputStream os = new FileOutputStream(target);
			byte[] buffer = new byte[1024];
			int length = 0;
			while ((length = is.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
			is.close();
			os.close();
			com = (Company) session.getAttribute("loginCompany");
			com.setCompanyLicenseImg("uploadLicenseImg/" + targetFileName);
			if (cdao.companyUpdate(com)) {
				return "uploadlicenseimg_success";
			} else {
				this.addFieldError("unknow", "未知错误，稍后再试");
				return "uploadlicenseimg_failure";
			}
		} catch (FileNotFoundException e1) {
			this.addFieldError("FileNotFoundException", e1.toString());
			return "uploadlicenseimg_failure";
		} catch (IOException e2) {
			this.addFieldError("IOException", e2.toString());
			return "uploadlicenseimg_failure";
		}
	}
	// 重命名上传文件（非必须）
	public String generateFileName(String fileName) {
		String temp = "com";
		String formatDate = new SimpleDateFormat("yyMMddHHmmss")
				.format(new Date());
		int random = new Random().nextInt(10000);
		int position = fileName.lastIndexOf(".");
		String extension = fileName.substring(position);
		return temp + formatDate + random + extension;
	}
	
	public String selectAllCompany(){
		String key;
		if(request.getParameter("key")!=null){
			key = request.getParameter("key");
		}else{
			key = "";
		}
		try {
			key = new String(key.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int page = 1;
		if(request.getParameter("page")!=null){
			page=Integer.valueOf(request.getParameter("page"));
		}
		int tage=0;
		if(request.getParameter("tage")!=null){
			tage = Integer.valueOf(request.getParameter("tage"));
		}
		int counts = cdao.getCompanyCounts(key,tage);
		List<Company> list = cdao.getAllCompany(page,rows,key,tage);
		request.setAttribute("allCompany", list);
		request.setAttribute("page", page);
		request.setAttribute("counts", counts);
		request.setAttribute("key", key);
		request.setAttribute("tage", tage);
		return "selectallcompany_success";
	}
	
	public String getCompany(){
		com = cdao.getCompanyById(com.getCompanyId());
		if(com!=null){
			request.setAttribute("company", com);
			request.setAttribute("page", request.getParameter("page"));
			request.setAttribute("tage", request.getParameter("tage"));
			request.setAttribute("key", request.getParameter("key"));
			return "getcompany_success";
		}else{
			return "getcompany_failure";
		}
	}
	
	public String companyApproved(){
		com = cdao.getCompanyById(com.getCompanyId());
		com.setCompanyStage(1);
		if(cdao.companyUpdate(com)){
			request.setAttribute("page", request.getParameter("page"));
			request.setAttribute("tage", request.getParameter("tage"));
			request.setAttribute("key", request.getParameter("key"));
			return "companyapproved_success";
		}else{
			return "companyapproved_failure";
		}
	}

	@Override
	public Company getModel() {
		return this.com;
	}
}
