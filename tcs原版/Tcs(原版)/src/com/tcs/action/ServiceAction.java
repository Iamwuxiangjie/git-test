package com.tcs.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.tcs.dao.CompanyDAO;
import com.tcs.dao.PriveunitDAO;
import com.tcs.dao.ServiceDAO;
import com.tcs.dao.ServiceTypeDAO;
import com.tcs.daoimpl.CompanyDAOImpl;
import com.tcs.daoimpl.OrderDAOImpl;
import com.tcs.daoimpl.PriveunitDAOImpl;
import com.tcs.daoimpl.ServiceDAOImpl;
import com.tcs.daoimpl.ServiceTypeDAOImpl;
import com.tcs.entity.Company;
import com.tcs.entity.Priveunit;
import com.tcs.entity.Service;
import com.tcs.entity.ServiceType;
import com.tcs.entity.Top;
import com.tcs.entity.User;

public class ServiceAction extends SuperAction implements ModelDriven<Service> {
	private static final long serialVersionUID = 1L;
	Service se = new Service();
	Company com = new Company();
	CompanyDAO cdao = new CompanyDAOImpl();
	ServiceDAO sdao = new ServiceDAOImpl();
	PriveunitDAO pdao = new PriveunitDAOImpl();
	ServiceTypeDAO stdao = new ServiceTypeDAOImpl();
	int serviceid;
	int operand;
	File img;
	String fileName;
	static int rows = 10;
	int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

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

	public int getOperand() {
		return operand;
	}

	public void setOperand(int operand) {
		this.operand = operand;
	}

	public int getServiceid() {
		return serviceid;
	}

	public void setServiceid(int serviceid) {
		this.serviceid = serviceid;
	}
	// 增加服务类型
	@SuppressWarnings("unchecked")
	public String addService() {
		List<Priveunit> pli = (List<Priveunit>) session
				.getAttribute("priveunit");
		List<ServiceType> sli = (List<ServiceType>) session
				.getAttribute("serviceType");
		for (int i = 0; i < pli.size(); i++) {
			if (pli.get(i).toString().equals(request.getParameter("priveunit"))) {
				se.setService_priveunit(pli.get(i));
			}
		}
		for (int i = 0; i < sli.size(); i++) {
			if (sli.get(i).toString().equals(request.getParameter("serviceType"))) {
				se.setService_serviceType(sli.get(i));
			}
		}
		com = (Company) session.getAttribute("loginCompany");
		se.setService_company(com);
		if (sdao.addService(se)) {
			return "addservice_success";
		} else {
			this.addFieldError("companyRegisterError", "未知原因添加服务失败！请稍后再试");
			return "addservice_failure";
		}
	}
	// 查询公司所有服务
	public String selectComAllService() {
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
		if(session.getAttribute("loginCompany")!=null){
			com = (Company) session.getAttribute("loginCompany");
		}else if(request.getAttribute("company")!=null){
			com = (Company) request.getAttribute("company");
		}else{
			com = cdao.getCompanyById(Integer.valueOf(request.getParameter("companyId")));
		}
		int counts = sdao.selectComServiceCounts(com,key);
		if(page==0){
			page=1;
		}
		int tage = 0;
		if(request.getParameter("tage")!=null){
			tage = Integer.valueOf(request.getParameter("tage"));
		}
		
		List<Service> list = sdao.selectComService(com,page,rows,key);
		if (list != null) {
			request.setAttribute("company", com);
			request.setAttribute("page", page);
			request.setAttribute("counts", counts);
			request.setAttribute("allservice", list);
			request.setAttribute("key", key);
			request.setAttribute("tage", tage);
			return "selectcomallservice_success";
		} else {
			this.addFieldError("companyRegisterError", "未知原因查询！请稍后再试");
			return "selectcomallservice_failure";
		}
	}
	// 对服务上下架
	public String updownService() {
		if (sdao.updownService(serviceid, operand)) {
			return "updown_success";
		} else {
			this.addFieldError("companyRegisterError", "未知原因更改状态失败！请稍后再试");
			return "updown_failure";
		}
	}
	// 更新服务信息
	@SuppressWarnings("unchecked")
	public String updateService() {
		List<Priveunit> pli = (List<Priveunit>) session
				.getAttribute("priveunit");
		List<ServiceType> sli = (List<ServiceType>) session
				.getAttribute("serviceType");
		Service ser = sdao.getService(serviceid);
		ser.setServiceName(se.getServiceName());
		ser.setServiceExplain(se.getServiceExplain());
		ser.setServiceprice(se.getServiceprice());
		for (int i = 0; i < pli.size(); i++) {
			if (pli.get(i).toString().equals(request.getParameter("priveunit"))) {
				ser.setService_priveunit(pli.get(i));
			}
		}
		for (int i = 0; i < sli.size(); i++) {
			if (sli.get(i).toString().equals(request.getParameter("serviceType"))) {
				ser.setService_serviceType(sli.get(i));
			}
		}
		if (fileName != null && fileName != "") {
			String root = ServletActionContext.getServletContext().getRealPath(
					"/uploadServiceImg");
			String targetFileName = generateFileName(fileName);
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
				String oldImg = ser.getServiceImg();
				new File(ServletActionContext.getServletContext().getRealPath(
						"/")
						+ oldImg).delete();
				ser.setServiceImg("uploadServiceImg/" + targetFileName);
			} catch (Exception e) {
				this.addFieldError("error", "图片添加失败");
			}
		}
		if (sdao.updateService(ser)) {
			return "update_success";
		} else {
			this.addFieldError("companyRegisterError", "未知原因错误！请稍后再试");
			return "update_failure";
		}
	}
	// 删除服务
	public String delete() {
		if (sdao.delete(serviceid)) {
			return "delete_success";
		} else {
			this.addFieldError("companyRegisterError", "未知原因错误！请稍后再试");
			return "delete_failure";
		}
	}
	// 获取单个服务信息
	public String getService() {
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
		Service s = null;
		if ((s = sdao.getService(serviceid)) != null) {
			request.setAttribute("service", s);
			request.setAttribute("key", key);
			return "getservice_success";
		} else {
			this.addFieldError("companyRegisterError", "未知原因错误！请稍后再试");
			return "getservice_failure";
		}

	}
	
	
	
	public String servicePrice(){
		List<ServiceType> typelist = new ServiceTypeDAOImpl().getServiceType();
		List<String> typenamelist = new ArrayList<String>();
		List<Map<String, Float>> list = new ArrayList<Map<String,Float>>();
		for (int i = 0; i < typelist.size(); i++) {
			Map<String, Float> map = sdao.getPriceByTypeId(typelist.get(i).getServiceTypeId());
			list.add(map);
			typenamelist.add(typelist.get(i).getServiceTypeName());
		}
		request.setAttribute("typenamelist", typenamelist);
		request.setAttribute("pricelist", list);
		return "getserviceprice_success";
	}
	
	public String serviceTop(){
		List<Top> toplist = new OrderDAOImpl().getTopList();
		if(toplist!=null){
			for (int i = 0; i < toplist.size(); i++) {
				Company c = cdao.getCompanyById(toplist.get(i).getOrder_companyId());
				Service s = sdao.getService(toplist.get(i).getOrder_serviceId());
				toplist.get(i).setCompanyName(c.getCompanyName());
				toplist.get(i).setServiceName(s.getServiceName());
			}
		}
			request.setAttribute("toplist", toplist);
			return "gettop_success";
	}
	// 重命名上传文件（非必须）
	public String generateFileName(String fileName) {
		String temp = "service";
		String formatDate = new SimpleDateFormat("yyMMddHHmmss")
				.format(new Date());
		int random = new Random().nextInt(10000);
		int position = fileName.lastIndexOf(".");
		String extension = fileName.substring(position);
		return temp + formatDate + random + extension;
	}
	@Override
	public Service getModel() {
		return this.se;
	}
	
	private String likename;
	private String ServiceTypeId;
	private String add;
	
	public void setAdd(String add) {
		this.add = add;
	}

	public String getLikename() {
		return likename;
	}

	public void setLikename(String likename) {
		this.likename = likename;
	}

	public String getLikeServices(){
		
		boolean typeflag=false;
		boolean nameflag=false;
		boolean addflag = false;
		if(page==0){
			page=1;
		}
		if(ServiceTypeId==null&&session.getAttribute("serviceTypeId")!=null){
			ServiceTypeId = session.getAttribute("serviceTypeId").toString();
			typeflag=true;
		}else if(ServiceTypeId==null||ServiceTypeId.trim().equals("0")){
			typeflag=false;
		}else if(ServiceTypeId!=null&&ServiceTypeId!=""&&(!ServiceTypeId.trim().equals("0"))){
			typeflag = true;
		}else{
			typeflag = false;
		}
		if(likename!=""&&likename!=null){
			nameflag=true;
		}
		User u = null;
		if((u=(User)session.getAttribute("loginUser"))!=null){
			addflag=true;
			String[] split = u.getUserAddress().split("省");
			if(split.length>1){
				add = split[1];
			}else{
				String[] split2 = u.getUserAddress().split("市");
					add = split2[1];
			}
		}
		likename=likename!=null?likename.trim():null;
		ServiceTypeId=ServiceTypeId!=null?ServiceTypeId.trim():null;
		long theNumOfServices=this.sdao.theNumOfServices(nameflag,likename,typeflag,ServiceTypeId,addflag,add);
		List<Service> list=this.sdao.selectAllService(this.page, 30,nameflag,likename,typeflag,ServiceTypeId,addflag,add);
		ActionContext ac=ActionContext.getContext();
		int themaxpage=(int) (theNumOfServices%30==0?theNumOfServices/30:theNumOfServices/30+1);
		ac.put("serviceslist", list);
		ac.put("themaxpage", themaxpage);
		ac.put("nowpage",page);
		ac.put("likename",likename);
		ac.put("ServiceTypeId",ServiceTypeId==null?0:ServiceTypeId);
		List<ServiceType> serviceTypelist = stdao.getServiceType();
		request.setAttribute("servicetype", serviceTypelist);
		return "serviceslist";
	}
	
	public String getServiceTypeId() {
		return ServiceTypeId;
	}

	public void setServiceTypeId(String serviceTypeId) {
		ServiceTypeId = serviceTypeId;
	}

	public String forwardto(){
		ActionContext ac=ActionContext.getContext();
		List<Object> li=this.sdao.getService(serviceid,this.page,rows);
		ac.put("service", (Service)li.get(0));
		ac.put("themaxpage",li.get(1));
		ac.put("nowpage", page);
		ac.put("ServiceTypeId",serviceid );
		return "showServiceById";
	}
}
